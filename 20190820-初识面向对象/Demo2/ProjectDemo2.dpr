program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{*------------------------------------------------------------------------------
  1����ô����һ����
    ��ĳ�Ա���
      ���ԡ���Ա�������ֶ�
      ���ܡ����������������������̣�����

  2����δ���һ����Ķ���
  3���������������
    һ������Ӵ����������Ĺ��̣���Ϊ�ö������������ ���Ӷ�ʵ�ֶ���Ĵ���
    ����Ĵ���
      1�����췽��      constuctor
        ��1�����ڴ�������һ���ڴ�ռ䣬�Ӷ�ʵ�ֶ���Ĵ���
        ��2����ʼ�����Ա�Ĺ���
    ���������    destructor
      1��free
      2��destroy
      3��freeAndNil
      4��NilΪ��ֵ���൱���������Ե�NULL
    self ��ʾ�������     ���������ͻ
  4��Delphi�е�Ԫ�ĸ���
-------------------------------------------------------------------------------}

type
  TUser = class
  {�ֶ�}
    FName: string;
    {��������,CTRL_SHIFT+C������ʵ����ķ���}
    procedure SetName(Name: string);
    {�ض��幹�캯��}
    constructor AAA(FName:string);overload;   //����
    constructor AAA();overload;
    {���ٶ���ķ���}
    destructor Destroy;override;      // ������д
  end;

{ TUser }
{ʵ����ķ���}
{������Ĺ��캯��}
constructor TUser.AAA(FName:string);
begin
  self.FName:=FName;
end;

{���ٶ���ķ�����ʵ��}
constructor TUser.AAA;
begin

end;

destructor TUser.Destroy;
begin
  {���ø������ٶ���ķ���}
  Writeln('���ø������ٶ���ķ���');
  inherited;
end;

procedure TUser.SetName(Name: string);
begin
  FName := Name;
end;
var
  User:TUser;
begin
  {ͨ����Ĺ��췽����������Ķ���}
  User:=TUser.AAA('aaa');
  //User.FName:='����ޱ';
  Writeln(User.FName);
  {�������ٶ���ķ�����Free->destroy,ģ�����ģʽ}
  //User.Free;        // 1 �ж��˶����Ƿ��Ѿ�Ϊ�գ�Ȼ�����destroy
  FreeAndNil(User); // 2 �ͷţ����ҽ�UserҲָ��NIL
  readln;
end.

