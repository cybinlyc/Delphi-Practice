program ProjectJsonDemo2;

uses
  Vcl.Forms,
  UJson in 'UJson.pas' {Form1},
  UStudent in 'UStudent.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
