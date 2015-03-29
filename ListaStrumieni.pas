unit ListaStrumieni;

interface

uses
  System.Classes, IdHTTP, IdSSLOpenSSL, {DBXJSON} System.JSON, Vcl.ComCtrls, SysUtils, StrUtils,
  System.DateUtils, System.TimeSpan, Vcl.ExtCtrls,
  Windows, commctrl, messages;
// Diagnostics;

type
  TStringiTablica = array [0 .. 1] of string;

  TListaStrumieni = class(TThread)
  private
    fLiczbaWidzow, fDataUtworzeniaKonta, fLiczbaSledzacych, fNazwaKanalu, fDataAktualizacjiKanalu, fURL, fOpisKanalu, fLiczbaOdwiedzin,
      fKraj, fWyswietlanaNazwaKanalu, fCzasStrumieniowania, fID, fProgram, fFPS, fRozdzialka: array of String;
    fListView: TlistView;
    fBazaDanych: TStringList;
    fProgressBar: TProgressBar;
    fTrayIcon: TTrayIcon;
    // fPomiarCzasuPobrania, fPomiarCzasuReszty: TStopWatch;
    // fRozmiar: String;
    fSortujWgProgramu: boolean;
    fJezyk: integer;
    // fHinty : array of string;
    // function PobierzHinty(indeks: integer): string;
    function PobierzInformacjeTwitchAPI: boolean;
    procedure AktualizaujListView;
    function SnipealotRasaGracza(const bonjwa: string): integer;
    function ModyfikacjaInfa(const kanal: string; const j: integer): TStringiTablica;
  protected
    procedure Execute; override;
  public
    // property pHinty [indeks: integer]: string read PobierzHinty;
    constructor Create(const lv: TlistView; const bazaDanych: TStringList; const pb: TProgressBar; const ti: TTrayIcon;
      const sortujWgProgramu: boolean; const jezyk: integer);
  end;

implementation

uses Launcher;

{ function TListaStrumieni.PobierzHinty(indeks: integer):string;
  begin
  result := fHinty[indeks];
  end; }
function TListaStrumieni.PobierzInformacjeTwitchAPI: boolean;
var
  IdHTTP: TIdHTTP;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  JSONv3, JSONv2: string;
  jsonObiekt: TJSONObject;
  streams: TJSONArray;
  strumien: TJSONObject;
  channel: TJSONObject;
  created_atKonto: TJSONString;
  created_atStrumien: TJSONString;
  followers: TJSONString;
  _id: TJSONString;
  name: TJSONString;
  updated_at: TJSONString;
  url: TJSONString;
  status: TJSONString;
  views: TJSONString;
  language: TJSONString;
  viewers: TJSONString;
  display_name: TJSONString;
  average_fps: TJSONString;
  video_height: TJSONString;
  liczbaStrumieni: integer;
  i, j: integer;
  fu: TFormatSettings;
  t1, t2, t3: TDate;
  d: integer;
  uplyneloKonto, uplyneloStrumien: string;
