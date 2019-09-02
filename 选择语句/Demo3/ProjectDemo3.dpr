program ProjectDemo3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{*------------------------------------------------------------------------------
  判断分数

-------------------------------------------------------------------------------}

procedure JudgeScore();
var
  Score: Integer;
begin
  Writeln('请输入需要判断的分数');
  Readln(Score);
  if Score >= 60 then
  begin
    Writeln('考试合格');
  end
  else
  begin
    Writeln('考试不合格');
  end;
end;

{*------------------------------------------------------------------------------
  判断季节

  @param Month
-------------------------------------------------------------------------------}
procedure JudgeSeason(Month: Integer);
begin
  case Month of
    3:
      begin
        Writeln('春天');
      end;
    4:
      begin
        Writeln('春天');
      end;
    5:
      begin
        Writeln('春天');
      end;
    6:
      begin
        Writeln('夏天');
      end;
    7:
      begin
        Writeln('夏天');
      end;
    8:
      begin
        Writeln('夏天');
      end;
    9:
      begin
        Writeln('秋天');
      end;
    10:
      begin
        Writeln('秋天');
      end;
    11:
      begin
        Writeln('秋天');
      end;
    12:
      begin
        Writeln('冬天');
      end;
    1:
      begin
        Writeln('冬天');
      end;
    2:
      begin
        Writeln('冬天');
      end;
  else
  begin
    Writeln('此月份无法判断');
  end;
  end;
end;

begin
  JudgeScore();
  JudgeSeason(14);
  Readln;
end.

