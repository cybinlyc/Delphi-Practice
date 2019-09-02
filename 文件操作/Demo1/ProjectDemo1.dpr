program ProjectDemo1;

uses
  Vcl.Forms,
  UnitDemo1 in 'UnitDemo1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
