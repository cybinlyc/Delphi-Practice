program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,System.Generics.Collections;
{*------------------------------------------------------------------------------
泛型参考手册：Delphi2010参考手册
  1、什么是泛型
    广泛的数据类型
  2、泛型有什么用
    1、为了避免在程序中的数据类型强制转换。
    2、在容器中我们使用数据类型更加灵活。
  3、如何使用
    <T>
  4、泛型使用场景
    1、泛型容器
    2、反射
-------------------------------------------------------------------------------}

type
  TArrayString = array of string;

  TArrayInt = array of Integer;

  TArray<T>= array of T;

  TStudent<T>= class
  end;

var
  ArrayString: TArrayString;
  ArrayInt: TArrayInt;
  {泛型变量定义，在声明变量时用实际类型替代类型定义时指定的名称T来指定实际应用中的类型}
  ArraySs: TArray<string>;
  Num: Integer;
  {delphi中的泛型类}
  Ss:TArray<string>;

begin
  ArrayString := ['风起来了', '睡觉吧'];
  ArrayInt := [11, 22, 33];
  ArraySs := ['杨紫薇', '陈怡彬', '结婚啦'];
  for Num := Low(ArraySs) to High(ArraySs) do
  begin
    Writeln(ArraySs[Num], ',', Num);
  end;
  TStudent<Integer>.Create;
  TArray.Create;
  Readln;
end.

