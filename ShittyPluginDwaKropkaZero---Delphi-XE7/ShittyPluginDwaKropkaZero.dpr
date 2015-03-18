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
  Vcl.Graphics,
  Cromis.Comm.IPC in 'IPC\Cromis.Comm.IPC.pas',
  Cromis.Streams in 'IPC\Cromis.Streams.pas',
  Cromis.Threading in 'IPC\Cromis.Threading.pas',
  Cromis.Unicode in 'IPC\Cromis.Unicode.pas',
  Cromis.AnyValue in 'IPC\Cromis.AnyValue.pas',
  Cromis.Detours in 'IPC\Cromis.Detours.pas',
  Cromis.Comm.Custom in 'IPC\Cromis.Comm.Custom.pas',
  Cromis.Hashing in 'IPC\Cromis.Hashing.pas',
  Cromis.Cryptography in 'IPC\Cromis.Cryptography.pas';

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
    fOstatnioZaznaczonyGracz: integer;
    fMiejsce: integer;

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
    procedure Obs;
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
    property pMiejsce: integer read fMiejsce;
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
    fLicznikOdebrane: integer;
    fLicznikWyslane: integer;
    function Polacz: boolean;
    procedure NowaWiadomosc(ASender: TIdContext; const ANicknameFrom, AHost, ANicknameTo, AMessage: string);
    procedure WyslijWiadomosc(const tresc: AnsiString);
  protected
  public
    property pLogin: string read fLogin;
    property pWyslijWiadomosc: AnsiString write WyslijWiadomosc;
    property pBlad: boolean read fBlad;
    property pLicznikOdebrane: integer read fLicznikOdebrane;
    property pLicznikWyslane: integer read fLicznikWyslane;
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
    fTwitchLogin: string;
    fTwitchHaslo: string;
    fGracze: boolean;
    fMapa: boolean;
    fCzasGry: boolean;
    fGodzina: boolean;
    fAPM: boolean;
    fUtwor: boolean;
    fBitmapa: boolean;
    fDirectIP: boolean;
    fDebug: boolean;
    fObs: boolean;
    fAutoReplay: boolean;
    fPasekReplaya: boolean;
    fLimitSlotowReplay: boolean;

  public
    property pTwitchLogin: string read fTwitchLogin;
    property pTwitchHaslo: string read fTwitchHaslo;
    property pGracze: boolean read fGracze write fGracze;
    property pMapa: boolean read fMapa write fMapa;
    property pCzasGry: boolean read fCzasGry write fCzasGry;
    property pGodzina: boolean read fGodzina write fGodzina;
    property pAPM: boolean read fAPM write fAPM;
    property pUtwor: boolean read fUtwor write fUtwor;
    property pBitmapa: boolean read fBitmapa write fBitmapa;
    property pDirectIP: boolean read fDirectIP write fDirectIP;
    property pDebug: boolean read fDebug write fDebug;
    property pObs: boolean read fObs write fObs;
    property pAutoReplay: boolean read fAutoReplay write fAutoReplay;
    property pPasekReplaya: boolean read fPasekReplaya write fPasekReplaya;
    property pLimitSlotowReplay: boolean read fLimitSlotowReplay write fLimitSlotowReplay;
    constructor Create;
  end;

  { TStale = class
    public const

    end; }
  TLaczaNazwaneSerwer = class
  private
    fIPCSerwer: TIPCServer;
    fLicznik: integer;
    procedure OnExecuteRequest(const Context: ICommContext; const Request, Response: IMessageData);
  public
    property pLicznik: integer read fLicznik;
    constructor Create;
  end;

  TLaczaNazwaneKlient = class
  private
    fIPCKlient: TIPCClient;
    fLicznik: integer;
    procedure SendSynchronous;
  public
    property pLicznik: integer read fLicznik;
    constructor Create;
  end;

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
  laczaNazwaneSerwer: TLaczaNazwaneSerwer;
  laczaNazwaneKlient: TLaczaNazwaneKlient;
  czestoliwosc: int64;
function Gra: boolean; forward;
function Powtorka: boolean; forward;
function Lobby: boolean; forward;
function LobbyPrzedGra: boolean; forward;
procedure KopiujBlokPamieci(const miejsceDocelowe, zrodlo, dlugosc: cardinal); forward;
function DirectIPPatch: boolean; forward;

