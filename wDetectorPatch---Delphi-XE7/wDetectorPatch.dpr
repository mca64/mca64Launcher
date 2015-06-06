library wDetectorPatch;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}

uses
  System.SysUtils,
  System.Classes,
  TLHelp32,
  Windows;

{$R *.res}

var
  adresBazowy, hProces: cardinal;

function PobierzAdresBazowy(const pId: cardinal): cardinal;
var
  hSnap: cardinal;
  wpis: TModuleEntry32;
begin
  Result := 0;
  hSnap := CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, pId);
  if hSnap <> 0 then
    try
      wpis.dwSize := SizeOf(TModuleEntry32);
      if Module32First(hSnap, wpis) = True then
      begin
        while Module32Next(hSnap, wpis) = True do
        begin
          if lstrcmpi(wpis.szModule, 'wDetector.w') = 0 then
          begin
            Result := cardinal(wpis.modBaseAddr);
            break;
          end;
        end;
      end;
    finally
      CloseHandle(hSnap);
    end;
end;

procedure ZapiszTekstDoPamieci(const adresDoZapisania: cardinal; tekst: ansiString);
var
  i, znak: integer;
  temp: size_t;
begin
  for i := 0 to Length(tekst) - 1 do
  begin
    znak := ord(tekst[i + 1]);
    WriteProcessMemory(hProces, Pointer(adresBazowy + adresDoZapisania + i), @znak, 1, temp);
  end;
end;

function Patchuj(const pId: cardinal; const jezyk: integer): boolean; stdcall;
begin
  adresBazowy := PobierzAdresBazowy(pId);
  hProces := OpenProcess(PROCESS_ALL_ACCESS, False, pId);
  try
    ZapiszTekstDoPamieci($41BF9, ' wD '#4'3.36 '#6' mca64Launcher');
    ZapiszTekstDoPamieci($5AD94, #18); // aktywacja AA B4 C2 20 C7 D1
    if jezyk = 0 then // polski
    begin
      { ZapiszTekstDoPamieci($3E683, ' Historia gier: ');
        ZapiszTekstDoPamieci($3F1C9, '- host hack');
        ZapiszTekstDoPamieci($3F2D5, ' - wykryte hacki   ');
        ZapiszTekstDoPamieci($3F331, #$17 + 'Gotowe. Możesz teraz wykonywać akcje                   ');
        ZapiszTekstDoPamieci($3F66D, '- czat:    ');
        ZapiszTekstDoPamieci($3F9E8, #4'N ');
        ZapiszTekstDoPamieci($3F9EC, #4'Pn');
        ZapiszTekstDoPamieci($3F9F0, #4'Wt');
        ZapiszTekstDoPamieci($3F9F4, #4'Sr');
        ZapiszTekstDoPamieci($3F9F8, #4'Cz');
        ZapiszTekstDoPamieci($3F9FC, #4'Pt');
        ZapiszTekstDoPamieci($3FA00, #4'So');
        ZapiszTekstDoPamieci($3FA04, #2'PM'#6);
        ZapiszTekstDoPamieci($3FA0C, #2'AM'#6);
        ZapiszTekstDoPamieci($40B79, 'wDetector aktywowany!      ');
        ZapiszTekstDoPamieci($40B98, 'Konflikt');
        ZapiszTekstDoPamieci($40DB8, ' - odświeżanie gry>   ');
        ZapiszTekstDoPamieci($414C1, ' Wył');
        ZapiszTekstDoPamieci($414C9, '  Wł');
        ZapiszTekstDoPamieci($414D1, 'Odświeżanie gry ');
        ZapiszTekstDoPamieci($46870, 'AutoMine');
        ZapiszTekstDoPamieci($46898, 'M. komendy');
        ZapiszTekstDoPamieci($468E8, 'A. build  ');
        ZapiszTekstDoPamieci($46938, 'Hack');
        ZapiszTekstDoPamieci($46988, 'Spoofer   ');
        ZapiszTekstDoPamieci($414E9, 'Okno dropowania wł.');
        ZapiszTekstDoPamieci($41501, 'Okno dropowania wył.' + #$0A + #$08 + 'Nie wykonuj żadnych akcji,' + ' mogą one zostać uznane za ' + #04
        + '"multi command"                          ');
        ZapiszTekstDoPamieci($41579, #$17 + 'Dropowanie użytkowników Obliviona. Nie wykonuj żadnych akcji');
        ZapiszTekstDoPamieci($415B9, 'Czas    ' + #3 + 'ON  ');
        ZapiszTekstDoPamieci($415C9, 'Czas    ' + #6 + 'OFF '); }
    end
    else if jezyk = 1 then // angielski
    begin
      { ZapiszTekstDoPamieci($3E683, ' Game history:  ');
        ZapiszTekstDoPamieci($3F1C9, '- host hack');
        ZapiszTekstDoPamieci($3F2D5, ' - detected hacks  ');
        ZapiszTekstDoPamieci($3F331, #$17 + 'Done. You may control your units                       ');
        ZapiszTekstDoPamieci($3F66D, '- chat:    ');
        ZapiszTekstDoPamieci($3F9E8, #4'Su');
        ZapiszTekstDoPamieci($3F9EC, #4'Mo');
        ZapiszTekstDoPamieci($3F9F0, #4'Tu');
        ZapiszTekstDoPamieci($3F9F4, #4'We');
        ZapiszTekstDoPamieci($3F9F8, #4'Th');
        ZapiszTekstDoPamieci($3F9FC, #4'Fr');
        ZapiszTekstDoPamieci($3FA00, #4'Sa');
        ZapiszTekstDoPamieci($3FA04, #2'PM'#6);
        ZapiszTekstDoPamieci($3FA0C, #2'AM'#6);
        ZapiszTekstDoPamieci($40B79, 'wDetector initialized!     ');
        ZapiszTekstDoPamieci($40B98, 'Conflict');
        ZapiszTekstDoPamieci($40DB8, ' - refreshing game>   ');
        ZapiszTekstDoPamieci($414C1, ' Off');
        ZapiszTekstDoPamieci($414C9, '  On');
        ZapiszTekstDoPamieci($414D1, 'Auto refresh    ');
        ZapiszTekstDoPamieci($414E9, 'Drop window enabled');
        ZapiszTekstDoPamieci($41501, 'Drop window disabled' + #$0A + #$08 + 'Do not control units or buildings.' +
        ' When disabled, actions can be detected as ' + #04 + 'multi command    ');
        ZapiszTekstDoPamieci($41579, #$17 + 'Dropowanie użytkowników Obliviona. Nie wykonuj żadnych akcji');
        ZapiszTekstDoPamieci($41579, #$17 + 'Crashing any Oblivion users. Do not control any units!      ');
        ZapiszTekstDoPamieci($415B9, 'Time    ' + #3 + 'ON  ');
        ZapiszTekstDoPamieci($415C9, 'Time    ' + #6 + 'OFF ');
        ZapiszTekstDoPamieci($46870, 'AutoMine');
        ZapiszTekstDoPamieci($46898, 'M. command');
        ZapiszTekstDoPamieci($468E8, 'A. build  ');
        ZapiszTekstDoPamieci($46938, 'Hack');
        ZapiszTekstDoPamieci($46988, 'Spoofer   '); }
    end;
    Result := True;
  finally
    CloseHandle(hProces);
  end;
end;

exports
  Patchuj Name 'wDetectorPatch';

begin

end.
