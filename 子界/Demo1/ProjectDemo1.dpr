program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
  {�ӽ����Ͷ���
    (1)�������ʽ type �ӽ�����=�Ͻ�..�½磻
    (2)���ӽ�Ҫ���Ͻ���½������������������� ���ͣ��ַ���ö������
    (3)���ӽ���Ͻ��������½磻
  }

type
  {ö������}
  //EColor = (RED, GREEN, BLUE);
  {�ӽ�}

  {TSubBoundNum = 1..10;

  TSubBoundChar = 'a'..'z';

  TSubBoundEnum = EColor.RED..EColor.BLUE; }
  {����һ����ݣ���ӡ��ƽ�껹�����꣬ÿ���µ���������������}
  {�ӽ磺�·�}
  TSubBoundMonth = 1..12;             // �����·�ȡֵ1..12
  {ö�٣�����}

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
  Writeln('������һ����ݣ���ʽΪYYYY');
  Readln(UserYear);
  Writeln('������һ���·�');
  Readln(UserMonth);
  IsLeapYear := False;    // Ĭ��Ϊƽ��
  // 1.����ܱ�4���� 2.����ܱ�100�������豻400����
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
    Writeln(UserYear,'������');
  end
  else
  begin
    Writeln(UserYear,'��ƽ��');
  end;

  if (UserMonth >= Low(Month)) and (UserMonth <= High(Month)) then
  begin
    if (UserMonth >= 1) and (UserMonth <= 3) then
    begin
      Writeln('��ǰ�Ǵ���', UserMonth, '�µ�������');
      case UserMonth of
        1:
          begin
            Writeln(31, '��');
          end;
        2:
          begin
            if IsLeapYear = True then
            begin
              Writeln(29, '��');
            end
            else
            begin
              Writeln(28, '��');
            end;
          end;
        3:
          begin
            Writeln(31, '��')
          end;
      end;
    end
    else if (UserMonth >= 4) and (UserMonth <= 6) then
    begin
      Writeln('��ǰ���ļ�', UserMonth, '�µ�������');
      case UserMonth of
        4:
          begin
            Writeln(30, '��');
          end;
        5:
          begin
            Writeln(31, '��');
          end;
        6:
          begin
            Writeln(30, '��');
          end;
      end;
    end
    else if (UserMonth >= 7) and (UserMonth <= 9) then
    begin
      Writeln('��ǰ���＾', UserMonth, '�µ�������');
      case UserMonth of
        7:
          begin
            Writeln(31, '��');
          end;
        8:
          begin
            Writeln(30, '��');
          end;
        9:
          begin
            Writeln(31, '��');
          end;
      end;
    end
    else if (UserMonth >= 10) and (UserMonth <= 12) then
    begin
      Writeln('��ǰ�Ƕ���', UserMonth, '�µ�������');
      case UserMonth of
        10:
          begin
            Writeln(31, '��');
          end;
        11:
          begin
            Writeln(30, '��');
          end;
        12:
          begin
            Writeln(31, '��');
          end;
      end;
    end;

  end
  else
  begin
    Writeln('�Բ�����������·ݴ���');
  end;

  Readln;
end.

