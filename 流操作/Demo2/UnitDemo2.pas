unit UnitDemo2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnCopy: TButton;
    btnWrite: TButton;
    btnRead: TButton;
    mmoDisplay: TMemo;
    btnLoad: TButton;
    procedure btnCopyClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
const
  SOURCE_FILE = 'D:\test\Demo3.txt';
implementation

{$R *.dfm}

procedure TForm1.btnCopyClick(Sender: TObject);
var
  readFileStream,writeFileStream:TFileStream;
begin
  try
    // 创建对象
    readFileStream:=TFileStream.Create('D:\test\Demo2.txt',fmOpenRead);
    writeFileStream:=TFileStream.Create('D:\test\Demo2Copy.txt',fmCreate);
    // 设置读取的位置
    readFileStream.Position:=0;
    writeFileStream.CopyFrom(readFileStream,readFileStream.Size);
    // 显示读写大小
    ShowMessage(IntToStr(writeFileStream.Size));
  finally
    // 释放资源
    FreeAndNil(readFileStream);
    FreeAndNil(writeFileStream);
  end;



end;

procedure TForm1.btnLoadClick(Sender: TObject);
var
  FileStream:TFileStream;
  strRead:UTF8String;
begin
  try
    // 创建对象
    FileStream:=TFileStream.Create(SOURCE_FILE,fmOpenRead);
    // 设置开始读位置
    FileStream.Position:=0;
    // 设置字符串长度
    SetLength(strRead,FileStream.Size);
    // 读入数据到字符串
    FileStream.Read(PChar(strRead)^,FileStream.Size);
    Self.mmoDisplay.Lines.Add(strRead);
  finally
    // 释放资源
    FreeAndNil(FileStream);
  end;

end;

procedure TForm1.btnReadClick(Sender: TObject);
var
  FileStream:TFileStream;
  strRead:UTF8String;
begin
  try
    // 创建对象
    FileStream:=TFileStream.Create(SOURCE_FILE,fmOpenRead);
    // 设置开始读位置
    FileStream.Position:=0;
    // 设置字符串长度
    SetLength(strRead,FileStream.Size);
    // 读入数据到字符串
    FileStream.Read(PChar(strRead)^,FileStream.Size);
    ShowMessage(strRead);
  finally
    FreeAndNil(FileStream);
  end;
end;

procedure TForm1.btnWriteClick(Sender: TObject);
var
  FileStream:TFileStream;
  str:string;
  strByte:TBytes;
begin
  // 字符串注意 1、长度 2、编码 unicode，utf-8，GBK
  str:='Hello,World.I am 陈怡彬.';
  try
    // 创建对象
    FileStream:=TFileStream.Create(SOURCE_FILE,fmCreate);
    // 将string转换为指定编码的字节数组
    strByte:=TEncoding.UTF8.GetBytes(str);
    // ^在右边解除指针引用，从而获取其中数据
    FileStream.WriteBuffer(strByte,Length(strByte));
  finally
    FreeAndNil(FileStream);
  end;
end;

end.
