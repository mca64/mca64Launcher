library TwitchCzat;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}

uses
  System.SysUtils, IdIRC, IdContext, IdGlobal, Classes, Registry, Windows;

type
  TGlownyWatek = class(TThread)
  private
  protected
    procedure Execute; override;
  public
    constructor Create(wstrzymanie: boolean);
  end;

  TCzatTwitcha = class
  private
    fLogin: string;
    fHaslo: string;
    fKanal: string;
    fWiadomosc: string;
    fNick: string;
    fUdanePolaczenie: boolean;
    function Polacz: boolean;
    procedure NowaWiadomosc(ASender: TIdContext; const ANicknameFrom, AHost, ANicknameTo, AMessage: string);
    procedure MySugarIsRaw(ASender: TIdContext; AIn: boolean; const AMessage: string);
    procedure WyjscieUzytkownika(ASender: TIdContext; const ANickname, AHost, AChannel, APartMessage: string);
    procedure Polaczono(Sender: TObject);
    procedure ListaUzytkownikow(ASender: TIdContext; const AChannel: string; ANicknameList: TStrings);
    procedure WejscieUzytkownika(ASender: TIdContext; const ANickname, AHost, AChannel: string);
  protected
  public
    fIdIRC: TIdIRC;
    property pKanal: string read fKanal;
    property pWiadomosc: string read fWiadomosc;
    property pNick: string read fNick;
    property pUdanePolaczenie: boolean read fUdanePolaczenie;
    constructor Create(const login, haslo, kanal: string);
    destructor Destroy; override;
  end;

  TPrzkazDoShittyPlugin = packed record
    wiadomosc, temp: String[255];
    nick: String[30];
    iloscWiadomosci: integer;
    udanePolaczenie: boolean;
  end;

  PrzkazDoShittyPlugin = ^TPrzkazDoShittyPlugin;

  TOdbierzODShittyPlugin = packed record
    wiadomosc: String[255];
    idWiadomosci: integer;
    idKomendy: integer;
    komenda: integer;
    kanal: string[30];
  end;

  OdbierzODShittyPlugin = ^TOdbierzODShittyPlugin;

procedure ImportDanych(dane: OdbierzODShittyPlugin); stdcall; external 'ShittyPlugin.dll' Name 'PrzekazWiadomscDoWyslania';

var
  // glownyWatek: TGlownyWatek;
  czatTwitcha: TCzatTwitcha;
  iloscWiadomosciG, idWiadomosciG, idKomendyG: integer;

procedure TGlownyWatek.Execute;
var
  rejestr: TRegistry;
  twitchLogin, twitchHaslo, polaczUst: string;
  odebraneDane: TOdbierzODShittyPlugin;
