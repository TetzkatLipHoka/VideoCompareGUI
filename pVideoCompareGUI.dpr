program pVideoCompareGUI;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  {$IF CompilerVersion > 30}
  Vcl.Themes,
  Vcl.Styles,
//  VCLStylesSystemMenu in '..\VCLStylesSystemMenu.pas',
  uTLH.SysUtils in 'uTLH.SysUtils.pas',
  {$IFEND }
  Main in 'Main.pas' {FrmVideoCompare};

{$R *.res}

begin
  Application.Initialize;
  {$IF CompilerVersion > 30}
  if SystemUsesLightTheme then
    TStyleManager.TrySetStyle('Windows10')
  else
    TStyleManager.TrySetStyle('Windows10 Dark');
  {$IFEND}
  Application.CreateForm(TFrmVideoCompare, FrmVideoCompare);
  Application.Run;
end.
