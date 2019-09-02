program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

procedure ForDemo();
var
  i: Integer;
begin
   {for循环的的基本写法}
  for i := 1 to 10 do
  begin
    Writeln(i);
  end;

  for i := 10 downto 1 do
  begin
    Writeln(i);
  end;
end;

/// <summary>
///  1-100的和
/// </summary>
procedure Sum();
var
  i: Integer;
  NumSum: Integer;
begin
  NumSum := 0;
  for i := 1 to 100 do
  begin
    NumSum := NumSum + i;
  end;
  Writeln('NumSum=',NumSum);
end;
/// <summary>
/// 求100内7的倍数的个数和求和
/// </summary>
procedure Num7Sum();
var
  i:Integer;
  NumSum:Integer;
  Count:Integer;
begin
  NumSum:=0;
  Count:=0;
  for i:= 1 to 100 do
  begin
    if ( i mod 7  ) = 0 then
    begin
      NumSum:=NumSum+i;
      Count:=Count+1;
    end;
  end;
  Writeln('100内7的倍数的和=',NumSum);
  Writeln('100内7的个数=',Count);
end;
begin
  Num7Sum();
  readln;
end.

