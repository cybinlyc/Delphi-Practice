program ProjectDemo3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{*------------------------------------------------------------------------------
  �жϷ���

-------------------------------------------------------------------------------}

procedure JudgeScore();
var
  Score: Integer;
begin
  Writeln('��������Ҫ�жϵķ���');
  Readln(Score);
  if Score >= 60 then
  begin
    Writeln('���Ժϸ�');
  end
  else
  begin
    Writeln('���Բ��ϸ�');
  end;
end;

{*------------------------------------------------------------------------------
  �жϼ���

  @param Month
-------------------------------------------------------------------------------}
procedure JudgeSeason(Month: Integer);
begin
  case Month of
    3:
      begin
        Writeln('����');
      end;
    4:
      begin
        Writeln('����');
      end;
    5:
      begin
        Writeln('����');
      end;
    6:
      begin
        Writeln('����');
      end;
    7:
      begin
        Writeln('����');
      end;
    8:
      begin
        Writeln('����');
      end;
    9:
      begin
        Writeln('����');
      end;
    10:
      begin
        Writeln('����');
      end;
    11:
      begin
        Writeln('����');
      end;
    12:
      begin
        Writeln('����');
      end;
    1:
      begin
        Writeln('����');
      end;
    2:
      begin
        Writeln('����');
      end;
  else
  begin
    Writeln('���·��޷��ж�');
  end;
  end;
end;

begin
  JudgeScore();
  JudgeSeason(14);
  Readln;
end.

