program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uTools in 'uTools.pas',
  uDemo in 'uDemo.pas';

{*------------------------------------------------------------------------------
  1、单元
    什么是单元
    为什么使用单元
      1、方便代码维护
      2、对代码进行分们别类的整理
    怎么使用
  2、属性
    1、访问的可见性（访问权限修饰符）
      private        私有的
      public         公共的
      protecter      受保护的，如何某个字段或者方法被该关键字修饰，子类可以调用
      published      跟控制开发有关系，
-------------------------------------------------------------------------------}
var
  person:TPerson;
begin
  person:=TPerson.Create;
  person.Age:=19;
  Readln;
end.
