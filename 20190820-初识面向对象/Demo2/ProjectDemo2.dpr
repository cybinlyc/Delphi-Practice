program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{*------------------------------------------------------------------------------
  1、怎么创建一个类
    类的成员组成
      属性、成员变量、字段
      功能、方法，函数，函数，过程，例程

  2、如何创建一个类的对象
  3、对象的生命周期
    一个对象从创建到消亡的过程，称为该对象的生命周期 ，从而实现对象的创建
    对象的创建
      1、构造方法      constuctor
        （1、向内存中申请一个内存空间，从而实现对象的创建
        （2、初始化类成员的功能
    对象的销毁    destructor
      1、free
      2、destroy
      3、freeAndNil
      4、Nil为空值，相当于其他语言的NULL
    self 表示本类对象     解决命名冲突
  4、Delphi中单元的概念
-------------------------------------------------------------------------------}

type
  TUser = class
  {字段}
    FName: string;
    {声明定义,CTRL_SHIFT+C，快速实现类的方法}
    procedure SetName(Name: string);
    {重定义构造函数}
    constructor AAA(FName:string);overload;   //重载
    constructor AAA();overload;
    {销毁对象的方法}
    destructor Destroy;override;      // 覆盖重写
  end;

{ TUser }
{实现类的方法}
{定义类的构造函数}
constructor TUser.AAA(FName:string);
begin
  self.FName:=FName;
end;

{销毁对象的方法的实现}
constructor TUser.AAA;
begin

end;

destructor TUser.Destroy;
begin
  {调用父类销毁对象的方法}
  Writeln('调用父类销毁对象的方法');
  inherited;
end;

procedure TUser.SetName(Name: string);
begin
  FName := Name;
end;
var
  User:TUser;
begin
  {通过类的构造方法，创建类的对象}
  User:=TUser.AAA('aaa');
  //User.FName:='杨紫薇';
  Writeln(User.FName);
  {调用销毁对象的方法，Free->destroy,模板设计模式}
  //User.Free;        // 1 判断了对象是否已经为空，然后调用destroy
  FreeAndNil(User); // 2 释放，并且将User也指向NIL
  readln;
end.

