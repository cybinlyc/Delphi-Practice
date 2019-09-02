program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{
  1、表达式 由运算符和合法的标识符组成的序列
  划分：根据运算结果的类型；1<2 1+1

  2、语句 由关键字和操作指令组成
  划分
    选择语句 -if语句 case语句
    循环语句
}
begin
  // if语句格式
  // 标准格式
  if 1<2 then
  begin
    // 当判断条件成立时，执行的代码
    Writeln('台湾第一美女');
  end;
  Readln;
  // 简写方式：前提是只需执行一行代码
  if 1<2 then
    Writeln('中国第一美女');
  // 如果..否则
  if True then
  begin
    Writeln('台湾第一美女：萧蔷');
  end     // 不能有分号，分号表示结束
  else
  begin
    Writeln('台湾第一美女：林志玲');
  end;
  // 简写
  if True then
    Writeln('1:台湾第一美女：萧蔷')   // 不能有分号，分号表示结束
  else
    Writeln('1:台湾第一美女：林志玲');

end.
