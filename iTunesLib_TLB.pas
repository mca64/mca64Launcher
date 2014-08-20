unit iTunesLib_TLB;
{$WARN SYMBOL_PLATFORM OFF}
// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 45604 $
// File generated on 2013-11-14 15:09:34 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Program Files\iTunes\iTunes.exe (1)
// LIBID: {9E93C96F-CF0D-43F6-8BA8-B807A3370712}
// LCID: 0
// Helpfile:
// HelpString: iTunes 1.13 Type Library
// DepndLst:
// (1) v2.0 stdole, (E:\Windows\system32\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL,
  Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
// Type Libraries     : LIBID_xxxx
// CoClasses          : CLASS_xxxx
// DISPInterfaces     : DIID_xxxx
// Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  iTunesLibMajorVersion = 1;
  iTunesLibMinorVersion = 13;

  LIBID_iTunesLib: TGUID = '{9E93C96F-CF0D-43F6-8BA8-B807A3370712}';

  IID_IITObject: TGUID = '{9FAB0E27-70D7-4E3A-9965-B0C8B8869BB6}';
  IID_IITSource: TGUID = '{AEC1C4D3-AEF1-4255-B892-3E3D13ADFDF9}';
  IID_IITPlaylistCollection: TGUID = '{FF194254-909D-4437-9C50-3AAC2AE6305C}';
  IID_IITPlaylist: TGUID = '{3D5E072F-2A77-4B17-9E73-E03B77CCCCA9}';
  IID_IITTrackCollection: TGUID = '{755D76F1-6B85-4CE4-8F5F-F88D9743DCD8}';
  IID_IITTrack: TGUID = '{4CB0915D-1E54-4727-BAF3-CE6CC9A225A1}';
  IID_IITArtwork: TGUID = '{D0A6C1F8-BF3D-4CD8-AC47-FE32BDD17257}';
  IID_IITArtworkCollection: TGUID = '{BF2742D7-418C-4858-9AF9-2981B062D23E}';
  IID_IITSourceCollection: TGUID = '{2FF6CE20-FF87-4183-B0B3-F323D047AF41}';
  IID_IITEncoder: TGUID = '{1CF95A1C-55FE-4F45-A2D3-85AC6C504A73}';
  IID_IITEncoderCollection: TGUID = '{8862BCA9-168D-4549-A9D5-ADB35E553BA6}';
  IID_IITEQPreset: TGUID = '{5BE75F4F-68FA-4212-ACB7-BE44EA569759}';
  IID_IITEQPresetCollection: TGUID = '{AEF4D111-3331-48DA-B0C2-B468D5D61D08}';
  IID_IITOperationStatus: TGUID = '{206479C9-FE32-4F9B-A18A-475AC939B479}';
  IID_IITConvertOperationStatus: TGUID = '{7063AAF6-ABA0-493B-B4FC-920A9F105875}';
  IID_IITLibraryPlaylist: TGUID = '{53AE1704-491C-4289-94A0-958815675A3D}';
  IID_IITURLTrack: TGUID = '{1116E3B5-29FD-4393-A7BD-454E5E327900}';
  IID_IITUserPlaylist: TGUID = '{0A504DED-A0B5-465A-8A94-50E20D7DF692}';
  IID_IITVisual: TGUID = '{340F3315-ED72-4C09-9ACF-21EB4BDF9931}';
  IID_IITVisualCollection: TGUID = '{88A4CCDD-114F-4043-B69B-84D4E6274957}';
  IID_IITWindow: TGUID = '{370D7BE0-3A89-4A42-B902-C75FC138BE09}';
  IID_IITBrowserWindow: TGUID = '{C999F455-C4D5-4AA4-8277-F99753699974}';
  IID_IITWindowCollection: TGUID = '{3D8DE381-6C0E-481F-A865-E2385F59FA43}';
  IID_IiTunes: TGUID = '{9DD6680B-3EDC-40DB-A771-E6FE4832E34A}';
  DIID__IiTunesEvents: TGUID = '{5846EB78-317E-4B6F-B0C3-11EE8C8FEEF2}';
  DIID__IITConvertOperationStatusEvents: TGUID = '{5C47A705-8E8A-45A1-9EED-71C993F0BF60}';
  CLASS_iTunesApp: TGUID = '{DC0C2640-1415-4644-875C-6F4D769839BA}';
  CLASS_iTunesConvertOperationStatus: TGUID = '{D06596AD-C900-41B2-BC68-1B486450FC56}';
  IID_IITAudioCDPlaylist: TGUID = '{CF496DF3-0FED-4D7D-9BD8-529B6E8A082E}';
  IID_IITIPodSource: TGUID = '{CF4D8ACE-1720-4FB9-B0AE-9877249E89B0}';
  IID_IITFileOrCDTrack: TGUID = '{00D7FE99-7868-4CC7-AD9E-ACFD70D09566}';
  IID_IITPlaylistWindow: TGUID = '{349CBB45-2E5A-4822-8E4A-A75555A186F7}';

  // *********************************************************************//
  // Declaration of Enumerations defined in Type Library
  // *********************************************************************//
  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0086_0001
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0086_0001 = TOleEnum;

const
  ITSourceKindUnknown = $00000000;
  ITSourceKindLibrary = $00000001;
  ITSourceKindIPod = $00000002;
  ITSourceKindAudioCD = $00000003;
  ITSourceKindMP3CD = $00000004;
  ITSourceKindDevice = $00000005;
  ITSourceKindRadioTuner = $00000006;
  ITSourceKindSharedLibrary = $00000007;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0003
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0003 = TOleEnum;

const
  ITPlaylistPrintKindPlaylist = $00000000;
  ITPlaylistPrintKindAlbumlist = $00000001;
  ITPlaylistPrintKindInsert = $00000002;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0004
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0004 = TOleEnum;

const
  ITPlaylistSearchFieldAll = $00000000;
  ITPlaylistSearchFieldVisible = $00000001;
  ITPlaylistSearchFieldArtists = $00000002;
  ITPlaylistSearchFieldAlbums = $00000003;
  ITPlaylistSearchFieldComposers = $00000004;
  ITPlaylistSearchFieldSongNames = $00000005;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0075_0001
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0075_0001 = TOleEnum;

const
  ITArtworkFormatUnknown = $00000000;
  ITArtworkFormatJPEG = $00000001;
  ITArtworkFormatPNG = $00000002;
  ITArtworkFormatBMP = $00000003;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0089_0001
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0089_0001 = TOleEnum;

const
  ITTrackKindUnknown = $00000000;
  ITTrackKindFile = $00000001;
  ITTrackKindCD = $00000002;
  ITTrackKindURL = $00000003;
  ITTrackKindDevice = $00000004;
  ITTrackKindSharedLibrary = $00000005;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0001
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0001 = TOleEnum;

const
  ITPlaylistKindUnknown = $00000000;
  ITPlaylistKindLibrary = $00000001;
  ITPlaylistKindUser = $00000002;
  ITPlaylistKindCD = $00000003;
  ITPlaylistKindDevice = $00000004;
  ITPlaylistKindRadioTuner = $00000005;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0002
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0002 = TOleEnum;

const
  ITPlaylistRepeatModeOff = $00000000;
  ITPlaylistRepeatModeOne = $00000001;
  ITPlaylistRepeatModeAll = $00000002;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0089_0003
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0089_0003 = TOleEnum;

const
  ITRatingKindUser = $00000000;
  ITRatingKindComputed = $00000001;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0083_0001
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0083_0001 = TOleEnum;

const
  ITUserPlaylistSpecialKindNone = $00000000;
  ITUserPlaylistSpecialKindPurchases = $00000001;
  ITUserPlaylistSpecialKindITunesDJ = $00000002;
  ITUserPlaylistSpecialKindPodcasts = $00000003;
  ITUserPlaylistSpecialKindFolder = $00000004;
  ITUserPlaylistSpecialKindVideos = $00000005;
  ITUserPlaylistSpecialKindMusic = $00000006;
  ITUserPlaylistSpecialKindMovies = $00000007;
  ITUserPlaylistSpecialKindTVShows = $00000008;
  ITUserPlaylistSpecialKindBooks = $00000009;
  ITUserPlaylistSpecialKindITunesU = $0000000A;
  ITUserPlaylistSpecialKindGenius = $0000000B;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0095_0001
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0095_0001 = TOleEnum;

const
  ITWindowKindUnknown = $00000000;
  ITWindowKindBrowser = $00000001;
  ITWindowKindPlaylist = $00000002;
  ITWindowKindEQ = $00000003;
  ITWindowKindArtwork = $00000004;
  ITWindowKindNowPlaying = $00000005;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0001
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0001 = TOleEnum;

const
  ITPlayerStateStopped = $00000000;
  ITPlayerStatePlaying = $00000001;
  ITPlayerStateFastForward = $00000002;
  ITPlayerStateRewind = $00000003;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0002
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0002 = TOleEnum;

const
  ITVisualSizeSmall = $00000000;
  ITVisualSizeMedium = $00000001;
  ITVisualSizeLarge = $00000002;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0003
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0003 = TOleEnum;

const
  ITCOMDisabledReasonOther = $00000000;
  ITCOMDisabledReasonDialog = $00000001;
  ITCOMDisabledReasonQuitting = $00000002;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0004
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0004 = TOleEnum;

const
  ITPlayButtonStatePlayDisabled = $00000000;
  ITPlayButtonStatePlayEnabled = $00000001;
  ITPlayButtonStatePauseEnabled = $00000002;
  ITPlayButtonStatePauseDisabled = $00000003;
  ITPlayButtonStateStopEnabled = $00000004;
  ITPlayButtonStateStopDisabled = $00000005;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0005
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0005 = TOleEnum;

const
  ITPlayerButtonPrevious = $00000000;
  ITPlayerButtonPlay = $00000001;
  ITPlayerButtonNext = $00000002;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0006
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0006 = TOleEnum;

const
  ITPlayerButtonModifierKeyNone = $00000000;
  ITPlayerButtonModifierKeyShift = $00000001;
  ITPlayerButtonModifierKeyControl = $00000002;
  ITPlayerButtonModifierKeyAlt = $00000004;
  ITPlayerButtonModifierKeyCapsLock = $00000008;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0073_0001
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0073_0001 = TOleEnum;

const
  ITEventDatabaseChanged = $00000001;
  ITEventPlayerPlay = $00000002;
  ITEventPlayerStop = $00000003;
  ITEventPlayerPlayingTrackChanged = $00000004;
  ITEventUserInterfaceEnabled = $00000005;
  ITEventCOMCallsDisabled = $00000006;
  ITEventCOMCallsEnabled = $00000007;
  ITEventQuitting = $00000008;
  ITEventAboutToPromptUserToQuit = $00000009;
  ITEventSoundVolumeChanged = $0000000A;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0074_0001
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0074_0001 = TOleEnum;

const
  ITConvertOperationStatusChanged = $00000001;
  ITConvertOperationComplete = $00000002;

  // Constants for enum __MIDL___MIDL_itf_iTunesCOMInterface_0001_0089_0002
type
  __MIDL___MIDL_itf_iTunesCOMInterface_0001_0089_0002 = TOleEnum;

const
  ITVideoKindNone = $00000000;
  ITVideoKindMovie = $00000001;
  ITVideoKindMusicVideo = $00000002;
  ITVideoKindTVShow = $00000003;

