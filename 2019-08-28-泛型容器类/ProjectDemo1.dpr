program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,System.Generics.Collections;
{*------------------------------------------------------------------------------
���Ͳο��ֲ᣺Delphi2010�ο��ֲ�
  1��ʲô�Ƿ���
    �㷺����������
  2��������ʲô��
    1��Ϊ�˱����ڳ����е���������ǿ��ת����
    2��������������ʹ���������͸�����
  3�����ʹ��
    <T>
  4������ʹ�ó���
    1����������
    2������
-------------------------------------------------------------------------------}

type
  TArrayString = array of string;

  TArrayInt = array of Integer;

  TArray<T>= array of T;

  TStudent<T>= class
  end;

var
  ArrayString: TArrayString;
  ArrayInt: TArrayInt;
  {���ͱ������壬����������ʱ��ʵ������������Ͷ���ʱָ��������T��ָ��ʵ��Ӧ���е�����}
  ArraySs: TArray<string>;
  Num: Integer;
  {delphi�еķ�����}
  Ss:TArray<string>;

begin
  ArrayString := ['��������', '˯����'];
  ArrayInt := [11, 22, 33];
  ArraySs := ['����ޱ', '������', '�����'];
  for Num := Low(ArraySs) to High(ArraySs) do
  begin
    Writeln(ArraySs[Num], ',', Num);
  end;
  TStudent<Integer>.Create;
  TArray.Create;
  Readln;
end.

