program ProjectDemo2;

uses
  Vcl.Forms,
  UnitDemo2 in 'UnitDemo2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
