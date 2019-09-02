program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uExterns in 'uExterns.pas';

{*------------------------------------------------------------------------------
  派生（继承）
    派生是指类和类之间的关系
    继承更多是指对象和对象之间的关系
  特点
    1、提高代码的利用率
    2、一旦产生了派生关系之后，他们就具备了多态的特性
    3、Delphi是单继承，但是可以多层继承
  继承中的构造方法
    1、定义
  重写
  继承中的访问权限
-------------------------------------------------------------------------------}
var
  Dog:TDog;
begin
  Dog:=TDog.Create;
  writeln(Dog._FHeight);
  Dog.GetName();
  Readln;
end.

