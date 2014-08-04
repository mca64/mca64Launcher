library ShittyPluginDwaKropkaZero;

uses
  System.SysUtils,
  System.Classes,
  System.Math,
  System.IniFiles,
  IdContext,
  IdGlobal,
  IdIRC,
  Windows;

type
  TShittyPlugin = class
  private
    fLicznikAkcji: array [0 .. 7] of integer;
    fAkcje: array [0 .. 7] of byte;
    // fPomiarCzasuWykonaniaKodu: AnsiString;
    fMojNumerGracza: integer;
    fResetujAPM: boolean;
    fPoczatekGry: boolean;
    fCzasGrySekundy: single;
    fTc: boolean;
    fNowaWiadomoscTwitch: boolean;
    fWiadomoscTwitch: AnsiString;
    procedure JmpPatch(const od, skokDo: cardinal);
    procedure InstalacjaPodpiec;
    procedure CofniecieInstalacjiPodpiec;
    class procedure Podpiecie_Wyswietlanie(instance: TShittyPlugin); static;
    class procedure Podpiecie_KomendyGra(instance: TShittyPlugin); static;
    class procedure Podpiecie_Akcje(instance: TShittyPlugin); static;
    procedure Wyswietlanie;
    function CzasGry(const czasGrySekundy: single): AnsiString;
    function Godzina: AnsiString;
    function KomendyGra(const wprowadzonyTekst: PAnsiChar): boolean;
    procedure Akcje(const numerGracza, kodAkcji: integer);
    function APM(const numerGracza: integer; czasGrySekundy: single): AnsiString;
    procedure ResetujAPM(const resetuj: boolean);
    procedure BW_OdtwarzajDzwiek(const numer: integer); stdcall;
    procedure BW_Tekst(const tekst: PAnsiChar); stdcall;
    procedure BW_TekstXY(const x, y: integer; const tekst: PAnsiChar); stdcall;
    procedure BW_RozmiarCzcionki(const rozmiarCzcionki: cardinal); stdcall;
    procedure BW_Piksel(const x, y: integer; const kolor: byte); stdcall;
    procedure BW_Boks(const x, y, szerekosc, wysokosc: integer; const kolor: byte); stdcall;
    procedure BW_PrzezroczystyBoks(const x, y, szerekosc, wysokosc: integer; const kolor: byte); stdcall;
  public
    property pMojNumerGracza: integer read fMojNumerGracza;
    property pResetujAPM: boolean write ResetujAPM;
    property pPoczatekGry: boolean write fPoczatekGry;
    property pCzasGrySekundy: single read fCzasGrySekundy;
    property pTc: boolean read fTc;
    property pNowaWiadomoscTwitch: boolean read fNowaWiadomoscTwitch write fNowaWiadomoscTwitch;
    property pWiadomoscTwitch: AnsiString read fWiadomoscTwitch write fWiadomoscTwitch;
    constructor Create;
  end;

  TGlownyWatek = class(TThread)
  private
  protected
    procedure Execute; override;
  public
    fResetujZmienne: boolean;
    constructor Create(wstrzymanie: boolean);
  end;

  TCzatTwitcha = class
  private
    fIdIRC: TIdIRC;
    fLogin: string;
    fHaslo: string;
    function Polacz: boolean;
    procedure NowaWiadomosc(ASender: TIdContext; const ANicknameFrom, AHost, ANicknameTo, AMessage: string);
    procedure WyslijWiadomosc(const tresc: AnsiString);
  protected
  public
    property pLogin: string read fLogin;
    property pWyslijWiadomosc: AnsiString write WyslijWiadomosc;
    constructor Create;
    destructor Destroy; override;
  end;

var
  ShittyPlugin: TShittyPlugin;
  glownyWatek: TGlownyWatek;
  czatTwitcha: TCzatTwitcha;

function Gra: boolean; forward;
function Powtorka: boolean; forward;
function Lobby: boolean; forward;
function LobbyPrzedGra: boolean; forward;
procedure KopiujBlokPamieci(const miejsceDocelowe, zrodlo, dlugosc: cardinal); forward;
function DirectIPPatch: boolean; forward;

procedure TShittyPlugin.JmpPatch(const od, skokDo: cardinal);
var
  lgJmp: array [0 .. 4] of byte;
