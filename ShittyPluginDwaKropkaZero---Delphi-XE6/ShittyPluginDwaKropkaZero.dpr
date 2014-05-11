library ShittyPluginDwaKropkaZero;

uses
  System.SysUtils,
  System.Classes,
  System.Diagnostics,
  System.Math,
  Windows;

type
  TPodpiecia = class
  private
    fLicznikAkcji: array [0 .. 7] of integer;
    fAkcje: array [0 .. 7] of byte;
    fPomiarCzasu: AnsiString;
    fMojNumerGracza: integer;
    fResetujAPM: boolean;
    fPoczatekGry: boolean;
    fCzasGrySekundy: single;
    procedure JmpPatch(const od, skokDo: cardinal);
    procedure InstalacjaPodpiec;
    procedure CofniecieInstalacjiPodpiec;
    class procedure Podpiecie_Wyswietlanie(instance: TPodpiecia); static;
    class procedure Podpiecie_KomendyGra(instance: TPodpiecia); static;
    class procedure Podpiecie_Akcje(instance: TPodpiecia); static;
    // ****
    procedure Wyswietlanie;
    function CzasGry(const czasGrySekundy: single): AnsiString;
    function Godzina: AnsiString;
    //
    function KomendyGra(const wprowadzonyTekst: PAnsiChar): boolean;
    // ****
    procedure Akcje(const numerGracza, kodAkcji: integer);
    function APM(const numerGracza: integer): AnsiString;
    procedure ResetujAPM(const resetuj: boolean);
    //
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
  end;

  TGlownyWatek = class(TThread)
  private
  protected
    procedure Execute; override;
  public
    fResetujZmienne: boolean;
    constructor Create(wstrzymanie: boolean);
  end;

var
  ShittyPlugin: TPodpiecia;
  glownyWatek: TGlownyWatek;

function Gra: boolean; forward;
function Powtorka: boolean; forward;
function Lobby: boolean; forward;
function LobbyPrzedGra: boolean; forward;
procedure KopiujBlokPamieci(const miejsceDocelowe, zrodlo, dlugosc: cardinal); forward;

procedure TPodpiecia.JmpPatch(const od, skokDo: cardinal);
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

procedure TPodpiecia.InstalacjaPodpiec;
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

procedure TPodpiecia.CofniecieInstalacjiPodpiec;
begin

end;

class procedure TPodpiecia.Podpiecie_Wyswietlanie;
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

procedure TPodpiecia.Wyswietlanie;
const
  adres: cardinal = $0041FB30;
var
  pierwotnyRozmiarCzcionki: cardinal;
  czestoliwosc: Int64;
  start: Int64;
  stop: Int64;
  delta: extended;
