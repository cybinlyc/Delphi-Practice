program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

{返回值}
{1、result返回值}
{函数重载，函数名相同，参数列表不同，包括参数的个数和类型。使用关键字overload }

function Add(Number0: Integer; Number1: Integer): Integer; overload;
begin
  Result := Number0 + Number1;
  {Result并没有C语言中return结束函数或者程序的功能，要结束，必须使用Exit功能}
  Exit;
end;
{函数重载：函数名相同，参数列表不同，使用关键字overload}

function Add(Number0: Double; Number1: Double): Double; overload;
begin
  Result := Number0 + Number1;
  {Result并没有C语言中return结束函数或者程序的功能，要结束，必须使用Exit功能}
  Exit;
end;

{forward关键字前置声明}
function mun(Number0: Integer; Number1: Integer; out Sum: Integer): Integer; forward;

function get(Number0: Integer; Number1: Integer): Integer; forward;
{2、使用var关键字，引用调用拿到返回值}

function Add1(Number0: Integer; Number1: Integer; var Sum: Integer): Integer;
begin
  Sum := Number0 + Number1;
end;
{3、使用out关键字的仅输出参数}

function mun(Number0: Integer; Number1: Integer; out Sum: Integer): Integer;
begin
  Sum := Number0 * Number1;
end;
{4、使用函数名得到获取结果}

function get(Number0: Integer; Number1: Integer): Integer;
begin
  get := Number0 + Number1;
end;

begin

end.

