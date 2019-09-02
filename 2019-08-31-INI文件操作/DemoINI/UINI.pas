unit UINI;

interface

uses
  System.IOUtils, System.IniFiles, Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;



type
  TForm1 = class(TForm)
    lblName: TLabel;
    lblSex: TLabel;
    rgSex: TRadioGroup;
    rbBoy: TRadioButton;
    rbGirl: TRadioButton;
    lblAge: TLabel;
    edtName: TEdit;
    edtAge: TEdit;
    grpLike: TGroupBox;
    lblLike: TLabel;
    chkMoney: TCheckBox;
    chkProgram: TCheckBox;
    cbbAddr: TComboBox;
    lblAddr: TLabel;
    btnSave: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  UserConfigPath:string;

implementation

{$R *.dfm}

procedure TForm1.btnSaveClick(Sender: TObject);
var
  IniFile: TIniFile;
  IniSection: string;
begin
  IniSection := 'BasicConfig';
  // 有一个配置文件
  IniFile := TIniFile.Create(UserConfigPath);
  IniFile.WriteString(IniSection, 'edtName', edtName.Text);
  IniFile.WriteString(IniSection, 'edtAge', edtAge.Text);
  IniFile.WriteBool(IniSection, 'rbBoy', rbBoy.Checked);
  IniFile.WriteBool(IniSection, 'rbGirl', rbGirl.Checked);
  IniFile.WriteBool(IniSection, 'chkMoney', chkMoney.Checked);
  IniFile.WriteBool(IniSection, 'chkProgram', chkProgram.Checked);
  //IniFile.WriteInteger(IniSection, 'cbbAddr', cbbAddr.ItemIndex);
  IniFile.WriteString(IniSection,'cbbAddr',cbbAddr.Text);
  Self.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
  IniSection: string;
begin
  UserConfigPath := TDirectory.GetCurrentDirectory + '\UserConfig.ini';
  IniSection := 'BasicConfig';
  IniFile := TIniFile.Create(UserConfigPath);
  edtName.Text := IniFile.ReadString(IniSection, 'edtName', '');
  edtAge.Text := IniFile.ReadString(IniSection, 'edtAge', '');
  rbBoy.Checked := IniFile.ReadBool(IniSection, 'rbBoy', False);
  rbGirl.Checked := IniFile.ReadBool(IniSection, 'rbGirl', False);
  chkMoney.Checked := IniFile.ReadBool(IniSection, 'chkMoney', False);
  chkProgram.Checked := IniFile.ReadBool(IniSection, 'chkProgram', False);
  //cbbAddr.ItemIndex := IniFile.ReadInteger(IniSection, 'cbbAddr', 0);
  cbbAddr.Text:=IniFile.ReadString(IniSection,'cbbAddr','');

end;

end.

