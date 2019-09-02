program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uPerson in 'uPerson.pas';

{*------------------------------------------------------------------------------
  1、种类
    构造方法
    析构方法
    静态方法:
      类中默认的方法，关键字无
      调用规则
    虚拟方法
      关键字，virtual
      可以有实现，也可以没有实现
      如果子类要覆盖父类的方法，那就父类只能使用虚方法或者动态方法
    动态方法
      关键字：Dynamic
      跟虚拟方法一致
    类方法  类似于JAVA中的静态方法
      关键字：class
      规则：
        当class修饰属性时，该属性称为类属性
        当class修饰方法时，该方法称为类方法
        既可以类名点调用，也可以对象调用
    抽象方法
      关键字：abstract
      规则：前体是该方法必须是虚方法（虚拟，动态）
            抽象方法一般写在父类中
            抽象方法只有声明，没有实现
    消息方法    暂时不讲
-------------------------------------------------------------------------------}
var
  Dog:TDog;
begin
  {创建类的对象，类的实例化}
  Dog:=TDog.Create;
  Dog.Talk;
  Dog.Run;
  Dog.Eat;
  TAnimal.Drink;
  Dog.Drink;
  Dog.Sleep;
  Readln;

end.
