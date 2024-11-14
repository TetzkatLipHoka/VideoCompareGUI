unit Main;

interface

uses
  Classes, Controls, Forms, Messages, StdCtrls, FileCtrl, Mask, JvExMask,
  JvToolEdit, ActnList, ExtCtrls;

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
    pnlRight: TPanel;
    pnlControls: TPanel;
    btnLaunch: TButton;
    chkHighDPI: TCheckBox;
    grpWindowSize: TGroupBox;
    lblWindowSizeX: TLabel;
    edtWidth: TEdit;
    edtHeight: TEdit;
    chkWindowSize: TCheckBox;
    lbl1: TLabel;
    grpShift: TGroupBox;
    edtShift: TEdit;
    grpMode: TGroupBox;
    cbbMode: TComboBox;
    procedure dirEdtIn1Change(Sender: TObject);
    procedure dirEdtIn2Change(Sender: TObject);
    procedure actLaunchUpdate(Sender: TObject);
    procedure actLaunchExecute(Sender: TObject);
    procedure chkWindowSizeClick(Sender: TObject);
    procedure BlockKeyPress(Sender: TObject; var Key: Char);
    procedure UnsignedKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UnsignedKeyPress(Sender: TObject; var Key: Char);
    procedure edtWidthKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtHeightKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SignedKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SignedKeyPress(Sender: TObject; var Key: Char);
  private
    { Private-Deklarationen }
    procedure WMDROPFILES(var Msg: TMessage); message WM_DROPFILES;
  protected
    procedure CreateWnd; override;
    procedure DestroyWindowHandle; override;
  public
    { Public-Deklarationen }
  end;

var
  FrmVideoCompare: TFrmVideoCompare;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
implementation

uses
  Windows, SysUtils, ShellAPI,
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
procedure TFrmVideoCompare.chkWindowSizeClick(Sender: TObject);
begin
  SetEnabledForControls( grpWindowSize, TCheckBox( Sender ).Checked );
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
procedure TFrmVideoCompare.actLaunchUpdate(Sender: TObject);
begin
  TAction( Sender ).Enabled := ( flIn1.ItemIndex >= 0 ) AND ( flIn2.ItemIndex >= 0 );
end;

procedure TFrmVideoCompare.actLaunchExecute(Sender: TObject);
const
  FILENAME = 'video-compare.exe';
var
  Params : string;
  i      : Int64;
begin
  if chkHighDPI.Checked then
    Params := '--high-dpi '
  else
    Params := '';

  if chkWindowSize.Checked then
    Params := Params + Format( '--window-size %dx%d ', [ StrToIntDef( edtWidth.Text, 1280 ), StrToIntDef( edtHeight.Text, 1024 ) ] );

  case cbbMode.ItemIndex of
    1 : Params := Params + '--mode vstack ';
    2 : Params := Params + '--mode hstack ';
  end;

  i := StrToIntDef( edtShift.Text, 0 );
  if ( i <> 0 ) then
    Params := Params + Format( '--time-shift %d ', [ i ] );

  Params := Params + Format( '"%s" "%s"', [ flIn1.FileName, flIn2.FileName ] );
  {result := }ExecutePE( nil, ExtractFilePath( ParamStr( 0 ) ) + FILENAME, Params, ''{WorkingDirectory}, nil{CaptureLineProc}, ExecutePE_DefaultOptions-[ eoHideWindow, eoWaitForTerminate ] );
end;

end.
