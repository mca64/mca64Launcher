{ *****************************************************************************
  WARNING: This component file was generated using the EventSinkImp utility.
  The contents of this file will be overwritten everytime EventSinkImp
  is asked to regenerate this sink component.

  NOTE:    When using this component at the same time with the XXX_TLB.pas in
  your Delphi projects, make sure you always put the XXX_TLB unit name
  AFTER this component unit name in the USES clause of the interface
  section of your unit; otherwise you may get interface conflict
  errors from the Delphi compiler.

  EventSinkImp is written by Binh Ly (bly@techvanguards.com)
  *****************************************************************************
  //Sink Classes//
  TiTunesLibIiTunesEvents
  TiTunesLibIITConvertOperationStatusEvents
}

// {$IFDEF VER100}
// {$DEFINE D3}
// {$ENDIF}

// SinkUnitName//
unit iTunesLibEvents;
{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, ActiveX, Classes, ComObj, OleCtrls
  // SinkUses//
    , StdVCL, iTunesLib_TLB;

type
  { backward compatibility types }
{$IFDEF D3}
  OLE_COLOR = TOleColor;
{$ENDIF}

  TiTunesLibEventsBaseSink = class(TComponent, IUnknown, IDispatch)
  protected
    { IUnknown }
    function QueryInterface(const IID: TGUID; out Obj): HResult;
{$IFNDEF D3} override; {$ENDIF} stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    { IDispatch }
    function GetIDsOfNames(const IID: TGUID; Names: Pointer; NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; virtual; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; virtual; stdcall;
    function GetTypeInfoCount(out Count: Integer): HResult; virtual; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer)
      : HResult; virtual; stdcall;
  protected
    FCookie: Integer;
    FCP: IConnectionPoint;
    FSinkIID: TGUID;
    FSource: IUnknown;
    function DoInvoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var dps: TDispParams; pDispIds: PDispIdList;
      VarResult, ExcepInfo, ArgErr: Pointer): HResult; virtual; abstract;
  public
    destructor Destroy; override;
    procedure Connect(const ASource: IUnknown);
    procedure Disconnect;
    property SinkIID: TGUID read FSinkIID write FSinkIID;
    property Source: IUnknown read FSource;
  end;

  // SinkImportsForwards//

  // SinkImports//

  // SinkIntfStart//

  // SinkEventsForwards//
  T_IiTunesEventsOnDatabaseChangedEventEvent = procedure(Sender: TObject; deletedObjectIDs: OleVariant; changedObjectIDs: OleVariant)
    of object;
  T_IiTunesEventsOnPlayerPlayEventEvent = procedure(Sender: TObject; iTrack: OleVariant) of object;
  T_IiTunesEventsOnPlayerStopEventEvent = procedure(Sender: TObject; iTrack: OleVariant) of object;
  T_IiTunesEventsOnPlayerPlayingTrackChangedEventEvent = procedure(Sender: TObject; iTrack: OleVariant) of object;
  T_IiTunesEventsOnUserInterfaceEnabledEventEvent = procedure(Sender: TObject) of object;
  T_IiTunesEventsOnCOMCallsDisabledEventEvent = procedure(Sender: TObject; reason: ITCOMDisabledReason) of object;
  T_IiTunesEventsOnCOMCallsEnabledEventEvent = procedure(Sender: TObject) of object;
  T_IiTunesEventsOnQuittingEventEvent = procedure(Sender: TObject) of object;
  T_IiTunesEventsOnAboutToPromptUserToQuitEventEvent = procedure(Sender: TObject) of object;
  T_IiTunesEventsOnSoundVolumeChangedEventEvent = procedure(Sender: TObject; newVolume: Integer) of object;

  // SinkComponent//
  TiTunesLibIiTunesEvents = class(TiTunesLibEventsBaseSink
    // ISinkInterface//
    )
  protected
    function DoInvoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var dps: TDispParams; pDispIds: PDispIdList;
      VarResult, ExcepInfo, ArgErr: Pointer): HResult; override;

    // ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create(AOwner: TComponent); override;
  protected
    // SinkInterface//
    procedure DoOnDatabaseChangedEvent(deletedObjectIDs: OleVariant; changedObjectIDs: OleVariant); safecall;
    procedure DoOnPlayerPlayEvent(iTrack: OleVariant); safecall;
    procedure DoOnPlayerStopEvent(iTrack: OleVariant); safecall;
    procedure DoOnPlayerPlayingTrackChangedEvent(iTrack: OleVariant); safecall;
    procedure DoOnUserInterfaceEnabledEvent; safecall;
    procedure DoOnCOMCallsDisabledEvent(reason: ITCOMDisabledReason); safecall;
    procedure DoOnCOMCallsEnabledEvent; safecall;
    procedure DoOnQuittingEvent; safecall;
    procedure DoOnAboutToPromptUserToQuitEvent; safecall;
    procedure DoOnSoundVolumeChangedEvent(newVolume: Integer); safecall;
  protected
    // SinkEventsProtected//
    FOnDatabaseChangedEvent: T_IiTunesEventsOnDatabaseChangedEventEvent;
    FOnPlayerPlayEvent: T_IiTunesEventsOnPlayerPlayEventEvent;
    FOnPlayerStopEvent: T_IiTunesEventsOnPlayerStopEventEvent;
    FOnPlayerPlayingTrackChangedEvent: T_IiTunesEventsOnPlayerPlayingTrackChangedEventEvent;
    FOnUserInterfaceEnabledEvent: T_IiTunesEventsOnUserInterfaceEnabledEventEvent;
    FOnCOMCallsDisabledEvent: T_IiTunesEventsOnCOMCallsDisabledEventEvent;
    FOnCOMCallsEnabledEvent: T_IiTunesEventsOnCOMCallsEnabledEventEvent;
    FOnQuittingEvent: T_IiTunesEventsOnQuittingEventEvent;
    FOnAboutToPromptUserToQuitEvent: T_IiTunesEventsOnAboutToPromptUserToQuitEventEvent;
    FOnSoundVolumeChangedEvent: T_IiTunesEventsOnSoundVolumeChangedEventEvent;
  published
    // SinkEventsPublished//
    property OnDatabaseChangedEvent: T_IiTunesEventsOnDatabaseChangedEventEvent read FOnDatabaseChangedEvent write FOnDatabaseChangedEvent;
    property OnPlayerPlayEvent: T_IiTunesEventsOnPlayerPlayEventEvent read FOnPlayerPlayEvent write FOnPlayerPlayEvent;
    property OnPlayerStopEvent: T_IiTunesEventsOnPlayerStopEventEvent read FOnPlayerStopEvent write FOnPlayerStopEvent;
    property OnPlayerPlayingTrackChangedEvent: T_IiTunesEventsOnPlayerPlayingTrackChangedEventEvent read FOnPlayerPlayingTrackChangedEvent
      write FOnPlayerPlayingTrackChangedEvent;
    property OnUserInterfaceEnabledEvent: T_IiTunesEventsOnUserInterfaceEnabledEventEvent read FOnUserInterfaceEnabledEvent
      write FOnUserInterfaceEnabledEvent;
    property OnCOMCallsDisabledEvent: T_IiTunesEventsOnCOMCallsDisabledEventEvent read FOnCOMCallsDisabledEvent
      write FOnCOMCallsDisabledEvent;
    property OnCOMCallsEnabledEvent: T_IiTunesEventsOnCOMCallsEnabledEventEvent read FOnCOMCallsEnabledEvent write FOnCOMCallsEnabledEvent;
    property OnQuittingEvent: T_IiTunesEventsOnQuittingEventEvent read FOnQuittingEvent write FOnQuittingEvent;
    property OnAboutToPromptUserToQuitEvent: T_IiTunesEventsOnAboutToPromptUserToQuitEventEvent read FOnAboutToPromptUserToQuitEvent
      write FOnAboutToPromptUserToQuitEvent;
    property OnSoundVolumeChangedEvent: T_IiTunesEventsOnSoundVolumeChangedEventEvent read FOnSoundVolumeChangedEvent
      write FOnSoundVolumeChangedEvent;
  end;

  // SinkEventsForwards//
  T_IITConvertOperationStatusEventsOnConvertOperationStatusChangedEventEvent = procedure(Sender: TObject; const trackName: WideString;
    progressValue: Integer; maxProgressValue: Integer) of object;
  T_IITConvertOperationStatusEventsOnConvertOperationCompleteEventEvent = procedure(Sender: TObject) of object;

  // SinkComponent//
  TiTunesLibIITConvertOperationStatusEvents = class(TiTunesLibEventsBaseSink
    // ISinkInterface//
    )
  protected
    function DoInvoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var dps: TDispParams; pDispIds: PDispIdList;
      VarResult, ExcepInfo, ArgErr: Pointer): HResult; override;

    // ISinkInterfaceMethods//
  public
    { system methods }
    constructor Create(AOwner: TComponent); override;
  protected
    // SinkInterface//
    procedure DoOnConvertOperationStatusChangedEvent(const trackName: WideString; progressValue: Integer;
      maxProgressValue: Integer); safecall;
    procedure DoOnConvertOperationCompleteEvent; safecall;
  protected
    // SinkEventsProtected//
    FOnConvertOperationStatusChangedEvent: T_IITConvertOperationStatusEventsOnConvertOperationStatusChangedEventEvent;
    FOnConvertOperationCompleteEvent: T_IITConvertOperationStatusEventsOnConvertOperationCompleteEventEvent;
  published
    // SinkEventsPublished//
    property OnConvertOperationStatusChangedEvent: T_IITConvertOperationStatusEventsOnConvertOperationStatusChangedEventEvent
      read FOnConvertOperationStatusChangedEvent write FOnConvertOperationStatusChangedEvent;
    property OnConvertOperationCompleteEvent: T_IITConvertOperationStatusEventsOnConvertOperationCompleteEventEvent
      read FOnConvertOperationCompleteEvent write FOnConvertOperationCompleteEvent;
  end;

  // SinkIntfEnd//

