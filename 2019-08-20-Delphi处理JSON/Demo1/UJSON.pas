unit UJSON;

interface

uses
  System.Generics.Collections, System.JSON.Serializers, UStudent, Winapi.Windows,
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MyMemo: TMemo;
    btnMyDeSerier: TButton;
    btnMySerier: TButton;
    btnMy: TButton;
    btnMy2: TButton;
    procedure btnMyDeSerierClick(Sender: TObject);
    procedure btnMySerierClick(Sender: TObject);
    procedure btnMyClick(Sender: TObject);
    procedure btnMy2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMy2Click(Sender: TObject);
var
  UserJson: string;
  StuList: TList<TStudent>;
  Serializer: TJsonSerializer;
  StuJson: TStudent;
begin
  UserJson := '{"FListHelper":{"FCount":2},"FItems":[{"FName":"��Ǿ","FAge":30},{"FName":"������","FAge":29}],"FComparer":{}}';
  Serializer := TJsonSerializer.Create;
  StuList := Serializer.Deserialize<TList<TStudent>>(UserJson);
  for StuJson in StuList do
  begin
    MyMemo.Lines.Add('�����л�:' + StuJson.Name + ',' + StuJson.Age.ToString);
  end;
end;

procedure TForm1.btnMyClick(Sender: TObject);
var
  StuJson: TStudent;
  StuList: TList<TStudent>;
  Serializer: TJsonSerializer;
begin
  StuList := TList<TStudent>.Create;
  StuList.Add(TStudent.Create('��Ǿ', 30));
  StuList.Add(TStudent.Create('������', 29));
  Serializer := TJsonSerializer.Create();
  //�������л�����
  MyMemo.Lines.Add('���л�:' + Serializer.Serialize<TList<TStudent>>(StuList));
end;

procedure TForm1.btnMyDeSerierClick(Sender: TObject);
var
  UserJson: string;
  Serializer: TJsonSerializer;
  StuJson: TStudent;
begin
  {������һ���ַ������͵�JSON����}
  UserJson := '{"FName":"С��","FAge":18}';
  Serializer := TJsonSerializer.Create();
  // �����л�
  StuJson := Serializer.Deserialize<TStudent>(UserJson);
  MyMemo.Lines.Add('�����л�:' + StuJson.Name + ',' + StuJson.Age.ToString);
end;

procedure TForm1.btnMySerierClick(Sender: TObject);
var
  UserJson: string;
  Serializer: TJsonSerializer;
  StuJson: TStudent;
begin
  StuJson := TStudent.Create;
  StuJson.Name := 'С��';
  StuJson.Age := 30;
  Serializer := TJsonSerializer.Create;
  //�������л�����
  MyMemo.Lines.Add('���л�:' + Serializer.Serialize<TStudent>(StuJson));
end;

end.

