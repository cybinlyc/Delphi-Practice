program ProjectJsonDemo1;

uses
  Vcl.Forms,
  UJSON in 'UJSON.pas' {Form1},
  UStudent in 'Domain\UStudent.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
