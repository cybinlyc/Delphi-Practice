program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit1 in 'Unit1.pas';

{*------------------------------------------------------------------------------
  1、什么是多态
    一种事物以多种形态存在，例如动物和狗类，猫类之间的关系
    前提：两个类之间具备派生（继承）和实现（接口）这两种关系
    具体体现：父类接收或指向其子类对象。
  2、多态有什么用
    提高代码的复用性，方便我们对代码进行解耦操作（类和类之间不要出现直接的依赖）。
  3、怎么使用
-------------------------------------------------------------------------------}
var
  Animal: TAnimal;
  DogEat: IEat;
// 向上指向，把子类的对象数据类型转换为了父类的数据类型

procedure ShowAnimalRun(Animal: TAnimal);
var
  Dog: TDog;
  Cat: TCat;
begin
{运行时的数据类型}
  Animal.Run;
  {向下转型，把父类的对象的数据类型转换为子类的数据类型}
  // 强制类型转换
  Writeln(Animal.ClassName);
  if Animal.ClassName = 'TDog' then
  begin
    Dog := TDog(Animal);
    Dog.LookDog;
  end;
  // is 判断一个对象释放和一个类型兼容
  if Animal is TCat then
  begin
    Writeln('可以转换为猫');
    Cat:= Animal as TCat;
    // 判断对象是否为空
    if Assigned(Cat) then
    begin
      Writeln('空');
    end
    else
    begin
      Cat.CatchMouse;
    end;

  end;

end;

begin
  Animal := TCat.Create;
  ShowAnimalRun(Animal);
  Readln;
end.

