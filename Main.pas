unit Main;

interface

uses
  Classes, Controls, Forms, Messages, StdCtrls, FileCtrl, Mask, JvExMask,
  SysUtils,
  JvToolEdit, ActnList, ExtCtrls, ComCtrls, System.Actions;

type
  TFrmVideoCompare = class(TForm)
    grpFile1: TGroupBox;
    dirEdtIn1: TJvDirectoryEdit;
    flIn1: TFileListBox;
    grpFile2: TGroupBox;
    dirEdtIn2: TJvDirectoryEdit;
    flIn2: TFileListBox;
    actlstMain: TActionList;
    actLaunch: TAction;
    splFile: TSplitter;
    pcMain: TPageControl;
    tsDefault: TTabSheet;
    chkHighDPI: TCheckBox;
    grpMode: TGroupBox;
    cbbMode: TComboBox;
    chk10Bit: TCheckBox;
    grpDisplay: TGroupBox;
    cbbDisplay: TComboBox;
    grpAutoLoopMode: TGroupBox;
    cbbAutoLoopMode: TComboBox;
    grpFrameBufferSize: TGroupBox;
    edtFrameBufferSize: TEdit;
    rgWindow: TRadioGroup;
    pnlWindowSize: TPanel;
    lblWindowSizeX: TLabel;
    edtWidth: TEdit;
    edtHeight: TEdit;
    btnLaunch: TButton;
    tsHotKeys: TTabSheet;
    lblHotKeys: TLabel;
    chkAutoFilters: TCheckBox;
    grpWheelSensitivity: TGroupBox;
    edtWheelSensitivity: TEdit;
    grpShift: TGroupBox;
    edtShift: TEdit;
    grpToneMapMode: TGroupBox;
    cbbToneMapModeLeft: TComboBox;
    pnlTop: TPanel;
    mmoParams: TMemo;
    splParams: TSplitter;
    grpPeakNits: TGroupBox;
    edtPeakNitsLeft: TEdit;
    edtPeakNitsRight: TEdit;
    grpBoostTone: TGroupBox;
    tsAdvanced: TTabSheet;
    grplibvmafFilterOptions: TGroupBox;
    edtlibvmafFilterOptions: TEdit;
    btnCreateShellLink: TButton;
    actCreateShellLink: TAction;
    actRemoveShellLink: TAction;
    btnRemoveShellLink: TButton;
    chkFastAlignment: TCheckBox;
    chkBilinearTexture: TCheckBox;
    grpFilter: TGroupBox;
    edtFilterBoth: TLabeledEdit;
    edtFilterLeft: TLabeledEdit;
    edtFilterRight: TLabeledEdit;
    grpDecoder: TGroupBox;
    edtDecoderBoth: TLabeledEdit;
    edtDecoderLeft: TLabeledEdit;
    edtDecoderRight: TLabeledEdit;
    grpDemuxer: TGroupBox;
    edtDemuxerBoth: TLabeledEdit;
    edtDemuxerLeft: TLabeledEdit;
    edtDemuxerRight: TLabeledEdit;
    grpHardwareAcceleration: TGroupBox;
    edtHardwareAccelerationBoth: TLabeledEdit;
    edtHardwareAccelerationLeft: TLabeledEdit;
    edtHardwareAccelerationRight: TLabeledEdit;
    grpColorSpace: TGroupBox;
    edtColorSpace: TEdit;
    grpColorRange: TGroupBox;
    edtColorRange: TEdit;
    grpColorPrimaries: TGroupBox;
    edtColorPrimaries: TEdit;
    grpColorTRC: TGroupBox;
    edtColorTRC: TEdit;
    cbbToneMapModeRight: TComboBox;
    edtBoostToneLeft: TEdit;
    edtBoostToneRight: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OnChange(Sender: TObject);
    procedure dirEdtIn1Change(Sender: TObject);
    procedure dirEdtIn2Change(Sender: TObject);
    procedure actLaunchUpdate(Sender: TObject);
    procedure actLaunchExecute(Sender: TObject);
    procedure rgWindowClick(Sender: TObject);
    procedure cbbToneMapModeLeftClick(Sender: TObject);
    procedure edtWidthKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtHeightKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BlockKeyPress(Sender: TObject; var Key: Char);
    procedure UnsignedKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UnsignedKeyPress(Sender: TObject; var Key: Char);
    procedure SignedKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SignedKeyPress(Sender: TObject; var Key: Char);
    procedure FloatKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FloatKeyPress(Sender: TObject; var Key: Char);
    procedure pnlTopResize(Sender: TObject);
    procedure actCreateShellLinkExecute(Sender: TObject);
    procedure actRemoveShellLinkUpdate(Sender: TObject);
    procedure actRemoveShellLinkExecute(Sender: TObject);
  private
    { Private-Deklarationen }
    fLF : TFormatSettings;
    fParams : String;
    procedure WMDROPFILES(var Msg: TMessage); message WM_DROPFILES;
  protected
    procedure CreateWnd; override;
    procedure DestroyWindowHandle; override;
  public
    { Public-Deklarationen }
    function  LoadParametersFromFile( FileName : String ) : Integer;
    procedure SaveParametersToFile( FileName : String );
    function  CreateParameters( WithFileName : Boolean = True ) : String;
  end;