begin
  if Gra then
  begin
    QueryPerformanceFrequency(czestoliwosc);
    QueryPerformanceCounter(start);
    if fPoczatekGry then
    begin
      BW_Tekst(PAnsiChar(#4'<mca64Launcher:> ' + #7'Wersja: ' + #3'1.8.6.4'));
      BW_Tekst(PAnsiChar(#4'<ShittyPlugin:> ' + #7'Wersja: ' + #3'2.0'));
      fMojNumerGracza := integer(Pointer($00512684)^);
      fResetujAPM := True;
      glownyWatek.fResetujZmienne := True;
      fPoczatekGry := False;
    end;
    pierwotnyRozmiarCzcionki := cardinal(Pointer($006D5DDC)^);
    BW_RozmiarCzcionki($00000000);
    BW_RozmiarCzcionki($006CE0F8);
    // wielka: $006CE0FC;
    // normalna: $006CE0F8;
    // mala: $006CE0F4;
    // *****************************************************cały kod tutaj:
    // BW_PrzezroczystyBoks(0, 0, 639, 165, 46);
    BW_TekstXY(4, 2, PAnsiChar(#4'APM: ' + APM(fMojNumerGracza)));
    BW_TekstXY(4, 13, PAnsiChar(fPomiarCzasu));
    fCzasGrySekundy := integer(Pointer($0057F23C)^) / 23.81;
    BW_TekstXY(306, 22, PAnsiChar(#4 + CzasGry(fCzasGrySekundy)));
    BW_TekstXY(14, 284, PAnsiChar(#4 + Godzina));
    // *****************************************************
    BW_RozmiarCzcionki($00000000);
    asm                               // przywrócenie rozmiaru czcionki
      pushad
      mov   ecx, pierwotnyRozmiarCzcionki
      call  dword ptr [adres]
      popad
    end;
    QueryPerformanceCounter(stop);
    delta := ((stop - start) / czestoliwosc) * 1000;
    fPomiarCzasu := AnsiString(FloatToStr(delta));
  end;
end;

function TPodpiecia.CzasGry(const czasGrySekundy: single): AnsiString;
var
  czescSekundy, czescMinuty: integer;
begin
  czescMinuty := floor(czasGrySekundy / 60);
  czescSekundy := floor(czasGrySekundy - (czescMinuty * 60));
  if czescSekundy < 10 then Result := IntToStr(czescMinuty) + ':' + '0' + IntToStr(czescSekundy)
  else Result := IntToStr(czescMinuty) + ':' + IntToStr(czescSekundy);
end;

function TPodpiecia.Godzina: AnsiString;
var
  Godzina: TDateTime;
begin
  Godzina := time;
  Result := FormatDateTime('hh:nn', Godzina);
end;

class procedure TPodpiecia.Podpiecie_KomendyGra;
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

function TPodpiecia.KomendyGra;
begin
  Result := False;
  if LowerCase(wprowadzonyTekst) = '/ggyo' then BW_Tekst(#4'Spierdalaj');
  Result := True;
end;

class procedure TPodpiecia.Podpiecie_Akcje;
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

procedure TPodpiecia.Akcje;
begin
  if (numerGracza < 8) and (kodAkcji <> 55) then
  begin
    fLicznikAkcji[numerGracza] := fLicznikAkcji[numerGracza] + 1;
    fAkcje[numerGracza] := kodAkcji;
  end;
end;

function TPodpiecia.APM(const numerGracza: integer): AnsiString;
var
  CzasGry: single;
  i: integer;
begin
  CzasGry := integer(Pointer($0057F23C)^) / 23.81;
  if CzasGry < 120 then Result := AnsiString(IntToStr(round((fLicznikAkcji[numerGracza] / (CzasGry)) * 60)))
  else
  begin
    if fResetujAPM then ResetujAPM(True);
    Result := AnsiString(IntToStr(round((fLicznikAkcji[numerGracza] / (CzasGry - 120)) * 60)));
  end;
end;

procedure TPodpiecia.ResetujAPM(const resetuj: boolean);
var
  i: integer;
begin
  if resetuj then
  begin
    for i := 0 to Length(fLicznikAkcji) - 1 do fLicznikAkcji[i] := 0;
    fResetujAPM := False; // not resetuj;
  end;
end;

procedure TPodpiecia.BW_OdtwarzajDzwiek(const numer: integer); stdcall;
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

procedure TPodpiecia.BW_Tekst(const tekst: PAnsiChar); stdcall;
const
  adres: cardinal = $0048D0C0;
  asm
    pushad
    xor   eax, eax
    mov   edi, tekst
    call  dword ptr [adres]
    popad
end;

procedure TPodpiecia.BW_TekstXY(const x, y: integer; const tekst: PAnsiChar); stdcall;
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

procedure TPodpiecia.BW_RozmiarCzcionki(const rozmiarCzcionki: cardinal); stdcall;
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

procedure TPodpiecia.BW_Piksel(const x, y: integer; const kolor: byte); stdcall;
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

procedure TPodpiecia.BW_Boks(const x, y, szerekosc, wysokosc: integer; const kolor: byte); stdcall;
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

procedure TPodpiecia.BW_PrzezroczystyBoks(const x, y, szerekosc, wysokosc: integer; const kolor: byte); stdcall;
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

procedure TGlownyWatek.Execute;
begin
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
    sleep(350);
  end;
end;

constructor TGlownyWatek.Create(wstrzymanie: boolean);
begin
  FreeOnTerminate := True;
  fResetujZmienne := True;
  inherited Create(wstrzymanie);
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

function DirectIPPatch: boolean;
const
  kod: array [0 .. 15] of byte = ($C7, $44, $24, 08, 05, 00, 00, 00, $B8, 01, 00, 00, 00, $C2, 08, 00);
var
  adres: cardinal;
  i: integer;
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
    glownyWatek := TGlownyWatek.Create(True);
    ShittyPlugin := TPodpiecia.Create;
    ShittyPlugin.InstalacjaPodpiec;
    DirectIPPatch;
    glownyWatek.start;
  end;
end;

begin
  DllProc := Wstrzykniecie;
  Wstrzykniecie(DLL_PROCESS_ATTACH);

end.
