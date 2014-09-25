library ShittyPluginDwaKropkaZero;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
{$R *.dres}

uses
  System.SysUtils,
  System.Classes,
  System.Math,
  System.IniFiles,
  IdContext,
  IdGlobal,
  IdIRC,
  Windows,
  Vcl.Graphics;

type
  TXYKolor = array of array of integer;

  TTekstGra = packed record
    komenda_tc1, komenda_tc0, komenda_b1, komenda_b0, wersja, Twitch_laczenie, Twitch_brakKonfiguracji: PAnsiChar;
  end;

  TShittyPlugin = class
  private
    fLicznikAkcji: array [0 .. 7] of integer;
    fAkcje: array [0 .. 7] of byte;
    fPomiarCzasuWykonaniaKodu: AnsiString;
    fMojNumerGracza: integer;
    fResetujAPM: boolean;
    fPoczatekGry: boolean;
    fCzasGrySekundy: single;
    fTc: boolean;
    fNowaWiadomoscTwitch: boolean;
    fTrescWiadomosciTwitch: AnsiString;
    fTekstGra: TTekstGra;
    fGracze: AnsiString;
    fMapa: AnsiString;
    fMapaPozycjaX: integer;

    fPomiarCzasuWykonaniaKodu5, fPomiarCzasuWykonaniaKodu12, fPomiarCzasuWykonaniaKodu16, fPomiarCzasuWykonaniaKodu26,
      fPomiarCzasuWykonaniaKodu27: int64;
    fCalosc, fSrednia5: extended;

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
    function BW_SzerekoscTekstu(const tekst: PAnsiChar): integer; stdcall;
    procedure Debug;
  public
    property pMojNumerGracza: integer read fMojNumerGracza;
    property pResetujAPM: boolean write ResetujAPM;
    property pPoczatekGry: boolean write fPoczatekGry;
    property pCzasGrySekundy: single read fCzasGrySekundy;
    property pTc: boolean read fTc;
    property pNowaWiadomoscTwitch: boolean write fNowaWiadomoscTwitch;
    property pTrescWiadomosciTwitch: AnsiString write fTrescWiadomosciTwitch;
    property pTekstGra: TTekstGra read fTekstGra;
    property pGracze: AnsiString write fGracze;
    property pMapa: AnsiString read fMapa write fMapa;
    property pMapaPozycjaX: integer write fMapaPozycjaX;
    constructor Create;
  end;

  TGlownyWatek = class(TThread)
  private
    function PobierzNazweMapy: AnsiString;
  protected
    procedure Execute; override;
  public
    fResetujZmienne: boolean;
    fPoczatekGry: boolean;
    constructor Create(wstrzymanie: boolean);
  end;

  TCzatTwitcha = class
  private
    fIdIRC: TIdIRC;
    fLogin: string;
    fHaslo: string;
    fKanal: string;
    fBlad: boolean;
    function Polacz: boolean;
    procedure NowaWiadomosc(ASender: TIdContext; const ANicknameFrom, AHost, ANicknameTo, AMessage: string);
    procedure WyslijWiadomosc(const tresc: AnsiString);
  protected
  public
    property pLogin: string read fLogin;
    property pWyslijWiadomosc: AnsiString write WyslijWiadomosc;
    property pBlad: boolean read fBlad;
    constructor Create(const kanal: String);
    destructor Destroy; override;
  end;

  TGrafika = class
  private
    fGaz: TXYKolor;
    fMineraly: TXYKolor;
    fTwitch: TXYKolor;
    fWinamp: TXYKolor;
    fUzytkownika: TXYKolor;
    procedure PobierzRGB(const kolor: TColor; var r, g, b: integer);
    procedure KonwersjaBitmapy(const plik: boolean; const nazwaPlikuLubZasobu: string; var gdzieZapisac: TXYKolor);
  public
    constructor Create;
    procedure Wyswietl(const xPoczatek, yPoczatek: integer; const xyKolor: TXYKolor);

  end;

  TOpcje = class
  private
    fGracze: boolean;
    fMapa: boolean;
    fCzasGry: boolean;
    fGodzina: boolean;
    fAPM: boolean;
    fUtwor: boolean;
    fBitmapa: boolean;
  public
    property pGracze: boolean read fGracze write fGracze;
    property pMapa: boolean read fMapa write fMapa;
    property pCzasGry: boolean read fCzasGry write fCzasGry;
    property pGodzina: boolean read fGodzina write fGodzina;
    property pAPM: boolean read fAPM write fAPM;
    property pUtwor: boolean read fUtwor write fUtwor;
    property pBitmapa: boolean read fBitmapa write fBitmapa;
    constructor Create;
  end;
  { TStale = class
    public const

    end; }