var
  FrmVideoCompare: TFrmVideoCompare;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
implementation

uses
  Windows, ShellAPI,
  IniFiles,
  uTLH.Files,
  uTLH.SysUtils,
  uTLH.ComponentTools;

{$R *.dfm}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
procedure TFrmVideoCompare.CreateWnd;
begin
  inherited;
  DragAcceptFiles( Handle, true );
end;

procedure TFrmVideoCompare.DestroyWindowHandle;
begin
  DragAcceptFiles( Handle, False );
  inherited;
end;

procedure TFrmVideoCompare.WMDROPFILES(var Msg: TMessage);
var
  StrL : TStringList;
  C    : TControl;
begin
  inherited;

  StrL := TStringList.Create;
  GetDropFiles( Self, Msg.WParam, StrL, @C );
  if NOT ( C is TWinControl ) then
    begin
    StrL.Free;
    Exit;
    end;

  if ( StrL.Count = 0 ) then
    begin
    StrL.Free;
    Exit;
    end;

  if ControlIsChildOf( TWinControl( C ).Handle, grpFile1.Handle ) then
    begin
    if FileExists( StrL[ 0 ] ) then
      begin
      dirEdtIn1.Directory := ExtractFilePath( StrL[ 0 ] );
      flIn1.FileName      := ExtractFileName( StrL[ 0 ] );
      end
    else if DirectoryExists( StrL[ 0 ] ) then
      dirEdtIn1.Directory := IncludeTrailingPathDelimiter( StrL[ 0 ] );
    end
  else if ControlIsChildOf( TWinControl( C ).Handle, grpFile2.Handle ) then
    begin
    if FileExists( StrL[ 0 ] ) then
      begin
      dirEdtIn2.Directory := ExtractFilePath( StrL[ 0 ] );
      flIn2.FileName      := ExtractFileName( StrL[ 0 ] );
      end
    else if DirectoryExists( StrL[ 0 ] ) then
      dirEdtIn2.Directory := IncludeTrailingPathDelimiter( StrL[ 0 ] );
    end;

  StrL.Free;
end;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
const
  DEFAULT_WIDTH          = 1280;
  DEFAULT_HEIGHT         = 1024;
  DEFAULT_BUFFER_SIZE    = 50;
  DEFAULT_WHEEL          = 1.0;
  DEFAULT_WHEEL_INTERNAL = -1.0;
  DEFAULT_PEAK_NITS      = 100;
  DEFAULT_BOOST_TONE     = 1.0;

  PARAMETER_SECTION      = 'Parameter';
  PARAMETER_FILE         = PARAMETER_SECTION + '.ini';

  EXECUTABLE             = 'video-compare.exe';
  SHORTCUT_NAME          = 'VideoCompare';
  EXT_LNK                = '.lnk';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
procedure TFrmVideoCompare.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  cbbDisplay.Clear;
  for i := 0 to Screen.MonitorCount-1 do
    cbbDisplay.Items.Add( IntToStr( i ) );
  cbbDisplay.ItemIndex := 0;

  LoadParametersFromFile( ExtractFilePath( ParamStr( 0 ) ) + PARAMETER_FILE );

  {$IF CompilerVersion >= 30}
  fLF := TFormatSettings.Create( LOCALE_SYSTEM_DEFAULT );
  {$ELSE}
  GetLocaleFormatSettings( LOCALE_SYSTEM_DEFAULT, fLF );
  {$IFEND}
  fLF.DecimalSeparator := '.';

  OnChange( Sender );
