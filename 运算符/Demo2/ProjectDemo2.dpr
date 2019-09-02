program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{
  1、运算符   算术运算符 +,-,*,/(除不进),div（整除）,mod（取模）
}
begin
  // 写出到控制台指定的内容
  Writeln(6/2);
  Writeln(6 div 4);
  Writeln(6 mod 4);

  // 布尔运算符
  Writeln(1=2);
  Writeln(1<>2);
  Writeln(not(1<>2));
  // 从控制台读取一行数据，它现在的主要作用是暂停等待，等待我们按下回车键
  readln;
end.