function IntToAnsiStr(const liczba: integer; const dokladnosc: integer = 0): AnsiString;
begin
  Str(liczba: dokladnosc, Result);
end;

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
      fPoczatekGry := False;
      fMojNumerGracza := integer(Pointer($00512684)^);
      fResetujAPM := True;
      glownyWatek.fResetujZmienne := True;
      glownyWatek.fPoczatekGry := True;
      BW_Tekst(fTekstGra.wersja);
      if Powtorka then opcje.pObs := True;
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
    if opcje.pObs then
      if Powtorka or (byte(Pointer($00581E14 + (fMojNumerGracza * 4))^) < 4) then Obs;
    if opcje.pDebug then Debug;
    if opcje.pMapa then BW_TekstXY(Ceil(320 - (BW_SzerekoscTekstu(PAnsiChar(fMapa)) / 2)), 11, PAnsiChar(#4 + fMapa));
    if opcje.pBitmapa then grafika.Wyswietl(0, 0, grafika.fUzytkownika);

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
    fPomiarCzasuWykonaniaKodu := AnsiString(FloatToStr(delta));
  end;
end;

procedure TShittyPlugin.Debug;
begin
  BW_TekstXY(300, 41, PAnsiChar(#4 + 'Licznik akcji: ' + #2 + IntToAnsiStr(fLicznikAkcji[fMojNumerGracza])));
  BW_TekstXY(300, 52, PAnsiChar(#4 + 'Ostatnia akcja: ' + #2 + ' 0x' + AnsiString(IntToHex(fAkcje[fMojNumerGracza], 2))));
  BW_TekstXY(300, 63, PAnsiChar(#4 + 'Liczba klatek: ' + #2 + IntToAnsiStr(integer(Pointer($0057F23C)^))));
  BW_TekstXY(300, 74, PAnsiChar(#4 + 'Pozycja kursora w osi X: ' + #2 + IntToAnsiStr(integer(Pointer($006CDDC4)^))));
  BW_TekstXY(300, 85, PAnsiChar(#4 + 'Pozycja kursora w osi Y: ' + #2 + IntToAnsiStr(integer(Pointer($006CDDC8)^))));
  BW_TekstXY(300, 96, PAnsiChar(#4 + 'Czas gry [s]: ' + #2 + AnsiString(FloatToStr(fCzasGrySekundy))));
  BW_TekstXY(300, 107, PAnsiChar(#4 + fPomiarCzasuWykonaniaKodu));
  // BW_TekstXY(300, 186, PAnsiChar(#3 + '--> ShittyPlugin: ' + #2 + IntToAnsiStr(laczaNazwaneSerwer.pLicznik)));
  // BW_TekstXY(300, 197, PAnsiChar(#3 + '--> mca64Launcher: ' + #2 + IntToAnsiStr(laczaNazwaneKlient.pLicznik)));
  BW_TekstXY(300, 208, PAnsiChar(#3 + 'Czat Twitcha odebrane: ' + #2 + IntToAnsiStr(czatTwitcha.pLicznikOdebrane)));
  BW_TekstXY(300, 219, PAnsiChar(#3 + 'Czat Twitcha wyslane: ' + #2 + IntToAnsiStr(czatTwitcha.pLicznikWyslane)));
end;

procedure TShittyPlugin.Obs;
const
  jednostkiZergTekst: array [0 .. 19] of AnsiString = ('Drone', 'Zergling', 'Hydralisk', 'Lurker Egg', 'Lurker', 'Ultralisk', 'Queen',
    'Defiler', 'Mutalisk', 'Guardian', 'Devourer', 'Scourge', 'Infested T.', 'Sunken', 'Spore', 'Overlord', 'Broodling', 'Cocoon',
    'Larva', 'Egg');
  jednostkiTerranTekst: array [0 .. 15] of AnsiString = ('SCV', 'Marine', 'Ghost', 'Firebat', 'Medic', 'Siege Tank', 'Vulture', 'Goliath',
    'Battlecruiser', 'Wraith', 'Valkyrie', 'Science V.', 'Dropship', 'Spider Mine', 'Nuclear Miss.', 'Turret');
  jednostkiTossTekst: array [0 .. 15] of AnsiString = ('Probe', 'Zealot', 'Dragoon', 'Dark T.', 'Archon', 'High Templar', 'Reaver',
    'Arbiter', 'Carrier', 'Corsair', 'Observer', 'Dark Archon', 'Scout', 'Shuttle', 'Cannon', 'Interceptor');
  jednostkiZergNumer: array [0 .. 19] of integer = (6, 2, 3, 62, 68, 4, 10, 11, 8, 9, 27, 12, 15, 111, 109, 7, 5, 25, 0, 1);
  jednostkiTerranNumer: array [0 .. 15] of integer = (7, 0, 1, 32, 34, 5, 2, 3, 12, 8, 58, 9, 11, 13, 14, 124);
  jednostkiTossNumer: array [0 .. 15] of integer = (64, 65, 66, 61, 68, 67, 83, 71, 72, 60, 84, 63, 70, 69, 162, 73);
var
  licznikJednostek: array of integer;
  numerZaznaczonegoGracza: integer;
  nazwaZaznaczonegoGracza: AnsiString;
  i: integer;
  gracz: array [0 .. 7] of AnsiString;
  mineraly: array [0 .. 7] of integer;
  gaz: array [0 .. 7] of integer;
  supply: array [0 .. 7] of integer;
  supplyMaks: array [0 .. 7] of integer;
  supplyKolor: array [0 .. 7] of AnsiChar;
  pozycjaY: integer;
  up: AnsiString;
begin
  pozycjaY := 22;
  BW_TekstXY(109, 11, PAnsiChar(#4 + 'APM'));
  grafika.Wyswietl(139, 11, grafika.fMineraly);
  grafika.Wyswietl(184, 11, grafika.fGaz);
  for i := 0 to 7 do
  begin
    SetLength(gracz[i], 16);
    Move(Pointer($0057EEEB + (i * 36))^, gracz[i][1], Length(gracz[i]));
    SetLength(gracz[i], StrLen(PAnsiChar(gracz[i])));
    if gracz[i] <> '' then
    begin
      case byte(Pointer($00581DD6 + i)^) of // kolor gracza
        $6F: gracz[i] := #$08 + gracz[i];
        $A5: gracz[i] := #$0E + gracz[i];
        $9F: gracz[i] := #$0F + gracz[i];
        $A4: gracz[i] := #$10 + gracz[i];
        $9C: gracz[i] := #$11 + gracz[i];
        $13: gracz[i] := #$15 + gracz[i];
        $54: gracz[i] := #$16 + gracz[i];
        $87: gracz[i] := #$17 + gracz[i];
        $B9: gracz[i] := #$18 + gracz[i];
        $88: gracz[i] := #$19 + gracz[i];
        $86: gracz[i] := #$1B + gracz[i];
        $33: gracz[i] := #$1C + gracz[i];
        $4D: gracz[i] := #$1D + gracz[i];
        $9A: gracz[i] := #$1E + gracz[i];
        $80: gracz[i] := #$1F + gracz[i]
      else gracz[i] := #$02 + gracz[i]
      end;
      mineraly[i] := integer(Pointer($0057F0F0 + (i * 4))^);
      gaz[i] := integer(Pointer($0057F120 + (i * 4))^);
      case byte(Pointer($0057EEEB - 2 + (i * 36))^) of // rasa
        0:
          begin // zerg
            supply[i] := integer(Pointer($00582174 + (i * 4))^);
            supplyMaks[i] := integer(Pointer($00582144 + (i * 4))^);
          end;
        1:
          begin // terran
            supply[i] := integer(Pointer($00582204 + (i * 4))^);
            supplyMaks[i] := integer(Pointer($005821D4 + (i * 4))^);
          end;
        2:
          begin
            supply[i] := integer(Pointer($00582294 + (i * 4))^);
            supplyMaks[i] := integer(Pointer($00582264 + (i * 4))^);
          end;
      end;
      if supply[i] <> 0 then supply[i] := Ceil(supply[i] / 2);
      if supplyMaks[i] <> 0 then supplyMaks[i] := Ceil(supplyMaks[i] / 2);
      if supply[i] > supplyMaks[i] then supplyKolor[i] := #6 // czerwony
      else supplyKolor[i] := #7; // zielony
      BW_TekstXY(4, pozycjaY, PAnsiChar(gracz[i]));
      BW_TekstXY(109, pozycjaY, PAnsiChar(#4 + APM(i, fCzasGrySekundy)));
      BW_TekstXY(139, pozycjaY, PAnsiChar(#7 + IntToAnsiStr(mineraly[i])));
      BW_TekstXY(184, pozycjaY, PAnsiChar(#7 + IntToAnsiStr(gaz[i])));
      BW_TekstXY(219, pozycjaY, PAnsiChar(supplyKolor[i] + IntToAnsiStr(supply[i]) + #7 + '/' + IntToAnsiStr(supplyMaks[i])));
      pozycjaY := pozycjaY + 11;
    end;
  end;
  pozycjaY := pozycjaY + 11;
  if byte(Pointer($0059724C)^) = 0 then numerZaznaczonegoGracza := fOstatnioZaznaczonyGracz
  else
  begin
    numerZaznaczonegoGracza := byte(Pointer(integer(Pointer($0059724C)^) + 76)^);
    fOstatnioZaznaczonyGracz := numerZaznaczonegoGracza
  end;
  if numerZaznaczonegoGracza > 7 then Exit;
  SetLength(nazwaZaznaczonegoGracza, 16);
  Move(Pointer($0057EEEB + (numerZaznaczonegoGracza * 36))^, nazwaZaznaczonegoGracza[1], Length(nazwaZaznaczonegoGracza));
  SetLength(nazwaZaznaczonegoGracza, StrLen(PAnsiChar(nazwaZaznaczonegoGracza)));
  BW_TekstXY(16, pozycjaY, PAnsiChar(#4 + nazwaZaznaczonegoGracza + ':'));
  pozycjaY := pozycjaY + 11;
  case byte(Pointer($0057EEEB - 2 + (numerZaznaczonegoGracza * 36))^) of // rasa
    0:
      begin
        up := IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 10)^));
        up := up + '-' + IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 11)^));
        up := up + '-' + IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 3)^));
        if up <> '0-0-0' then
        begin
          BW_TekstXY(4, pozycjaY, PAnsiChar(#3 + 'Evolution Chamber ' + #4 + up));
          pozycjaY := pozycjaY + 11;
        end;
        up := '';
        up := IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 12)^));
        up := up + '-' + IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 4)^));
        if up <> '0-0' then
        begin
          BW_TekstXY(4, pozycjaY, PAnsiChar(#3 + 'Spire ' + #4 + up));
          pozycjaY := pozycjaY + 11;
        end;
        // licznik jednostek
        SetLength(licznikJednostek, Length(jednostkiZergTekst));
        for i := 0 to Length(licznikJednostek) - 1 do
        begin
          licznikJednostek[i] := byte(Pointer($005829B4 + (numerZaznaczonegoGracza * 4) + (48 * jednostkiZergNumer[i]))^);
          if licznikJednostek[i] <> 0 then
          begin
            BW_TekstXY(4, pozycjaY, PAnsiChar(#2 + jednostkiZergTekst[i]));
            BW_TekstXY(79, pozycjaY, PAnsiChar(#7 + IntToAnsiStr(licznikJednostek[i])));
            pozycjaY := pozycjaY + 11;
          end;
        end;
      end;
    1:
      begin
        up := IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 7)^));
        up := up + '-' + IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 0)^));
        if up <> '0-0' then
        begin
          BW_TekstXY(4, pozycjaY, PAnsiChar(#3 + 'Engineering Bay ' + #4 + up));
          pozycjaY := pozycjaY + 11;
        end;
        up := '';
        up := IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 8)^));
        up := up + '-' + IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 1)^));
        up := up + '-' + IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 9)^));
        up := up + '-' + IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 2)^));
        if up <> '0-0-0-0' then
        begin
          BW_TekstXY(4, pozycjaY, PAnsiChar(#3 + 'Armory ' + #4 + up));
          pozycjaY := pozycjaY + 11;
        end;
        SetLength(licznikJednostek, Length(jednostkiTerranTekst));
        for i := 0 to Length(licznikJednostek) - 1 do
        begin
          licznikJednostek[i] := byte(Pointer($00584DE4 + (numerZaznaczonegoGracza * 4) + (48 * jednostkiTerranNumer[i]))^);
          if i = 5 then licznikJednostek[5] := licznikJednostek[5] // tank + siege tank
              + byte(Pointer($00584DE4 + (numerZaznaczonegoGracza * 4) + (48 * 30))^);
          if licznikJednostek[i] <> 0 then
          begin
            BW_TekstXY(4, pozycjaY, PAnsiChar(#2 + jednostkiTerranTekst[i]));
            BW_TekstXY(79, pozycjaY, PAnsiChar(#7 + IntToAnsiStr(licznikJednostek[i])));
            pozycjaY := pozycjaY + 11;
          end;
        end;
      end;
    2:
      begin
        up := IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 13)^));
        up := up + '-' + IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 5)^));
        up := up + '-' + IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 15)^));
        if up <> '0-0-0' then
        begin
          BW_TekstXY(4, pozycjaY, PAnsiChar(#3 + 'Forge ' + #4 + up));
          pozycjaY := pozycjaY + 11;
        end;
        up := '';
        up := IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 14)^));
        up := up + '-' + IntToAnsiStr(byte(Pointer($0058D2B0 + (numerZaznaczonegoGracza * 46) + 6)^));
        if up <> '0-0' then
        begin
          BW_TekstXY(4, pozycjaY, PAnsiChar(#3 + 'Cybernetics Core ' + #4 + up));
          pozycjaY := pozycjaY + 11;
        end;
        SetLength(licznikJednostek, Length(jednostkiTossTekst));
        for i := 0 to Length(licznikJednostek) - 1 do
        begin
          licznikJednostek[i] := byte(Pointer($00584DE4 + (numerZaznaczonegoGracza * 4) + (48 * jednostkiTossNumer[i]))^);
          if licznikJednostek[i] <> 0 then
          begin
            BW_TekstXY(4, pozycjaY, PAnsiChar(#2 + jednostkiTossTekst[i]));
            BW_TekstXY(79, pozycjaY, PAnsiChar(#7 + IntToAnsiStr(licznikJednostek[i])));
            pozycjaY := pozycjaY + 11;
          end;
        end;
      end;
  end;
end;

function TShittyPlugin.CzasGry(const czasGrySekundy: single): AnsiString;
var
  czescSekundy, czescMinuty: integer;
begin
  czescMinuty := floor(czasGrySekundy / 60);
  czescSekundy := floor(czasGrySekundy - (czescMinuty * 60));
  if czescSekundy < 10 then Result := IntToAnsiStr(czescMinuty) + ':' + '0' + IntToAnsiStr(czescSekundy)
  else Result := IntToAnsiStr(czescMinuty) + ':' + IntToAnsiStr(czescSekundy);
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
  komenda, plikZdjecie: string;
begin
  Result := True;
  komenda := LowerCase(String(wprowadzonyTekst));
  if komenda = '/apm' then
  begin
    if opcje.pAPM then opcje.pAPM := False
    else opcje.pAPM := True;
  end
  else if komenda = '/debug' then
  begin
    if opcje.pDebug then opcje.pDebug := False
    else opcje.pDebug := True
  end
  else if komenda = '/overlay' then
  begin
    if opcje.pGracze then
    begin
      opcje.pGracze := False;
      opcje.pMapa := False;
    end
    else
    begin
      opcje.pGracze := True;
      opcje.pMapa := True;
    end;
  end
  else if komenda = '/tc' then
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
      plikZdjecie := String(Copy(wprowadzonyTekst, 4, Length((wprowadzonyTekst)) - 3));
      if FileExists(plikZdjecie) then
      begin
        grafika.KonwersjaBitmapy(True, plikZdjecie, grafika.fUzytkownika);
        opcje.fBitmapa := True;
        BW_Tekst(fTekstGra.komenda_b1);
      end;
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
  if czasGrySekundy < 120 then Result := IntToAnsiStr(round((fLicznikAkcji[numerGracza] / (czasGrySekundy)) * 60))
  else
  begin
    if fResetujAPM then ResetujAPM(True);
    Result := IntToAnsiStr(round((fLicznikAkcji[numerGracza] / (czasGrySekundy - 120)) * 60));
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
  fOstatnioZaznaczonyGracz := 13;
end;

procedure TGlownyWatek.Execute;
begin
  // laczaNazwaneSerwer := TLaczaNazwaneSerwer.Create;
  // laczaNazwaneKlient := TLaczaNazwaneKlient.Create;
  if opcje.pDirectIP then DirectIPPatch;
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
        fResetujZmienne := False;
        ShittyPlugin.pResetujAPM := True;
        ShittyPlugin.pPoczatekGry := True;
        ShittyPlugin.pMapa := '';
        opcje.pObs := False;
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
    fIdIRC.Host := '192.16.64.144';
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
    Inc(fLicznikOdebrane);
  end;
end;

procedure TCzatTwitcha.WyslijWiadomosc(const tresc: AnsiString);
begin
  fIdIRC.Say('#' + fLogin, String(tresc));
  Inc(fLicznikWyslane)
end;

constructor TCzatTwitcha.Create;
begin
  inherited Create;
  fBlad := True;
  fLogin := opcje.pTwitchLogin;
  fHaslo := opcje.pTwitchHaslo;
  if kanal <> '' then fKanal := kanal
  else fKanal := fLogin;
  if (fLogin <> '') and (fHaslo <> '') then fBlad := not Polacz
  else if Gra then ShittyPlugin.BW_Tekst(ShittyPlugin.pTekstGra.Twitch_brakKonfiguracji);
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
      if xyKolor[x, y] <> 0 then // brak czarnego
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
var
  ini: TINIFile;
  sciezka: array [0 .. MAX_PATH] of Char;
begin
  inherited Create;
  FillChar(sciezka, SizeOf(sciezka), #0);
  GetModuleFileName(hInstance, sciezka, MAX_PATH);
  ini := TINIFile.Create(ExtractFilePath(sciezka) + 'ShittyPluginDwaKropkaZero.ini');
  try
    fTwitchLogin := ini.ReadString('ShittyPlugin', 'TwitchLogin', '');
    fTwitchHaslo := ini.ReadString('ShittyPlugin', 'TwitchHaslo', '');
  finally
    ini.Free;
  end;
  fGracze := True;
  fMapa := True;
  fCzasGry := True;
  fGodzina := True;
  fAPM := True;
  fUtwor := True;
  // fBitmapa := True;
  fDirectIP := True;
  fDebug := False;
  // fObs := True;
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

{ TLaczaNazwaneSerwer }

constructor TLaczaNazwaneSerwer.Create;
begin
  fIPCSerwer := TIPCServer.Create;
  fIPCSerwer.ServerName := 'ShittyPlugin';
  fIPCSerwer.OnExecuteRequest := OnExecuteRequest;
  fIPCSerwer.start;
end;

procedure TLaczaNazwaneSerwer.OnExecuteRequest(const Context: ICommContext; const Request, Response: IMessageData);
begin
  opcje.pAPM := Request.Data.ReadBoolean('APM');
  opcje.pGodzina := Request.Data.ReadBoolean('Godzina');
  opcje.pCzasGry := Request.Data.ReadBoolean('CzasGry');
  opcje.pUtwor := Request.Data.ReadBoolean('Winamp');
  opcje.pAutoReplay := Request.Data.ReadBoolean('Autoreplay');
  opcje.pPasekReplaya := Request.Data.ReadBoolean('UkryjPasek');
  opcje.pLimitSlotowReplay := Request.Data.ReadBoolean('LimitSlotow');
  opcje.pObs := Request.Data.ReadBoolean('Obs');
  opcje.pGracze := Request.Data.ReadBoolean('Overlay');
  opcje.pMapa := opcje.pGracze;
  Inc(fLicznik);
end;

{ TLaczaNazwaneKlient }

constructor TLaczaNazwaneKlient.Create;
begin
  fIPCKlient := TIPCClient.Create;
  fIPCKlient.ServerName := 'mca64Launcher';
  fIPCKlient.ConnectClient(cDefaultTimeout);
end;

procedure TLaczaNazwaneKlient.SendSynchronous;
var
  zapytanie: IIPCData;
begin
  zapytanie := AcquireIPCData;
  zapytanie.ID := 'ShittyPlugin';
  zapytanie.Data.WriteInteger('Stan', ShittyPlugin.pMiejsce);
  fIPCKlient.ExecuteConnectedRequest(zapytanie);
  Inc(fLicznik);
end;

begin
  QueryPerformanceFrequency(czestoliwosc);
  DllProc := Wstrzykniecie;
  Wstrzykniecie(DLL_PROCESS_ATTACH);

end.