procedure Register;

implementation

uses
  SysUtils;

{ globals }

procedure BuildPositionalDispIds(pDispIds: PDispIdList; const dps: TDispParams);
var
  i: Integer;
begin
  Assert(pDispIds <> nil);

  { by default, directly arrange in reverse order }
  for i := 0 to dps.cArgs - 1 do pDispIds^[i] := dps.cArgs - 1 - i;

  { check for named args }
  if (dps.cNamedArgs <= 0) then Exit;

  { parse named args }
  for i := 0 to dps.cNamedArgs - 1 do pDispIds^[dps.rgdispidNamedArgs^[i]] := i;
end;

{ TiTunesLibEventsBaseSink }

function TiTunesLibEventsBaseSink.GetIDsOfNames(const IID: TGUID; Names: Pointer; NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;

function TiTunesLibEventsBaseSink.GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult;
begin
  Result := E_NOTIMPL;
  Pointer(TypeInfo) := nil;
end;

function TiTunesLibEventsBaseSink.GetTypeInfoCount(out Count: Integer): HResult;
begin
  Result := E_NOTIMPL;
  Count := 0;
end;

function TiTunesLibEventsBaseSink.Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var Params;
  VarResult, ExcepInfo, ArgErr: Pointer): HResult;
var
  dps: TDispParams absolute Params;
  bHasParams: boolean;
  pDispIds: PDispIdList;
  iDispIdsSize: Integer;
