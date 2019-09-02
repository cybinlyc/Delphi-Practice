program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
  {子界类型定义
    (1)、定义格式 type 子界名称=上界..下界；
    (2)、子界要求上界和下界必须是有序的数据类型 整型，字符，枚举类型
    (3)、子界的上界必须大于下界；
  }

type
  {枚举类型}
  //EColor = (RED, GREEN, BLUE);
  {子界}

  {TSubBoundNum = 1..10;

  TSubBoundChar = 'a'..'z';

  TSubBoundEnum = EColor.RED..EColor.BLUE; }
  {给出一个年份，打印出平年还是闰年，每个月的天数和所属季节}
  {子界：月份}
  TSubBoundMonth = 1..12;             // 限制月份取值1..12
  {枚举：季节}

  ESeason = (SPRING, SUMMER, AUTUMN, WINTER);

var
  Month: TSubBoundMonth;
  UserYear: Integer;
  UserMonth: Integer;
  IsLeapYear: Boolean;

begin
  {writeln(Low(TSubBoundNum));
  writeln(Low(TSubBoundChar));
  Writeln(Ord(Low(TSubBoundEnum)));}
  Writeln('请输入一个年份，格式为YYYY');
  Readln(UserYear);
  Writeln('请输入一个月份');
  Readln(UserMonth);
  IsLeapYear := False;    // 默认为平年
  // 1.年份能被4整除 2.年份能被100整除，需被400整除
  if UserYear mod 4 = 0 then
  begin
    if UserYear mod 100 = 0 then
    begin
      if UserYear mod 400 = 0 then
      begin
        IsLeapYear := True;
      end;
    end
    else
    begin
      IsLeapYear := True;
    end;
  end;
  if IsLeapYear=True then
  begin
    Writeln(UserYear,'是闰年');
  end
  else
  begin
    Writeln(UserYear,'是平年');
  end;

  if (UserMonth >= Low(Month)) and (UserMonth <= High(Month)) then
  begin
    if (UserMonth >= 1) and (UserMonth <= 3) then
    begin
      Writeln('当前是春季', UserMonth, '月的天数是');
      case UserMonth of
        1:
          begin
            Writeln(31, '天');
          end;
        2:
          begin
            if IsLeapYear = True then
            begin
              Writeln(29, '天');
            end
            else
            begin
              Writeln(28, '天');
            end;
          end;
        3:
          begin
            Writeln(31, '天')
          end;
      end;
    end
    else if (UserMonth >= 4) and (UserMonth <= 6) then
    begin
      Writeln('当前是夏季', UserMonth, '月的天数是');
      case UserMonth of
        4:
          begin
            Writeln(30, '天');
          end;
        5:
          begin
            Writeln(31, '天');
          end;
        6:
          begin
            Writeln(30, '天');
          end;
      end;
    end
    else if (UserMonth >= 7) and (UserMonth <= 9) then
    begin
      Writeln('当前是秋季', UserMonth, '月的天数是');
      case UserMonth of
        7:
          begin
            Writeln(31, '天');
          end;
        8:
          begin
            Writeln(30, '天');
          end;
        9:
          begin
            Writeln(31, '天');
          end;
      end;
    end
    else if (UserMonth >= 10) and (UserMonth <= 12) then
    begin
      Writeln('当前是冬季', UserMonth, '月的天数是');
      case UserMonth of
        10:
          begin
            Writeln(31, '天');
          end;
        11:
          begin
            Writeln(30, '天');
          end;
        12:
          begin
            Writeln(31, '天');
          end;
      end;
    end;

  end
  else
  begin
    Writeln('对不起，你输入的月份错误');
  end;

  Readln;
end.

