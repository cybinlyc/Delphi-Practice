unit Uadd;

interface

uses
  System.Generics.Collections, Unit2, UnitDao, Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAddForm = class(TForm)
    lblName: TLabel;
    lblAge: TLabel;
    edtName: TEdit;
    edtAge: TEdit;
    btnSave: TButton;
    btnCancel: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddForm: TAddForm;

implementation

uses
  Unit1;
{$R *.dfm}

procedure TAddForm.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TAddForm.btnSaveClick(Sender: TObject);
var
  stuDictionary: TDictionary<string, TStudent>;
  Keys: string;
  Stu: TStudent;
begin
  TDao.Add(TStudent.Create(TGUID.NewGuid.ToString, edtName.Text, StrToInt(edtAge.Text)));
  Self.Close;
  MyForm.MyMemo.Lines.Clear;
  stuDictionary := TDao.ListStu;
  {查询添加后所有的东西，再显示出来}
  for Keys in stuDictionary.Keys do
  begin
    stuDictionary.TryGetValue(Keys, Stu);
    MyForm.MyMemo.Lines.Add(Stu.Id + ',' + Stu.Name + ',' + Stu.Age.ToString);
  end;
end;

end.