begin
  { validity checks }
  if (Flags AND DISPATCH_METHOD = 0) then raise Exception.Create(Format('%s only supports sinking of method calls!', [ClassName]));

  { build pDispIds array. this maybe a bit of overhead but it allows us to
    sink named-argument calls such as Excel's AppEvents, etc!
  }
  pDispIds := nil;
  iDispIdsSize := 0;
  bHasParams := (dps.cArgs > 0);
  if (bHasParams) then
  begin
    iDispIdsSize := dps.cArgs * SizeOf(TDispId);
    GetMem(pDispIds, iDispIdsSize);
  end; { if }

  try
    { rearrange dispids properly }
    if (bHasParams) then BuildPositionalDispIds(pDispIds, dps);
    Result := DoInvoke(DispId, IID, LocaleID, Flags, dps, pDispIds, VarResult, ExcepInfo, ArgErr);
  finally
    { free pDispIds array }
    if (bHasParams) then FreeMem(pDispIds, iDispIdsSize);
  end; { finally }
end;

function TiTunesLibEventsBaseSink.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if (GetInterface(IID, Obj)) then
  begin
    Result := S_OK;
    Exit;
  end
  else if (IsEqualIID(IID, FSinkIID)) then
    if (GetInterface(IDispatch, Obj)) then
    begin
      Result := S_OK;
      Exit;
    end;
  Result := E_NOINTERFACE;
  Pointer(Obj) := nil;
