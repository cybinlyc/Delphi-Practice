program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{*------------------------------------------------------------------------------
  1、什么是指针
    指针是存储内存地址的一个变量
  2、为什么使用指针
    效率高
  3、指针怎么使用
    @：获取地址
    ^: 定义指针
    类型指针：具有明确的数据类型
    无类型指针：没有数据类型，可以指向任何地址
-------------------------------------------------------------------------------}

type
{函数指针}
  TFunctionPrt = function(const value: integer): string;
function One(const value:Integer):string;
begin

end;
// 这里是实际调用函数指针
function DynamincFunction(f:TFunctionPrt;const value:integer):Integer;
begin

end;
var
  I: Integer;
  {整数类型的指针}
  PInt: ^Integer;
  // 利用系统封装好的类型指针
  PInt2: PInteger;
  {无类型指针}
  PVoid: Pointer;

begin
  I := 100;
  PInt := @I;
  Writeln(PInt^);
  New(PInt2);     // 初始化，分配内存空间
  PInt2^ := 100;
  Dispose(Pint2);  // 释放指针

  GetMem(PVoid, 1024); // 能够分配指定大小的内存空间给指针
  FreeMem(PVoid, 1024);  // 释放内存
  // 调用函数指针
  DynamincFunction(One,10);
  Readln;
end.

