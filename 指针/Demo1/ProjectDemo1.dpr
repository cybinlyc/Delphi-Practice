program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{*------------------------------------------------------------------------------
  1��ʲô��ָ��
    ָ���Ǵ洢�ڴ��ַ��һ������
  2��Ϊʲôʹ��ָ��
    Ч�ʸ�
  3��ָ����ôʹ��
    @����ȡ��ַ
    ^: ����ָ��
    ����ָ�룺������ȷ����������
    ������ָ�룺û���������ͣ�����ָ���κε�ַ
-------------------------------------------------------------------------------}

type
{����ָ��}
  TFunctionPrt = function(const value: integer): string;
function One(const value:Integer):string;
begin

end;
// ������ʵ�ʵ��ú���ָ��
function DynamincFunction(f:TFunctionPrt;const value:integer):Integer;
begin

end;
var
  I: Integer;
  {�������͵�ָ��}
  PInt: ^Integer;
  // ����ϵͳ��װ�õ�����ָ��
  PInt2: PInteger;
  {������ָ��}
  PVoid: Pointer;

begin
  I := 100;
  PInt := @I;
  Writeln(PInt^);
  New(PInt2);     // ��ʼ���������ڴ�ռ�
  PInt2^ := 100;
  Dispose(Pint2);  // �ͷ�ָ��

  GetMem(PVoid, 1024); // �ܹ�����ָ����С���ڴ�ռ��ָ��
  FreeMem(PVoid, 1024);  // �ͷ��ڴ�
  // ���ú���ָ��
  DynamincFunction(One,10);
  Readln;
end.

