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
    // ��������
    readFileStream:=TFileStream.Create('D:\test\Demo2.txt',fmOpenRead);
    writeFileStream:=TFileStream.Create('D:\test\Demo2Copy.txt',fmCreate);
    // ���ö�ȡ��λ��
    readFileStream.Position:=0;
    writeFileStream.CopyFrom(readFileStream,readFileStream.Size);
    // ��ʾ��д��С
    ShowMessage(IntToStr(writeFileStream.Size));
  finally
    // �ͷ���Դ
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
    // ��������
    FileStream:=TFileStream.Create(SOURCE_FILE,fmOpenRead);
    // ���ÿ�ʼ��λ��
    FileStream.Position:=0;
    // �����ַ�������
    SetLength(strRead,FileStream.Size);
    // �������ݵ��ַ���
    FileStream.Read(PChar(strRead)^,FileStream.Size);
    Self.mmoDisplay.Lines.Add(strRead);
  finally
    // �ͷ���Դ
    FreeAndNil(FileStream);
  end;

end;

procedure TForm1.btnReadClick(Sender: TObject);
var
  FileStream:TFileStream;
  strRead:UTF8String;
begin
  try
    // ��������
    FileStream:=TFileStream.Create(SOURCE_FILE,fmOpenRead);
    // ���ÿ�ʼ��λ��
    FileStream.Position:=0;
    // �����ַ�������
    SetLength(strRead,FileStream.Size);
    // �������ݵ��ַ���
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
  // �ַ���ע�� 1������ 2������ unicode��utf-8��GBK
  str:='Hello,World.I am ������.';
  try
    // ��������
    FileStream:=TFileStream.Create(SOURCE_FILE,fmCreate);
    // ��stringת��Ϊָ��������ֽ�����
    strByte:=TEncoding.UTF8.GetBytes(str);
    // ^���ұ߽��ָ�����ã��Ӷ���ȡ��������
    FileStream.WriteBuffer(strByte,Length(strByte));
  finally
    FreeAndNil(FileStream);
  end;
end;

end.
