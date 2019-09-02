program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{
  1、例程是什么？
    1、例程是Delphi独有称呼，是一个功能的代码段的封装。
      过程
      函数
      过程和函数的区别在于有没有返回值。
  2、例程有什么作用？
    1、可以解决命名冲突
    2、提高代码的重复利用率
    3、提高我们代码的可维护性
  3、如何使用例程？
}

procedure Add(A: Integer; B: Integer);
begin
  Writeln(A + B);
end;
{var-传地址，类似于C语言的指针参数，在函数中改变的值会改变全局变量的值}

function FDemo(var A: Integer; var B: Integer): Integer;
begin
  A:=2;
  B:=3;
  Result:=A+B;
end;

{
  当传递的参数个数不固定
  const-代表传递的是固定常量,在函数中不可改变
  参数不固定利用动态数组
}
procedure Demo1(const Number:array of Integer);
begin

end;
{
  参数带有默认值的例程
  默认值只能放在后面的
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

