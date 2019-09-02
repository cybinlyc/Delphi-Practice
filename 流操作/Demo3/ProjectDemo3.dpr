program ProjectDemo3;

uses
  Vcl.Forms,
  UnitDemo3 in 'UnitDemo3.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
