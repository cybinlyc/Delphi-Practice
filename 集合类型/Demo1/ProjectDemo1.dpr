program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
{��׼�Ķ��巽ʽ}
  MySet = set of 1..255;

  MySet1 = set of'a'..'z';   // �ӽ�ļ���

  MySet2 = set of (RED, BLUE, YELLOW); // ö�ٵļ���
var
  MySetVar:MySet;

begin
  MySetVar:=[1,2,3,4,7,6];
end.

