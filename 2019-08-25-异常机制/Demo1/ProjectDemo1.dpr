program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

{*------------------------------------------------------------------------------
  1��ʲô���쳣
  2���쳣��ʲô�ã�
-------------------------------------------------------------------------------}

type
{�����Լ����쳣��}
  EMyMathException = class(Exception)
  end;

procedure MyDivFun(Num1, Num2: Integer);
begin
{����Ϊ0���׳��쳣}
  if Num2 = 0 then
  begin
    raise EMyMathException.Create('����������Ϊ0');
  end
  else
  begin
    Writeln(Num1 div Num2);
  end;

end;

begin
  try
    try
      MyDivFun(10, 0);
    except      // �����쳣��ִ��
      on E: EMyMathException do
      begin
        Writeln(E.Message, '----');
        Writeln(E.ClassName, ',', E.UnitName);
      end;
      on E: Exception do
      begin
        Writeln(E.Message);
      end;
    end;
  finally   {�ܱ�ִ�У������ͷ���Դ}
    Writeln('��Դ�ͷ�');
    Readln;
  end;

end.

