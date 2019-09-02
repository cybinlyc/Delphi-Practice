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
  {Ҫ�ȴ����������洢����}
  listStu := TObjectList<TStudent>.Create;
  {��Ӷ���������}
  listStu.Add(TStudent.Create('Gomez', 'Addams', 40));
  listStu.Add(TStudent.Create('Gomez', 'Addams', 41));
  {���л�����TList��������ת��δJSON��ʽ�ַ���}
  {TList���������������������л�������ַ���ÿ������Ӧ���ɻ�������������
   ����������Ӧ����������飬��������������}
  MyMemo.Text := TJsonSerializer.Create.Serialize<TObjectList<TStudent>>(listStu);
  {�����л��õ�TList<TStudent>������}
  MyMemo.Text := MyMemo.Text + TJsonSerializer.Create.Deserialize<TObjectList<TStudent>>(MyMemo.Text)[0].FirstName;
end;

procedure TForm1.MyBtn2Click(Sender: TObject);
var
  Serializer: TJsonSerializer;
  jsonString: string;
  ListStu: TObjectList<TStudent>;
  ZhangSanStudent: TStudent;
begin
  {JSon��ʽ�ַ���ת��ΪTObjectList�������������ͷβ���������֣�ֻ���������޷�ת���ɹ�}
  jsonString := '{"FOwnsObjects":true,"FListHelper":{"FCount":2},"FItems":[{"FFirstName":"Gomez","FSecondName":"Addams","FAge":40},{"FFirstName":"Gomez","FSecondName":"Addams","FAge":41}],"FComparer":{}}';
  ListStu := TObjectList<TStudent>.Create();
  MyMemo.Lines.Add(TJsonSerializer.Create.Deserialize<TObjectList<TStudent>>(jsonString)[0].FirstName);

  jsonString := '{"FFirstName":"��","FSecondName":"��","FAge":29}';
  ZhangSanStudent := TJsonSerializer.Create.Deserialize<TStudent>(jsonString);
  MyMemo.Text := MyMemo.Text + ZhangSanStudent.FirstName + ZhangSanStudent.SecondName + ZhangSanStudent.Age.ToString;

  jsonString := '{"FFirstName":"��","FSecondName":"����","FAge":29,"FLike":["��ë��","����ޱ"]}';
  ZhangSanStudent := TJsonSerializer.Create.Deserialize<TStudent>(jsonString);
  MyMemo.Text := MyMemo.Text + ZhangSanStudent.FirstName + ZhangSanStudent.SecondName + ZhangSanStudent.Age.ToString + ZhangSanStudent.Like[0]+ZhangSanStudent.Like[1];

end;

end.

