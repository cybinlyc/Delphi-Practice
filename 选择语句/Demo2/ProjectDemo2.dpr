program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  i: Integer;
  // CTRL+W-��ʽ��������ʾ
begin
  i := 1;
  case i of
    1:
      begin
        Writeln('̨���һ��Ů����Ǿ');
      end;
    2:
      begin
        Writeln('̨���һ��Ů����־��');
      end;
  else
  begin
    Writeln('������');
  end;
  end;
  Readln;
end.