end;

procedure TFrmVideoCompare.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  SaveParametersToFile( ExtractFilePath( ParamStr( 0 ) ) + PARAMETER_FILE );
end;

procedure TFrmVideoCompare.OnChange(Sender: TObject);
begin
  edtFilterLeft.Enabled  := ( edtFilterBoth.Text = '' );
  edtFilterRight.Enabled := edtFilterLeft.Enabled;
  edtFilterBoth.Enabled := ( edtFilterLeft.Text = '' ) AND ( edtFilterRight.Text = '' );

  edtDemuxerLeft.Enabled  := ( edtDemuxerBoth.Text = '' );
  edtDemuxerRight.Enabled := edtDemuxerLeft.Enabled;
  edtDemuxerBoth.Enabled := ( edtDemuxerLeft.Text = '' ) AND ( edtDemuxerRight.Text = '' );

  edtDecoderLeft.Enabled  := ( edtDecoderBoth.Text = '' );
  edtDecoderRight.Enabled := edtDecoderLeft.Enabled;
  edtDecoderBoth.Enabled := ( edtDecoderLeft.Text = '' ) AND ( edtDecoderRight.Text = '' );

  edtHardwareAccelerationLeft.Enabled  := ( edtHardwareAccelerationBoth.Text = '' );
  edtHardwareAccelerationRight.Enabled := edtHardwareAccelerationLeft.Enabled;
  edtHardwareAccelerationBoth.Enabled := ( edtHardwareAccelerationLeft.Text = '' ) AND ( edtHardwareAccelerationRight.Text = '' );

  fParams := CreateParameters;
  mmoParams.Text := fParams;
end;

procedure TFrmVideoCompare.pnlTopResize(Sender: TObject);
begin
  grpFile1.Width := ( Width - pcMain.Width ) div 2;
end;

procedure TFrmVideoCompare.rgWindowClick(Sender: TObject);
begin
  SetEnabledForControls( pnlWindowSize, TRadioGroup( Sender ).ItemIndex = 1 ); // Custom
  OnChange( Sender );
end;

procedure TFrmVideoCompare.cbbToneMapModeLeftClick(Sender: TObject);
begin
  edtPeakNitsLeft.Enabled := ( cbbToneMapModeLeft.ItemIndex = 1 );
  edtPeakNitsRight.Enabled := ( cbbToneMapModeRight.ItemIndex = 1 );

  edtBoostToneLeft.Enabled := ( cbbToneMapModeLeft.ItemIndex = 1 );
  edtBoostToneRight.Enabled := ( cbbToneMapModeRight.ItemIndex = 1 );

  OnChange( Sender );
end;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function TFrmVideoCompare.LoadParametersFromFile( FileName : String ) : Integer;
var
  Ini : TIniFile;
  S   : String;
begin
  if NOT FileExists( FileName ) then
    begin
    result := -2;
    Exit;
    end;

  Ini := nil;
  try
    Ini := TIniFile.Create( FileName );
  except
    result := -1;
    Ini.free;
    Exit;
  end;

  S := Ini.ReadString( PARAMETER_SECTION, 'Directory1', '' );
  if DirectoryExists( S ) then
    dirEdtIn1.Directory := S;

  S := Ini.ReadString( PARAMETER_SECTION, 'Directory2', '' );
  if DirectoryExists( S ) then
    dirEdtIn2.Directory := S;

  chkHighDPI.Checked                := Ini.ReadBool( PARAMETER_SECTION, 'High DPI', False );
  chk10Bit.Checked                  := Ini.ReadBool( PARAMETER_SECTION, '10 Bit', False );
  chkFastAlignment.Checked          := Ini.ReadBool( PARAMETER_SECTION, 'Fast Alignment', False );
  chkBilinearTexture.Checked        := Ini.ReadBool( PARAMETER_SECTION, 'Bilinear Texture', False );
  cbbDisplay.ItemIndex              := Ini.ReadInteger( PARAMETER_SECTION, 'Display', 0 );
  cbbMode.ItemIndex                 := Ini.ReadInteger( PARAMETER_SECTION, 'Mode', 0 );
  rgWindow.ItemIndex                := Ini.ReadInteger( PARAMETER_SECTION, 'Window Mode', 0 );
  edtWidth.Text                     := IntToStr( Ini.ReadInteger( PARAMETER_SECTION, 'Window Width', DEFAULT_WIDTH ) );
  edtHeight.Text                    := IntToStr( Ini.ReadInteger( PARAMETER_SECTION, 'Window Height', DEFAULT_HEIGHT ) );
  cbbAutoLoopMode.ItemIndex         := Ini.ReadInteger( PARAMETER_SECTION, 'AutoLoop Mode', 0 );
  edtFrameBufferSize.Text           := IntToStr( Ini.ReadInteger( PARAMETER_SECTION, 'Frame Buffer Size', DEFAULT_BUFFER_SIZE ) );
