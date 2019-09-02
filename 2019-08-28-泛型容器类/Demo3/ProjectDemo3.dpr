program ProjectDemo3;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {MyForm},
  Vcl.Themes,
  Vcl.Styles,
  Unit2 in 'Unit2.pas',
  Uadd in 'Uadd.pas' {AddForm},
  UnitDao in 'UnitDao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TMyForm, MyForm);
  Application.CreateForm(TAddForm, AddForm);
  Application.Run;
end.
