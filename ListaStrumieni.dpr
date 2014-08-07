unit ListaStrumieni;

interface

uses
  System.Classes, IdHTTP, IdSSLOpenSSL, DBXJSON, Vcl.ComCtrls, SysUtils, StrUtils;

type
  TStringiTablica = array [0 .. 1] of string;

  TListaStrumieni = class(TThread)
  private
    fLiczbaWidzow, fDataUtworzeniaKonta, fLiczbaSledzacych, fNazwaKanalu, fDataAktualizacjiKanalu, fURL, fOpisKanalu,
      fLiczbaOdwiedzin: array of String;
    fLv: TlistView;
    fBazaDanych: TStringList;
    function PobierzInformacjeTwitchAPI: boolean;
    procedure AktualizaujListView;
    function SnipealotRasaGracza(const bonjwa: string): integer;
    function ModyfikacjaInfa(const kanal: string): TStringiTablica;
    { Private declarations }
  protected
    procedure Execute; override;
  public
    constructor Create(const lv: TlistView; const bazaDanych: TStringList);
  end;

implementation

function TListaStrumieni.PobierzInformacjeTwitchAPI: boolean;
var
  IdHTTP: TIdHTTP;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  JSON: string;
  jsonObiekt: TJSONObject;
  streams: TJSONArray;
  strumien: TJSONObject;
  channel: TJSONObject;
  created_at: TJSONString;
  followers: TJSONString;
  name: TJSONString;
  updated_at: TJSONString;
  url: TJSONString;
  status: TJSONString;
  views: TJSONString;
  viewers: TJSONString;
  liczbaStrumieni: integer;
  i: integer;
begin
  Result := False;
  IdHTTP := TIdHTTP.Create;
  try
    IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);
    IdHTTP.IOHandler := IdSSL;
    IdHTTP.Request.Accept := 'application/vnd.twitchtv.v3+json';
    IdHTTP.Request.CustomHeaders.AddValue('Client-ID', 'smb61nyd0vxmqdn9d3k735qbx41cdyg');
    JSON := IdHTTP.Get('https://api.twitch.tv/kraken/streams?game=StarCraft:%20Brood%20War');
  finally
    IdHTTP.Free;
  end;
  jsonObiekt := TJSONObject.ParseJSONValue(JSON) as TJSONObject;
  try
    streams := jsonObiekt.Get('streams').JsonValue as TJSONArray;
    liczbaStrumieni := streams.Size;
    SetLength(fLiczbaWidzow, liczbaStrumieni);
    SetLength(fDataUtworzeniaKonta, liczbaStrumieni);
    SetLength(fLiczbaSledzacych, liczbaStrumieni);
    SetLength(fNazwaKanalu, liczbaStrumieni);
    SetLength(fDataAktualizacjiKanalu, liczbaStrumieni);
    SetLength(fURL, liczbaStrumieni);
    SetLength(fOpisKanalu, liczbaStrumieni);
    SetLength(fLiczbaOdwiedzin, liczbaStrumieni);
    for i := 0 to liczbaStrumieni - 1 do
    begin
      strumien := streams.Get(i) as TJSONObject;
      viewers := strumien.Get('viewers').JsonValue as TJSONString;
      channel := strumien.Get('channel').JsonValue as TJSONObject;
      created_at := channel.Get('created_at').JsonValue as TJSONString;
      followers := channel.Get('followers').JsonValue as TJSONString;
      name := channel.Get('name').JsonValue as TJSONString;
      updated_at := channel.Get('updated_at').JsonValue as TJSONString;
      url := channel.Get('url').JsonValue as TJSONString;
      status := channel.Get('status').JsonValue as TJSONString;
      views := channel.Get('views').JsonValue as TJSONString;

      fLiczbaWidzow[i] := viewers.Value;
      fDataUtworzeniaKonta[i] := created_at.Value;
      fLiczbaSledzacych[i] := followers.Value;
      fNazwaKanalu[i] := name.Value;
      fDataAktualizacjiKanalu[i] := updated_at.Value;
      fURL[i] := url.Value;
      fOpisKanalu[i] := status.Value;
      fLiczbaOdwiedzin[i] := views.Value;
    end;
    if liczbaStrumieni > 0 then Result := true;
  except
    Result := False;
  end;
  jsonObiekt.Free;
end;

procedure TListaStrumieni.AktualizaujListView;
var
  listItem: TListItem;