//  edtShift.Text                     := FloatToStr( Ini.ReadFloat( PARAMETER_SECTION, 'Shift', 0 ) );
  edtWheelSensitivity.Text          := FloatToStr( Ini.ReadFloat( PARAMETER_SECTION, 'Wheel Sensitivity', DEFAULT_WHEEL_INTERNAL ) );
  cbbToneMapModeLeft.ItemIndex      := Ini.ReadInteger( PARAMETER_SECTION, 'ToneMap Mode (Left)', 0 );
  cbbToneMapModeRight.ItemIndex     := Ini.ReadInteger( PARAMETER_SECTION, 'ToneMap Mode (Right)', 0 );
  edtPeakNitsLeft.Text              := IntToStr( Ini.ReadInteger( PARAMETER_SECTION, 'Peak Nits (Left)', DEFAULT_PEAK_NITS ) );
  edtPeakNitsRight.Text             := IntToStr( Ini.ReadInteger( PARAMETER_SECTION, 'Peak Nits (Right)', DEFAULT_PEAK_NITS ) );
  edtBoostToneLeft.Text             := FloatToStr( Ini.ReadFloat( PARAMETER_SECTION, 'Boost Tone (Left)', DEFAULT_BOOST_TONE ) );
  edtBoostToneRight.Text            := FloatToStr( Ini.ReadFloat( PARAMETER_SECTION, 'Boost Tone (Right)', DEFAULT_BOOST_TONE ) );
  edtFilterBoth.Text                := Ini.ReadString( PARAMETER_SECTION, 'Filter (Both)', '' );
  edtFilterLeft.Text                := Ini.ReadString( PARAMETER_SECTION, 'Filter (Left)', '' );
  edtFilterRight.Text               := Ini.ReadString( PARAMETER_SECTION, 'Filter (Right)', '' );
  edtDemuxerBoth.Text               := Ini.ReadString( PARAMETER_SECTION, 'Demuxer (Both)', '' );
  edtDemuxerLeft.Text               := Ini.ReadString( PARAMETER_SECTION, 'Demuxer (Left)', '' );
  edtDemuxerRight.Text              := Ini.ReadString( PARAMETER_SECTION, 'Demuxer (Right)', '' );
  edtDecoderBoth.Text               := Ini.ReadString( PARAMETER_SECTION, 'Decoder (Both)', '' );
  edtDecoderLeft.Text               := Ini.ReadString( PARAMETER_SECTION, 'Decoder (Left)', '' );
  edtDecoderRight.Text              := Ini.ReadString( PARAMETER_SECTION, 'Decoder (Right)', '' );
  edtHardwareAccelerationBoth.Text  := Ini.ReadString( PARAMETER_SECTION, 'Hardware Acceleration (Both)', '' );  
  edtHardwareAccelerationLeft.Text  := Ini.ReadString( PARAMETER_SECTION, 'Hardware Acceleration (Left)', '' );
  edtHardwareAccelerationRight.Text := Ini.ReadString( PARAMETER_SECTION, 'Hardware Acceleration (Right)', '' );
  edtColorSpace.Text                := Ini.ReadString( PARAMETER_SECTION, 'Color Space', '' );
  edtColorRange.Text                := Ini.ReadString( PARAMETER_SECTION, 'Color Range', '' );
  edtColorPrimaries.Text            := Ini.ReadString( PARAMETER_SECTION, 'Color Primaries', '' );
  edtColorTRC.Text                  := Ini.ReadString( PARAMETER_SECTION, 'Color TRC', '' );
  edtlibvmafFilterOptions.Text      := Ini.ReadString( PARAMETER_SECTION, 'libvmaf Filter Options', '' );
  chkAutoFilters.Checked            := Ini.ReadBool( PARAMETER_SECTION, 'Auto Filters', True );

  Ini.Free;

  result := 0;
