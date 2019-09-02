program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

{*------------------------------------------------------------------------------
  1、什么是异常
  2、异常有什么用？
-------------------------------------------------------------------------------}

type
{定义自己的异常类}
  EMyMathException = class(Exception)
  end;

procedure MyDivFun(Num1, Num2: Integer);
begin
{除数为0，抛出异常}
  if Num2 = 0 then
  begin
    raise EMyMathException.Create('被除数不能为0');
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
    except      // 发生异常则执行
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
  finally   {总被执行，用于释放资源}
    Writeln('资源释放');
    Readln;
  end;

end.