begin
  // fPomiarCzasuPobrania.Start;
  Queue(
    procedure
    begin
      fProgressBar.Visible := true;
    end);
  Result := false;
  IdHTTP := TIdHTTP.Create;
  try
    IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);
    IdHTTP.IOHandler := IdSSL;
    IdHTTP.Request.Accept := 'application/vnd.twitchtv.v3+json';
    IdHTTP.Request.CustomHeaders.AddValue('Client-ID', 'smb61nyd0vxmqdn9d3k735qbx41cdyg');
    JSONv3 := IdHTTP.Get('https://api.twitch.tv/kraken/streams?game=StarCraft:%20Brood%20War');
    Queue(
      procedure
      begin
        fProgressBar.Position := 1;
      end);
    IdHTTP.Request.Accept := 'application/vnd.twitchtv.v2+json';
    JSONv2 := IdHTTP.Get('https://api.twitch.tv/kraken/streams?game=StarCraft:%20Brood%20War');
    Queue(
      procedure
      begin
        fProgressBar.Position := 2;
      end);
    // fRozmiar := (IntToStr(Round((Length(JSONv3) / 1024) + (Length(JSONv2) / 1024))) + ' kB');
  finally
    IdHTTP.Free;
    // fPomiarCzasuPobrania.Stop;
    // fPomiarCzasuReszty.Start;
  end;
  jsonObiekt := TJSONObject.ParseJSONValue(JSONv3) as TJSONObject;
  try
    streams := jsonObiekt.Get('streams').JsonValue as TJSONArray;
    liczbaStrumieni := streams.Count; // Delphi XE7
    // liczbaStrumieni := streams.Size;
    SetLength(fLiczbaWidzow, liczbaStrumieni);
    SetLength(fFPS, liczbaStrumieni);
    SetLength(fRozdzialka, liczbaStrumieni);
    SetLength(fDataUtworzeniaKonta, liczbaStrumieni);
    SetLength(fCzasStrumieniowania, liczbaStrumieni);
    SetLength(fLiczbaSledzacych, liczbaStrumieni);
    SetLength(fNazwaKanalu, liczbaStrumieni);
    SetLength(fDataAktualizacjiKanalu, liczbaStrumieni);
    SetLength(fURL, liczbaStrumieni);
    SetLength(fOpisKanalu, liczbaStrumieni);
    SetLength(fLiczbaOdwiedzin, liczbaStrumieni);
    SetLength(fKraj, liczbaStrumieni);
    SetLength(fWyswietlanaNazwaKanalu, liczbaStrumieni);
    SetLength(Form1.HintyTablica, 0);
    SetLength(Form1.HintyTablica, liczbaStrumieni);
    SetLength(fID, liczbaStrumieni);
    SetLength(fProgram, liczbaStrumieni);
    fu := TFormatSettings.Create;
    fu.ShortDateFormat := 'yyyy-MM-dd';
    fu.DateSeparator := '-';
    fu.TimeSeparator := ':';
    for i := 0 to liczbaStrumieni - 1 do
    begin
      strumien := streams.Items[i] as TJSONObject; // Delphi XE7
      // strumien := streams.Get(i) as TJSONObject;
      viewers := strumien.Get('viewers').JsonValue as TJSONString;
      average_fps := strumien.Get('average_fps').JsonValue as TJSONString;
      video_height := strumien.Get('video_height').JsonValue as TJSONString;
      _id := strumien.Get('_id').JsonValue as TJSONString;
      created_atStrumien := strumien.Get('created_at').JsonValue as TJSONString;
      channel := strumien.Get('channel').JsonValue as TJSONObject;
      created_atKonto := channel.Get('created_at').JsonValue as TJSONString;
      followers := channel.Get('followers').JsonValue as TJSONString;
      name := channel.Get('name').JsonValue as TJSONString;
      updated_at := channel.Get('updated_at').JsonValue as TJSONString;
      url := channel.Get('url').JsonValue as TJSONString;
      try
        status := channel.Get('status').JsonValue as TJSONString;
        fOpisKanalu[i] := status.Value;
      except
        fOpisKanalu[i] := '';
      end;
      views := channel.Get('views').JsonValue as TJSONString;
      language := channel.Get('language').JsonValue as TJSONString;
      display_name := channel.Get('display_name').JsonValue as TJSONString;
      fLiczbaWidzow[i] := viewers.Value;
      fFPS[i] := average_fps.Value;
      fRozdzialka[i] := video_height.Value;
      fCzasStrumieniowania[i] := created_atStrumien.Value;
      fDataUtworzeniaKonta[i] := created_atKonto.Value;
      fLiczbaSledzacych[i] := followers.Value;
      fNazwaKanalu[i] := name.Value;
      fDataAktualizacjiKanalu[i] := updated_at.Value;
      fURL[i] := url.Value;
      fLiczbaOdwiedzin[i] := views.Value;
      fKraj[i] := language.Value;
      fWyswietlanaNazwaKanalu[i] := display_name.Value;
      fID[i] := _id.Value;
      t1 := StrToDateTime(fDataAktualizacjiKanalu[i], fu);
      t2 := TTimeZone.Local.ToUniversalTime(Now);
      d := trunc(t2 - t1);
      if d > 0 then uplyneloKonto := (Format('%dd, %s', [d, FormatDateTime('hh''h'' nn''min'' ss''s''', Frac(t2 - t1))]))
      else uplyneloKonto := (Format('%s', [FormatDateTime('hh''h'' nn''min'' ss''s''', Frac(t2 - t1))]));
      t3 := StrToDateTime(fCzasStrumieniowania[i], fu);
      d := trunc(t2 - t3);
      if d > 0 then uplyneloStrumien := (Format('%dd, %s', [d, FormatDateTime('hh''h'' nn''min'' ss''s''', Frac(t2 - t3))]))
      else uplyneloStrumien := (Format('%s', [FormatDateTime('hh''h'' nn''min'' ss''s''', Frac(t2 - t3))]));
      if fJezyk = 0 then
          Form1.HintyTablica[i] := 'Adres: ' + fURL[i] + #13#10 + 'Opis: ' + fOpisKanalu[i] + #13#10 + 'Język: ' + UpperCase(fKraj[i]) +
          #13#10 + 'Data utworzenia konta: ' + FormatDateTime('c', StrToDateTime(fDataUtworzeniaKonta[i], fu)) + #13#10 +
          'Czas strumieniowania: ' + FormatDateTime('c', t3 + TTimeZone.Local.GetUtcOffset(Now, true)) + ' (upłyneło ' + uplyneloStrumien +
          ')' + #13#10 + 'Czas ostatniej aktualizacji kanału: ' + FormatDateTime('c', t1 + TTimeZone.Local.GetUtcOffset(Now, true)) +
          ' (upłyneło ' + uplyneloKonto + ')' + #13#10 + 'Liczba odwiedzin: ' + fLiczbaOdwiedzin[i] + #13#10 + 'Liczba śledzących: ' +
          fLiczbaSledzacych[i]
      else Form1.HintyTablica[i] := 'Address: ' + fURL[i] + #13#10 + 'Description: ' + fOpisKanalu[i] + #13#10 + 'Language: ' +
          UpperCase(fKraj[i]) + #13#10 + 'Account created at: ' + FormatDateTime('c', StrToDateTime(fDataUtworzeniaKonta[i], fu)) + #13#10 +
          'Stream uptime: ' + FormatDateTime('c', t3 + TTimeZone.Local.GetUtcOffset(Now, true)) + ' (elapsed ' + uplyneloStrumien + ')' +
          #13#10 + 'Channel updated at: ' + FormatDateTime('c', t1 + TTimeZone.Local.GetUtcOffset(Now, true)) + ' (elapsed ' + uplyneloKonto
          + ')' + #13#10 + 'Views: ' + fLiczbaOdwiedzin[i] + #13#10 + 'Followers: ' + fLiczbaSledzacych[i]
    end;
    // Twitch API V2 (program do strumieniowania)
    jsonObiekt.Free;
    jsonObiekt := TJSONObject.ParseJSONValue(JSONv2) as TJSONObject;
    streams := jsonObiekt.Get('streams').JsonValue as TJSONArray;
    liczbaStrumieni := streams.Count;
    // liczbaStrumieni := streams.Size;
    for i := 0 to liczbaStrumieni - 1 do
    begin
      strumien := streams.Items[i] as TJSONObject; // Delphi XE7
      // strumien := streams.Get(i) as TJSONObject;
      _id := strumien.Get('_id').JsonValue as TJSONString;
      for j := 0 to Length(fID) - 1 do
        if _id.Value = fID[j] then
        begin
          _id := strumien.Get('broadcaster').JsonValue as TJSONString;
          fProgram[j] := _id.Value;
        end;
    end;
    if (liczbaStrumieni > 0) and (Length(fLiczbaWidzow) > 0) then Result := true;
  except
    Result := false;
  end;
  jsonObiekt.Free;