begin
  Synchronize(
    procedure
    var
      i: integer;
      temp: TStringiTablica;
    begin
      fLv.Items.BeginUpdate;
      fLv.Clear;
      for i := 0 to Length(fNazwaKanalu) - 1 do
      begin
        listItem := fLv.Items.Add;
        if (fNazwaKanalu[i] = 'snipealot1') or (fNazwaKanalu[i] = 'snipealot2') or (fNazwaKanalu[i] = 'snipealot3') or
          (fNazwaKanalu[i] = 'snipealot4') then
        begin
          listItem.ImageIndex := SnipealotRasaGracza(fOpisKanalu[i]);
          listItem.Caption := ' ' + fOpisKanalu[i];
        end
        else
        begin
          temp := ModyfikacjaInfa(fNazwaKanalu[i]);
          try
            listItem.ImageIndex := StrToInt(temp[1]);
          except
            listItem.ImageIndex := 0;
          end;
          listItem.Caption := ' ' + temp[0];
        end;
        listItem.SubItems.Add(fLiczbaWidzow[i]);
        listItem.SubItems.Add('');
        listItem.SubItems.Add('');
        listItem.SubItems.Add(fNazwaKanalu[i]);
      end;
      fLv.Visible := true;
      fLv.Items.EndUpdate;
    end)
end;

constructor TListaStrumieni.Create(const lv: TlistView; const bazaDanych: TStringList);
begin
  inherited Create(False);
  FreeOnTerminate := true;
  fLv := lv;
  fBazaDanych := bazaDanych;
end;

procedure TListaStrumieni.Execute;
begin
  if PobierzInformacjeTwitchAPI then AktualizaujListView;
end;

function TListaStrumieni.SnipealotRasaGracza(const bonjwa: string): integer;
var
  gracz: string;
begin
  gracz := LowerCase(bonjwa);
  if (gracz = 'larva') or (gracz = 'killer') or (gracz = 'hero') or (gracz = 'zergman') or (gracz = 'terror') or (gracz = 'beast') or
    (gracz = 's2') or (gracz = 'zero') or (gracz = 'starcue') or (gracz = 'modesty') or (gracz = 'kwanro') or (gracz = 'cola') or
    (gracz = 'hyuk') or (gracz = 'jat.tv') or (gracz = 'saber') then Result := 0
  else if (gracz = 'hiya') or (gracz = 'mong') or (gracz = 'ssak') or (gracz = 'sea') or (gracz = 'ample') or (gracz = 'mind') or
    (gracz = 'shinee') or (gracz = 'light') or (gracz = 'dove') or (gracz = 'kkong') or (gracz = 'piano') or (gracz = 'midas') or
    (gracz = 'firebathero') or (gracz = 'icarus') or (gracz = 'boxer') then Result := 1
  else if (gracz = 'bisu') or (gracz = 'shuttle') or (gracz = 'pusan') or (gracz = 'pure') or (gracz = 'jaehoon') or (gracz = 'hint') or
    (gracz = 'eagle') or (gracz = 'mini') or (gracz = 'britney') or (gracz = 'lazy') or (gracz = 'brave') or (gracz = 'tyson') or
    (gracz = 'sky') or (gracz = 'zeus') or (gracz = 'leto') or (gracz = 'air') or (gracz = 'jangbi') or (gracz = 'tamoo') or
    (gracz = 'snow') or (gracz = 'free') or (gracz = 'hwan') or (gracz = 'yongsu') then Result := 2
  else Result := 4
end;

function TListaStrumieni.ModyfikacjaInfa(const kanal: string): TStringiTablica;
var
  i: integer;
  poczatekKanalu: integer;
  temp: string;
begin
  for i := 0 to fBazaDanych.Count - 1 do
  begin
    poczatekKanalu := PosEx(' ', fBazaDanych.Strings[i], 4);
    temp := LowerCase(copy(fBazaDanych.Strings[i], poczatekKanalu + 1, Length(fBazaDanych.Strings[i]) - poczatekKanalu + 1));
    if temp = kanal then
    begin
      Result[0] := copy(fBazaDanych.Strings[i], 4, poczatekKanalu - 4);
      Result[1] := copy(fBazaDanych.Strings[i], 1, 1);
      exit;
    end;
  end;
  Result[0] := 'Dodaj mnie';
  Result[1] := '4';
end;

end.
