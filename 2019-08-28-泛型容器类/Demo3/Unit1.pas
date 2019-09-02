unit Unit1;

interface

uses
  UnitDao, Uadd, Unit2, System.Generics.Collections, Winapi.Windows,
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMyForm = class(TForm)
    btnAdd: TButton;
    btnDelete: TButton;
    btnFind: TButton;
    btnUpdate: TButton;
    MyMemo: TMemo;
    procedure btnAddClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MyForm: TMyForm;

implementation

{$R *.dfm}

procedure TMyForm.btnAddClick(Sender: TObject);
var
  FormAdd: TAddForm;
begin
  FormAdd := TAddForm.Create(Self);
  FormAdd.Left := Self.Left + 50;
  FormAdd.Top := Self.Top + 15;
  FormAdd.ShowModal;

  //AddForm:=TAddForm.Create(Self);
  //AddForm.ShowModal;
end;

procedure TMyForm.btnDeleteClick(Sender: TObject);
begin
  TDao.Clear;
  MyMemo.Lines.Clear;
end;

procedure TMyForm.btnFindClick(Sender: TObject);
var
  StuDictionary: TDictionary<string, TStudent>;
  StuItem:TStudent;
begin
  MyMemo.Lines.Clear;
  StuDictionary := TDao.ListStu;
  for StuItem in StuDictionary.Values do
  begin
    MyMemo.Lines.Add(StuItem.Id+','+StuItem.Name+','+StuItem.Age.ToString);
  end;
end;

end.

