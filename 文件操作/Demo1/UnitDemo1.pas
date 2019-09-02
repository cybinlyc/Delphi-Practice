unit UnitDemo1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnWrite: TButton;
    btnRead: TButton;
    btnRecord: TButton;
    btnReadRecord: TButton;
    mmoDispalyRecord: TMemo;
    procedure btnWriteClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnRecordClick(Sender: TObject);
    procedure btnReadRecordClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TPerson = record
    name:string[20];  {必须是一个指定长度的字符串，没有指定不知道多长，无法构造}
    age:Integer;
  end;

var
  Form1: TForm1;
const
  SOURCE_FILE   ='D:\test\Demo1.txt';
implementation

{$R *.dfm}

procedure TForm1.btnReadClick(Sender: TObject);
var
  dataSourceFile:TextFile;     // 读取文本文档的类型
  content:string;
begin
  try
    // 将磁盘上的文件跟我们的变量关联绑定
    AssignFile(dataSourceFile,SOURCE_FILE);
    // 打开文件 reset方式打开，只读
    Reset(dataSourceFile);
    // 读取文本数据
    Readln(dataSourceFile,content);
    ShowMessage(content);
  finally
    // 关闭文件 1、把内存中的数据写入到磁盘 2、释放资源
    CloseFile(dataSourceFile);
  end;

end;

procedure TForm1.btnReadRecordClick(Sender: TObject);
var
  Person:TPerson;
  PersonFile:File of TPerson;
begin
  // 关联文件和变量
  AssignFile(PersonFile,SOURCE_FILE);
  // 以写方式打开文件
  Reset(PersonFile);
  // 改变文件指针位置,文件指针的索引是从0开始的
  Seek(PersonFile,1);
  // 将结构体的数据写入文件
  Read(PersonFile,Person);
  mmoDispalyRecord.Clear;
  mmoDispalyRecord.Lines.Add(Person.name);
  mmoDispalyRecord.Lines.Add(Person.age.ToString);
  // 关闭文件 1、把内存中的数据写入到磁盘 2、释放资源
  CloseFile(PersonFile);
end;

procedure TForm1.btnRecordClick(Sender: TObject);
var
  Person:TPerson;
  PersonFile:File of TPerson;
begin
  try
    // 关联文件和变量
    AssignFile(PersonFile,SOURCE_FILE);
    // 以写方式打开文件
    Rewrite(PersonFile);
    // 构造结构体的数据
    Person.name:='陈怡彬';
    Person.age:=29;
    // 将结构体的数据写入文件
    Write(PersonFile,Person);  
    ShowMessage('记录数'+IntToStr(FileSize(PersonFile))+'，当前文件指针'+IntToStr(FilePos(PersonFile)));
    // 构造结构体的数据
    Person.name:='杨紫薇';
    Person.age:=25;
    // 将结构体的数据写入文件
    Write(PersonFile,Person);  
    ShowMessage('记录数'+IntToStr(FileSize(PersonFile))+'，当前文件指针'+IntToStr(FilePos(PersonFile)));    
  finally
    // 关闭文件 1、把内存中的数据写入到磁盘 2、释放资源
    CloseFile(PersonFile);
  end;
end;

procedure TForm1.btnWriteClick(Sender: TObject);
var
  dataSourceFile:TextFile;     // 读取文本文档的类型
begin
  try
    // 将磁盘上的文件跟我们的变量关联绑定
    AssignFile(dataSourceFile,SOURCE_FILE);
    // 打开文件 rewirte方式打开，如果该文件已存在，将被覆盖
    Rewrite(dataSourceFile);
    // 向文档写入数据
    Writeln(dataSourceFile,'Hello,World.I am cybinlyc.');
  finally
    // 关闭文件 1、把内存中的数据写入到磁盘 2、释放资源
    CloseFile(dataSourceFile);
  end;


end;

end.
