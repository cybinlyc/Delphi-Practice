program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

{*------------------------------------------------------------------------------
  1、匿名函数
    关键字reference to
      type
        TFun = reference to function():Integer;
-------------------------------------------------------------------------------}
type
{匿名函数}
  TFunc = reference to function():Integer;
{函数指针}
  TPFunc = function():Integer;
var
  Fun1:TFunc;
  Fun2:TPFunc;

function Test():Integer;
begin
  Writeln('函数指针/匿名函数');
  Result:=Result;
end;

begin
  Fun1:=Test;
  {匿名函数用法1，指向函数}
  Fun2:=Test;
  Fun1;
  Fun2;
  {匿名函数用法2，直接定义函数}
  Fun1:=function():Integer
  begin
    Writeln('匿名函数2');
    Result:=Result;
  end;
  Fun1;
  Readln;
end.