end;

procedure TFrmVideoCompare.SaveParametersToFile( FileName : String );
var
  Ini : TIniFile;
begin
  Ini := nil;
  try
    Ini := TIniFile.Create( FileName );
  except
    Ini.free;
    Exit;
  end;

  Ini.WriteString( PARAMETER_SECTION, 'Directory1', dirEdtIn1.Directory );
  Ini.WriteString( PARAMETER_SECTION, 'Directory2', dirEdtIn2.Directory );

  Ini.WriteBool( PARAMETER_SECTION, 'High DPI', chkHighDPI.Checked );
  Ini.WriteBool( PARAMETER_SECTION, '10 Bit', chk10Bit.Checked );
  Ini.WriteBool( PARAMETER_SECTION, 'Fast Alignment', chkFastAlignment.Checked );
  Ini.WriteBool( PARAMETER_SECTION, 'Bilinear Texture', chkBilinearTexture.Checked );
  Ini.WriteInteger( PARAMETER_SECTION, 'Display', cbbDisplay.ItemIndex );
  Ini.WriteInteger( PARAMETER_SECTION, 'Mode', cbbMode.ItemIndex );

  Ini.WriteInteger( PARAMETER_SECTION, 'Window Mode', rgWindow.ItemIndex );
  Ini.WriteInteger( PARAMETER_SECTION, 'Window Width', StrToIntDef( edtWidth.Text, DEFAULT_WIDTH ) );
  Ini.WriteInteger( PARAMETER_SECTION, 'Window Height', StrToIntDef( edtHeight.Text, DEFAULT_HEIGHT ) );
  Ini.WriteInteger( PARAMETER_SECTION, 'AutoLoop Mode', cbbAutoLoopMode.ItemIndex );
  Ini.WriteInteger( PARAMETER_SECTION, 'Frame Buffer Size', StrToIntDef( edtFrameBufferSize.Text, DEFAULT_BUFFER_SIZE ) );
//  Ini.WriteFloat( PARAMETER_SECTION, 'Shift', StrToFloatDef( edtShift.Text, 0 ) );
  Ini.WriteFloat( PARAMETER_SECTION, 'Wheel Sensitivity', StrToFloatDef( edtWheelSensitivity.Text, DEFAULT_WHEEL_INTERNAL ) );
  Ini.WriteInteger( PARAMETER_SECTION, 'ToneMap Mode (Left)', cbbToneMapModeLeft.ItemIndex );
  Ini.WriteInteger( PARAMETER_SECTION, 'ToneMap Mode (Right)', cbbToneMapModeRight.ItemIndex );
  Ini.WriteInteger( PARAMETER_SECTION, 'Peak Nits (Left)', StrToIntDef( edtPeakNitsLeft.Text, DEFAULT_PEAK_NITS ) );
  Ini.WriteInteger( PARAMETER_SECTION, 'Peak Nits (Right)', StrToIntDef( edtPeakNitsRight.Text, DEFAULT_PEAK_NITS ) );
  Ini.WriteFloat( PARAMETER_SECTION, 'Boost Tone (Left)', StrToFloatDef( edtBoostToneLeft.Text, DEFAULT_BOOST_TONE ) );
  Ini.WriteFloat( PARAMETER_SECTION, 'Boost Tone (Right)', StrToFloatDef( edtBoostToneRight.Text, DEFAULT_BOOST_TONE ) );
  Ini.WriteString( PARAMETER_SECTION, 'Filter (Both)', edtFilterBoth.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Filter (Left)', edtFilterLeft.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Filter (Right)', edtFilterRight.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Demuxer (Both)', edtDemuxerBoth.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Demuxer (Left)', edtDemuxerLeft.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Demuxer (Right)', edtDemuxerRight.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Decoder (Both)', edtDecoderBoth.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Decoder (Left)', edtDecoderLeft.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Decoder (Right)', edtDecoderRight.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Hardware Acceleration (Both)', edtHardwareAccelerationBoth.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Hardware Acceleration (Left)', edtHardwareAccelerationLeft.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Hardware Acceleration (Right)', edtHardwareAccelerationRight.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Color Space', edtColorSpace.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Color Range', edtColorRange.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Color Primaries', edtColorPrimaries.Text );
  Ini.WriteString( PARAMETER_SECTION, 'Color TRC', edtColorTRC.Text );
  Ini.WriteString( PARAMETER_SECTION, 'libvmaf Filter Options', edtlibvmafFilterOptions.Text );
  Ini.WriteBool( PARAMETER_SECTION, 'Auto Filters', chkAutoFilters.Checked );

  Ini.free;
