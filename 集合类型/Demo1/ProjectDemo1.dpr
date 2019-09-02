program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
{标准的定义方式}
  MySet = set of 1..255;

  MySet1 = set of'a'..'z';   // 子界的集合

  MySet2 = set of (RED, BLUE, YELLOW); // 枚举的集合
var
  MySetVar:MySet;

begin
  MySetVar:=[1,2,3,4,7,6];
end.

