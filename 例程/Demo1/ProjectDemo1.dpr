program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{
  1��������ʲô��
    1��������Delphi���гƺ�����һ�����ܵĴ���εķ�װ��
      ����
      ����
      ���̺ͺ���������������û�з���ֵ��
  2��������ʲô���ã�
    1�����Խ��������ͻ
    2����ߴ�����ظ�������
    3��������Ǵ���Ŀ�ά����
  3�����ʹ�����̣�
}

procedure Add(A: Integer; B: Integer);
begin
  Writeln(A + B);
end;
{var-����ַ��������C���Ե�ָ��������ں����иı��ֵ��ı�ȫ�ֱ�����ֵ}

function FDemo(var A: Integer; var B: Integer): Integer;
begin
  A:=2;
  B:=3;
  Result:=A+B;
end;

{
  �����ݵĲ����������̶�
  const-�����ݵ��ǹ̶�����,�ں����в��ɸı�
  �������̶����ö�̬����
}
procedure Demo1(const Number:array of Integer);
begin

end;
{
  ��������Ĭ��ֵ������
  Ĭ��ֵֻ�ܷ��ں����
}
procedure Demo2(a:Integer;b:Integer=100);
begin

end;
var
  X, Y: Integer;
  Number1:array of Integer;
begin
  Number1:=[1,2,3,4];
  Demo1(Number1);
  Demo2(100);
  Readln;
end.

