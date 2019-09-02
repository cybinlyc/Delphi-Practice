unit Unit1;

interface

uses
  Unit2, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnMySend: TButton;
    btnMySend1002: TButton;
    procedure btnMySendClick(Sender: TObject);
    procedure btnMySend1002Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMySend1002Click(Sender: TObject);
var
  Msg: TMyMsg;
  MsgAccepter: TMsgAccepter;
begin
  Msg.MsgNum := 1034;
  Msg.MsgText := '消息和事件';
  MsgAccepter:=TMsgAccepter.Create;
  MsgAccepter.Dispatch(Msg);
end;

procedure TForm1.btnMySendClick(Sender: TObject);
var
  Msg: TMyMsg;
  MsgAccepter: TMsgAccepter;
begin
  Msg.MsgNum := 2000;
  Msg.MsgText := '消息和事件';
  MsgAccepter:=TMsgAccepter.Create;
  MsgAccepter.Dispatch(Msg);
end;

end.