end;

procedure TListaStrumieni.AktualizaujListView;
var
  listItem: TListItem;
  afreeca: boolean;
begin
  Synchronize(
    procedure
    var
      i, j: integer;
      temp: TStringiTablica;
      listaKanalowPrzed, listaKanalowPo: array of string;
      nowyStrumien: boolean;
      tekstChmurka: string;
      pozycja: integer;
      sInfo: TScrollInfo;
    begin
      sInfo.cbSize := SizeOf(sInfo);
      sInfo.fMask := SIF_ALL;
      GetScrollInfo(fListView.Handle, SB_VERT, sInfo);
      pozycja := sInfo.nPos;
      // Form1.Caption := inttostr(pozycja);
      fListView.Items.BeginUpdate;
      try
        SetLength(listaKanalowPrzed, fListView.Items.Count);
        for i := 0 to fListView.Items.Count - 1 do listaKanalowPrzed[i] := fListView.Items[i].Caption;
        fListView.Clear;
        SetLength(listaKanalowPo, Length(fNazwaKanalu));
        for i := 0 to Length(fNazwaKanalu) - 1 do
        begin
          // fProgressBar.Position := i;
          listItem := fListView.Items.Add;
          if (fNazwaKanalu[i] = 'snipealot1') or (fNazwaKanalu[i] = 'snipealot2') or (fNazwaKanalu[i] = 'snipealot3') or
            (fNazwaKanalu[i] = 'snipealot4') or (fNazwaKanalu[i] = 'bgvrtc') or (fNazwaKanalu[i] = 'tempsnip1') then
          begin
            listItem.ImageIndex := SnipealotRasaGracza(fOpisKanalu[i]);
            listItem.Caption := ' ' + fOpisKanalu[i];
            afreeca := true;
          end
          else
          begin
            afreeca := false;
            temp := ModyfikacjaInfa(fNazwaKanalu[i], i);
            try
              listItem.ImageIndex := StrToInt(temp[1]);
            except
              listItem.ImageIndex := 0;
            end;
            listItem.Caption := ' ' + temp[0];
          end;
          listItem.SubItems.Add(fLiczbaWidzow[i]);
          try
            fFPS[i] := FloatToStrF(StrToFloat(fFPS[i]), ffNumber, 100, 2);
          except
            fFPS[i] := '-.-'
          end;
          listItem.SubItems.Add(fRozdzialka[i] + 'p @' + fFPS[i]);
          if afreeca then listItem.SubItemImages[1] := 8
          else if fProgram[i] = 'unknown_rtmp' then listItem.SubItemImages[1] := 9
          else if fProgram[i] = 'obs' then listItem.SubItemImages[1] := 7
          else if fProgram[i] = 'xsplit' then listItem.SubItemImages[1] := 6
          else if fProgram[i] = 'fme' then listItem.SubItemImages[1] := 5
          else listItem.SubItemImages[1] := 4;
          listItem.SubItems.Add(inttostr(i + 1));
          listItem.SubItems.Add(fNazwaKanalu[i]);
          listaKanalowPo[i] := fListView.Items[i].Caption;
        end;
        fListView.Visible := true;
      finally
        fListView.Items.EndUpdate;
        for i := 1 to pozycja do SendMessage(fListView.Handle, WM_VSCROLL, SB_LINEDOWN, 0);
      end;
      if Form1.CheckBox68.checked then // Pop Your Balloon
        try
          for i := 0 to Length(listaKanalowPo) - 1 do
          begin
            nowyStrumien := true;
            for j := 0 to Length(listaKanalowPrzed) - 1 do
              if listaKanalowPo[i] = listaKanalowPrzed[j] then nowyStrumien := false;
            if nowyStrumien then
            begin
              if tekstChmurka = '' then tekstChmurka := listaKanalowPo[i]
              else tekstChmurka := tekstChmurka + ', ' + listaKanalowPo[i]
            end;
          end;
          if (tekstChmurka <> '') and (PobierzNazweKlasyAktywnegoOkna(GetForeGroundWindow) <> 'SDlgDialog') and
            (PobierzNazweKlasyAktywnegoOkna(GetForeGroundWindow) <> 'SWarClass') then
          begin
            fTrayIcon.BalloonTitle := 'Strumień';
            fTrayIcon.BalloonHint := tekstChmurka;
            fTrayIcon.ShowBalloonHint;
          end;
        except
        end;
      { if fSortujWgProgramu then
        begin
        Form1.ListView2ColumnClick(Self, Form1.ListView2.Columns[2]);
        Form1.ListView2ColumnClick(Self, Form1.ListView2.Columns[2]);
        end; }
      fProgressBar.Position := 0;
      fProgressBar.Visible := false;
    end)
