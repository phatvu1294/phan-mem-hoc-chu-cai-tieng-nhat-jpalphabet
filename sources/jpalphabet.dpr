program jpalphabet;

uses
  Vcl.Forms,
  main in 'main.pas' {frmMain} ,
  numedit in 'numedit.pas',
  common in 'common.pas';

{$R *.res}

begin
  if not LoadAppIsRunning('JPAlphabet') then
  begin
{$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
    Application.Initialize;
    Application.Title := 'JP Alphabet';
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TfrmMain, frmMain);
    Application.Run;
  end;

end.
