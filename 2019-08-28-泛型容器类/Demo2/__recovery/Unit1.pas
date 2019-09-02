unit Unit1;

interface

uses
  System.Generics.Collections, Unit2, Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MyMemo: TMemo;
    btnAdd: TButton;
    btnDelete: TButton;
    btnFind: TButton;
    btnClean: TButton;
    btnUpadte: TButton;
    edtMy: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ListStudet: TList<TStudent>; // 学生列表

implementation

{$R *.dfm}

procedure TForm1.btnAddClick(Sender: TObject);
var
  Stu: TStudent;
begin
  if edtMy.Text <> '' then
  begin
    ListStudet.Add(TStudent.Create(edtMy.Text));
    MyMemo.Clear;
    for Stu in ListStudet do
    begin
      MyMemo.Lines.Add(Stu.Name);
    end
  end
  else
  begin
    MessageBox(Self.Handle,'名字不能为空','温馨提示',MB_RETRYCANCEL);
  end;
end;

procedure TForm1.btnFindClick(Sender: TObject);
var
  Stu: TStudent;
begin
  {方法1,利用for in循环读取TList的值}
  MyMemo.Clear;
  for Stu in ListStudet do
  begin
    MyMemo.Lines.Add(Stu.Name);
  end;
  {方法2、利用}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {创建学生列表，容器类对象}
  ListStudet := TList<TStudent>.Create;
  {添加容器类成员}
  ListStudet.Add(TStudent.Create('小强'));
  ListStudet.Add(TStudent.Create('萧蔷'));
  ListStudet.Add(TStudent.Create('小黑'));
  ListStudet.Add(TStudent.Create('小白'));
  ListStudet.Add(TStudent.Create('小黄'));
end;

end.

