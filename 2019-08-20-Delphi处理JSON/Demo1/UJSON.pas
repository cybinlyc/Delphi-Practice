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
  UserJson := '{"FListHelper":{"FCount":2},"FItems":[{"FName":"萧蔷","FAge":30},{"FName":"陈怡彬","FAge":29}],"FComparer":{}}';
  Serializer := TJsonSerializer.Create;
  StuList := Serializer.Deserialize<TList<TStudent>>(UserJson);
  for StuJson in StuList do
  begin
    MyMemo.Lines.Add('反序列化:' + StuJson.Name + ',' + StuJson.Age.ToString);
  end;
end;

procedure TForm1.btnMyClick(Sender: TObject);
var
  StuJson: TStudent;
  StuList: TList<TStudent>;
  Serializer: TJsonSerializer;
begin
  StuList := TList<TStudent>.Create;
  StuList.Add(TStudent.Create('萧蔷', 30));
  StuList.Add(TStudent.Create('陈怡彬', 29));
  Serializer := TJsonSerializer.Create();
  //创建序列化对象
  MyMemo.Lines.Add('序列化:' + Serializer.Serialize<TList<TStudent>>(StuList));
end;

procedure TForm1.btnMyDeSerierClick(Sender: TObject);
var
  UserJson: string;
  Serializer: TJsonSerializer;
  StuJson: TStudent;
begin
  {创建了一个字符串类型的JSON对象}
  UserJson := '{"FName":"小黑","FAge":18}';
  Serializer := TJsonSerializer.Create();
  // 反序列化
  StuJson := Serializer.Deserialize<TStudent>(UserJson);
  MyMemo.Lines.Add('反序列化:' + StuJson.Name + ',' + StuJson.Age.ToString);
end;

procedure TForm1.btnMySerierClick(Sender: TObject);
var
  UserJson: string;
  Serializer: TJsonSerializer;
  StuJson: TStudent;
begin
  StuJson := TStudent.Create;
  StuJson.Name := '小白';
  StuJson.Age := 30;
  Serializer := TJsonSerializer.Create;
  //创建序列化对象
  MyMemo.Lines.Add('序列化:' + Serializer.Serialize<TStudent>(StuJson));
end;

end.

