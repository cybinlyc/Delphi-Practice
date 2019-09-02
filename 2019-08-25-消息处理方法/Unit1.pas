unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Mybtn: TButton;
    btnSendMsg: TButton;
    procedure MybtnClick(Sender: TObject);
    procedure btnSendMsgClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    {定义消息方法，关键字message +消息号；1024之前的消息编号都被使用，我们自己必须使用1024之后的}
    procedure ShowMyMsg(var Msg:TMessage);message WM_USER+1;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSendMsgClick(Sender: TObject);
begin
  SendMessage(Self.Handle,WM_USER+1,101,Integer(PChar('你好')));
end;

procedure TForm1.MybtnClick(Sender: TObject);
begin
  ShowMessage('Hello World.');
  Application.MessageBox(PWideChar('Hello World.'),PWideChar('温馨提示'),1);
end;

{消息处理方法，该过程不许显示调用，由系统触发}
procedure TForm1.ShowMyMsg(var Msg: TMessage);
begin
  ShowMessage(PChar(Msg.LParam));
end;

end.
