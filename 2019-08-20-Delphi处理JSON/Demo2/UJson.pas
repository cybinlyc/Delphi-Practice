unit UJson;

interface

uses
  System.JSON.Serializers, System.Generics.Collections, UStudent, Winapi.Windows,
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MyBtn1: TButton;
    MyBtn2: TButton;
    MyMemo: TMemo;
    procedure MyBtn1Click(Sender: TObject);
    procedure MyBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.MyBtn1Click(Sender: TObject);
var
  listStu: TObjectList<TStudent>;
begin
  {要先创建容器来存储对象}
  listStu := TObjectList<TStudent>.Create;
  {添加对象到容器中}
  listStu.Add(TStudent.Create('Gomez', 'Addams', 40));
  listStu.Add(TStudent.Create('Gomez', 'Addams', 41));
  {序列化，将TList容器对象转换未JSON格式字符串}
  {TList里面有连个对象，所以序列化处理的字符串每个对象应该由花括号括起来，
   而两个对象应该组成了数组，由中括号括起来}
  MyMemo.Text := TJsonSerializer.Create.Serialize<TObjectList<TStudent>>(listStu);
  {反序列化得到TList<TStudent>的容器}
  MyMemo.Text := MyMemo.Text + TJsonSerializer.Create.Deserialize<TObjectList<TStudent>>(MyMemo.Text)[0].FirstName;
end;

procedure TForm1.MyBtn2Click(Sender: TObject);
var
  Serializer: TJsonSerializer;
  jsonString: string;
  ListStu: TObjectList<TStudent>;
  ZhangSanStudent: TStudent;
begin
  {JSon格式字符串转换为TObjectList容器，必须包含头尾的描述部分，只有内容则无法转换成功}
  jsonString := '{"FOwnsObjects":true,"FListHelper":{"FCount":2},"FItems":[{"FFirstName":"Gomez","FSecondName":"Addams","FAge":40},{"FFirstName":"Gomez","FSecondName":"Addams","FAge":41}],"FComparer":{}}';
  ListStu := TObjectList<TStudent>.Create();
  MyMemo.Lines.Add(TJsonSerializer.Create.Deserialize<TObjectList<TStudent>>(jsonString)[0].FirstName);

  jsonString := '{"FFirstName":"张","FSecondName":"三","FAge":29}';
  ZhangSanStudent := TJsonSerializer.Create.Deserialize<TStudent>(jsonString);
  MyMemo.Text := MyMemo.Text + ZhangSanStudent.FirstName + ZhangSanStudent.SecondName + ZhangSanStudent.Age.ToString;

  jsonString := '{"FFirstName":"陈","FSecondName":"怡彬","FAge":29,"FLike":["羽毛球","杨紫薇"]}';
  ZhangSanStudent := TJsonSerializer.Create.Deserialize<TStudent>(jsonString);
  MyMemo.Text := MyMemo.Text + ZhangSanStudent.FirstName + ZhangSanStudent.SecondName + ZhangSanStudent.Age.ToString + ZhangSanStudent.Like[0]+ZhangSanStudent.Like[1];

end;

end.

