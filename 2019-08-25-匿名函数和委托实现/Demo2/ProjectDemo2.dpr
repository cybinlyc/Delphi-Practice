program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit1 in 'Unit1.pas';
{委托实现：关键之implements 接口}

var
  Dog: TDog;
  Cat: TCat;

begin
  Dog:=TDog.Create;
  Cat:=TCat.Create;
  {Cat继承于IEat接口，原本IEat接口中的方法需要在Cat中实现，但是由于Cat中的IEat中方法和Dog中的
  是一致的，为了避免代码冗余，在Cat中定义了属性 implements IEat委托别的类实现，下面的一句代码
  委托TDog类中实现TCat类中的接口方法   }
  Cat.Eat:=TDog.Create;
  Cat.Eat.Eating;
  Readln;
end.