begin
  asm
    mov   ebx, skokDo
    mov   ecx, od
    add   ecx, 05h
    sub	  ebx, ecx
    lea	  ecx, lgJmp
    mov	  byte ptr [ecx], 0E9h
    mov   dword ptr [ecx+1], ebx
  end;
  KopiujBlokPamieci(od, cardinal(@lgJmp), 5);
end;

procedure TShittyPlugin.InstalacjaPodpiec;
const
  kod1: array [0 .. 1] of byte = ($90, $90);
  kod2: array [0 .. 1] of byte = ($EB, $04);
begin
  JmpPatch($0048D0A9, cardinal(@Podpiecie_Wyswietlanie));
  JmpPatch($004F3375, cardinal(@Podpiecie_KomendyGra));
  JmpPatch($00486D8B, cardinal(@Podpiecie_Akcje));

  KopiujBlokPamieci($0047F26C, cardinal(@kod1), SizeOf(kod1)); // odświeżanie tekstu
  KopiujBlokPamieci($0047F120, cardinal(@kod2), SizeOf(kod2)); // odświeżanie tekstu
end;

procedure TShittyPlugin.CofniecieInstalacjiPodpiec;
begin

end;

class procedure TShittyPlugin.Podpiecie_Wyswietlanie;
const
  oryginalnaFunkcja: cardinal = $0041FB30;
  powrot: cardinal = $0048D0AE;
begin
  asm
    call  dword ptr [oryginalnaFunkcja]
    pushad
  end;
  ShittyPlugin.Wyswietlanie;
  asm
    popad
    jmp   [powrot]
  end;
end;

procedure TShittyPlugin.Wyswietlanie;
const
  adres: cardinal = $0041FB30;
var
  pierwotnyRozmiarCzcionki: cardinal;
  { czestoliwosc: int64;
    start: int64;
    stop: int64;
    delta: extended; }