end;

function TiTunesLibEventsBaseSink._AddRef: Integer;
begin
  Result := 2;
end;

function TiTunesLibEventsBaseSink._Release: Integer;
begin
  Result := 1;
end;

destructor TiTunesLibEventsBaseSink.Destroy;
begin
  Disconnect;
  inherited;
end;

procedure TiTunesLibEventsBaseSink.Connect(const ASource: IUnknown);
var
  pcpc: IConnectionPointContainer;
begin
  Assert(ASource <> nil);
  Disconnect;
  try
    OleCheck(ASource.QueryInterface(IConnectionPointContainer, pcpc));
    OleCheck(pcpc.FindConnectionPoint(FSinkIID, FCP));
    OleCheck(FCP.Advise(Self, FCookie));
    FSource := ASource;
  except
    raise Exception.Create(Format('Unable to connect %s.'#13'%s', [Name, Exception(ExceptObject).Message]));
  end; { finally }
end;

procedure TiTunesLibEventsBaseSink.Disconnect;
begin
  if (FSource = nil) then Exit;
  try
    OleCheck(FCP.Unadvise(FCookie));
    FCP := nil;
    FSource := nil;
  except
    Pointer(FCP) := nil;
    Pointer(FSource) := nil;
  end; { except }
end;


// SinkImplStart//

function TiTunesLibIiTunesEvents.DoInvoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var dps: TDispParams;
  pDispIds: PDispIdList; VarResult, ExcepInfo, ArgErr: Pointer): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := DISP_E_MEMBERNOTFOUND;

  // SinkInvoke//
  case DispId of
    1:
      begin
        DoOnDatabaseChangedEvent(OleVariant(dps.rgvarg^[pDispIds^[0]]), OleVariant(dps.rgvarg^[pDispIds^[1]]));
        Result := S_OK;
      end;
    2:
      begin
        DoOnPlayerPlayEvent(OleVariant(dps.rgvarg^[pDispIds^[0]]));
        Result := S_OK;
      end;
    3:
      begin
        DoOnPlayerStopEvent(OleVariant(dps.rgvarg^[pDispIds^[0]]));
        Result := S_OK;
      end;
    4:
      begin
        DoOnPlayerPlayingTrackChangedEvent(OleVariant(dps.rgvarg^[pDispIds^[0]]));
        Result := S_OK;
      end;
    5:
      begin
        DoOnUserInterfaceEnabledEvent();
        Result := S_OK;
      end;
    6:
      begin
        DoOnCOMCallsDisabledEvent(ITCOMDisabledReason(dps.rgvarg^[pDispIds^[0]].lval));
        Result := S_OK;
      end;
    7:
      begin
        DoOnCOMCallsEnabledEvent();
        Result := S_OK;
      end;
    8:
      begin
        DoOnQuittingEvent();
        Result := S_OK;
      end;
    9:
      begin
        DoOnAboutToPromptUserToQuitEvent();
        Result := S_OK;
      end;
    10:
      begin
        DoOnSoundVolumeChangedEvent(dps.rgvarg^[pDispIds^[0]].lval);
        Result := S_OK;
      end;
  end; { case }
  // SinkInvokeEnd//
end;

constructor TiTunesLibIiTunesEvents.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // SinkInit//
  FSinkIID := _IiTunesEvents;
end;

// SinkImplementation//
procedure TiTunesLibIiTunesEvents.DoOnDatabaseChangedEvent(deletedObjectIDs: OleVariant; changedObjectIDs: OleVariant);
begin
  if not Assigned(OnDatabaseChangedEvent) then System.Exit;
  OnDatabaseChangedEvent(Self, deletedObjectIDs, changedObjectIDs);
end;

procedure TiTunesLibIiTunesEvents.DoOnPlayerPlayEvent(iTrack: OleVariant);
begin
  if not Assigned(OnPlayerPlayEvent) then System.Exit;
  OnPlayerPlayEvent(Self, iTrack);
end;

procedure TiTunesLibIiTunesEvents.DoOnPlayerStopEvent(iTrack: OleVariant);
begin
  if not Assigned(OnPlayerStopEvent) then System.Exit;
  OnPlayerStopEvent(Self, iTrack);
end;

procedure TiTunesLibIiTunesEvents.DoOnPlayerPlayingTrackChangedEvent(iTrack: OleVariant);
begin
  if not Assigned(OnPlayerPlayingTrackChangedEvent) then System.Exit;
  OnPlayerPlayingTrackChangedEvent(Self, iTrack);
end;

procedure TiTunesLibIiTunesEvents.DoOnUserInterfaceEnabledEvent;
begin
  if not Assigned(OnUserInterfaceEnabledEvent) then System.Exit;
  OnUserInterfaceEnabledEvent(Self);
end;

procedure TiTunesLibIiTunesEvents.DoOnCOMCallsDisabledEvent(reason: ITCOMDisabledReason);
begin
  if not Assigned(OnCOMCallsDisabledEvent) then System.Exit;
  OnCOMCallsDisabledEvent(Self, reason);
end;

procedure TiTunesLibIiTunesEvents.DoOnCOMCallsEnabledEvent;
begin
  if not Assigned(OnCOMCallsEnabledEvent) then System.Exit;
  OnCOMCallsEnabledEvent(Self);
end;

procedure TiTunesLibIiTunesEvents.DoOnQuittingEvent;
begin
  if not Assigned(OnQuittingEvent) then System.Exit;
  OnQuittingEvent(Self);
end;

procedure TiTunesLibIiTunesEvents.DoOnAboutToPromptUserToQuitEvent;
begin
  if not Assigned(OnAboutToPromptUserToQuitEvent) then System.Exit;
  OnAboutToPromptUserToQuitEvent(Self);
end;

procedure TiTunesLibIiTunesEvents.DoOnSoundVolumeChangedEvent(newVolume: Integer);
begin
  if not Assigned(OnSoundVolumeChangedEvent) then System.Exit;
  OnSoundVolumeChangedEvent(Self, newVolume);
end;

function TiTunesLibIITConvertOperationStatusEvents.DoInvoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word;
  var dps: TDispParams; pDispIds: PDispIdList; VarResult, ExcepInfo, ArgErr: Pointer): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := DISP_E_MEMBERNOTFOUND;

  // SinkInvoke//
  case DispId of
    1:
      begin
        DoOnConvertOperationStatusChangedEvent(dps.rgvarg^[pDispIds^[0]].bstrval, dps.rgvarg^[pDispIds^[1]].lval,
          dps.rgvarg^[pDispIds^[2]].lval);
        Result := S_OK;
      end;
    2:
      begin
        DoOnConvertOperationCompleteEvent();
        Result := S_OK;
      end;
  end; { case }
  // SinkInvokeEnd//
end;

constructor TiTunesLibIITConvertOperationStatusEvents.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // SinkInit//
  FSinkIID := _IITConvertOperationStatusEvents;
end;

// SinkImplementation//
procedure TiTunesLibIITConvertOperationStatusEvents.DoOnConvertOperationStatusChangedEvent(const trackName: WideString;
  progressValue: Integer; maxProgressValue: Integer);
begin
  if not Assigned(OnConvertOperationStatusChangedEvent) then System.Exit;
  OnConvertOperationStatusChangedEvent(Self, trackName, progressValue, maxProgressValue);
end;

procedure TiTunesLibIITConvertOperationStatusEvents.DoOnConvertOperationCompleteEvent;
begin
  if not Assigned(OnConvertOperationCompleteEvent) then System.Exit;
  OnConvertOperationCompleteEvent(Self);
end;


// SinkImplEnd//

procedure Register;
begin
  // SinkRegisterStart//
  RegisterComponents('ActiveX', [TiTunesLibIiTunesEvents]);
  RegisterComponents('ActiveX', [TiTunesLibIITConvertOperationStatusEvents]);
  // SinkRegisterEnd//
end;

end.