end;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
procedure TFrmVideoCompare.dirEdtIn1Change(Sender: TObject);
begin
  if DirectoryExists( TJvDirectoryEdit( Sender ).Directory ) then
    begin
    flIn1.Directory := TJvDirectoryEdit( Sender ).Directory;
    flIn1.Update;
    end
  else
    flIn1.Clear;
end;

procedure TFrmVideoCompare.dirEdtIn2Change(Sender: TObject);
begin
  if DirectoryExists( TJvDirectoryEdit( Sender ).Directory ) then
    begin
    flIn2.Directory := TJvDirectoryEdit( Sender ).Directory;
    flIn2.Update;
    end
  else
    flIn2.Clear;
end;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
procedure TFrmVideoCompare.BlockKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #1{SelectAll} ) then
    begin
    if ( Sender is TWinControl ) then
      TWinControl( Sender ).Perform( $00B1{EM_SETSEL}, WPARAM( 0 ){SelStart}, LPARAM( -1 ){SelEnd} ); // -1=SelectAll
    end
  else if NOT {$IF CompilerVersion >= 22}CharInSet( Key,{$ELSE}( Key in{$IFEND} [ #3{Copy}, #27{ESCAPE} ] ) then
    Key := #0;
end;

procedure TFrmVideoCompare.SignedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  OnKeyDownManipulateNumbersViaUpDown( Sender, Key, Shift, kpmSigned );
end;

procedure TFrmVideoCompare.SignedKeyPress(Sender: TObject;
  var Key: Char);
begin
  OnKeyPressCheckChar( Sender, Key, kpmSigned );
end;

procedure TFrmVideoCompare.UnsignedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  OnKeyDownManipulateNumbersViaUpDown( Sender, Key, Shift, kpmUnsigned );
end;

procedure TFrmVideoCompare.UnsignedKeyPress(Sender: TObject;
  var Key: Char);
begin
  OnKeyPressCheckChar( Sender, Key, kpmUnsigned );
end;

procedure TFrmVideoCompare.FloatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  OnKeyDownManipulateNumbersViaUpDown( Sender, Key, Shift, kpmFloat );
end;

procedure TFrmVideoCompare.FloatKeyPress(Sender: TObject;
  var Key: Char);
begin
  OnKeyPressCheckChar( Sender, Key, kpmFloat );
end;

procedure TFrmVideoCompare.edtWidthKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Sets : tOnKeyPressRangeLimitSettings;
begin
  sets.Mode := kplmUnSigned;
  {$IF CompilerVersion < 23}{$RANGECHECKS OFF}{$IFEND} // RangeCheck might cause Internal-Error C1118
  sets.MinU := 1; // 352;
  sets.MaxU := 30720;
  {$IF CompilerVersion < 23}{$RANGECHECKS ON}{$IFEND} // RangeCheck might cause Internal-Error C1118

  OnKeyUpNumberRangeLimit( Sender, Key, sets );
end;

procedure TFrmVideoCompare.edtHeightKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Sets : tOnKeyPressRangeLimitSettings;
begin
  sets.Mode := kplmUnSigned;
  {$IF CompilerVersion < 23}{$RANGECHECKS OFF}{$IFEND} // RangeCheck might cause Internal-Error C1118
  sets.MinU := 1; // 240;
  sets.MaxU := 17280;
  {$IF CompilerVersion < 23}{$RANGECHECKS ON}{$IFEND} // RangeCheck might cause Internal-Error C1118

  OnKeyUpNumberRangeLimit( Sender, Key, sets );
end;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function TFrmVideoCompare.CreateParameters( WithFileName : Boolean = True ) : String;
var
  i     : Integer;
  D, D2 : Double;
begin
  result := '';
  if chkHighDPI.Checked then
    result := '--high-dpi '
  else
    result := '';

  if chk10Bit.Checked then
    result := result + '--10-bpc ';

  if chkFastAlignment.Checked then
    result := result + '--fast-alignment ';

  if chkBilinearTexture.Checked then
    result := result + '--bilinear-texture ';

  if ( cbbDisplay.ItemIndex > 0 ) then
    result := result + Format( '--display-number %d ', [ cbbDisplay.ItemIndex ] );

  case cbbMode.ItemIndex of
    1 : result := result + '--mode vstack ';
    2 : result := result + '--mode hstack ';
  end;

  case rgWindow.ItemIndex of
    1 : result := result + Format( '--window-size %dx%d ', [ StrToIntDef( edtWidth.Text, DEFAULT_WIDTH ), StrToIntDef( edtHeight.Text, DEFAULT_HEIGHT ) ] );
    2 : result := result + '--window-fit-display ';
  end;

  case cbbAutoLoopMode.ItemIndex of
    1 : result := result + '--auto-loop-mode on ';
    2 : result := result + '--auto-loop-mode pp ';
  end;

  i := StrToIntDef( edtFrameBufferSize.Text, DEFAULT_BUFFER_SIZE );
  if ( i <> DEFAULT_BUFFER_SIZE ) then
    result := result + Format( '--frame-buffer-size %d ', [ i ] );
 
  D := StrToFloatDef( edtShift.Text, 0 );
  if ( D <> 0 ) then
    result := result + Format( '--time-shift %.3f ', [ D ], fLF );

  D := StrToFloatDef( edtWheelSensitivity.Text, DEFAULT_WHEEL_INTERNAL );
  if ( D <> DEFAULT_WHEEL ) then
    result := result + Format( '--wheel-sensitivity %.3f ', [ D ], fLF );

  if ( cbbToneMapModeLeft.ItemIndex <> 0 ) OR ( cbbToneMapModeRight.ItemIndex <> 0 ) then
    begin
    result := result + '--tone-map-mode ';

    case cbbToneMapModeLeft.ItemIndex of
      0 : result := result + 'auto:';
      1 : result := result + 'off:';
      2 : result := result + 'on:';
      3 : result := result + 'rel:';
    end;

    case cbbToneMapModeRight.ItemIndex of
      0 : result := result + 'auto';
      1 : result := result + 'off';
      2 : result := result + 'on';
      3 : result := result + 'rel';
    end;
    end;

  if ( cbbToneMapModeLeft.ItemIndex = 1 ) then
    begin
    i := StrToIntDef( edtPeakNitsLeft.Text, DEFAULT_PEAK_NITS );
    if ( i <> DEFAULT_PEAK_NITS ) then
      result := result + Format( '--left-peak-nits %d ', [ i ] );
    end;

  if ( cbbToneMapModeRight.ItemIndex = 1 ) then
    begin
    i := StrToIntDef( edtPeakNitsRight.Text, DEFAULT_PEAK_NITS );
    if ( i <> DEFAULT_PEAK_NITS ) then
      result := result + Format( '--right-peak-nits %d ', [ i ] );
    end;

//  if ( cbbToneMapModeLeft.ItemIndex = 1 ) then
    begin
    D := StrToFloatDef( edtBoostToneLeft.Text, DEFAULT_BOOST_TONE );
    D2 := StrToFloatDef( edtBoostToneRight.Text, DEFAULT_BOOST_TONE );
    if ( D <> DEFAULT_BOOST_TONE ) OR ( D2 <> DEFAULT_BOOST_TONE ) then
      result := result + Format( '--boost-tone %.2f:%.2f', [ D, D2 ], fLF );
    end;

  if ( edtFilterBoth.Text <> '' ) then
    result := result + '--filters ' + edtFilterBoth.Text + ' '
  else
    begin
    if ( edtFilterLeft.Text <> '' ) then
      result := result + '--left-filters ' + edtFilterLeft.Text + ' ';
    if ( edtFilterRight.Text <> '' ) then
      result := result + '--right-filters ' + edtFilterRight.Text + ' ';
    end;   
    
  if ( edtDemuxerBoth.Text <> '' ) then
    result := result + '--demuxer ' + edtDemuxerBoth.Text + ' '
  else
    begin
    if ( edtDemuxerLeft.Text <> '' ) then
      result := result + '--left-demuxer ' + edtDemuxerLeft.Text + ' ';
    if ( edtDemuxerRight.Text <> '' ) then
      result := result + '--right-demuxer ' + edtDemuxerRight.Text + ' ';
    end;
    
  if ( edtDecoderBoth.Text <> '' ) then
    result := result + '--decoder ' + edtDecoderBoth.Text + ' '
  else
    begin
    if ( edtDecoderLeft.Text <> '' ) then
      result := result + '--left-decoder ' + edtDecoderLeft.Text + ' ';
    if ( edtDecoderRight.Text <> '' ) then
      result := result + '--right-decoder ' + edtDecoderRight.Text + ' ';
    end;  
    
  if ( edtHardwareAccelerationBoth.Text <> '' ) then
    result := result + '--hwaccel ' + edtHardwareAccelerationBoth.Text + ' '
  else
    begin
    if ( edtHardwareAccelerationLeft.Text <> '' ) then
      result := result + '--left-hwaccel ' + edtHardwareAccelerationLeft.Text + ' ';
    if ( edtHardwareAccelerationRight.Text <> '' ) then
      result := result + '--right-hwaccel ' + edtHardwareAccelerationRight.Text + ' ';
    end;

  if ( edtColorSpace.Text <> '' ) then
    result := result + '--color-space ' + edtColorSpace.Text + ' ';

  if ( edtColorRange.Text <> '' ) then
    result := result + '--color-range ' + edtColorRange.Text + ' ';

  if ( edtColorPrimaries.Text <> '' ) then
    result := result + '--color-primaries ' + edtColorPrimaries.Text + ' ';

  if ( edtColorTRC.Text <> '' ) then
    result := result + '--color-trc ' + edtColorTRC.Text + ' ';

  if ( edtlibvmafFilterOptions.Text <> '' ) then
    result := result + '--libvmaf-options ' + edtlibvmafFilterOptions.Text + ' ';

  if NOT chkAutoFilters.Checked then
    result := result + '--no-auto-filters ';

  if WithFileName AND ( flIn1.FileName <> flIn2.FileName ) then
    result := result + Format( '"%s" "%s"', [ flIn1.FileName, flIn2.FileName ] );
end;

procedure TFrmVideoCompare.actLaunchUpdate(Sender: TObject);
begin
  TAction( Sender ).Enabled := ( flIn1.ItemIndex >= 0 ) AND ( flIn2.ItemIndex >= 0 );
end;

procedure TFrmVideoCompare.actCreateShellLinkExecute(Sender: TObject);
begin
  try
    CreateShellLink( ExtractFilePath( ParamStr( 0 ) ) + EXECUTABLE, GetShellFolder( CSIDL_SENDTO ), SHORTCUT_NAME + EXT_LNK, ''{WorkingDir}, CreateParameters( False ), SHORTCUT_NAME{Desc} );
  except

  end;
end;

procedure TFrmVideoCompare.actRemoveShellLinkUpdate(Sender: TObject);
begin
  try
    TAction( Sender ).Enabled := FileExists( GetShellFolder( CSIDL_SENDTO ) + SHORTCUT_NAME + EXT_LNK );
  except
    TAction( Sender ).Enabled := False;
  end;
end;

procedure TFrmVideoCompare.actRemoveShellLinkExecute(Sender: TObject);
begin
  try
    DeleteFile( PChar( GetShellFolder( CSIDL_SENDTO ) + SHORTCUT_NAME + EXT_LNK ) );
  except

  end;
end;

procedure TFrmVideoCompare.actLaunchExecute(Sender: TObject);
begin
  if ( flIn1.FileName = flIn2.FileName ) then
    Exit;

  {result := }ExecutePE( nil, ExtractFilePath( ParamStr( 0 ) ) + EXECUTABLE, fParams, ''{WorkingDirectory}, nil{CaptureLineProc}, ExecutePE_DefaultOptions-[ eoHideWindow, eoWaitForTerminate ] );
end;

end.