const
  polski: TTekstGra = (komenda_tc1: #4'<ShittyPlugin> ' + #7 + 'Wiadomości Twitch''a: ' + #3 + 'włączone';
    komenda_tc0: #4'<ShittyPlugin> ' + #7 + 'Wiadomości Twitch''a: ' + #6 + 'wyłączone';
    komenda_b1: #4'<ShittyPlugin> ' + #7 + 'Bitmapa''a: ' + #3 + 'włączona';
    komenda_b0: #4'<ShittyPlugin> ' + #7 + 'Bitmapa''a: ' + #6 + 'wyłączona'; wersja: #4'<ShittyPlugin> ' + #7'Wersja: ' + #3'2.0';
    Twitch_laczenie: #4'<ShittyPlugin> '#7'Próba ponownego połączenia z czatem Twitcha...';
    Twitch_brakKonfiguracji: #4'<ShittyPlugin> '#6'Ustawienia Twitch''a nie są skonfigurowane');
  angielski: TTekstGra = (komenda_tc1: #4'<ShittyPlugin> ' + #7 + 'Twitch messages: ' + #3 + 'ON';
    komenda_tc0: #4'<ShittyPlugin> ' + #7 + 'Twitch messages: ' + #6 + 'OFF'; komenda_b1: #4'<ShittyPlugin> ' + #7 + 'Bitmap: ' + #3 + 'ON';
    komenda_b0: #4'<ShittyPlugin> ' + #7 + 'Bitmap: ' + #6 + 'OFF'; wersja: #4'<ShittyPlugin> ' + #7'Version: ' + #3'2.0';
    Twitch_laczenie: #4'<ShittyPlugin> '#7'Reconnecting to Twitch chat...';
    Twitch_brakKonfiguracji: #4'<ShittyPlugin> '#6'Twitch''s settings are not configured');

var
  ShittyPlugin: TShittyPlugin;
  glownyWatek: TGlownyWatek;
  czatTwitcha: TCzatTwitcha;
  grafika: TGrafika;
  opcje: TOpcje;
  czestoliwosc: int64;
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
  start: int64;
  stop: int64;
  delta: extended;
begin
  if Gra then
  begin
    QueryPerformanceCounter(start);
    if fPoczatekGry then
    begin
      fMojNumerGracza := integer(Pointer($00512684)^);
      fResetujAPM := True;
      try
        glownyWatek.fResetujZmienne := True;
        glownyWatek.fPoczatekGry := True;
      finally

      end;
      fPoczatekGry := False;
      BW_Tekst(fTekstGra.wersja);
    end;
    if (fTc) and (fNowaWiadomoscTwitch) then
    begin
      BW_Tekst(PAnsiChar(fTrescWiadomosciTwitch));
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
    if opcje.pAPM then BW_TekstXY(4, 2, PAnsiChar(#4'APM: ' + APM(fMojNumerGracza, fCzasGrySekundy)));
    if opcje.pCzasGry then BW_TekstXY(306, 22, PAnsiChar(#4 + CzasGry(fCzasGrySekundy)));
    if opcje.pGodzina then BW_TekstXY(14, 284, PAnsiChar(#4 + Godzina));
    Debug;
    if opcje.pMapa then BW_TekstXY(Ceil(320 - (BW_SzerekoscTekstu(PAnsiChar(fMapa)) / 2)), 11, PAnsiChar(#4 + fMapa));

    // *****************************************************
    // grafika.Wyswietl(150, 250, grafika.fMineraly);
    // grafika.Wyswietl(350, 250, grafika.fGaz);
    // grafika.Wyswietl(450, 250, grafika.fTwitch);
    // grafika.Wyswietl(100, 100, grafika.fWinamp);
    if opcje.pBitmapa then grafika.Wyswietl(150, 150, grafika.fUzytkownika);
    BW_RozmiarCzcionki($00000000);
    asm                               // przywrócenie rozmiaru czcionki
      pushad
      mov   ecx, pierwotnyRozmiarCzcionki
      call  dword ptr [adres]
      popad
    end;
    QueryPerformanceCounter(stop);
    delta := ((stop - start) / czestoliwosc) * 1000;
    fPomiarCzasuWykonaniaKodu := AnsiString(FloatToStr(delta));
    if delta <= 6 then
    begin
      fPomiarCzasuWykonaniaKodu5 := fPomiarCzasuWykonaniaKodu5 + 1;
      fCalosc := fCalosc + delta;
      fSrednia5 := fCalosc / fPomiarCzasuWykonaniaKodu5;
    end
    else if delta < 12 then fPomiarCzasuWykonaniaKodu12 := fPomiarCzasuWykonaniaKodu12 + 1
    else if delta < 16 then fPomiarCzasuWykonaniaKodu16 := fPomiarCzasuWykonaniaKodu16 + 1
    else if delta < 26 then fPomiarCzasuWykonaniaKodu26 := fPomiarCzasuWykonaniaKodu26 + 1
    else if delta >= 26 then fPomiarCzasuWykonaniaKodu27 := fPomiarCzasuWykonaniaKodu27 + 1;

  end;
end;

procedure TShittyPlugin.Debug;
begin
  BW_TekstXY(4, 13, PAnsiChar(fPomiarCzasuWykonaniaKodu));
  BW_TekstXY(4, 24, PAnsiChar(#3 + '<=5 '#4 + AnsiString(IntToStr(fPomiarCzasuWykonaniaKodu5))));
  BW_TekstXY(4, 35, PAnsiChar(#3 + '>6 '#4 + AnsiString(IntToStr(fPomiarCzasuWykonaniaKodu12))));
  BW_TekstXY(4, 46, PAnsiChar(#3 + '>12 '#4 + AnsiString(IntToStr(fPomiarCzasuWykonaniaKodu16))));
  BW_TekstXY(4, 57, PAnsiChar(#3 + '>16 '#4 + AnsiString(IntToStr(fPomiarCzasuWykonaniaKodu26))));
  BW_TekstXY(4, 68, PAnsiChar(#3 + '>26 '#4 + AnsiString(IntToStr(fPomiarCzasuWykonaniaKodu27))));
  BW_TekstXY(4, 79, PAnsiChar(#3 + 'Sre '#4 + AnsiString(FloatToStr(fSrednia5))));
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
  kanal, wiadomoscDoWyslania, temp: AnsiString;
  komenda: string;
begin
  Result := True;
  komenda := LowerCase(String(wprowadzonyTekst));
  if komenda = '/tc' then
  begin
    if fTc then
    begin
      fTc := False;
      BW_Tekst(fTekstGra.komenda_tc0);
    end
    else
    begin
      fTc := True;
      BW_Tekst(fTekstGra.komenda_tc1)
    end;
  end
  else if komenda = '/j' then
  begin
    try
      if czatTwitcha <> nil then FreeAndNil(czatTwitcha);
      czatTwitcha := TCzatTwitcha.Create('');
    except
    end;
  end
  else if Pos('/j ', komenda) = 1 then
  begin
    if Length(wprowadzonyTekst) > 3 then kanal := Copy(wprowadzonyTekst, 4, Length((wprowadzonyTekst)) - 3);
    try
      if czatTwitcha <> nil then FreeAndNil(czatTwitcha);
      czatTwitcha := TCzatTwitcha.Create(String(kanal));
    except
    end;
  end
  else if Pos('/t ', komenda) = 1 then
  begin
    if not czatTwitcha.pBlad then
    begin
      if Length(wprowadzonyTekst) > 3 then
      begin
        wiadomoscDoWyslania := Copy(wprowadzonyTekst, 4, Length((wprowadzonyTekst)) - 3);
        czatTwitcha.pWyslijWiadomosc := wiadomoscDoWyslania;
        temp := #7 + AnsiString(czatTwitcha.pLogin) + ': ' + #4 + wiadomoscDoWyslania;
        BW_Tekst(PAnsiChar(temp));
      end;
    end
    else BW_Tekst(PAnsiChar('gg no re'));
  end
  else if komenda = '/b' then
  begin
    if opcje.fBitmapa then
    begin
      opcje.fBitmapa := False;
      BW_Tekst(fTekstGra.komenda_b0);
    end
    else if Length(grafika.fUzytkownika) > 0 then
    begin
      opcje.fBitmapa := True;
      BW_Tekst(fTekstGra.komenda_b1);
    end;

  end
  else if Pos('/b ', komenda) = 1 then
  begin
    if Length(wprowadzonyTekst) > 3 then
    begin
      grafika.KonwersjaBitmapy(True, String(Copy(wprowadzonyTekst, 4, Length((wprowadzonyTekst)) - 3)), grafika.fUzytkownika);
      opcje.fBitmapa := True;
      BW_Tekst(fTekstGra.komenda_b1);
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
const
  adresKolor: cardinal = $006CF4AC;
  adres: cardinal = $004E1D20;
var
  rysuj: boolean;
  i, j: integer;
begin
  rysuj := True;
  for i := y to y + wysokosc - 1 do
  begin
    for j := x to x + szerekosc - 1 do
    begin
      if rysuj then
        asm
          pushad
          mov   cl, kolor
          mov   eax, adresKolor
          mov   byte ptr ds:[eax], cl
          push  1
          push  1
          push  i
          push  j
          call  dword ptr [adres]
          popad
        end;
      rysuj := not rysuj;
    end;
    if szerekosc mod 2 = 0 then rysuj := not rysuj;
  end;
end;

function TShittyPlugin.BW_SzerekoscTekstu(const tekst: PAnsiChar): integer; stdcall;
const
  szerokoscTekstu: cardinal = $006CE108;
  adresFunkcji: cardinal = $0041F920;
begin
  asm
    pushad
    mov   ecx, [szerokoscTekstu]
    mov   dword ptr ds:[ecx], 0
    mov   eax, [tekst]
    call  dword ptr [adresFunkcji]
    popad
  end;
  Result := integer(Pointer(szerokoscTekstu)^);
end;

constructor TShittyPlugin.Create;
begin
  inherited Create;
  fTc := True;
  fTekstGra := polski;
  ShittyPlugin.InstalacjaPodpiec;
end;

procedure TGlownyWatek.Execute;
begin
  DirectIPPatch;
  grafika := TGrafika.Create;
  czatTwitcha := TCzatTwitcha.Create('');
  while not Terminated do
  begin
    if Gra then
    begin
      if fPoczatekGry then
      begin
        fPoczatekGry := False;
        ShittyPlugin.pMapa := PobierzNazweMapy;
      end;
    end
    else
    begin
      if fResetujZmienne then
      begin
        ShittyPlugin.pResetujAPM := True;
        ShittyPlugin.pPoczatekGry := True;
        ShittyPlugin.pMapa := '';
        fResetujZmienne := False;
      end;
    end;
    Sleep(100);
  end;
end;

function TGlownyWatek.PobierzNazweMapy;
const
  adres: integer = $0057FE40;
var
  znak: Char;
  offset: integer;
  znakOrd: integer;
  nazwaMapy: AnsiString;
begin
  offset := 0;
  repeat
    znak := Chr(byte(Pointer(adres + offset)^));
    znakOrd := Ord(znak);
    if (znakOrd < 32) and (znakOrd <> 0) then
    begin
      if znakOrd = 7 then nazwaMapy := nazwaMapy + #6
      else if znakOrd = 4 then nazwaMapy := nazwaMapy + #7
      else if znakOrd = 6 then nazwaMapy := nazwaMapy + #4
      else if znakOrd = 3 then nazwaMapy := nazwaMapy + #7
      else nazwaMapy := nazwaMapy + AnsiString(znak);
    end
    else nazwaMapy := nazwaMapy + AnsiString(znak);
    Inc(offset);
  until (znak = #0) or (offset > 128);
  Result := nazwaMapy;
end;

constructor TGlownyWatek.Create(wstrzymanie: boolean);
begin
  inherited Create(wstrzymanie);
  FreeOnTerminate := True;
  fResetujZmienne := True;
end;

function TCzatTwitcha.Polacz: boolean;
begin
  if Gra then ShittyPlugin.BW_Tekst(ShittyPlugin.pTekstGra.Twitch_laczenie);
  fIdIRC := TIdIRC.Create(nil);
  fIdIRC.OnPrivateMessage := NowaWiadomosc;
  fIdIRC.UserMode := [];
  fIdIRC.Host := 'irc.twitch.tv';
  fIdIRC.Nickname := fLogin;
  fIdIRC.Password := fHaslo;
  try
    fIdIRC.Connect;
    fIdIRC.Join('#' + fKanal);
    fIdIRC.IOHandler.DefStringEncoding := IndyTextEncoding_UTF8();
    Result := True;
  except
    fIdIRC.Host := '199.9.250.229';
    fIdIRC.Connect;
    fIdIRC.Join('#' + fKanal);
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
    ShittyPlugin.pTrescWiadomosciTwitch := AnsiString(#3 + ANicknameFrom + ': ' + #4 + temp);
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
  fBlad := True;
  ini := TINIFile.Create(GetCurrentDir + '\ShittyPluginDwaKropkaZero.ini');
  try
    fLogin := ini.ReadString('ShittyPlugin', 'TwitchLogin', '');
    fHaslo := ini.ReadString('ShittyPlugin', 'TwitchHaslo', '');
  finally
    ini.Free;
  end;
  if kanal <> '' then fKanal := kanal
  else fKanal := fLogin;
  if (fLogin <> '') and (fHaslo <> '') then fBlad := not Polacz;
  // else if Gra then ShittyPlugin.BW_Tekst(ShittyPlugin.pTekstGra.Twitch_brakKonfiguracji);
end;

destructor TCzatTwitcha.Destroy;
begin
  try
    fIdIRC.Free;
  except
  end;
  inherited;
end;

procedure TGrafika.PobierzRGB(const kolor: TColor; var r, g, b: integer);
var
  kolorRGB: 0 .. $FFFFFFFF;
begin
  kolorRGB := ColorToRGB(kolor);
  r := ($000000FF and kolorRGB);
  g := ($0000FF00 and kolorRGB) shr 8;
  b := ($00FF0000 and kolorRGB) shr 16;
end;

procedure TGrafika.KonwersjaBitmapy(const plik: boolean; const nazwaPlikuLubZasobu: string; var gdzieZapisac: TXYKolor);
var
  probka: TBitmap;
  bitampaDoKonwersji: TBitmap;
  rBW, gBW, bBW: array [0 .. 255] of integer;
  rRoznica, gRoznica, bRoznica: array [0 .. 255] of integer;
  sumaRoznicRGB: array [0 .. 255] of integer;
  r, g, b: integer;
  x, y, i: integer;
  najmniejszaRoznica: integer;
begin
  najmniejszaRoznica := 0;
  probka := TBitmap.Create;
  try
    probka.LoadFromResourceName(hInstance, 'Bitmap_probka');
    bitampaDoKonwersji := TBitmap.Create;
    try
      if plik then
      begin
        bitampaDoKonwersji.LoadFromFile(nazwaPlikuLubZasobu);
        SetLength(gdzieZapisac, 0, 0);
      end
      else bitampaDoKonwersji.LoadFromResourceName(hInstance, nazwaPlikuLubZasobu);
      SetLength(gdzieZapisac, bitampaDoKonwersji.Width, bitampaDoKonwersji.Height);
      for x := 0 to 255 do
      begin
        PobierzRGB(probka.Canvas.Pixels[x, 0], r, g, b);
        rBW[x] := r;
        gBW[x] := g;
        bBW[x] := b;
      end;
      for y := 0 to bitampaDoKonwersji.Height - 1 do
        for x := 0 to bitampaDoKonwersji.Width - 1 do
        begin
          PobierzRGB(bitampaDoKonwersji.Canvas.Pixels[x, y], r, g, b);
          for i := 0 to 255 do
            if (i > 15) and (i < 197) or (i = 255) or (i = 0) then
            begin
              rRoznica[i] := Abs(r - rBW[i]);
              gRoznica[i] := Abs(g - gBW[i]);
              bRoznica[i] := Abs(b - bBW[i]);
              sumaRoznicRGB[i] := rRoznica[i] + gRoznica[i] + bRoznica[i];
              if i = 0 then najmniejszaRoznica := sumaRoznicRGB[i];
              if sumaRoznicRGB[i] < najmniejszaRoznica then
              begin
                najmniejszaRoznica := sumaRoznicRGB[i];
                gdzieZapisac[x][y] := i;
              end;
            end;
        end;
    finally
      bitampaDoKonwersji.Free;
    end;
  finally
    probka.Free;
  end;
end;

procedure TGrafika.Wyswietl(const xPoczatek, yPoczatek: integer; const xyKolor: TXYKolor);
const
  adresKolor: cardinal = $006CF4AC;
  adres: cardinal = $004E1D20;
var
  x, y: integer;
  xEkran, yEkran: integer;
  kolor: byte;
begin
  for x := 0 to Length(xyKolor) - 1 do
    for y := 0 to Length(xyKolor[0]) - 1 do
    // if xyKolor[x, y] <> 0 then // brak czarnego
    // ShittyPlugin.BW_Piksel(x, y, xyKolor[x, y]);
    begin
      kolor := xyKolor[x, y];
      xEkran := x + xPoczatek;
      yEkran := y + yPoczatek;
      asm
        pushad
        mov   cl, kolor
        mov   eax, adresKolor
        mov   byte ptr ds:[eax], cl
        push  1
        push  1
        push  yEkran
        push  xEkran
        call  dword ptr [adres]
        popad
      end;
    end;
end;

constructor TGrafika.Create;
begin
  inherited Create;
  KonwersjaBitmapy(False, 'Bitmap_mineraly', fMineraly);
  KonwersjaBitmapy(False, 'Bitmap_gaz', fGaz);
  KonwersjaBitmapy(False, 'Bitmap_twitch', fTwitch);
  KonwersjaBitmapy(False, 'Bitmap_winamp', fWinamp);
end;

constructor TOpcje.Create;
begin
  inherited Create;
  fGracze := True;
  fMapa := True;
  fCzasGry := True;
  fGodzina := True;
  fAPM := True;
  fUtwor := True;
  // fBitmapa := True;
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
    opcje := TOpcje.Create;
    ShittyPlugin := TShittyPlugin.Create;
    glownyWatek := TGlownyWatek.Create(False);
  end;
end;

begin
  QueryPerformanceFrequency(czestoliwosc);
  DllProc := Wstrzykniecie;
  Wstrzykniecie(DLL_PROCESS_ATTACH);

end.
