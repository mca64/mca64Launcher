unit AudioVista;

interface

uses Winapi.Windows, Winapi.ActiveX, System.Win.ComObj, MMSystem;

const
  IID_IMMDevice: TGUID = '{D666063F-1587-4E43-81F1-B948E807363F}';
  IID_IMMDeviceCollection: TGUID = '{0BD7A1BE-7A1A-44DB-8397-CC5392387B5E}';
  IID_IMMDeviceEnumerator: TGUID = '{A95664D2-9614-4F35-A746-DE8DB63617E6}';
  IID_IAudioClient: TGUID = '{1CB9AD4C-DBFA-4c32-B178-C2F568A703B2}';
  CLASS_IMMDeviceEnumerator: TGUID = '{BCDE0395-E52F-467C-8E3D-C4579291692E}';
  DEVICE_STATE_ACTIVE = $00000001;
  DEVICE_STATE_DISABLE = $00000002;
  DEVICE_STATE_NOTPRESENT = $00000004;
  DEVICE_STATE_UNPLUGGED = $00000008;
  DEVICE_STATEMASK_ALL = $0000000F;
  eRender = $00000000;
  eCapture = $00000001;
  eAll = $00000002;
  eConsole = $00000000;
  eMultimedia = $00000001;
  eCommunications = $00000002;
  PKEY_Device_FriendlyName: PROPERTYKEY = (fmtid: (D1: $A45C254E; D2: $DF1C; D3: $4EFD; D4: ($80, $20, $67, $D1, $46, $A8, $50, $E0)
    ); pid: 14);
  PKEY_AudioEngine_DeviceFormat: PROPERTYKEY = (fmtid: (D1: $F19F064D; D2: $82C; D3: $4E27;
    D4: ($BC, $73, $68, $82, $A1, $BB, $8E, $4C)); pid: 0);
  PKEY_AudioEngine_OEMFormat: PROPERTYKEY = (fmtid: (D1: $E4870E26; D2: $3CC5; D3: $4CD2;
    D4: ($BA, $46, $CA, $A, $9A, $70, $ED, $4)); pid: 3);

type
  TIntegerTablica = array of integer;

  TSamples = packed record
    case WORD of
      0: (wValidBitsPerSample: WORD);
      1: (wSamplesPerBlock: WORD);
      2: (wReserved: WORD);
  end;

  TWaveFormatExtensible = packed record
    Format: TWaveFormatEx;
    Samples: TSamples;
    dwChannelMask: DWORD;
    SubFormat: TGUID;
  end;

  PWAVEFORMATEXTENSIBLE = ^TWaveFormatExtensible;
  AUDCLNT_SHAREMODE = TOleEnum;
  EDATAFLOW = TOleEnum;
  EROLE = TOleEnum;
  REFERENCE_TIME = int64;

  IPropertyStore = interface(IUnknown)
    function GetCount(out cProps: DWORD): HRESULT; stdcall;
    function GetAt(const iProp: DWORD; out pkey: TPropertyKey): HRESULT; stdcall;
    function GetValue(const key: TPropertyKey; out pv: TPropVariant): HRESULT; stdcall;
    function SetValue(const key: TPropertyKey; const propvar: TPropVariant): HRESULT; stdcall;
    function Commit: HRESULT; stdcall;
  end;

  IMMDevice = interface(IUnknown)
    ['{D666063F-1587-4E43-81F1-B948E807363F}']
    function Activate(const iid: TGUID; const dwClsCtx: UINT; const pActivationParams: PPropVariant; out ppInterface: IUnknown)
      : HRESULT; stdcall;
    function OpenPropertyStore(const stgmAccess: DWORD; out ppProperties: IPropertyStore): HRESULT; stdcall;
    function GetId(out ppstrId: PWChar): HRESULT; stdcall;
    function GetState(out pdwState: UINT): HRESULT; stdcall;
  end;

  IMMDeviceCollection = interface(IUnknown)
    ['{0BD7A1BE-7A1A-44DB-8397-CC5392387B5E}']
    function GetCount(out pcDevices: UINT): HRESULT; stdcall;
    function Item(const nDevice: UINT; out ppDevice: IMMDevice): HRESULT; stdcall;
  end;

  IMMNotificationClient = interface(IUnknown)
    ['{7991EEC9-7E89-4D85-8390-6C703CEC60C0}']
    function OnDeviceStateChanged(const pwstrDeviceId: LPCWSTR; const dwNewState: DWORD): HRESULT; stdcall;
    function OnDeviceAdded(const pwstrDeviceId: LPCWSTR): HRESULT; stdcall;
    function OnDeviceRemoved(const pwstrDeviceId: LPCWSTR): HRESULT; stdcall;
    function OnDefaultDeviceChanged(const flow: EDATAFLOW; const role: EROLE; const pwstrDefaultDevice: LPCWSTR): HRESULT; stdcall;
    function OnPropertyValueChanged(const pwstrDeviceId: LPCWSTR; const key: PROPERTYKEY): HRESULT; stdcall;
  end;

  IMMDeviceEnumerator = interface(IUnknown)
    ['{A95664D2-9614-4F35-A746-DE8DB63617E6}']
    function EnumAudioEndpoints(const dataFlow: EDATAFLOW; const dwStateMask: DWORD; out ppDevices: IMMDeviceCollection): HRESULT; stdcall;
    function GetDefaultAudioEndpoint(const dataFlow: EDATAFLOW; const role: EROLE; out ppEndpoint: IMMDevice): HRESULT; stdcall;
    function GetDevice(const pwstrId: PWChar; out ppDevice: IMMDevice): HRESULT; stdcall;
    function RegisterEndpointNotificationCallback(const pClient: IMMNotificationClient): HRESULT; stdcall;
    function UnregisterEndpointNotificationCallback(const pClient: IMMNotificationClient): HRESULT; stdcall;
  end;

  IAudioClient = interface(IUnknown)
    ['{1CB9AD4C-DBFA-4c32-B178-C2F568A703B2}']
    function Initialize(const shareMode: AUDCLNT_SHAREMODE; const streamFlags: DWORD;
      const hnsBufferDuration, hnsPeriodicity: REFERENCE_TIME; const pFormat: PWAVEFORMATEXTENSIBLE; const audioSessionGuid: pGuid)
      : HRESULT; stdcall;
    function GetBufferSize(out numBufferFrames: UINT32): HRESULT; stdcall;
    function GetCurrentPadding(out numPaddingFrames: UINT32): HRESULT; stdcall;
    function GetStreamLatency(out hnsLatency: REFERENCE_TIME): HRESULT; stdcall;
    function IsFormatSupported(const shareMode: AUDCLNT_SHAREMODE; const pFormat: PWAVEFORMATEXTENSIBLE;
      out pClosestMatch: PWAVEFORMATEXTENSIBLE): HRESULT; stdcall;
    function GetMixFormat(out pFormat: PWAVEFORMATEXTENSIBLE): HRESULT; stdcall;
    function GetDevicePeriod(out hnsDefaultDevicePeriod, hnsMinimumDevicePeriod: REFERENCE_TIME): HRESULT; stdcall;
    function Start: HRESULT; stdcall;
    function Stop: HRESULT; stdcall;
    function Reset: HRESULT; stdcall;
    function SetEventHandle(const eventHandle: HWND): HRESULT; stdcall;
    function GetService(const iid: TGUID; out ppInterface: IUnknown): HRESULT; stdcall;
  end;

