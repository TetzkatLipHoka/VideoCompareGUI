program pVideoCompareGUI;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  Main in 'Main.pas' {FrmVideoCompare};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmVideoCompare, FrmVideoCompare);
  Application.Run;
end.