begin
  Sleep(5000);
  rejestr := TRegistry.Create((KEY_READ));
  rejestr.RootKey := HKEY_LOCAL_MACHINE;
  try
    rejestr.OpenKey('SOFTWARE\mca64Launcher\ShittyPlugin\', False);
    twitchLogin := rejestr.ReadString('TwitchLogin');
    twitchHaslo := rejestr.ReadString('TwitchHaslo');
    polaczUst := rejestr.ReadString('Twitch');
  finally
    rejestr.Free;
  end;
  if (polaczUst = '-1') and (twitchLogin <> '') and (twitchHaslo <> '') then
      czatTwitcha := TCzatTwitcha.Create(twitchLogin, twitchHaslo, '#' + twitchLogin)
  else Exit;
  idKomendyG := 0;
  while not Terminated do
  begin
    ImportDanych(@odebraneDane);
    if odebraneDane.idKomendy > idKomendyG then
    begin
      idKomendyG := idKomendyG + 1;
      case odebraneDane.komenda of
        1:
          begin
            try
              if czatTwitcha <> nil then FreeAndNil(czatTwitcha);
              if odebraneDane.kanal <> '' then
                  czatTwitcha := TCzatTwitcha.Create(twitchLogin, twitchHaslo, '#' + String(odebraneDane.kanal))
              else czatTwitcha := TCzatTwitcha.Create(twitchLogin, twitchHaslo, '#' + twitchLogin)
            except
            end;
          end;
        2:
          begin
            try
              if czatTwitcha <> nil then FreeAndNil(czatTwitcha);
            except
            end;
          end;
      end;
    end
    else
    begin
      if odebraneDane.idWiadomosci > idWiadomosciG then
      begin
        try
          if czatTwitcha <> nil then czatTwitcha.fIdIRC.Say(czatTwitcha.pKanal, String(odebraneDane.wiadomosc));
        finally
          idWiadomosciG := idWiadomosciG + 1;
        end;
      end;
    end;
    Sleep(1000);
  end;
end;

constructor TGlownyWatek.Create(wstrzymanie: boolean);
begin
  inherited Create(wstrzymanie);
  FreeOnTerminate := True;
end;

function TCzatTwitcha.Polacz: boolean;

begin
  Result := False;
  try
    fIdIRC := TIdIRC.Create(nil);
    fIdIRC.OnPrivateMessage := NowaWiadomosc;
    fIdIRC.OnRaw := MySugarIsRaw;
    { fIdIRC.OnNicknamesListReceived := ListaUzytkownikow;
      fIdIRC.OnPart := WyjscieUzytkownika;
      fIdIRC.OnConnected := Polaczono;
      fIdIRC.OnJoin := WejscieUzytkownika; }
    fIdIRC.UserMode := [];
    fIdIRC.Host := '199.9.250.229';
    fIdIRC.Nickname := fLogin; // 'mca64';
    fIdIRC.Password := fHaslo; // 'oauth:hdbmv7oeoe2d3uero62l28t0ylwy9vg';
  finally
    try
      fIdIRC.Connect;
      fIdIRC.Join(fKanal);
      fIdIRC.IOHandler.DefStringEncoding := IndyTextEncoding_UTF8();
      Result := True;
    except
      try
        fIdIRC.Host := 'irc.twitch.tv';
        fIdIRC.Connect;
        fIdIRC.Join(fKanal);
        fIdIRC.IOHandler.DefStringEncoding := IndyTextEncoding_UTF8();
        Result := True;
      except
        fIdIRC.Free;
      end;
    end;
  end;
end;

procedure TCzatTwitcha.NowaWiadomosc(ASender: TIdContext; const ANicknameFrom, AHost, ANicknameTo, AMessage: string);
begin
  fWiadomosc := AMessage;
  fNick := ANicknameFrom;
  iloscWiadomosciG := iloscWiadomosciG + 1;
end;

procedure TCzatTwitcha.MySugarIsRaw(ASender: TIdContext; AIn: boolean; const AMessage: string);
begin
  if not fUdanePolaczenie then
  begin
    if AMessage = 'NOTICE * :Login unsuccessful' then
    begin
      // 'Złe hasło albo login'
    end
    else if AMessage = 'NOTICE * :Error encountered while attempting login' then
    begin
      // 'Wystąpił nieznany błąd podczas logowania do czatu Twitch''a. Prawdpodobnie konto nie jest zweryfikowane.'
    end
    else if (Pos('connected to TMI', AMessage) > 0) or (Pos('host is testserver.local', AMessage) > 0) or (Pos(':HISTORYEND', AMessage) > 0)
    then
    begin
      fUdanePolaczenie := True;
    end
  end;
end;

procedure TCzatTwitcha.WyjscieUzytkownika(ASender: TIdContext; const ANickname, AHost, AChannel, APartMessage: string);

begin

end;

procedure TCzatTwitcha.Polaczono(Sender: TObject);
begin

end;

procedure TCzatTwitcha.WejscieUzytkownika(ASender: TIdContext; const ANickname, AHost, AChannel: string);
begin

end;

procedure TCzatTwitcha.ListaUzytkownikow(ASender: TIdContext; const AChannel: string; ANicknameList: TStrings);
begin

end;

constructor TCzatTwitcha.Create(const login, haslo, kanal: String);
begin
  inherited Create;
  fLogin := login;
  fHaslo := haslo;
  fKanal := kanal;
  Polacz;
end;

destructor TCzatTwitcha.Destroy;
begin
  try
    fIdIRC.Free;
  except
  end;
  inherited;
end;

procedure EksportDanych(dane: PrzkazDoShittyPlugin); stdcall;
begin
  if Assigned(czatTwitcha) then
  begin
    with dane^ do
    begin
      wiadomosc := AnsiString(czatTwitcha.pWiadomosc);
      nick := AnsiString(czatTwitcha.pNick);
      iloscWiadomosci := iloscWiadomosciG;
      udanePolaczenie := czatTwitcha.pUdanePolaczenie;
    end
  end
  else
  begin
    with dane^ do
    begin
      wiadomosc := '';
      nick := '';
      iloscWiadomosci := iloscWiadomosciG;
      udanePolaczenie := False;
    end;
  end;
end;

exports
  EksportDanych Name 'OdbierzNowaWiadomsc';

begin
  // glownyWatek :=
  TGlownyWatek.Create(False);

end.