function DomyslneUrzadzenie(const odtwarzanieCzyNagrywanie: EDATAFLOW): IMMDevice;
function DomyslneUrzadzenieKomunikacyjne(const odtwarzanieCzyNagrywanie: EDATAFLOW): IMMDevice;
function IMMDeviceNaTekst(const urzadzenie: IMMDevice): String;
function IdUrzadzeniaNaTekst(const id: PWideChar): string;
function FormatUrzadzeniaAudio(const urzadzenie: IMMDevice): TIntegerTablica;

implementation

uses Launcher;

function DomyslneUrzadzenie(const odtwarzanieCzyNagrywanie: EDATAFLOW): IMMDevice;
var
  urzadzenie: IMMDevice;
  urzedzenieEnumerator: IMMDeviceEnumerator;
begin
  try
    CoCreateInstance(CLASS_IMMDeviceEnumerator, nil, CLSCTX_ALL, IID_IMMDeviceEnumerator, urzedzenieEnumerator);
    if urzedzenieEnumerator.GetDefaultAudioEndpoint(odtwarzanieCzyNagrywanie, eConsole, urzadzenie) = ERROR_SUCCESS then
        Result := urzadzenie;
  except
  end
end;

function DomyslneUrzadzenieKomunikacyjne(const odtwarzanieCzyNagrywanie: EDATAFLOW): IMMDevice;
var
  urzadzenie: IMMDevice;
  urzedzenieEnumerator: IMMDeviceEnumerator;
begin
  try
    CoCreateInstance(CLASS_IMMDeviceEnumerator, nil, CLSCTX_ALL, IID_IMMDeviceEnumerator, urzedzenieEnumerator);
    if urzedzenieEnumerator.GetDefaultAudioEndpoint(odtwarzanieCzyNagrywanie, eCommunications, urzadzenie) = ERROR_SUCCESS then
        Result := urzadzenie;
  except
  end
end;

function IMMDeviceNaTekst(const urzadzenie: IMMDevice): String;
var
  ustawienia: IPropertyStore;
  pv: TPropVariant;
begin
  try
    urzadzenie.OpenPropertyStore(STGM_READ, ustawienia);
    ustawienia.GetValue(PKEY_Device_FriendlyName, pv);
    Result := pv.pwszVal;
  except
  end
end;

function IdUrzadzeniaNaTekst(const id: PWideChar): string;
var
  urzadzenie: IMMDevice;
  urzedzenieEnumerator: IMMDeviceEnumerator;
begin
  try
    CoCreateInstance(CLASS_IMMDeviceEnumerator, nil, CLSCTX_ALL, IID_IMMDeviceEnumerator, urzedzenieEnumerator);
    if urzedzenieEnumerator.GetDevice(id, urzadzenie) = ERROR_SUCCESS then Result := IMMDeviceNaTekst(urzadzenie);
  except
  end
end;

function FormatUrzadzeniaAudio(const urzadzenie: IMMDevice): TIntegerTablica;
var
  ustawienia: IPropertyStore;
  pv: TPropVariant;
  pFormat: PWAVEFORMATEXTENSIBLE;
begin
  try
    urzadzenie.OpenPropertyStore(STGM_READ, ustawienia);
    ustawienia.GetValue(PKEY_AudioEngine_DeviceFormat, pv);
    pFormat := pv.blob.pBlobData;
    SetLength(Result, 5);
    Result[0] := pFormat.Format.nChannels;
    Result[1] := pFormat.Format.nSamplesPerSec;
    Result[2] := pFormat.Samples.wValidBitsPerSample;
    Result[3] := pFormat.Format.nAvgBytesPerSec;
    Result[4] := pFormat.Format.wBitsPerSample;
    CoTaskMemFree(pFormat);
  except
  end;
end;

end.