end;

constructor TListaStrumieni.Create(const lv: TlistView; const bazaDanych: TStringList; const pb: TProgressBar; const ti: TTrayIcon;
const sortujWgProgramu: boolean; const jezyk: integer);
begin
  inherited Create(false);
  FreeOnTerminate := true;
  fListView := lv;
  fBazaDanych := bazaDanych;
  fProgressBar := pb;
  fTrayIcon := ti;
  fSortujWgProgramu := sortujWgProgramu;
  fJezyk := jezyk;
end;

procedure TListaStrumieni.Execute;
begin
  if PobierzInformacjeTwitchAPI then AktualizaujListView;
  { fPomiarCzasuReszty.Stop;
    Synchronize(
    procedure
    begin
    DodajDoLogaAV('ListaStrumieni', IntToStr(fPomiarCzasuPobrania.ElapsedMilliseconds) + ' + ' +
    IntToStr(fPomiarCzasuReszty.ElapsedMilliseconds) + ' ms, ' + fRozmiar);
    end); }
end;

function TListaStrumieni.SnipealotRasaGracza(const bonjwa: string): integer;
var
  gracz: string;
begin
  gracz := LowerCase(bonjwa);
  if (gracz = 'larva') or (gracz = 'killer') or (gracz = 'hero') or (gracz = 'zergman') or (gracz = 'terror') or (gracz = 'beast') or
    (gracz = 's2') or (gracz = 'zero') or (gracz = 'starcue') or (gracz = 'modesty') or (gracz = 'kwanro') or (gracz = 'cola') or
    (gracz = 'hyuk') or (gracz = 'jat.tv') or (gracz = 'saber') or (gracz = 'effort') then Result := 0
  else if (gracz = 'hiya') or (gracz = 'mong') or (gracz = 'ssak') or (gracz = 'sea') or (gracz = 'ample') or (gracz = 'mind') or
    (gracz = 'shinee') or (gracz = 'light') or (gracz = 'dove') or (gracz = 'kkong') or (gracz = 'piano') or (gracz = 'midas') or
    (gracz = 'firebathero') or (gracz = 'icarus') or (gracz = 'boxer') or (gracz = 'last') then Result := 1
  else if (gracz = 'bisu') or (gracz = 'shuttle') or (gracz = 'pusan') or (gracz = 'pure') or (gracz = 'jaehoon') or (gracz = 'hint') or
    (gracz = 'eagle') or (gracz = 'mini') or (gracz = 'britney') or (gracz = 'lazy') or (gracz = 'brave') or (gracz = 'tyson') or
    (gracz = 'sky') or (gracz = 'zeus') or (gracz = 'leto') or (gracz = 'air') or (gracz = 'jangbi') or (gracz = 'tamoo') or
    (gracz = 'snow') or (gracz = 'free') or (gracz = 'hwan') or (gracz = 'yongsu') or (gracz = 'guemchi') then Result := 2
  else Result := 4
end;

function TListaStrumieni.ModyfikacjaInfa(const kanal: string; const j: integer): TStringiTablica;
var
  i: integer;
  poczatekKanalu: integer;
  temp: string;
begin
  try
    for i := 0 to fBazaDanych.Count - 1 do
    begin
      poczatekKanalu := PosEx(' ', fBazaDanych.Strings[i], 4);
      temp := LowerCase(copy(fBazaDanych.Strings[i], poczatekKanalu + 1, Length(fBazaDanych.Strings[i]) - poczatekKanalu + 1));
      if temp = kanal then
      begin
        Result[0] := copy(fBazaDanych.Strings[i], 4, poczatekKanalu - 4);
        if temp = LowerCase(Result[0]) then Result[0] := fWyswietlanaNazwaKanalu[j];
        Result[1] := copy(fBazaDanych.Strings[i], 1, 1);
        exit;
      end;
    end;
    Result[0] := fWyswietlanaNazwaKanalu[j]; // + ' Dodaj mnie ';
    Result[1] := '4';
  except

  end;
end;

end.
