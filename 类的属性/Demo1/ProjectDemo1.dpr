program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uTools in 'uTools.pas',
  uDemo in 'uDemo.pas';

{*------------------------------------------------------------------------------
  1����Ԫ
    ʲô�ǵ�Ԫ
    Ϊʲôʹ�õ�Ԫ
      1���������ά��
      2���Դ�����з��Ǳ��������
    ��ôʹ��
  2������
    1�����ʵĿɼ��ԣ�����Ȩ�����η���
      private        ˽�е�
      public         ������
      protecter      �ܱ����ģ����ĳ���ֶλ��߷������ùؼ������Σ�������Ե���
      published      �����ƿ����й�ϵ��
-------------------------------------------------------------------------------}
var
  person:TPerson;
begin
  person:=TPerson.Create;
  person.Age:=19;
  Readln;
end.
