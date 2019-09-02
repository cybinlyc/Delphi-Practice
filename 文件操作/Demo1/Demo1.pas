unit Demo1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnWrite: TButton;
    btnRead: TButton;
    procedure btnWriteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
const
  SOURCE_FILE   ='D:\test\Demo1.txt';
implementation

{$R *.dfm}

procedure TForm1.btnWriteClick(Sender: TObject);
var
  dataSourveFile:TextFile;     // 读取文本文档的类型
begin
  // 将磁盘上的文件跟我们的变量关联绑定
  AssignFile(dataSourveFile,SOURCE_FILE);
  // 打开文件
  Rewrite(TextFile);
end;

end.