begin
  if Gra then
  begin
    { QueryPerformanceFrequency(czestoliwosc);
      QueryPerformanceCounter(start); }
    if fPoczatekGry then
    begin
      fMojNumerGracza := integer(Pointer($00512684)^);
      fResetujAPM := True;
      glownyWatek.fResetujZmienne := True;
      fPoczatekGry := False;
      BW_Tekst(#4'<ShittyPlugin> ' + #7'Wersja: ' + #3'2.0');
    end;
    if (fTc) and (fNowaWiadomoscTwitch) then
    begin
      BW_Tekst(PAnsiChar(fWiadomoscTwitch));
      fNowaWiadomoscTwitch := False;
    end;
    pierwotnyRozmiarCzcionki := cardinal(Pointer($006D5DDC)^);
    BW_RozmiarCzcionki($00000000);
    BW_RozmiarCzcionki($006CE0F8);
    // wielka: $006CE0FC;
    // normalna: $006CE0F8;
    // mala: $006CE0F4;
    // *****************************************************cały kod tutaj:
    // BW_PrzezroczystyBoks(0, 0, 639, 165, 46);
    fCzasGrySekundy := integer(Pointer($0057F23C)^) / 23.81;
    BW_TekstXY(004, 002, PAnsiChar(#4'APM: ' + APM(fMojNumerGracza, fCzasGrySekundy)));
    // BW_TekstXY(004, 013, PAnsiChar(fPomiarCzasuWykonaniaKodu + ' ms'));
    BW_TekstXY(306, 022, PAnsiChar(#4 + CzasGry(fCzasGrySekundy)));
    BW_TekstXY(014, 284, PAnsiChar(#4 + Godzina));
    // *****************************************************
    BW_RozmiarCzcionki($00000000);
    asm                               // przywrócenie rozmiaru czcionki
      pushad
      mov   ecx, pierwotnyRozmiarCzcionki
      call  dword ptr [adres]
      popad
    end;
    { QueryPerformanceCounter(stop);
      delta := ((stop - start) / czestoliwosc) * 1000;
      fPomiarCzasuWykonaniaKodu := AnsiString(FloatToStr(delta)); }
  end;
end;

function TShittyPlugin.CzasGry(const czasGrySekundy: single): AnsiString;
var
  czescSekundy, czescMinuty: integer;
begin
  czescMinuty := floor(czasGrySekundy / 60);
  czescSekundy := floor(czasGrySekundy - (czescMinuty * 60));
  if czescSekundy < 10 then Result := AnsiString(IntToStr(czescMinuty) + ':' + '0' + IntToStr(czescSekundy))
  else Result := AnsiString(IntToStr(czescMinuty) + ':' + IntToStr(czescSekundy));
end;

function TShittyPlugin.Godzina: AnsiString;
var
  Godzina: TDateTime;
begin
  Godzina := time;
  Result := AnsiString(FormatDateTime('hh:nn', Godzina));
end;

class procedure TShittyPlugin.Podpiecie_KomendyGra;
const
  oryginalnaFunkcja: cardinal = $004B23E0;
  powrot: cardinal = $004F337A;
var
  wprowadzonyTekst: PAnsiChar;
begin
  asm
    pushad
    mov   wprowadzonyTekst, edx
  end;
  if ShittyPlugin.KomendyGra(wprowadzonyTekst) then
  begin
    asm
      popad
      pop   ecx
      pop   ebp
      jmp   [powrot]
    end;
    Exit;
  end;
  asm
    popad
    pop   ecx
    pop   ebp
    call  dword ptr [oryginalnaFunkcja]
    jmp   [powrot]
  end;
end;

function TShittyPlugin.KomendyGra;
var
  wiadomoscDoWyslania, temp: AnsiString;
begin
  Result := True;
  if LowerCase(String(wprowadzonyTekst)) = '/tc' then
  begin
    if fTc then
    begin
      fTc := False;
      BW_Tekst(#4'<ShittyPlugin> ' + #7 + 'Wiadomości Twitch''a: ' + #6 + 'wyłączone')
    end
    else
    begin
      fTc := True;
      BW_Tekst(#4'<ShittyPlugin> ' + #7 + 'Wiadomości Twitch''a: ' + #3 + 'włączone')
    end;
  end
  else if LowerCase(String(wprowadzonyTekst)) = '/twitch' then
  begin
    try
      if czatTwitcha <> nil then FreeAndNil(czatTwitcha);
      czatTwitcha := TCzatTwitcha.Create;
    except
    end;
  end
  else if Pos('/t ', LowerCase(String(wprowadzonyTekst))) = 1 then
  begin
    if Length(String(wprowadzonyTekst)) > 3 then
    begin
      wiadomoscDoWyslania := Copy(wprowadzonyTekst, 4, Length(wprowadzonyTekst) - 3);
      czatTwitcha.pWyslijWiadomosc := wiadomoscDoWyslania;
      temp := #7 + AnsiString(czatTwitcha.pLogin) + ': ' + #4 + wiadomoscDoWyslania;
      BW_Tekst(PAnsiChar(temp));
    end;
  end
  else Result := False;

end;

class procedure TShittyPlugin.Podpiecie_Akcje;
const
  oryginalnaFunkcja: cardinal = $004CDE70;
  powrot: cardinal = $00486D90;
  adresNumerGracza: cardinal = $0051267C;
var
  kodAkcji: Pointer;
  numerGracza: integer;
begin
  asm
    pushad
    mov     edx,[adresNumerGracza]
    mov     edx,[edx]
    mov     numerGracza,edx
    mov     kodAkcji,esi
  end;
  ShittyPlugin.Akcje(numerGracza, byte(kodAkcji^));
  asm
    popad
    add     esp,8
    pop     ebp
    call    [oryginalnaFunkcja]
    jmp     [powrot]
  end;

end;

procedure TShittyPlugin.Akcje;
begin
  if (numerGracza < 8) and (kodAkcji <> 55) then
  begin
    fLicznikAkcji[numerGracza] := fLicznikAkcji[numerGracza] + 1;
    fAkcje[numerGracza] := kodAkcji;
  end;
end;

function TShittyPlugin.APM(const numerGracza: integer; czasGrySekundy: single): AnsiString;
begin
  if czasGrySekundy < 120 then Result := AnsiString(IntToStr(round((fLicznikAkcji[numerGracza] / (czasGrySekundy)) * 60)))
  else
  begin
    if fResetujAPM then ResetujAPM(True);
    Result := AnsiString(IntToStr(round((fLicznikAkcji[numerGracza] / (czasGrySekundy - 120)) * 60)));
  end;
end;

procedure TShittyPlugin.ResetujAPM(const resetuj: boolean);
var
  i: integer;
begin
  if resetuj then
  begin
    for i := 0 to Length(fLicznikAkcji) - 1 do fLicznikAkcji[i] := 0;
    fResetujAPM := False;
  end;
end;

procedure TShittyPlugin.BW_OdtwarzajDzwiek(const numer: integer); stdcall;
const
  adres: cardinal = $004BC270;
  asm
    pushad
    push  0
    push  0
    push  20
    push  numer
    call  dword ptr [adres]
    popad
end;

procedure TShittyPlugin.BW_Tekst(const tekst: PAnsiChar); stdcall;
const
  adres: cardinal = $0048D0C0;
  asm
    pushad
    xor   eax, eax
    mov   edi, tekst
    call  dword ptr [adres]
    popad
end;

procedure TShittyPlugin.BW_TekstXY(const x, y: integer; const tekst: PAnsiChar); stdcall;
const
  adres: cardinal = $004202B0;
  asm
    pushad
    mov   eax, [tekst]
    mov   esi, x
    push  y
    call  dword ptr [adres]
    popad
end;

procedure TShittyPlugin.BW_RozmiarCzcionki(const rozmiarCzcionki: cardinal); stdcall;
const
  adres: cardinal = $0041FB30;
  asm
    pushad
    cmp   rozmiarCzcionki, 0
    jnz   @a
    xor   ecx, ecx
    jmp   @b
  @a:
    mov   eax, dword ptr ss: [rozmiarCzcionki]
    mov   ecx, dword ptr ds: [eax]
  @b:
    call  dword ptr [adres]
    popad
end;

procedure TShittyPlugin.BW_Piksel(const x, y: integer; const kolor: byte); stdcall;
const
  adresKolor: cardinal = $006CF4AC;
  adres: cardinal = $004E1D20;
  asm
    pushad
    mov   cl, kolor
    mov   eax, adresKolor
    mov   byte ptr ds:[eax], cl
    push  1
    push  1
    push  y
    push  x
    call  dword ptr [adres]
    popad
end;

procedure TShittyPlugin.BW_Boks(const x, y, szerekosc, wysokosc: integer; const kolor: byte); stdcall;
const
  adresKolor: cardinal = $006CF4AC;
  adres: cardinal = $004E1D20;
  asm
    pushad
    mov   cl, kolor
    mov   eax, adresKolor
    mov   byte ptr ds:[eax], cl
    push  wysokosc
    push  szerekosc
    push  y
    push  x
    call  dword ptr [adres]
    popad
end;

procedure TShittyPlugin.BW_PrzezroczystyBoks(const x, y, szerekosc, wysokosc: integer; const kolor: byte); stdcall;
var
  rysuj: boolean;
  i, j: integer;
begin
  rysuj := True;
  for i := y to y + wysokosc - 1 do
  begin
    for j := x to x + szerekosc - 1 do
    begin
      if rysuj then BW_Boks(j, i, 1, 1, kolor);
      rysuj := not rysuj;
    end;
    if szerekosc mod 2 = 0 then rysuj := not rysuj;
  end;
end;

constructor TShittyPlugin.Create;
begin
  inherited Create;
  fTc := True;
  ShittyPlugin.InstalacjaPodpiec;
end;

procedure TGlownyWatek.Execute;
begin
  DirectIPPatch;
  czatTwitcha := TCzatTwitcha.Create;
  while not Terminated do
  begin
    if Gra then
    begin

    end
    else
    begin
      if fResetujZmienne then
      begin
        ShittyPlugin.pResetujAPM := True;
        ShittyPlugin.pPoczatekGry := True;
        fResetujZmienne := False;
      end;
    end;
    Sleep(350);
  end;
end;

constructor TGlownyWatek.Create(wstrzymanie: boolean);
begin
  inherited Create(wstrzymanie);
  FreeOnTerminate := True;
  fResetujZmienne := True;
end;

function TCzatTwitcha.Polacz: boolean;
begin
  if Gra then ShittyPlugin.BW_Tekst(#4'<ShittyPlugin> '#7'Próba ponownego połączenia z czatem Twitcha...');
  fIdIRC := TIdIRC.Create(nil);
  fIdIRC.OnPrivateMessage := NowaWiadomosc;
  fIdIRC.UserMode := [];
  fIdIRC.Host := '199.9.250.229';
  fIdIRC.Nickname := fLogin;
  fIdIRC.Password := fHaslo;
  try
    fIdIRC.Connect;
    fIdIRC.Join('#' + fLogin);
    fIdIRC.IOHandler.DefStringEncoding := IndyTextEncoding_UTF8();
    Result := True;
  except
    fIdIRC.Host := 'irc.twitch.tv';
    fIdIRC.Connect;
    fIdIRC.Join('#' + fLogin);
    fIdIRC.IOHandler.DefStringEncoding := IndyTextEncoding_UTF8();
    Result := True;
  end;
end;

procedure TCzatTwitcha.NowaWiadomosc(ASender: TIdContext; const ANicknameFrom, AHost, ANicknameTo, AMessage: string);
var
  temp: string;
begin
  if ShittyPlugin.pTc = True then
  begin
    temp := Copy(AMessage, 1, 80);
    ShittyPlugin.pWiadomoscTwitch := AnsiString(#3 + ANicknameFrom + ': ' + #4 + temp);
    ShittyPlugin.pNowaWiadomoscTwitch := True;
  end;
end;

procedure TCzatTwitcha.WyslijWiadomosc(const tresc: AnsiString);
begin
  fIdIRC.Say('#' + fLogin, String(tresc));
end;

constructor TCzatTwitcha.Create;
var
  ini: TINIFile;
begin
  inherited Create;
  ini := TINIFile.Create(GetCurrentDir + '\ShittyPluginDwaKropkaZero.ini');
  try
    fLogin := ini.ReadString('ShittyPlugin', 'TwitchLogin', '');
    fHaslo := ini.ReadString('ShittyPlugin', 'TwitchHaslo', '');
  finally
    ini.Free;
  end;
  if (fLogin <> '') and (fHaslo <> '') then Polacz
  else if Gra then ShittyPlugin.BW_Tekst(#4'<ShittyPlugin> '#6'Ustawienia Twitch''a nie są skonfigurowane');
end;

destructor TCzatTwitcha.Destroy;
begin
  try
    fIdIRC.Free;
  except
  end;
  inherited;
end;

function Gra;
begin
  Result := byte(Pointer($006D11EC)^) = 1
end;

function Powtorka;
begin
  Result := Gra and (byte(Pointer($006D0F14)^) > 0)
end;

function Lobby;
begin
  Result := byte(Pointer($06D11BC)^) = 4;
end;

function LobbyPrzedGra;
begin
  Result := byte(Pointer($0068ED0E)^) <> 0;
end;

procedure KopiujBlokPamieci;
var
  ochrona: cardinal;
begin
  VirtualProtect(Pointer(miejsceDocelowe), dlugosc, PAGE_EXECUTE_READWRITE, @ochrona);
  CopyMemory(Pointer(miejsceDocelowe), Pointer(zrodlo), dlugosc);
  VirtualProtect(Pointer(miejsceDocelowe), dlugosc, ochrona, nil);
end;

function DirectIPPatch;
const
  kod: array [0 .. 15] of byte = ($C7, $44, $24, 08, 05, 00, 00, 00, $B8, 01, 00, 00, 00, $C2, 08, 00);
var
  adres: cardinal;
begin
  Result := False;
  try
    adres := cardinal(GetProcAddress(GetModuleHandle('storm.dll'), PAnsiChar(251)));
    KopiujBlokPamieci(adres, cardinal(@kod), SizeOf(kod));
    Result := True;
  except

  end;
end;

procedure Wstrzykniecie(stan: integer);
begin
  if stan = DLL_PROCESS_ATTACH then
  begin
    ShittyPlugin := TShittyPlugin.Create;
    glownyWatek := TGlownyWatek.Create(False);
  end;
end;

begin
  DllProc := Wstrzykniecie;
  Wstrzykniecie(DLL_PROCESS_ATTACH);

end.