type

  // *********************************************************************//
  // Forward declaration of types defined in TypeLibrary
  // *********************************************************************//
  IITObject = interface;
  IITObjectDisp = dispinterface;
  IITSource = interface;
  IITSourceDisp = dispinterface;
  IITPlaylistCollection = interface;
  IITPlaylistCollectionDisp = dispinterface;
  IITPlaylist = interface;
  IITPlaylistDisp = dispinterface;
  IITTrackCollection = interface;
  IITTrackCollectionDisp = dispinterface;
  IITTrack = interface;
  IITTrackDisp = dispinterface;
  IITArtwork = interface;
  IITArtworkDisp = dispinterface;
  IITArtworkCollection = interface;
  IITArtworkCollectionDisp = dispinterface;
  IITSourceCollection = interface;
  IITSourceCollectionDisp = dispinterface;
  IITEncoder = interface;
  IITEncoderDisp = dispinterface;
  IITEncoderCollection = interface;
  IITEncoderCollectionDisp = dispinterface;
  IITEQPreset = interface;
  IITEQPresetDisp = dispinterface;
  IITEQPresetCollection = interface;
  IITEQPresetCollectionDisp = dispinterface;
  IITOperationStatus = interface;
  IITOperationStatusDisp = dispinterface;
  IITConvertOperationStatus = interface;
  IITConvertOperationStatusDisp = dispinterface;
  IITLibraryPlaylist = interface;
  IITLibraryPlaylistDisp = dispinterface;
  IITURLTrack = interface;
  IITURLTrackDisp = dispinterface;
  IITUserPlaylist = interface;
  IITUserPlaylistDisp = dispinterface;
  IITVisual = interface;
  IITVisualDisp = dispinterface;
  IITVisualCollection = interface;
  IITVisualCollectionDisp = dispinterface;
  IITWindow = interface;
  IITWindowDisp = dispinterface;
  IITBrowserWindow = interface;
  IITBrowserWindowDisp = dispinterface;
  IITWindowCollection = interface;
  IITWindowCollectionDisp = dispinterface;
  IiTunes = interface;
  IiTunesDisp = dispinterface;
  _IiTunesEvents = dispinterface;
  _IITConvertOperationStatusEvents = dispinterface;
  IITAudioCDPlaylist = interface;
  IITAudioCDPlaylistDisp = dispinterface;
  IITIPodSource = interface;
  IITIPodSourceDisp = dispinterface;
  IITFileOrCDTrack = interface;
  IITFileOrCDTrackDisp = dispinterface;
  IITPlaylistWindow = interface;
  IITPlaylistWindowDisp = dispinterface;

  // *********************************************************************//
  // Declaration of CoClasses defined in Type Library
  // (NOTE: Here we map each CoClass to its Default Interface)
  // *********************************************************************//
  iTunesApp = IiTunes;
  iTunesConvertOperationStatus = IITConvertOperationStatus;

  // *********************************************************************//
  // Declaration of structures, unions and aliases.
  // *********************************************************************//
  POleVariant1 = ^OleVariant; { * }
  PWideString1 = ^WideString; { * }

  ITSourceKind = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0086_0001;
  ITPlaylistPrintKind = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0003;
  ITPlaylistSearchField = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0004;
  ITArtworkFormat = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0075_0001;
  ITTrackKind = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0089_0001;
  ITPlaylistKind = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0001;
  ITPlaylistRepeatMode = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0081_0002;
  ITRatingKind = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0089_0003;
  ITUserPlaylistSpecialKind = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0083_0001;
  ITWindowKind = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0095_0001;
  ITPlayerState = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0001;
  ITVisualSize = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0002;
  ITCOMDisabledReason = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0003;
  ITPlayButtonState = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0004;
  ITPlayerButton = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0005;
  ITPlayerButtonModifierKey = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0070_0006;
  ITEvent = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0073_0001;
  ITConvertOperationStatusEvent = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0074_0001;
  ITVideoKind = __MIDL___MIDL_itf_iTunesCOMInterface_0001_0089_0002;

  // *********************************************************************//
  // Interface: IITObject
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {9FAB0E27-70D7-4E3A-9965-B0C8B8869BB6}
  // *********************************************************************//
  IITObject = interface(IDispatch)
    ['{9FAB0E27-70D7-4E3A-9965-B0C8B8869BB6}']
    procedure GetITObjectIDs(out sourceID: Integer; out playlistID: Integer; out trackID: Integer; out databaseID: Integer); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    function Get_Index: Integer; safecall;
    function Get_sourceID: Integer; safecall;
    function Get_playlistID: Integer; safecall;
    function Get_trackID: Integer; safecall;
    function Get_TrackDatabaseID: Integer; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Index: Integer read Get_Index;
    property sourceID: Integer read Get_sourceID;
    property playlistID: Integer read Get_playlistID;
    property trackID: Integer read Get_trackID;
    property TrackDatabaseID: Integer read Get_TrackDatabaseID;
  end;

  // *********************************************************************//
  // DispIntf:  IITObjectDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {9FAB0E27-70D7-4E3A-9965-B0C8B8869BB6}
  // *********************************************************************//
  IITObjectDisp = dispinterface
    ['{9FAB0E27-70D7-4E3A-9965-B0C8B8869BB6}']
    procedure GetITObjectIDs(out sourceID: Integer; out playlistID: Integer; out trackID: Integer; out databaseID: Integer);
      dispid 1610743808;
    property Name: WideString dispid 1610743809;
    property Index: Integer readonly dispid 1610743811;
    property sourceID: Integer readonly dispid 1610743812;
    property playlistID: Integer readonly dispid 1610743813;
    property trackID: Integer readonly dispid 1610743814;
    property TrackDatabaseID: Integer readonly dispid 1610743815;
  end;

  // *********************************************************************//
  // Interface: IITSource
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {AEC1C4D3-AEF1-4255-B892-3E3D13ADFDF9}
  // *********************************************************************//
  IITSource = interface(IITObject)
    ['{AEC1C4D3-AEF1-4255-B892-3E3D13ADFDF9}']
    function Get_Kind: ITSourceKind; safecall;
    function Get_Capacity: Double; safecall;
    function Get_FreeSpace: Double; safecall;
    function Get_Playlists: IITPlaylistCollection; safecall;
    property Kind: ITSourceKind read Get_Kind;
    property Capacity: Double read Get_Capacity;
    property FreeSpace: Double read Get_FreeSpace;
    property Playlists: IITPlaylistCollection read Get_Playlists;
  end;

  // *********************************************************************//
  // DispIntf:  IITSourceDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {AEC1C4D3-AEF1-4255-B892-3E3D13ADFDF9}
  // *********************************************************************//
  IITSourceDisp = dispinterface
    ['{AEC1C4D3-AEF1-4255-B892-3E3D13ADFDF9}']
    property Kind: ITSourceKind readonly dispid 1610809344;
    property Capacity: Double readonly dispid 1610809345;
    property FreeSpace: Double readonly dispid 1610809346;
    property Playlists: IITPlaylistCollection readonly dispid 1610809347;
    procedure GetITObjectIDs(out sourceID: Integer; out playlistID: Integer; out trackID: Integer; out databaseID: Integer);
      dispid 1610743808;
    property Name: WideString dispid 1610743809;
    property Index: Integer readonly dispid 1610743811;
    property sourceID: Integer readonly dispid 1610743812;
    property playlistID: Integer readonly dispid 1610743813;
    property trackID: Integer readonly dispid 1610743814;
    property TrackDatabaseID: Integer readonly dispid 1610743815;
  end;

  // *********************************************************************//
  // Interface: IITPlaylistCollection
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {FF194254-909D-4437-9C50-3AAC2AE6305C}
  // *********************************************************************//
  IITPlaylistCollection = interface(IDispatch)
    ['{FF194254-909D-4437-9C50-3AAC2AE6305C}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): IITPlaylist; safecall;
    function Get_ItemByName(const Name: WideString): IITPlaylist; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_ItemByPersistentID(highID: Integer; lowID: Integer): IITPlaylist; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: IITPlaylist read Get_Item; default;
    property ItemByName[const Name: WideString]: IITPlaylist read Get_ItemByName;
    property _NewEnum: IUnknown read Get__NewEnum;
    property ItemByPersistentID[highID: Integer; lowID: Integer]: IITPlaylist read Get_ItemByPersistentID;
  end;

  // *********************************************************************//
  // DispIntf:  IITPlaylistCollectionDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {FF194254-909D-4437-9C50-3AAC2AE6305C}
  // *********************************************************************//
  IITPlaylistCollectionDisp = dispinterface
    ['{FF194254-909D-4437-9C50-3AAC2AE6305C}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Index: Integer]: IITPlaylist readonly dispid 0; default;
    property ItemByName[const Name: WideString]: IITPlaylist readonly dispid 1610743810;
    property _NewEnum: IUnknown readonly dispid - 4;
    property ItemByPersistentID[highID: Integer; lowID: Integer]: IITPlaylist readonly dispid 1610743812;
  end;

  // *********************************************************************//
  // Interface: IITPlaylist
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {3D5E072F-2A77-4B17-9E73-E03B77CCCCA9}
  // *********************************************************************//
  IITPlaylist = interface(IITObject)
    ['{3D5E072F-2A77-4B17-9E73-E03B77CCCCA9}']
    procedure Delete; safecall;
    procedure PlayFirstTrack; safecall;
    procedure Print(showPrintDialog: WordBool; printKind: ITPlaylistPrintKind; const theme: WideString); safecall;
    function Search(const searchText: WideString; searchFields: ITPlaylistSearchField): IITTrackCollection; safecall;
    function Get_Kind: ITPlaylistKind; safecall;
    function Get_Source: IITSource; safecall;
    function Get_Duration: Integer; safecall;
    function Get_Shuffle: WordBool; safecall;
    procedure Set_Shuffle(isShuffle: WordBool); safecall;
    function Get_Size: Double; safecall;
    function Get_SongRepeat: ITPlaylistRepeatMode; safecall;
    procedure Set_SongRepeat(repeatMode: ITPlaylistRepeatMode); safecall;
    function Get_Time: WideString; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_Tracks: IITTrackCollection; safecall;
    property Kind: ITPlaylistKind read Get_Kind;
    property Source: IITSource read Get_Source;
    property Duration: Integer read Get_Duration;
    property Shuffle: WordBool read Get_Shuffle write Set_Shuffle;
    property Size: Double read Get_Size;
    property SongRepeat: ITPlaylistRepeatMode read Get_SongRepeat write Set_SongRepeat;
    property Time: WideString read Get_Time;
    property Visible: WordBool read Get_Visible;
    property Tracks: IITTrackCollection read Get_Tracks;
  end;

  // *********************************************************************//
  // DispIntf:  IITPlaylistDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {3D5E072F-2A77-4B17-9E73-E03B77CCCCA9}
  // *********************************************************************//
  IITPlaylistDisp = dispinterface
    ['{3D5E072F-2A77-4B17-9E73-E03B77CCCCA9}']
    procedure Delete; dispid 1610809344;
    procedure PlayFirstTrack; dispid 1610809345;
    procedure Print(showPrintDialog: WordBool; printKind: ITPlaylistPrintKind; const theme: WideString); dispid 1610809346;
    function Search(const searchText: WideString; searchFields: ITPlaylistSearchField): IITTrackCollection; dispid 1610809347;
    property Kind: ITPlaylistKind readonly dispid 1610809348;
    property Source: IITSource readonly dispid 1610809349;
    property Duration: Integer readonly dispid 1610809350;
    property Shuffle: WordBool dispid 1610809351;
    property Size: Double readonly dispid 1610809353;
    property SongRepeat: ITPlaylistRepeatMode dispid 1610809354;
    property Time: WideString readonly dispid 1610809356;
    property Visible: WordBool readonly dispid 1610809357;
    property Tracks: IITTrackCollection readonly dispid 1610809358;
    procedure GetITObjectIDs(out sourceID: Integer; out playlistID: Integer; out trackID: Integer; out databaseID: Integer);
      dispid 1610743808;
    property Name: WideString dispid 1610743809;
    property Index: Integer readonly dispid 1610743811;
    property sourceID: Integer readonly dispid 1610743812;
    property playlistID: Integer readonly dispid 1610743813;
    property trackID: Integer readonly dispid 1610743814;
    property TrackDatabaseID: Integer readonly dispid 1610743815;
  end;

  // *********************************************************************//
  // Interface: IITTrackCollection
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {755D76F1-6B85-4CE4-8F5F-F88D9743DCD8}
  // *********************************************************************//
  IITTrackCollection = interface(IDispatch)
    ['{755D76F1-6B85-4CE4-8F5F-F88D9743DCD8}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): IITTrack; safecall;
    function Get_ItemByPlayOrder(Index: Integer): IITTrack; safecall;
    function Get_ItemByName(const Name: WideString): IITTrack; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_ItemByPersistentID(highID: Integer; lowID: Integer): IITTrack; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: IITTrack read Get_Item; default;
    property ItemByPlayOrder[Index: Integer]: IITTrack read Get_ItemByPlayOrder;
    property ItemByName[const Name: WideString]: IITTrack read Get_ItemByName;
    property _NewEnum: IUnknown read Get__NewEnum;
    property ItemByPersistentID[highID: Integer; lowID: Integer]: IITTrack read Get_ItemByPersistentID;
  end;

  // *********************************************************************//
  // DispIntf:  IITTrackCollectionDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {755D76F1-6B85-4CE4-8F5F-F88D9743DCD8}
  // *********************************************************************//
  IITTrackCollectionDisp = dispinterface
    ['{755D76F1-6B85-4CE4-8F5F-F88D9743DCD8}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Index: Integer]: IITTrack readonly dispid 0; default;
    property ItemByPlayOrder[Index: Integer]: IITTrack readonly dispid 1610743810;
    property ItemByName[const Name: WideString]: IITTrack readonly dispid 1610743811;
    property _NewEnum: IUnknown readonly dispid - 4;
    property ItemByPersistentID[highID: Integer; lowID: Integer]: IITTrack readonly dispid 1610743813;
  end;

  // *********************************************************************//
  // Interface: IITTrack
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {4CB0915D-1E54-4727-BAF3-CE6CC9A225A1}
  // *********************************************************************//
  IITTrack = interface(IITObject)
    ['{4CB0915D-1E54-4727-BAF3-CE6CC9A225A1}']
    procedure Delete; safecall;
    procedure Play; safecall;
    function AddArtworkFromFile(const filePath: WideString): IITArtwork; safecall;
    function Get_Kind: ITTrackKind; safecall;
    function Get_Playlist: IITPlaylist; safecall;
    function Get_Album: WideString; safecall;
    procedure Set_Album(const Album: WideString); safecall;
    function Get_Artist: WideString; safecall;
    procedure Set_Artist(const Artist: WideString); safecall;
    function Get_BitRate: Integer; safecall;
    function Get_BPM: Integer; safecall;
    procedure Set_BPM(beatsPerMinute: Integer); safecall;
    function Get_Comment: WideString; safecall;
    procedure Set_Comment(const Comment: WideString); safecall;
    function Get_Compilation: WordBool; safecall;
    procedure Set_Compilation(isCompilation: WordBool); safecall;
    function Get_Composer: WideString; safecall;
    procedure Set_Composer(const Composer: WideString); safecall;
    function Get_DateAdded: TDateTime; safecall;
    function Get_DiscCount: Integer; safecall;
    procedure Set_DiscCount(DiscCount: Integer); safecall;
    function Get_DiscNumber: Integer; safecall;
    procedure Set_DiscNumber(DiscNumber: Integer); safecall;
    function Get_Duration: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(isEnabled: WordBool); safecall;
    function Get_EQ: WideString; safecall;
    procedure Set_EQ(const EQ: WideString); safecall;
    procedure Set_Finish(Finish: Integer); safecall;
    function Get_Finish: Integer; safecall;
    function Get_Genre: WideString; safecall;
    procedure Set_Genre(const Genre: WideString); safecall;
    function Get_Grouping: WideString; safecall;
    procedure Set_Grouping(const Grouping: WideString); safecall;
    function Get_KindAsString: WideString; safecall;
    function Get_ModificationDate: TDateTime; safecall;
    function Get_PlayedCount: Integer; safecall;
    procedure Set_PlayedCount(PlayedCount: Integer); safecall;
    function Get_PlayedDate: TDateTime; safecall;
    procedure Set_PlayedDate(PlayedDate: TDateTime); safecall;
    function Get_PlayOrderIndex: Integer; safecall;
    function Get_Rating: Integer; safecall;
    procedure Set_Rating(Rating: Integer); safecall;
    function Get_SampleRate: Integer; safecall;
    function Get_Size: Integer; safecall;
    function Get_Start: Integer; safecall;
    procedure Set_Start(Start: Integer); safecall;
    function Get_Time: WideString; safecall;
    function Get_TrackCount: Integer; safecall;
    procedure Set_TrackCount(TrackCount: Integer); safecall;
    function Get_TrackNumber: Integer; safecall;
    procedure Set_TrackNumber(TrackNumber: Integer); safecall;
    function Get_VolumeAdjustment: Integer; safecall;
    procedure Set_VolumeAdjustment(VolumeAdjustment: Integer); safecall;
    function Get_Year: Integer; safecall;
    procedure Set_Year(Year: Integer); safecall;
    function Get_Artwork: IITArtworkCollection; safecall;
    property Kind: ITTrackKind read Get_Kind;
    property Playlist: IITPlaylist read Get_Playlist;
    property Album: WideString read Get_Album write Set_Album;
    property Artist: WideString read Get_Artist write Set_Artist;
    property BitRate: Integer read Get_BitRate;
    property BPM: Integer read Get_BPM write Set_BPM;
    property Comment: WideString read Get_Comment write Set_Comment;
    property Compilation: WordBool read Get_Compilation write Set_Compilation;
    property Composer: WideString read Get_Composer write Set_Composer;
    property DateAdded: TDateTime read Get_DateAdded;
    property DiscCount: Integer read Get_DiscCount write Set_DiscCount;
    property DiscNumber: Integer read Get_DiscNumber write Set_DiscNumber;
    property Duration: Integer read Get_Duration;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property EQ: WideString read Get_EQ write Set_EQ;
    property Finish: Integer read Get_Finish write Set_Finish;
    property Genre: WideString read Get_Genre write Set_Genre;
    property Grouping: WideString read Get_Grouping write Set_Grouping;
    property KindAsString: WideString read Get_KindAsString;
    property ModificationDate: TDateTime read Get_ModificationDate;
    property PlayedCount: Integer read Get_PlayedCount write Set_PlayedCount;
    property PlayedDate: TDateTime read Get_PlayedDate write Set_PlayedDate;
    property PlayOrderIndex: Integer read Get_PlayOrderIndex;
    property Rating: Integer read Get_Rating write Set_Rating;
    property SampleRate: Integer read Get_SampleRate;
    property Size: Integer read Get_Size;
    property Start: Integer read Get_Start write Set_Start;
    property Time: WideString read Get_Time;
    property TrackCount: Integer read Get_TrackCount write Set_TrackCount;
    property TrackNumber: Integer read Get_TrackNumber write Set_TrackNumber;
    property VolumeAdjustment: Integer read Get_VolumeAdjustment write Set_VolumeAdjustment;
    property Year: Integer read Get_Year write Set_Year;
    property Artwork: IITArtworkCollection read Get_Artwork;
  end;

  // *********************************************************************//
  // DispIntf:  IITTrackDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {4CB0915D-1E54-4727-BAF3-CE6CC9A225A1}
  // *********************************************************************//
  IITTrackDisp = dispinterface
    ['{4CB0915D-1E54-4727-BAF3-CE6CC9A225A1}']
    procedure Delete; dispid 1610809344;
    procedure Play; dispid 1610809345;
    function AddArtworkFromFile(const filePath: WideString): IITArtwork; dispid 1610809346;
    property Kind: ITTrackKind readonly dispid 1610809347;
    property Playlist: IITPlaylist readonly dispid 1610809348;
    property Album: WideString dispid 1610809349;
    property Artist: WideString dispid 1610809351;
    property BitRate: Integer readonly dispid 1610809353;
    property BPM: Integer dispid 1610809354;
    property Comment: WideString dispid 1610809356;
    property Compilation: WordBool dispid 1610809358;
    property Composer: WideString dispid 1610809360;
    property DateAdded: TDateTime readonly dispid 1610809362;
    property DiscCount: Integer dispid 1610809363;
    property DiscNumber: Integer dispid 1610809365;
    property Duration: Integer readonly dispid 1610809367;
    property Enabled: WordBool dispid 1610809368;
    property EQ: WideString dispid 1610809370;
    property Finish: Integer dispid 1610809372;
    property Genre: WideString dispid 1610809374;
    property Grouping: WideString dispid 1610809376;
    property KindAsString: WideString readonly dispid 1610809378;
    property ModificationDate: TDateTime readonly dispid 1610809379;
    property PlayedCount: Integer dispid 1610809380;
    property PlayedDate: TDateTime dispid 1610809382;
    property PlayOrderIndex: Integer readonly dispid 1610809384;
    property Rating: Integer dispid 1610809385;
    property SampleRate: Integer readonly dispid 1610809387;
    property Size: Integer readonly dispid 1610809388;
    property Start: Integer dispid 1610809389;
    property Time: WideString readonly dispid 1610809391;
    property TrackCount: Integer dispid 1610809392;
    property TrackNumber: Integer dispid 1610809394;
    property VolumeAdjustment: Integer dispid 1610809396;
    property Year: Integer dispid 1610809398;
    property Artwork: IITArtworkCollection readonly dispid 1610809400;
    procedure GetITObjectIDs(out sourceID: Integer; out playlistID: Integer; out trackID: Integer; out databaseID: Integer);
      dispid 1610743808;
    property Name: WideString dispid 1610743809;
    property Index: Integer readonly dispid 1610743811;
    property sourceID: Integer readonly dispid 1610743812;
    property playlistID: Integer readonly dispid 1610743813;
    property trackID: Integer readonly dispid 1610743814;
    property TrackDatabaseID: Integer readonly dispid 1610743815;
  end;

  // *********************************************************************//
  // Interface: IITArtwork
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {D0A6C1F8-BF3D-4CD8-AC47-FE32BDD17257}
  // *********************************************************************//
  IITArtwork = interface(IDispatch)
    ['{D0A6C1F8-BF3D-4CD8-AC47-FE32BDD17257}']
    procedure Delete; safecall;
    procedure SetArtworkFromFile(const filePath: WideString); safecall;
    procedure SaveArtworkToFile(const filePath: WideString); safecall;
    function Get_Format: ITArtworkFormat; safecall;
    function Get_IsDownloadedArtwork: WordBool; safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const Description: WideString); safecall;
    property Format: ITArtworkFormat read Get_Format;
    property IsDownloadedArtwork: WordBool read Get_IsDownloadedArtwork;
    property Description: WideString read Get_Description write Set_Description;
  end;

  // *********************************************************************//
  // DispIntf:  IITArtworkDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {D0A6C1F8-BF3D-4CD8-AC47-FE32BDD17257}
  // *********************************************************************//
  IITArtworkDisp = dispinterface
    ['{D0A6C1F8-BF3D-4CD8-AC47-FE32BDD17257}']
    procedure Delete; dispid 1610743808;
    procedure SetArtworkFromFile(const filePath: WideString); dispid 1610743809;
    procedure SaveArtworkToFile(const filePath: WideString); dispid 1610743810;
    property Format: ITArtworkFormat readonly dispid 1610743811;
    property IsDownloadedArtwork: WordBool readonly dispid 1610743812;
    property Description: WideString dispid 1610743813;
  end;

  // *********************************************************************//
  // Interface: IITArtworkCollection
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {BF2742D7-418C-4858-9AF9-2981B062D23E}
  // *********************************************************************//
  IITArtworkCollection = interface(IDispatch)
    ['{BF2742D7-418C-4858-9AF9-2981B062D23E}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): IITArtwork; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: IITArtwork read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  // *********************************************************************//
  // DispIntf:  IITArtworkCollectionDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {BF2742D7-418C-4858-9AF9-2981B062D23E}
  // *********************************************************************//
  IITArtworkCollectionDisp = dispinterface
    ['{BF2742D7-418C-4858-9AF9-2981B062D23E}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Index: Integer]: IITArtwork readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  // *********************************************************************//
  // Interface: IITSourceCollection
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {2FF6CE20-FF87-4183-B0B3-F323D047AF41}
  // *********************************************************************//
  IITSourceCollection = interface(IDispatch)
    ['{2FF6CE20-FF87-4183-B0B3-F323D047AF41}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): IITSource; safecall;
    function Get_ItemByName(const Name: WideString): IITSource; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_ItemByPersistentID(highID: Integer; lowID: Integer): IITSource; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: IITSource read Get_Item; default;
    property ItemByName[const Name: WideString]: IITSource read Get_ItemByName;
    property _NewEnum: IUnknown read Get__NewEnum;
    property ItemByPersistentID[highID: Integer; lowID: Integer]: IITSource read Get_ItemByPersistentID;
  end;

  // *********************************************************************//
  // DispIntf:  IITSourceCollectionDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {2FF6CE20-FF87-4183-B0B3-F323D047AF41}
  // *********************************************************************//
  IITSourceCollectionDisp = dispinterface
    ['{2FF6CE20-FF87-4183-B0B3-F323D047AF41}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Index: Integer]: IITSource readonly dispid 0; default;
    property ItemByName[const Name: WideString]: IITSource readonly dispid 1610743810;
    property _NewEnum: IUnknown readonly dispid - 4;
    property ItemByPersistentID[highID: Integer; lowID: Integer]: IITSource readonly dispid 1610743812;
  end;

  // *********************************************************************//
  // Interface: IITEncoder
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {1CF95A1C-55FE-4F45-A2D3-85AC6C504A73}
  // *********************************************************************//
  IITEncoder = interface(IDispatch)
    ['{1CF95A1C-55FE-4F45-A2D3-85AC6C504A73}']
    function Get_Name: WideString; safecall;
    function Get_Format: WideString; safecall;
    property Name: WideString read Get_Name;
    property Format: WideString read Get_Format;
  end;

  // *********************************************************************//
  // DispIntf:  IITEncoderDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {1CF95A1C-55FE-4F45-A2D3-85AC6C504A73}
  // *********************************************************************//
  IITEncoderDisp = dispinterface
    ['{1CF95A1C-55FE-4F45-A2D3-85AC6C504A73}']
    property Name: WideString readonly dispid 1610743808;
    property Format: WideString readonly dispid 1610743809;
  end;

  // *********************************************************************//
  // Interface: IITEncoderCollection
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {8862BCA9-168D-4549-A9D5-ADB35E553BA6}
  // *********************************************************************//
  IITEncoderCollection = interface(IDispatch)
    ['{8862BCA9-168D-4549-A9D5-ADB35E553BA6}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): IITEncoder; safecall;
    function Get_ItemByName(const Name: WideString): IITEncoder; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: IITEncoder read Get_Item; default;
    property ItemByName[const Name: WideString]: IITEncoder read Get_ItemByName;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  // *********************************************************************//
  // DispIntf:  IITEncoderCollectionDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {8862BCA9-168D-4549-A9D5-ADB35E553BA6}
  // *********************************************************************//
  IITEncoderCollectionDisp = dispinterface
    ['{8862BCA9-168D-4549-A9D5-ADB35E553BA6}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Index: Integer]: IITEncoder readonly dispid 0; default;
    property ItemByName[const Name: WideString]: IITEncoder readonly dispid 1610743810;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  // *********************************************************************//
  // Interface: IITEQPreset
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {5BE75F4F-68FA-4212-ACB7-BE44EA569759}
  // *********************************************************************//
  IITEQPreset = interface(IDispatch)
    ['{5BE75F4F-68FA-4212-ACB7-BE44EA569759}']
    function Get_Name: WideString; safecall;
    function Get_Modifiable: WordBool; safecall;
    function Get_Preamp: Double; safecall;
    procedure Set_Preamp(level: Double); safecall;
    function Get_Band1: Double; safecall;
    procedure Set_Band1(level: Double); safecall;
    function Get_Band2: Double; safecall;
    procedure Set_Band2(level: Double); safecall;
    function Get_Band3: Double; safecall;
    procedure Set_Band3(level: Double); safecall;
    function Get_Band4: Double; safecall;
    procedure Set_Band4(level: Double); safecall;
    function Get_Band5: Double; safecall;
    procedure Set_Band5(level: Double); safecall;
    function Get_Band6: Double; safecall;
    procedure Set_Band6(level: Double); safecall;
    function Get_Band7: Double; safecall;
    procedure Set_Band7(level: Double); safecall;
    function Get_Band8: Double; safecall;
    procedure Set_Band8(level: Double); safecall;
    function Get_Band9: Double; safecall;
    procedure Set_Band9(level: Double); safecall;
    function Get_Band10: Double; safecall;
    procedure Set_Band10(level: Double); safecall;
    procedure Delete(updateAllTracks: WordBool); safecall;
    procedure Rename(const newName: WideString; updateAllTracks: WordBool); safecall;
    property Name: WideString read Get_Name;
    property Modifiable: WordBool read Get_Modifiable;
    property Preamp: Double read Get_Preamp write Set_Preamp;
    property Band1: Double read Get_Band1 write Set_Band1;
    property Band2: Double read Get_Band2 write Set_Band2;
    property Band3: Double read Get_Band3 write Set_Band3;
    property Band4: Double read Get_Band4 write Set_Band4;
    property Band5: Double read Get_Band5 write Set_Band5;
    property Band6: Double read Get_Band6 write Set_Band6;
    property Band7: Double read Get_Band7 write Set_Band7;
    property Band8: Double read Get_Band8 write Set_Band8;
    property Band9: Double read Get_Band9 write Set_Band9;
    property Band10: Double read Get_Band10 write Set_Band10;
  end;

  // *********************************************************************//
  // DispIntf:  IITEQPresetDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {5BE75F4F-68FA-4212-ACB7-BE44EA569759}
  // *********************************************************************//
  IITEQPresetDisp = dispinterface
    ['{5BE75F4F-68FA-4212-ACB7-BE44EA569759}']
    property Name: WideString readonly dispid 1610743808;
    property Modifiable: WordBool readonly dispid 1610743809;
    property Preamp: Double dispid 1610743810;
    property Band1: Double dispid 1610743812;
    property Band2: Double dispid 1610743814;
    property Band3: Double dispid 1610743816;
    property Band4: Double dispid 1610743818;
    property Band5: Double dispid 1610743820;
    property Band6: Double dispid 1610743822;
    property Band7: Double dispid 1610743824;
    property Band8: Double dispid 1610743826;
    property Band9: Double dispid 1610743828;
    property Band10: Double dispid 1610743830;
    procedure Delete(updateAllTracks: WordBool); dispid 1610743832;
    procedure Rename(const newName: WideString; updateAllTracks: WordBool); dispid 1610743833;
  end;

  // *********************************************************************//
  // Interface: IITEQPresetCollection
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {AEF4D111-3331-48DA-B0C2-B468D5D61D08}
  // *********************************************************************//
  IITEQPresetCollection = interface(IDispatch)
    ['{AEF4D111-3331-48DA-B0C2-B468D5D61D08}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): IITEQPreset; safecall;
    function Get_ItemByName(const Name: WideString): IITEQPreset; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: IITEQPreset read Get_Item; default;
    property ItemByName[const Name: WideString]: IITEQPreset read Get_ItemByName;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  // *********************************************************************//
  // DispIntf:  IITEQPresetCollectionDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {AEF4D111-3331-48DA-B0C2-B468D5D61D08}
  // *********************************************************************//
  IITEQPresetCollectionDisp = dispinterface
    ['{AEF4D111-3331-48DA-B0C2-B468D5D61D08}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Index: Integer]: IITEQPreset readonly dispid 0; default;
    property ItemByName[const Name: WideString]: IITEQPreset readonly dispid 1610743810;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  // *********************************************************************//
  // Interface: IITOperationStatus
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {206479C9-FE32-4F9B-A18A-475AC939B479}
  // *********************************************************************//
  IITOperationStatus = interface(IDispatch)
    ['{206479C9-FE32-4F9B-A18A-475AC939B479}']
    function Get_InProgress: WordBool; safecall;
    function Get_Tracks: IITTrackCollection; safecall;
    property InProgress: WordBool read Get_InProgress;
    property Tracks: IITTrackCollection read Get_Tracks;
  end;

  // *********************************************************************//
  // DispIntf:  IITOperationStatusDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {206479C9-FE32-4F9B-A18A-475AC939B479}
  // *********************************************************************//
  IITOperationStatusDisp = dispinterface
    ['{206479C9-FE32-4F9B-A18A-475AC939B479}']
    property InProgress: WordBool readonly dispid 1610743808;
    property Tracks: IITTrackCollection readonly dispid 1610743809;
  end;

  // *********************************************************************//
  // Interface: IITConvertOperationStatus
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {7063AAF6-ABA0-493B-B4FC-920A9F105875}
  // *********************************************************************//
  IITConvertOperationStatus = interface(IITOperationStatus)
    ['{7063AAF6-ABA0-493B-B4FC-920A9F105875}']
    procedure GetConversionStatus(out trackName: WideString; out progressValue: Integer; out maxProgressValue: Integer); safecall;
    procedure StopConversion; safecall;
    function Get_trackName: WideString; safecall;
    function Get_progressValue: Integer; safecall;
    function Get_maxProgressValue: Integer; safecall;
    property trackName: WideString read Get_trackName;
    property progressValue: Integer read Get_progressValue;
    property maxProgressValue: Integer read Get_maxProgressValue;
  end;

  // *********************************************************************//
  // DispIntf:  IITConvertOperationStatusDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {7063AAF6-ABA0-493B-B4FC-920A9F105875}
  // *********************************************************************//
  IITConvertOperationStatusDisp = dispinterface
    ['{7063AAF6-ABA0-493B-B4FC-920A9F105875}']
    procedure GetConversionStatus(out trackName: WideString; out progressValue: Integer; out maxProgressValue: Integer); dispid 1610809344;
    procedure StopConversion; dispid 1610809345;
    property trackName: WideString readonly dispid 1610809346;
    property progressValue: Integer readonly dispid 1610809347;
    property maxProgressValue: Integer readonly dispid 1610809348;
    property InProgress: WordBool readonly dispid 1610743808;
    property Tracks: IITTrackCollection readonly dispid 1610743809;
  end;

  // *********************************************************************//
  // Interface: IITLibraryPlaylist
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {53AE1704-491C-4289-94A0-958815675A3D}
  // *********************************************************************//
  IITLibraryPlaylist = interface(IITPlaylist)
    ['{53AE1704-491C-4289-94A0-958815675A3D}']
    function AddFile(const filePath: WideString): IITOperationStatus; safecall;
    function AddFiles(const filePaths: OleVariant): IITOperationStatus; safecall;
    function AddURL(const URL: WideString): IITURLTrack; safecall;
    function AddTrack(const iTrackToAdd: OleVariant): IITTrack; safecall;
  end;

  // *********************************************************************//
  // DispIntf:  IITLibraryPlaylistDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {53AE1704-491C-4289-94A0-958815675A3D}
  // *********************************************************************//
  IITLibraryPlaylistDisp = dispinterface
    ['{53AE1704-491C-4289-94A0-958815675A3D}']
    function AddFile(const filePath: WideString): IITOperationStatus; dispid 1610874880;
    function AddFiles(const filePaths: OleVariant): IITOperationStatus; dispid 1610874881;
    function AddURL(const URL: WideString): IITURLTrack; dispid 1610874882;
    function AddTrack(const iTrackToAdd: OleVariant): IITTrack; dispid 1610874883;
    procedure Delete; dispid 1610809344;
    procedure PlayFirstTrack; dispid 1610809345;
    procedure Print(showPrintDialog: WordBool; printKind: ITPlaylistPrintKind; const theme: WideString); dispid 1610809346;
    function Search(const searchText: WideString; searchFields: ITPlaylistSearchField): IITTrackCollection; dispid 1610809347;
    property Kind: ITPlaylistKind readonly dispid 1610809348;
    property Source: IITSource readonly dispid 1610809349;
    property Duration: Integer readonly dispid 1610809350;
    property Shuffle: WordBool dispid 1610809351;
    property Size: Double readonly dispid 1610809353;
    property SongRepeat: ITPlaylistRepeatMode dispid 1610809354;
    property Time: WideString readonly dispid 1610809356;
    property Visible: WordBool readonly dispid 1610809357;
    property Tracks: IITTrackCollection readonly dispid 1610809358;
    procedure GetITObjectIDs(out sourceID: Integer; out playlistID: Integer; out trackID: Integer; out databaseID: Integer);
      dispid 1610743808;
    property Name: WideString dispid 1610743809;
    property Index: Integer readonly dispid 1610743811;
    property sourceID: Integer readonly dispid 1610743812;
    property playlistID: Integer readonly dispid 1610743813;
    property trackID: Integer readonly dispid 1610743814;
    property TrackDatabaseID: Integer readonly dispid 1610743815;
  end;

  // *********************************************************************//
  // Interface: IITURLTrack
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {1116E3B5-29FD-4393-A7BD-454E5E327900}
  // *********************************************************************//
  IITURLTrack = interface(IITTrack)
    ['{1116E3B5-29FD-4393-A7BD-454E5E327900}']
    function Get_URL: WideString; safecall;
    procedure Set_URL(const URL: WideString); safecall;
    function Get_Podcast: WordBool; safecall;
    procedure UpdatePodcastFeed; safecall;
    procedure DownloadPodcastEpisode; safecall;
    function Get_Category: WideString; safecall;
    procedure Set_Category(const Category: WideString); safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const Description: WideString); safecall;
    function Get_LongDescription: WideString; safecall;
    procedure Set_LongDescription(const LongDescription: WideString); safecall;
    procedure Reveal; safecall;
    function Get_AlbumRating: Integer; safecall;
    procedure Set_AlbumRating(Rating: Integer); safecall;
    function Get_AlbumRatingKind: ITRatingKind; safecall;
    function Get_ratingKind: ITRatingKind; safecall;
    function Get_Playlists: IITPlaylistCollection; safecall;
    property URL: WideString read Get_URL write Set_URL;
    property Podcast: WordBool read Get_Podcast;
    property Category: WideString read Get_Category write Set_Category;
    property Description: WideString read Get_Description write Set_Description;
    property LongDescription: WideString read Get_LongDescription write Set_LongDescription;
    property AlbumRating: Integer read Get_AlbumRating write Set_AlbumRating;
    property AlbumRatingKind: ITRatingKind read Get_AlbumRatingKind;
    property ratingKind: ITRatingKind read Get_ratingKind;
    property Playlists: IITPlaylistCollection read Get_Playlists;
  end;

  // *********************************************************************//
  // DispIntf:  IITURLTrackDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {1116E3B5-29FD-4393-A7BD-454E5E327900}
  // *********************************************************************//
  IITURLTrackDisp = dispinterface
    ['{1116E3B5-29FD-4393-A7BD-454E5E327900}']
    property URL: WideString dispid 1610874880;
    property Podcast: WordBool readonly dispid 1610874882;
    procedure UpdatePodcastFeed; dispid 1610874883;
    procedure DownloadPodcastEpisode; dispid 1610874884;
    property Category: WideString dispid 1610874885;
    property Description: WideString dispid 1610874887;
    property LongDescription: WideString dispid 1610874889;
    procedure Reveal; dispid 1610874891;
    property AlbumRating: Integer dispid 1610874892;
    property AlbumRatingKind: ITRatingKind readonly dispid 1610874894;
    property ratingKind: ITRatingKind readonly dispid 1610874895;
    property Playlists: IITPlaylistCollection readonly dispid 1610874896;
    procedure Delete; dispid 1610809344;
    procedure Play; dispid 1610809345;
    function AddArtworkFromFile(const filePath: WideString): IITArtwork; dispid 1610809346;
    property Kind: ITTrackKind readonly dispid 1610809347;
    property Playlist: IITPlaylist readonly dispid 1610809348;
    property Album: WideString dispid 1610809349;
    property Artist: WideString dispid 1610809351;
    property BitRate: Integer readonly dispid 1610809353;
    property BPM: Integer dispid 1610809354;
    property Comment: WideString dispid 1610809356;
    property Compilation: WordBool dispid 1610809358;
    property Composer: WideString dispid 1610809360;
    property DateAdded: TDateTime readonly dispid 1610809362;
    property DiscCount: Integer dispid 1610809363;
    property DiscNumber: Integer dispid 1610809365;
    property Duration: Integer readonly dispid 1610809367;
    property Enabled: WordBool dispid 1610809368;
    property EQ: WideString dispid 1610809370;
    property Finish: Integer dispid 1610809372;
    property Genre: WideString dispid 1610809374;
    property Grouping: WideString dispid 1610809376;
    property KindAsString: WideString readonly dispid 1610809378;
    property ModificationDate: TDateTime readonly dispid 1610809379;
    property PlayedCount: Integer dispid 1610809380;
    property PlayedDate: TDateTime dispid 1610809382;
    property PlayOrderIndex: Integer readonly dispid 1610809384;
    property Rating: Integer dispid 1610809385;
    property SampleRate: Integer readonly dispid 1610809387;
    property Size: Integer readonly dispid 1610809388;
    property Start: Integer dispid 1610809389;
    property Time: WideString readonly dispid 1610809391;
    property TrackCount: Integer dispid 1610809392;
    property TrackNumber: Integer dispid 1610809394;
    property VolumeAdjustment: Integer dispid 1610809396;
    property Year: Integer dispid 1610809398;
    property Artwork: IITArtworkCollection readonly dispid 1610809400;
    procedure GetITObjectIDs(out sourceID: Integer; out playlistID: Integer; out trackID: Integer; out databaseID: Integer);
      dispid 1610743808;
    property Name: WideString dispid 1610743809;
    property Index: Integer readonly dispid 1610743811;
    property sourceID: Integer readonly dispid 1610743812;
    property playlistID: Integer readonly dispid 1610743813;
    property trackID: Integer readonly dispid 1610743814;
    property TrackDatabaseID: Integer readonly dispid 1610743815;
  end;

  // *********************************************************************//
  // Interface: IITUserPlaylist
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {0A504DED-A0B5-465A-8A94-50E20D7DF692}
  // *********************************************************************//
  IITUserPlaylist = interface(IITPlaylist)
    ['{0A504DED-A0B5-465A-8A94-50E20D7DF692}']
    function AddFile(const filePath: WideString): IITOperationStatus; safecall;
    function AddFiles(const filePaths: OleVariant): IITOperationStatus; safecall;
    function AddURL(const URL: WideString): IITURLTrack; safecall;
    function AddTrack(const iTrackToAdd: OleVariant): IITTrack; safecall;
    function Get_Shared: WordBool; safecall;
    procedure Set_Shared(isShared: WordBool); safecall;
    function Get_Smart: WordBool; safecall;
    function Get_SpecialKind: ITUserPlaylistSpecialKind; safecall;
    function Get_Parent: IITUserPlaylist; safecall;
    function CreatePlaylist(const playlistName: WideString): IITPlaylist; safecall;
    function CreateFolder(const folderName: WideString): IITPlaylist; safecall;
    procedure Set_Parent(const iParentPlayList: OleVariant); safecall;
    procedure Reveal; safecall;
    property Shared: WordBool read Get_Shared write Set_Shared;
    property Smart: WordBool read Get_Smart;
    property SpecialKind: ITUserPlaylistSpecialKind read Get_SpecialKind;
    // Skipped Property "Parent"
  end;

  // *********************************************************************//
  // DispIntf:  IITUserPlaylistDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {0A504DED-A0B5-465A-8A94-50E20D7DF692}
  // *********************************************************************//
  IITUserPlaylistDisp = dispinterface
    ['{0A504DED-A0B5-465A-8A94-50E20D7DF692}']
    function AddFile(const filePath: WideString): IITOperationStatus; dispid 1610874880;
    function AddFiles(const filePaths: OleVariant): IITOperationStatus; dispid 1610874881;
    function AddURL(const URL: WideString): IITURLTrack; dispid 1610874882;
    function AddTrack(const iTrackToAdd: OleVariant): IITTrack; dispid 1610874883;
    property Shared: WordBool dispid 1610874884;
    property Smart: WordBool readonly dispid 1610874886;
    property SpecialKind: ITUserPlaylistSpecialKind readonly dispid 1610874887;
    function Parent: IITUserPlaylist; dispid 1610874888;
    function CreatePlaylist(const playlistName: WideString): IITPlaylist; dispid 1610874889;
    function CreateFolder(const folderName: WideString): IITPlaylist; dispid 1610874890;
    procedure Reveal; dispid 1610874892;
    procedure Delete; dispid 1610809344;
    procedure PlayFirstTrack; dispid 1610809345;
    procedure Print(showPrintDialog: WordBool; printKind: ITPlaylistPrintKind; const theme: WideString); dispid 1610809346;
    function Search(const searchText: WideString; searchFields: ITPlaylistSearchField): IITTrackCollection; dispid 1610809347;
    property Kind: ITPlaylistKind readonly dispid 1610809348;
    property Source: IITSource readonly dispid 1610809349;
    property Duration: Integer readonly dispid 1610809350;
    property Shuffle: WordBool dispid 1610809351;
    property Size: Double readonly dispid 1610809353;
    property SongRepeat: ITPlaylistRepeatMode dispid 1610809354;
    property Time: WideString readonly dispid 1610809356;
    property Visible: WordBool readonly dispid 1610809357;
    property Tracks: IITTrackCollection readonly dispid 1610809358;
    procedure GetITObjectIDs(out sourceID: Integer; out playlistID: Integer; out trackID: Integer; out databaseID: Integer);
      dispid 1610743808;
    property Name: WideString dispid 1610743809;
    property Index: Integer readonly dispid 1610743811;
    property sourceID: Integer readonly dispid 1610743812;
    property playlistID: Integer readonly dispid 1610743813;
    property trackID: Integer readonly dispid 1610743814;
    property TrackDatabaseID: Integer readonly dispid 1610743815;
  end;

  // *********************************************************************//
  // Interface: IITVisual
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {340F3315-ED72-4C09-9ACF-21EB4BDF9931}
  // *********************************************************************//
  IITVisual = interface(IDispatch)
    ['{340F3315-ED72-4C09-9ACF-21EB4BDF9931}']
    function Get_Name: WideString; safecall;
    property Name: WideString read Get_Name;
  end;

  // *********************************************************************//
  // DispIntf:  IITVisualDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {340F3315-ED72-4C09-9ACF-21EB4BDF9931}
  // *********************************************************************//
  IITVisualDisp = dispinterface
    ['{340F3315-ED72-4C09-9ACF-21EB4BDF9931}']
    property Name: WideString readonly dispid 1610743808;
  end;

  // *********************************************************************//
  // Interface: IITVisualCollection
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {88A4CCDD-114F-4043-B69B-84D4E6274957}
  // *********************************************************************//
  IITVisualCollection = interface(IDispatch)
    ['{88A4CCDD-114F-4043-B69B-84D4E6274957}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): IITVisual; safecall;
    function Get_ItemByName(const Name: WideString): IITVisual; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: IITVisual read Get_Item; default;
    property ItemByName[const Name: WideString]: IITVisual read Get_ItemByName;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  // *********************************************************************//
  // DispIntf:  IITVisualCollectionDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {88A4CCDD-114F-4043-B69B-84D4E6274957}
  // *********************************************************************//
  IITVisualCollectionDisp = dispinterface
    ['{88A4CCDD-114F-4043-B69B-84D4E6274957}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Index: Integer]: IITVisual readonly dispid 0; default;
    property ItemByName[const Name: WideString]: IITVisual readonly dispid 1610743810;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  // *********************************************************************//
  // Interface: IITWindow
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {370D7BE0-3A89-4A42-B902-C75FC138BE09}
  // *********************************************************************//
  IITWindow = interface(IDispatch)
    ['{370D7BE0-3A89-4A42-B902-C75FC138BE09}']
    function Get_Name: WideString; safecall;
    function Get_Kind: ITWindowKind; safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(isVisible: WordBool); safecall;
    function Get_Resizable: WordBool; safecall;
    function Get_Minimized: WordBool; safecall;
    procedure Set_Minimized(isMinimized: WordBool); safecall;
    function Get_Maximizable: WordBool; safecall;
    function Get_Maximized: WordBool; safecall;
    procedure Set_Maximized(isMaximized: WordBool); safecall;
    function Get_Zoomable: WordBool; safecall;
    function Get_Zoomed: WordBool; safecall;
    procedure Set_Zoomed(isZoomed: WordBool); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(Top: Integer); safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(Left: Integer); safecall;
    function Get_Bottom: Integer; safecall;
    procedure Set_Bottom(Bottom: Integer); safecall;
    function Get_Right: Integer; safecall;
    procedure Set_Right(Right: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(Width: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(Height: Integer); safecall;
    property Name: WideString read Get_Name;
    property Kind: ITWindowKind read Get_Kind;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Resizable: WordBool read Get_Resizable;
    property Minimized: WordBool read Get_Minimized write Set_Minimized;
    property Maximizable: WordBool read Get_Maximizable;
    property Maximized: WordBool read Get_Maximized write Set_Maximized;
    property Zoomable: WordBool read Get_Zoomable;
    property Zoomed: WordBool read Get_Zoomed write Set_Zoomed;
    property Top: Integer read Get_Top write Set_Top;
    property Left: Integer read Get_Left write Set_Left;
    property Bottom: Integer read Get_Bottom write Set_Bottom;
    property Right: Integer read Get_Right write Set_Right;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
  end;

  // *********************************************************************//
  // DispIntf:  IITWindowDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {370D7BE0-3A89-4A42-B902-C75FC138BE09}
  // *********************************************************************//
  IITWindowDisp = dispinterface
    ['{370D7BE0-3A89-4A42-B902-C75FC138BE09}']
    property Name: WideString readonly dispid 1610743808;
    property Kind: ITWindowKind readonly dispid 1610743809;
    property Visible: WordBool dispid 1610743810;
    property Resizable: WordBool readonly dispid 1610743812;
    property Minimized: WordBool dispid 1610743813;
    property Maximizable: WordBool readonly dispid 1610743815;
    property Maximized: WordBool dispid 1610743816;
    property Zoomable: WordBool readonly dispid 1610743818;
    property Zoomed: WordBool dispid 1610743819;
    property Top: Integer dispid 1610743821;
    property Left: Integer dispid 1610743823;
    property Bottom: Integer dispid 1610743825;
    property Right: Integer dispid 1610743827;
    property Width: Integer dispid 1610743829;
    property Height: Integer dispid 1610743831;
  end;

  // *********************************************************************//
  // Interface: IITBrowserWindow
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {C999F455-C4D5-4AA4-8277-F99753699974}
  // *********************************************************************//
  IITBrowserWindow = interface(IITWindow)
    ['{C999F455-C4D5-4AA4-8277-F99753699974}']
    function Get_MiniPlayer: WordBool; safecall;
    procedure Set_MiniPlayer(isMiniPlayer: WordBool); safecall;
    function Get_SelectedTracks: IITTrackCollection; safecall;
    function Get_SelectedPlaylist: IITPlaylist; safecall;
    procedure Set_SelectedPlaylist(const iPlaylist: OleVariant); safecall;
    property MiniPlayer: WordBool read Get_MiniPlayer write Set_MiniPlayer;
    property SelectedTracks: IITTrackCollection read Get_SelectedTracks;
    // Skipped Property "SelectedPlaylist"
  end;

  // *********************************************************************//
  // DispIntf:  IITBrowserWindowDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {C999F455-C4D5-4AA4-8277-F99753699974}
  // *********************************************************************//
  IITBrowserWindowDisp = dispinterface
    ['{C999F455-C4D5-4AA4-8277-F99753699974}']
    property MiniPlayer: WordBool dispid 1610809344;
    property SelectedTracks: IITTrackCollection readonly dispid 1610809346;
    function SelectedPlaylist: IITPlaylist; dispid 1610809347;
    property Name: WideString readonly dispid 1610743808;
    property Kind: ITWindowKind readonly dispid 1610743809;
    property Visible: WordBool dispid 1610743810;
    property Resizable: WordBool readonly dispid 1610743812;
    property Minimized: WordBool dispid 1610743813;
    property Maximizable: WordBool readonly dispid 1610743815;
    property Maximized: WordBool dispid 1610743816;
    property Zoomable: WordBool readonly dispid 1610743818;
    property Zoomed: WordBool dispid 1610743819;
    property Top: Integer dispid 1610743821;
    property Left: Integer dispid 1610743823;
    property Bottom: Integer dispid 1610743825;
    property Right: Integer dispid 1610743827;
    property Width: Integer dispid 1610743829;
    property Height: Integer dispid 1610743831;
  end;

  // *********************************************************************//
  // Interface: IITWindowCollection
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {3D8DE381-6C0E-481F-A865-E2385F59FA43}
  // *********************************************************************//
  IITWindowCollection = interface(IDispatch)
    ['{3D8DE381-6C0E-481F-A865-E2385F59FA43}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): IITWindow; safecall;
    function Get_ItemByName(const Name: WideString): IITWindow; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: IITWindow read Get_Item; default;
    property ItemByName[const Name: WideString]: IITWindow read Get_ItemByName;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  // *********************************************************************//
  // DispIntf:  IITWindowCollectionDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {3D8DE381-6C0E-481F-A865-E2385F59FA43}
  // *********************************************************************//
  IITWindowCollectionDisp = dispinterface
    ['{3D8DE381-6C0E-481F-A865-E2385F59FA43}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Index: Integer]: IITWindow readonly dispid 0; default;
    property ItemByName[const Name: WideString]: IITWindow readonly dispid 1610743810;
    property _NewEnum: IUnknown readonly dispid - 4;
  end;

  // *********************************************************************//
  // Interface: IiTunes
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {9DD6680B-3EDC-40DB-A771-E6FE4832E34A}
  // *********************************************************************//
  IiTunes = interface(IDispatch)
    ['{9DD6680B-3EDC-40DB-A771-E6FE4832E34A}']
    procedure BackTrack; safecall;
    procedure FastForward; safecall;
    procedure NextTrack; safecall;
    procedure Pause; safecall;
    procedure Play; safecall;
    procedure PlayFile(const filePath: WideString); safecall;
    procedure PlayPause; safecall;
    procedure PreviousTrack; safecall;
    procedure Resume; safecall;
    procedure Rewind; safecall;
    procedure Stop; safecall;
    function ConvertFile(const filePath: WideString): IITOperationStatus; safecall;
    function ConvertFiles(const filePaths: OleVariant): IITOperationStatus; safecall;
    function ConvertTrack(const iTrackToConvert: OleVariant): IITOperationStatus; safecall;
    function ConvertTracks(const iTracksToConvert: OleVariant): IITOperationStatus; safecall;
    function CheckVersion(majorVersion: Integer; minorVersion: Integer): WordBool; safecall;
    function GetITObjectByID(sourceID: Integer; playlistID: Integer; trackID: Integer; databaseID: Integer): IITObject; safecall;
    function CreatePlaylist(const playlistName: WideString): IITPlaylist; safecall;
    procedure OpenURL(const URL: WideString); safecall;
    procedure GotoMusicStoreHomePage; safecall;
    procedure UpdateIPod; safecall;
    procedure Authorize(numElems: Integer; const data: OleVariant; var names: WideString); safecall;
    procedure Quit; safecall;
    function Get_Sources: IITSourceCollection; safecall;
    function Get_Encoders: IITEncoderCollection; safecall;
    function Get_EQPresets: IITEQPresetCollection; safecall;
    function Get_Visuals: IITVisualCollection; safecall;
    function Get_Windows: IITWindowCollection; safecall;
    function Get_SoundVolume: Integer; safecall;
    procedure Set_SoundVolume(volume: Integer); safecall;
    function Get_Mute: WordBool; safecall;
    procedure Set_Mute(isMuted: WordBool); safecall;
    function Get_PlayerState: ITPlayerState; safecall;
    function Get_PlayerPosition: Integer; safecall;
    procedure Set_PlayerPosition(playerPos: Integer); safecall;
    function Get_CurrentEncoder: IITEncoder; safecall;
    procedure Set_CurrentEncoder(const iEncoder: IITEncoder); safecall;
    function Get_VisualsEnabled: WordBool; safecall;
    procedure Set_VisualsEnabled(isEnabled: WordBool); safecall;
    function Get_FullScreenVisuals: WordBool; safecall;
    procedure Set_FullScreenVisuals(isFullScreen: WordBool); safecall;
    function Get_VisualSize: ITVisualSize; safecall;
    procedure Set_VisualSize(VisualSize: ITVisualSize); safecall;
    function Get_CurrentVisual: IITVisual; safecall;
    procedure Set_CurrentVisual(const iVisual: IITVisual); safecall;
    function Get_EQEnabled: WordBool; safecall;
    procedure Set_EQEnabled(isEnabled: WordBool); safecall;
    function Get_CurrentEQPreset: IITEQPreset; safecall;
    procedure Set_CurrentEQPreset(const iEQPreset: IITEQPreset); safecall;
    function Get_CurrentStreamTitle: WideString; safecall;
    function Get_CurrentStreamURL: WideString; safecall;
    function Get_BrowserWindow: IITBrowserWindow; safecall;
    function Get_EQWindow: IITWindow; safecall;
    function Get_LibrarySource: IITSource; safecall;
    function Get_LibraryPlaylist: IITLibraryPlaylist; safecall;
    function Get_CurrentTrack: IITTrack; safecall;
    function Get_CurrentPlaylist: IITPlaylist; safecall;
    function Get_SelectedTracks: IITTrackCollection; safecall;
    function Get_Version: WideString; safecall;
    procedure SetOptions(options: Integer); safecall;
    function ConvertFile2(const filePath: WideString): IITConvertOperationStatus; safecall;
    function ConvertFiles2(const filePaths: OleVariant): IITConvertOperationStatus; safecall;
    function ConvertTrack2(const iTrackToConvert: OleVariant): IITConvertOperationStatus; safecall;
    function ConvertTracks2(const iTracksToConvert: OleVariant): IITConvertOperationStatus; safecall;
    function Get_AppCommandMessageProcessingEnabled: WordBool; safecall;
    procedure Set_AppCommandMessageProcessingEnabled(isEnabled: WordBool); safecall;
    function Get_ForceToForegroundOnDialog: WordBool; safecall;
    procedure Set_ForceToForegroundOnDialog(ForceToForegroundOnDialog: WordBool); safecall;
    function CreateEQPreset(const eqPresetName: WideString): IITEQPreset; safecall;
    function CreatePlaylistInSource(const playlistName: WideString; const iSource: OleVariant): IITPlaylist; safecall;
    procedure GetPlayerButtonsState(out previousEnabled: WordBool; out playPauseStopState: ITPlayButtonState;
      out nextEnabled: WordBool); safecall;
    procedure PlayerButtonClicked(playerButton: ITPlayerButton; playerButtonModifierKeys: Integer); safecall;
    function Get_CanSetShuffle(const iPlaylist: OleVariant): WordBool; safecall;
    function Get_CanSetSongRepeat(const iPlaylist: OleVariant): WordBool; safecall;
    function Get_ConvertOperationStatus: IITConvertOperationStatus; safecall;
    procedure SubscribeToPodcast(const URL: WideString); safecall;
    procedure UpdatePodcastFeeds; safecall;
    function CreateFolder(const folderName: WideString): IITPlaylist; safecall;
    function CreateFolderInSource(const folderName: WideString; const iSource: OleVariant): IITPlaylist; safecall;
    function Get_SoundVolumeControlEnabled: WordBool; safecall;
    function Get_LibraryXMLPath: WideString; safecall;
    function Get_ITObjectPersistentIDHigh(const iObject: OleVariant): Integer; safecall;
    function Get_ITObjectPersistentIDLow(const iObject: OleVariant): Integer; safecall;
    procedure GetITObjectPersistentIDs(const iObject: OleVariant; out highID: Integer; out lowID: Integer); safecall;
    property Sources: IITSourceCollection read Get_Sources;
    property Encoders: IITEncoderCollection read Get_Encoders;
    property EQPresets: IITEQPresetCollection read Get_EQPresets;
    property Visuals: IITVisualCollection read Get_Visuals;
    property Windows: IITWindowCollection read Get_Windows;
    property SoundVolume: Integer read Get_SoundVolume write Set_SoundVolume;
    property Mute: WordBool read Get_Mute write Set_Mute;
    property PlayerState: ITPlayerState read Get_PlayerState;
    property PlayerPosition: Integer read Get_PlayerPosition write Set_PlayerPosition;
    property CurrentEncoder: IITEncoder read Get_CurrentEncoder write Set_CurrentEncoder;
    property VisualsEnabled: WordBool read Get_VisualsEnabled write Set_VisualsEnabled;
    property FullScreenVisuals: WordBool read Get_FullScreenVisuals write Set_FullScreenVisuals;
    property VisualSize: ITVisualSize read Get_VisualSize write Set_VisualSize;
    property CurrentVisual: IITVisual read Get_CurrentVisual write Set_CurrentVisual;
    property EQEnabled: WordBool read Get_EQEnabled write Set_EQEnabled;
    property CurrentEQPreset: IITEQPreset read Get_CurrentEQPreset write Set_CurrentEQPreset;
    property CurrentStreamTitle: WideString read Get_CurrentStreamTitle;
    property CurrentStreamURL: WideString read Get_CurrentStreamURL;
    property BrowserWindow: IITBrowserWindow read Get_BrowserWindow;
    property EQWindow: IITWindow read Get_EQWindow;
    property LibrarySource: IITSource read Get_LibrarySource;
    property LibraryPlaylist: IITLibraryPlaylist read Get_LibraryPlaylist;
    property CurrentTrack: IITTrack read Get_CurrentTrack;
    property CurrentPlaylist: IITPlaylist read Get_CurrentPlaylist;
    property SelectedTracks: IITTrackCollection read Get_SelectedTracks;
    property Version: WideString read Get_Version;
    property AppCommandMessageProcessingEnabled: WordBool read Get_AppCommandMessageProcessingEnabled
      write Set_AppCommandMessageProcessingEnabled;
    property ForceToForegroundOnDialog: WordBool read Get_ForceToForegroundOnDialog write Set_ForceToForegroundOnDialog;
    property CanSetShuffle[const iPlaylist: OleVariant]: WordBool read Get_CanSetShuffle;
    property CanSetSongRepeat[const iPlaylist: OleVariant]: WordBool read Get_CanSetSongRepeat;
    property ConvertOperationStatus: IITConvertOperationStatus read Get_ConvertOperationStatus;
    property SoundVolumeControlEnabled: WordBool read Get_SoundVolumeControlEnabled;
    property LibraryXMLPath: WideString read Get_LibraryXMLPath;
    property ITObjectPersistentIDHigh[const iObject: OleVariant]: Integer read Get_ITObjectPersistentIDHigh;
    property ITObjectPersistentIDLow[const iObject: OleVariant]: Integer read Get_ITObjectPersistentIDLow;
  end;

  // *********************************************************************//
  // DispIntf:  IiTunesDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {9DD6680B-3EDC-40DB-A771-E6FE4832E34A}
  // *********************************************************************//
  IiTunesDisp = dispinterface
    ['{9DD6680B-3EDC-40DB-A771-E6FE4832E34A}']
    procedure BackTrack; dispid 1610743808;
    procedure FastForward; dispid 1610743809;
    procedure NextTrack; dispid 1610743810;
    procedure Pause; dispid 1610743811;
    procedure Play; dispid 1610743812;
    procedure PlayFile(const filePath: WideString); dispid 1610743813;
    procedure PlayPause; dispid 1610743814;
    procedure PreviousTrack; dispid 1610743815;
    procedure Resume; dispid 1610743816;
    procedure Rewind; dispid 1610743817;
    procedure Stop; dispid 1610743818;
    function ConvertFile(const filePath: WideString): IITOperationStatus; dispid 1610743819;
    function ConvertFiles(const filePaths: OleVariant): IITOperationStatus; dispid 1610743820;
    function ConvertTrack(const iTrackToConvert: OleVariant): IITOperationStatus; dispid 1610743821;
    function ConvertTracks(const iTracksToConvert: OleVariant): IITOperationStatus; dispid 1610743822;
    function CheckVersion(majorVersion: Integer; minorVersion: Integer): WordBool; dispid 1610743823;
    function GetITObjectByID(sourceID: Integer; playlistID: Integer; trackID: Integer; databaseID: Integer): IITObject; dispid 1610743824;
    function CreatePlaylist(const playlistName: WideString): IITPlaylist; dispid 1610743825;
    procedure OpenURL(const URL: WideString); dispid 1610743826;
    procedure GotoMusicStoreHomePage; dispid 1610743827;
    procedure UpdateIPod; dispid 1610743828;
    procedure Authorize(numElems: Integer; const data: OleVariant; var names: WideString); dispid 1610743829;
    procedure Quit; dispid 1610743830;
    property Sources: IITSourceCollection readonly dispid 1610743831;
    property Encoders: IITEncoderCollection readonly dispid 1610743832;
    property EQPresets: IITEQPresetCollection readonly dispid 1610743833;
    property Visuals: IITVisualCollection readonly dispid 1610743834;
    property Windows: IITWindowCollection readonly dispid 1610743835;
    property SoundVolume: Integer dispid 1610743836;
    property Mute: WordBool dispid 1610743838;
    property PlayerState: ITPlayerState readonly dispid 1610743840;
    property PlayerPosition: Integer dispid 1610743841;
    property CurrentEncoder: IITEncoder dispid 1610743843;
    property VisualsEnabled: WordBool dispid 1610743845;
    property FullScreenVisuals: WordBool dispid 1610743847;
    property VisualSize: ITVisualSize dispid 1610743849;
    property CurrentVisual: IITVisual dispid 1610743851;
    property EQEnabled: WordBool dispid 1610743853;
    property CurrentEQPreset: IITEQPreset dispid 1610743855;
    property CurrentStreamTitle: WideString readonly dispid 1610743857;
    property CurrentStreamURL: WideString readonly dispid 1610743858;
    property BrowserWindow: IITBrowserWindow readonly dispid 1610743859;
    property EQWindow: IITWindow readonly dispid 1610743860;
    property LibrarySource: IITSource readonly dispid 1610743861;
    property LibraryPlaylist: IITLibraryPlaylist readonly dispid 1610743862;
    property CurrentTrack: IITTrack readonly dispid 1610743863;
    property CurrentPlaylist: IITPlaylist readonly dispid 1610743864;
    property SelectedTracks: IITTrackCollection readonly dispid 1610743865;
    property Version: WideString readonly dispid 1610743866;
    procedure SetOptions(options: Integer); dispid 1610743867;
    function ConvertFile2(const filePath: WideString): IITConvertOperationStatus; dispid 1610743868;
    function ConvertFiles2(const filePaths: OleVariant): IITConvertOperationStatus; dispid 1610743869;
    function ConvertTrack2(const iTrackToConvert: OleVariant): IITConvertOperationStatus; dispid 1610743870;
    function ConvertTracks2(const iTracksToConvert: OleVariant): IITConvertOperationStatus; dispid 1610743871;
    property AppCommandMessageProcessingEnabled: WordBool dispid 1610743872;
    property ForceToForegroundOnDialog: WordBool dispid 1610743874;
    function CreateEQPreset(const eqPresetName: WideString): IITEQPreset; dispid 1610743876;
    function CreatePlaylistInSource(const playlistName: WideString; const iSource: OleVariant): IITPlaylist; dispid 1610743877;
    procedure GetPlayerButtonsState(out previousEnabled: WordBool; out playPauseStopState: ITPlayButtonState; out nextEnabled: WordBool);
      dispid 1610743878;
    procedure PlayerButtonClicked(playerButton: ITPlayerButton; playerButtonModifierKeys: Integer); dispid 1610743879;
    property CanSetShuffle[const iPlaylist: OleVariant]: WordBool readonly dispid 1610743880;
    property CanSetSongRepeat[const iPlaylist: OleVariant]: WordBool readonly dispid 1610743881;
    property ConvertOperationStatus: IITConvertOperationStatus readonly dispid 1610743882;
    procedure SubscribeToPodcast(const URL: WideString); dispid 1610743883;
    procedure UpdatePodcastFeeds; dispid 1610743884;
    function CreateFolder(const folderName: WideString): IITPlaylist; dispid 1610743885;
    function CreateFolderInSource(const folderName: WideString; const iSource: OleVariant): IITPlaylist; dispid 1610743886;
    property SoundVolumeControlEnabled: WordBool readonly dispid 1610743887;
    property LibraryXMLPath: WideString readonly dispid 1610743888;
    property ITObjectPersistentIDHigh[const iObject: OleVariant]: Integer readonly dispid 1610743889;
    property ITObjectPersistentIDLow[const iObject: OleVariant]: Integer readonly dispid 1610743890;
    procedure GetITObjectPersistentIDs(const iObject: OleVariant; out highID: Integer; out lowID: Integer); dispid 1610743891;
  end;

  // *********************************************************************//
  // DispIntf:  _IiTunesEvents
  // Flags:     (4096) Dispatchable
  // GUID:      {5846EB78-317E-4B6F-B0C3-11EE8C8FEEF2}
  // *********************************************************************//
  _IiTunesEvents = dispinterface
    ['{5846EB78-317E-4B6F-B0C3-11EE8C8FEEF2}']
    function OnDatabaseChangedEvent(deletedObjectIDs: OleVariant; changedObjectIDs: OleVariant): HResult; dispid 1;
    function OnPlayerPlayEvent(iTrack: OleVariant): HResult; dispid 2;
    function OnPlayerStopEvent(iTrack: OleVariant): HResult; dispid 3;
    function OnPlayerPlayingTrackChangedEvent(iTrack: OleVariant): HResult; dispid 4;
    function OnUserInterfaceEnabledEvent: HResult; dispid 5;
    function OnCOMCallsDisabledEvent(reason: ITCOMDisabledReason): HResult; dispid 6;
    function OnCOMCallsEnabledEvent: HResult; dispid 7;
    function OnQuittingEvent: HResult; dispid 8;
    function OnAboutToPromptUserToQuitEvent: HResult; dispid 9;
    function OnSoundVolumeChangedEvent(newVolume: Integer): HResult; dispid 10;
  end;

  // *********************************************************************//
  // DispIntf:  _IITConvertOperationStatusEvents
  // Flags:     (4096) Dispatchable
  // GUID:      {5C47A705-8E8A-45A1-9EED-71C993F0BF60}
  // *********************************************************************//
  _IITConvertOperationStatusEvents = dispinterface
    ['{5C47A705-8E8A-45A1-9EED-71C993F0BF60}']
    function OnConvertOperationStatusChangedEvent(const trackName: WideString; progressValue: Integer; maxProgressValue: Integer)
      : HResult; dispid 1;
    function OnConvertOperationCompleteEvent: HResult; dispid 2;
  end;

  // *********************************************************************//
  // Interface: IITAudioCDPlaylist
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {CF496DF3-0FED-4D7D-9BD8-529B6E8A082E}
  // *********************************************************************//
  IITAudioCDPlaylist = interface(IITPlaylist)
    ['{CF496DF3-0FED-4D7D-9BD8-529B6E8A082E}']
    function Get_Artist: WideString; safecall;
    function Get_Compilation: WordBool; safecall;
    function Get_Composer: WideString; safecall;
    function Get_DiscCount: Integer; safecall;
    function Get_DiscNumber: Integer; safecall;
    function Get_Genre: WideString; safecall;
    function Get_Year: Integer; safecall;
    procedure Reveal; safecall;
    property Artist: WideString read Get_Artist;
    property Compilation: WordBool read Get_Compilation;
    property Composer: WideString read Get_Composer;
    property DiscCount: Integer read Get_DiscCount;
    property DiscNumber: Integer read Get_DiscNumber;
    property Genre: WideString read Get_Genre;
    property Year: Integer read Get_Year;
  end;

  // *********************************************************************//
  // DispIntf:  IITAudioCDPlaylistDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {CF496DF3-0FED-4D7D-9BD8-529B6E8A082E}
  // *********************************************************************//
  IITAudioCDPlaylistDisp = dispinterface
    ['{CF496DF3-0FED-4D7D-9BD8-529B6E8A082E}']
    property Artist: WideString readonly dispid 1610874880;
    property Compilation: WordBool readonly dispid 1610874881;
    property Composer: WideString readonly dispid 1610874882;
    property DiscCount: Integer readonly dispid 1610874883;
    property DiscNumber: Integer readonly dispid 1610874884;
    property Genre: WideString readonly dispid 1610874885;
    property Year: Integer readonly dispid 1610874886;
    procedure Reveal; dispid 1610874887;
    procedure Delete; dispid 1610809344;
    procedure PlayFirstTrack; dispid 1610809345;
    procedure Print(showPrintDialog: WordBool; printKind: ITPlaylistPrintKind; const theme: WideString); dispid 1610809346;
    function Search(const searchText: WideString; searchFields: ITPlaylistSearchField): IITTrackCollection; dispid 1610809347;
    property Kind: ITPlaylistKind readonly dispid 1610809348;
    property Source: IITSource readonly dispid 1610809349;
    property Duration: Integer readonly dispid 1610809350;
    property Shuffle: WordBool dispid 1610809351;
    property Size: Double readonly dispid 1610809353;
    property SongRepeat: ITPlaylistRepeatMode dispid 1610809354;
    property Time: WideString readonly dispid 1610809356;
    property Visible: WordBool readonly dispid 1610809357;
    property Tracks: IITTrackCollection readonly dispid 1610809358;
    procedure GetITObjectIDs(out sourceID: Integer; out playlistID: Integer; out trackID: Integer; out databaseID: Integer);
      dispid 1610743808;
    property Name: WideString dispid 1610743809;
    property Index: Integer readonly dispid 1610743811;
    property sourceID: Integer readonly dispid 1610743812;
    property playlistID: Integer readonly dispid 1610743813;
    property trackID: Integer readonly dispid 1610743814;
    property TrackDatabaseID: Integer readonly dispid 1610743815;
  end;

  // *********************************************************************//
  // Interface: IITIPodSource
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {CF4D8ACE-1720-4FB9-B0AE-9877249E89B0}
  // *********************************************************************//
  IITIPodSource = interface(IITSource)
    ['{CF4D8ACE-1720-4FB9-B0AE-9877249E89B0}']
    procedure UpdateIPod; safecall;
    procedure EjectIPod; safecall;
    function Get_SoftwareVersion: WideString; safecall;
    property SoftwareVersion: WideString read Get_SoftwareVersion;
  end;

  // *********************************************************************//
  // DispIntf:  IITIPodSourceDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {CF4D8ACE-1720-4FB9-B0AE-9877249E89B0}
  // *********************************************************************//
  IITIPodSourceDisp = dispinterface
    ['{CF4D8ACE-1720-4FB9-B0AE-9877249E89B0}']
    procedure UpdateIPod; dispid 1610874880;
    procedure EjectIPod; dispid 1610874881;
    property SoftwareVersion: WideString readonly dispid 1610874882;
    property Kind: ITSourceKind readonly dispid 1610809344;
    property Capacity: Double readonly dispid 1610809345;
    property FreeSpace: Double readonly dispid 1610809346;
    property Playlists: IITPlaylistCollection readonly dispid 1610809347;
    procedure GetITObjectIDs(out sourceID: Integer; out playlistID: Integer; out trackID: Integer; out databaseID: Integer);
      dispid 1610743808;
    property Name: WideString dispid 1610743809;
    property Index: Integer readonly dispid 1610743811;
    property sourceID: Integer readonly dispid 1610743812;
    property playlistID: Integer readonly dispid 1610743813;
    property trackID: Integer readonly dispid 1610743814;
    property TrackDatabaseID: Integer readonly dispid 1610743815;
  end;

  // *********************************************************************//
  // Interface: IITFileOrCDTrack
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {00D7FE99-7868-4CC7-AD9E-ACFD70D09566}
  // *********************************************************************//
  IITFileOrCDTrack = interface(IITTrack)
    ['{00D7FE99-7868-4CC7-AD9E-ACFD70D09566}']
    function Get_Location: WideString; safecall;
    procedure UpdateInfoFromFile; safecall;
    function Get_Podcast: WordBool; safecall;
    procedure UpdatePodcastFeed; safecall;
    function Get_RememberBookmark: WordBool; safecall;
    procedure Set_RememberBookmark(RememberBookmark: WordBool); safecall;
    function Get_ExcludeFromShuffle: WordBool; safecall;
    procedure Set_ExcludeFromShuffle(ExcludeFromShuffle: WordBool); safecall;
    function Get_Lyrics: WideString; safecall;
    procedure Set_Lyrics(const Lyrics: WideString); safecall;
    function Get_Category: WideString; safecall;
    procedure Set_Category(const Category: WideString); safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const Description: WideString); safecall;
    function Get_LongDescription: WideString; safecall;
    procedure Set_LongDescription(const LongDescription: WideString); safecall;
    function Get_BookmarkTime: Integer; safecall;
    procedure Set_BookmarkTime(BookmarkTime: Integer); safecall;
    function Get_VideoKind: ITVideoKind; safecall;
    procedure Set_VideoKind(VideoKind: ITVideoKind); safecall;
    function Get_SkippedCount: Integer; safecall;
    procedure Set_SkippedCount(SkippedCount: Integer); safecall;
    function Get_SkippedDate: TDateTime; safecall;
    procedure Set_SkippedDate(SkippedDate: TDateTime); safecall;
    function Get_PartOfGaplessAlbum: WordBool; safecall;
    procedure Set_PartOfGaplessAlbum(PartOfGaplessAlbum: WordBool); safecall;
    function Get_AlbumArtist: WideString; safecall;
    procedure Set_AlbumArtist(const AlbumArtist: WideString); safecall;
    function Get_Show: WideString; safecall;
    procedure Set_Show(const showName: WideString); safecall;
    function Get_SeasonNumber: Integer; safecall;
    procedure Set_SeasonNumber(SeasonNumber: Integer); safecall;
    function Get_EpisodeID: WideString; safecall;
    procedure Set_EpisodeID(const EpisodeID: WideString); safecall;
    function Get_EpisodeNumber: Integer; safecall;
    procedure Set_EpisodeNumber(EpisodeNumber: Integer); safecall;
    function Get_Size64High: Integer; safecall;
    function Get_Size64Low: Integer; safecall;
    function Get_Unplayed: WordBool; safecall;
    procedure Set_Unplayed(isUnplayed: WordBool); safecall;
    function Get_SortAlbum: WideString; safecall;
    procedure Set_SortAlbum(const Album: WideString); safecall;
    function Get_SortAlbumArtist: WideString; safecall;
    procedure Set_SortAlbumArtist(const AlbumArtist: WideString); safecall;
    function Get_SortArtist: WideString; safecall;
    procedure Set_SortArtist(const Artist: WideString); safecall;
    function Get_SortComposer: WideString; safecall;
    procedure Set_SortComposer(const Composer: WideString); safecall;
    function Get_SortName: WideString; safecall;
    procedure Set_SortName(const Name: WideString); safecall;
    function Get_SortShow: WideString; safecall;
    procedure Set_SortShow(const showName: WideString); safecall;
    procedure Reveal; safecall;
    function Get_AlbumRating: Integer; safecall;
    procedure Set_AlbumRating(Rating: Integer); safecall;
    function Get_AlbumRatingKind: ITRatingKind; safecall;
    function Get_ratingKind: ITRatingKind; safecall;
    function Get_Playlists: IITPlaylistCollection; safecall;
    procedure Set_Location(const Location: WideString); safecall;
    function Get_ReleaseDate: TDateTime; safecall;
    property Location: WideString read Get_Location write Set_Location;
    property Podcast: WordBool read Get_Podcast;
    property RememberBookmark: WordBool read Get_RememberBookmark write Set_RememberBookmark;
    property ExcludeFromShuffle: WordBool read Get_ExcludeFromShuffle write Set_ExcludeFromShuffle;
    property Lyrics: WideString read Get_Lyrics write Set_Lyrics;
    property Category: WideString read Get_Category write Set_Category;
    property Description: WideString read Get_Description write Set_Description;
    property LongDescription: WideString read Get_LongDescription write Set_LongDescription;
    property BookmarkTime: Integer read Get_BookmarkTime write Set_BookmarkTime;
    property VideoKind: ITVideoKind read Get_VideoKind write Set_VideoKind;
    property SkippedCount: Integer read Get_SkippedCount write Set_SkippedCount;
    property SkippedDate: TDateTime read Get_SkippedDate write Set_SkippedDate;
    property PartOfGaplessAlbum: WordBool read Get_PartOfGaplessAlbum write Set_PartOfGaplessAlbum;
    property AlbumArtist: WideString read Get_AlbumArtist write Set_AlbumArtist;
    property Show: WideString read Get_Show write Set_Show;
    property SeasonNumber: Integer read Get_SeasonNumber write Set_SeasonNumber;
    property EpisodeID: WideString read Get_EpisodeID write Set_EpisodeID;
    property EpisodeNumber: Integer read Get_EpisodeNumber write Set_EpisodeNumber;
    property Size64High: Integer read Get_Size64High;
    property Size64Low: Integer read Get_Size64Low;
    property Unplayed: WordBool read Get_Unplayed write Set_Unplayed;
    property SortAlbum: WideString read Get_SortAlbum write Set_SortAlbum;
    property SortAlbumArtist: WideString read Get_SortAlbumArtist write Set_SortAlbumArtist;
    property SortArtist: WideString read Get_SortArtist write Set_SortArtist;
    property SortComposer: WideString read Get_SortComposer write Set_SortComposer;
    property SortName: WideString read Get_SortName write Set_SortName;
    property SortShow: WideString read Get_SortShow write Set_SortShow;
    property AlbumRating: Integer read Get_AlbumRating write Set_AlbumRating;
    property AlbumRatingKind: ITRatingKind read Get_AlbumRatingKind;
    property ratingKind: ITRatingKind read Get_ratingKind;
    property Playlists: IITPlaylistCollection read Get_Playlists;
    property ReleaseDate: TDateTime read Get_ReleaseDate;
  end;

  // *********************************************************************//
  // DispIntf:  IITFileOrCDTrackDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {00D7FE99-7868-4CC7-AD9E-ACFD70D09566}
  // *********************************************************************//
  IITFileOrCDTrackDisp = dispinterface
    ['{00D7FE99-7868-4CC7-AD9E-ACFD70D09566}']
    property Location: WideString dispid 1610874880;
    procedure UpdateInfoFromFile; dispid 1610874881;
    property Podcast: WordBool readonly dispid 1610874882;
    procedure UpdatePodcastFeed; dispid 1610874883;
    property RememberBookmark: WordBool dispid 1610874884;
    property ExcludeFromShuffle: WordBool dispid 1610874886;
    property Lyrics: WideString dispid 1610874888;
    property Category: WideString dispid 1610874890;
    property Description: WideString dispid 1610874892;
    property LongDescription: WideString dispid 1610874894;
    property BookmarkTime: Integer dispid 1610874896;
    property VideoKind: ITVideoKind dispid 1610874898;
    property SkippedCount: Integer dispid 1610874900;
    property SkippedDate: TDateTime dispid 1610874902;
    property PartOfGaplessAlbum: WordBool dispid 1610874904;
    property AlbumArtist: WideString dispid 1610874906;
    property Show: WideString dispid 1610874908;
    property SeasonNumber: Integer dispid 1610874910;
    property EpisodeID: WideString dispid 1610874912;
    property EpisodeNumber: Integer dispid 1610874914;
    property Size64High: Integer readonly dispid 1610874916;
    property Size64Low: Integer readonly dispid 1610874917;
    property Unplayed: WordBool dispid 1610874918;
    property SortAlbum: WideString dispid 1610874920;
    property SortAlbumArtist: WideString dispid 1610874922;
    property SortArtist: WideString dispid 1610874924;
    property SortComposer: WideString dispid 1610874926;
    property SortName: WideString dispid 1610874928;
    property SortShow: WideString dispid 1610874930;
    procedure Reveal; dispid 1610874932;
    property AlbumRating: Integer dispid 1610874933;
    property AlbumRatingKind: ITRatingKind readonly dispid 1610874935;
    property ratingKind: ITRatingKind readonly dispid 1610874936;
    property Playlists: IITPlaylistCollection readonly dispid 1610874937;
    property ReleaseDate: TDateTime readonly dispid 1610874939;
    procedure Delete; dispid 1610809344;
    procedure Play; dispid 1610809345;
    function AddArtworkFromFile(const filePath: WideString): IITArtwork; dispid 1610809346;
    property Kind: ITTrackKind readonly dispid 1610809347;
    property Playlist: IITPlaylist readonly dispid 1610809348;
    property Album: WideString dispid 1610809349;
    property Artist: WideString dispid 1610809351;
    property BitRate: Integer readonly dispid 1610809353;
    property BPM: Integer dispid 1610809354;
    property Comment: WideString dispid 1610809356;
    property Compilation: WordBool dispid 1610809358;
    property Composer: WideString dispid 1610809360;
    property DateAdded: TDateTime readonly dispid 1610809362;
    property DiscCount: Integer dispid 1610809363;
    property DiscNumber: Integer dispid 1610809365;
    property Duration: Integer readonly dispid 1610809367;
    property Enabled: WordBool dispid 1610809368;
    property EQ: WideString dispid 1610809370;
    property Finish: Integer dispid 1610809372;
    property Genre: WideString dispid 1610809374;
    property Grouping: WideString dispid 1610809376;
    property KindAsString: WideString readonly dispid 1610809378;
    property ModificationDate: TDateTime readonly dispid 1610809379;
    property PlayedCount: Integer dispid 1610809380;
    property PlayedDate: TDateTime dispid 1610809382;
    property PlayOrderIndex: Integer readonly dispid 1610809384;
    property Rating: Integer dispid 1610809385;
    property SampleRate: Integer readonly dispid 1610809387;
    property Size: Integer readonly dispid 1610809388;
    property Start: Integer dispid 1610809389;
    property Time: WideString readonly dispid 1610809391;
    property TrackCount: Integer dispid 1610809392;
    property TrackNumber: Integer dispid 1610809394;
    property VolumeAdjustment: Integer dispid 1610809396;
    property Year: Integer dispid 1610809398;
    property Artwork: IITArtworkCollection readonly dispid 1610809400;
    procedure GetITObjectIDs(out sourceID: Integer; out playlistID: Integer; out trackID: Integer; out databaseID: Integer);
      dispid 1610743808;
    property Name: WideString dispid 1610743809;
    property Index: Integer readonly dispid 1610743811;
    property sourceID: Integer readonly dispid 1610743812;
    property playlistID: Integer readonly dispid 1610743813;
    property trackID: Integer readonly dispid 1610743814;
    property TrackDatabaseID: Integer readonly dispid 1610743815;
  end;

  // *********************************************************************//
  // Interface: IITPlaylistWindow
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {349CBB45-2E5A-4822-8E4A-A75555A186F7}
  // *********************************************************************//
  IITPlaylistWindow = interface(IITWindow)
    ['{349CBB45-2E5A-4822-8E4A-A75555A186F7}']
    function Get_SelectedTracks: IITTrackCollection; safecall;
    function Get_Playlist: IITPlaylist; safecall;
    property SelectedTracks: IITTrackCollection read Get_SelectedTracks;
    property Playlist: IITPlaylist read Get_Playlist;
  end;

  // *********************************************************************//
  // DispIntf:  IITPlaylistWindowDisp
  // Flags:     (4432) Hidden Dual OleAutomation Dispatchable
  // GUID:      {349CBB45-2E5A-4822-8E4A-A75555A186F7}
  // *********************************************************************//
  IITPlaylistWindowDisp = dispinterface
    ['{349CBB45-2E5A-4822-8E4A-A75555A186F7}']
    property SelectedTracks: IITTrackCollection readonly dispid 1610809344;
    property Playlist: IITPlaylist readonly dispid 1610809345;
    property Name: WideString readonly dispid 1610743808;
    property Kind: ITWindowKind readonly dispid 1610743809;
    property Visible: WordBool dispid 1610743810;
    property Resizable: WordBool readonly dispid 1610743812;
    property Minimized: WordBool dispid 1610743813;
    property Maximizable: WordBool readonly dispid 1610743815;
    property Maximized: WordBool dispid 1610743816;
    property Zoomable: WordBool readonly dispid 1610743818;
    property Zoomed: WordBool dispid 1610743819;
    property Top: Integer dispid 1610743821;
    property Left: Integer dispid 1610743823;
    property Bottom: Integer dispid 1610743825;
    property Right: Integer dispid 1610743827;
    property Width: Integer dispid 1610743829;
    property Height: Integer dispid 1610743831;
  end;

  // *********************************************************************//
  // The Class CoiTunesApp provides a Create and CreateRemote method to
  // create instances of the default interface IiTunes exposed by
  // the CoClass iTunesApp. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoiTunesApp = class
    class function Create: IiTunes;
    class function CreateRemote(const MachineName: string): IiTunes;
  end;

  // *********************************************************************//
  // The Class CoiTunesConvertOperationStatus provides a Create and CreateRemote method to
  // create instances of the default interface IITConvertOperationStatus exposed by
  // the CoClass iTunesConvertOperationStatus. The functions are intended to be used by
  // clients wishing to automate the CoClass objects exposed by the
  // server of this typelibrary.
  // *********************************************************************//
  CoiTunesConvertOperationStatus = class
    class function Create: IITConvertOperationStatus;
    class function CreateRemote(const MachineName: string): IITConvertOperationStatus;
  end;

  TiTunesConvertOperationStatusOnConvertOperationStatusChangedEvent = procedure(ASender: TObject; const trackName: WideString;
    progressValue: Integer; maxProgressValue: Integer) of object;

  // *********************************************************************//
  // OLE Server Proxy class declaration
  // Server Object    : TiTunesConvertOperationStatus
  // Help String      : iTunesConvertOperationStatus Class
  // Default Interface: IITConvertOperationStatus
  // Def. Intf. DISP? : No
  // Event   Interface: _IITConvertOperationStatusEvents
  // TypeFlags        : (16) Hidden
  // *********************************************************************//
  TiTunesConvertOperationStatus = class(TOleServer)
  private
    FOnConvertOperationStatusChangedEvent: TiTunesConvertOperationStatusOnConvertOperationStatusChangedEvent;
    FOnConvertOperationCompleteEvent: TNotifyEvent;
    FIntf: IITConvertOperationStatus;
    function GetDefaultInterface: IITConvertOperationStatus;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(dispid: TDispID; var Params: TVariantArray); override;
    function Get_InProgress: WordBool;
    function Get_Tracks: IITTrackCollection;
    function Get_trackName: WideString;
    function Get_progressValue: Integer;
    function Get_maxProgressValue: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IITConvertOperationStatus);
    procedure Disconnect; override;
    procedure GetConversionStatus(out trackName: WideString; out progressValue: Integer; out maxProgressValue: Integer);
    procedure StopConversion;
    property DefaultInterface: IITConvertOperationStatus read GetDefaultInterface;
    property InProgress: WordBool read Get_InProgress;
    property Tracks: IITTrackCollection read Get_Tracks;
    property trackName: WideString read Get_trackName;
    property progressValue: Integer read Get_progressValue;
    property maxProgressValue: Integer read Get_maxProgressValue;
  published
    property OnConvertOperationStatusChangedEvent: TiTunesConvertOperationStatusOnConvertOperationStatusChangedEvent
      read FOnConvertOperationStatusChangedEvent write FOnConvertOperationStatusChangedEvent;
    property OnConvertOperationCompleteEvent: TNotifyEvent read FOnConvertOperationCompleteEvent write FOnConvertOperationCompleteEvent;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

class function CoiTunesApp.Create: IiTunes;
begin
  Result := CreateComObject(CLASS_iTunesApp) as IiTunes;
end;

class function CoiTunesApp.CreateRemote(const MachineName: string): IiTunes;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_iTunesApp) as IiTunes;
end;

class function CoiTunesConvertOperationStatus.Create: IITConvertOperationStatus;
begin
  Result := CreateComObject(CLASS_iTunesConvertOperationStatus) as IITConvertOperationStatus;
end;

class function CoiTunesConvertOperationStatus.CreateRemote(const MachineName: string): IITConvertOperationStatus;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_iTunesConvertOperationStatus) as IITConvertOperationStatus;
end;

procedure TiTunesConvertOperationStatus.InitServerData;
const
  CServerData: TServerData = (ClassID: '{D06596AD-C900-41B2-BC68-1B486450FC56}'; IntfIID: '{7063AAF6-ABA0-493B-B4FC-920A9F105875}';
    EventIID: '{5C47A705-8E8A-45A1-9EED-71C993F0BF60}'; LicenseKey: nil; Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TiTunesConvertOperationStatus.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    FIntf := punk as IITConvertOperationStatus;
  end;
end;

procedure TiTunesConvertOperationStatus.ConnectTo(svrIntf: IITConvertOperationStatus);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TiTunesConvertOperationStatus.Disconnect;
begin
  if FIntf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TiTunesConvertOperationStatus.GetDefaultInterface: IITConvertOperationStatus;
begin
  if FIntf = nil then Connect;
  Assert(FIntf <> nil,
    'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TiTunesConvertOperationStatus.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TiTunesConvertOperationStatus.Destroy;
begin
  inherited Destroy;
end;

procedure TiTunesConvertOperationStatus.InvokeEvent(dispid: TDispID; var Params: TVariantArray);
begin
  case DispID of
    - 1: Exit; // DISPID_UNKNOWN
    1: if Assigned(FOnConvertOperationStatusChangedEvent) then
          FOnConvertOperationStatusChangedEvent(Self, Params[0] { const WideString } , Params[1] { Integer } , Params[2] { Integer } );
    2: if Assigned(FOnConvertOperationCompleteEvent) then FOnConvertOperationCompleteEvent(Self);
  end; { case DispID }
end;

function TiTunesConvertOperationStatus.Get_InProgress: WordBool;
begin
  Result := DefaultInterface.InProgress;
end;

function TiTunesConvertOperationStatus.Get_Tracks: IITTrackCollection;
begin
  Result := DefaultInterface.Tracks;
end;

function TiTunesConvertOperationStatus.Get_trackName: WideString;
begin
  Result := DefaultInterface.trackName;
end;

function TiTunesConvertOperationStatus.Get_progressValue: Integer;
begin
  Result := DefaultInterface.progressValue;
end;

function TiTunesConvertOperationStatus.Get_maxProgressValue: Integer;
begin
  Result := DefaultInterface.maxProgressValue;
end;

procedure TiTunesConvertOperationStatus.GetConversionStatus(out trackName: WideString; out progressValue: Integer;
  out maxProgressValue: Integer);
begin
  DefaultInterface.GetConversionStatus(trackName, progressValue, maxProgressValue);
end;

procedure TiTunesConvertOperationStatus.StopConversion;
begin
  DefaultInterface.StopConversion;
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TiTunesConvertOperationStatus]);
end;

end.
