program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  i: Integer;
  // CTRL+W-格式化代码显示
begin
  i := 1;
  case i of
    1:
      begin
        Writeln('台湾第一美女：萧蔷');
      end;
    2:
      begin
        Writeln('台湾第一美女：林志玲');
      end;
  else
  begin
    Writeln('林心如');
  end;
  end;
  Readln;
end.

