program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  {����һ��ѧ���ļ�¼����}
  TStudent = record
    Name: string;
    Id: string;
  end;
  {���飬�洢��Ϣ}

  TStudentList = array of TStudent;

var
  StudentList: TStudentList;
{ѡ��˵�}

procedure ShowMenu();
begin
  Writeln('');
  Writeln('*********ѧ����Ϣ����ϵͳ***********');
  Writeln('1�������Ϣ');
  Writeln('2��ɾ����Ϣ');
  Writeln('3����ѯ��Ϣ');
  Writeln('4���޸���Ϣ');
  Writeln('************************************');
end;
{�����Ϣ����}

procedure AddStudent();
var
  Student: TStudent;
  ArrayLength: Integer;
  MyGuid0: TGUID;
  Str: string;
begin
  Writeln('��ѡ������ӹ��ܣ�������ѧ��������');
  ArrayLength := Length(StudentList);
  { Generating a random GUID. }
  CreateGUID(MyGuid0);
  Student.Id := GUIDToString(MyGuid0);
  {���û���������ݸ�ֵ����¼���͵�Name����}
  Readln(Student.Name);
  Insert(Student, StudentList, ArrayLength - 1);
  if Length(StudentList) > ArrayLength then
  begin
    Writeln('��ӳɹ�');
  end
  else
  begin
    Writeln('���ʧ��');
  end;
end;
{��ѯ������Ϣ}

procedure ListStudent();
var
  Student: TStudent;
begin
  Writeln('��ѡ���˲�ѯ���ܣ���Ϣ�б�����:');
  for Student in StudentList do
  begin
    {with���}
    with Student do
    begin
      Writeln('Id:', Id, '������', Name);
    end;
  end;
end;
{ɾ������}

procedure DeleteStduent();
var
  Student: TStudent;
  UserName: string;
  IsTrue: string;
  Indexs: Integer;
  ArrayLength: Integer;
begin
  Indexs := 0;
  Writeln('��ѡ����ɾ�����ܣ�������Ҫɾ����ѧ��������');
  Readln(UserName);
  ArrayLength := Length(StudentList);
  for Student in StudentList do
  begin
    {with���}
    with Student do
    begin
      if UserName = Name then
      begin
        {ɾ������һ�����ã���Ҫ�û�����ȷ��}
        Writeln('��ȷ��Ҫɾ����', Id, Name, '����Ϣ��Y/N');
        Readln(IsTrue);
        if IsTrue = 'Y' then
        begin
          Delete(StudentList, Indexs, 1);
          if Length(StudentList) < ArrayLength then
          begin
            Writeln('ɾ���ɹ�');
          end
          else
          begin
            Writeln('ɾ��ʧ��');
          end;
        end;
        Exit;
      end;
    end;
    Inc(Indexs);
  end;
end;
{�޸���Ϣ}

procedure UpdateStudent();
var
  UserName: string;
  I: Integer;
  IsExist:Boolean;
begin
  Writeln('��ѡ�����޸Ĺ��ܣ�������Ҫ�޸ĵ�ѧ������');
  Readln(UserName);
  IsExist:=False;
  for I := Low(StudentList) to High(StudentList) do
  begin
    with StudentList[I] do
    begin
      if UserName = Name then
      begin
        Writeln('�������µ����֣�');
        Readln(Name);
        IsExist:=True;
        break;
      end;
    end;
  end;
  if IsExist=False then
  begin
    Writeln('�޸�ʧ�ܣ����޴���');
  end;
end;
{�û�ѡ����}

procedure UserChoose();
var
  UserChooseIndex: Integer;
begin
  Writeln('��������Ҫѡ��Ĺ���:');
  {��ȡ�û�����ı��}
  Readln(UserChooseIndex);
  {�ж��û�����ı��}
  case UserChooseIndex of
    1:
      begin
        AddStudent();
      end;
    2:
      begin
        DeleteStduent();
      end;
    3:
      begin
        ListStudent();
      end;
    4:
      begin
        UpdateStudent();
      end;
  else
    begin
      Writeln('��������');
    end;
  end;
end;

begin
  {��ʼ����ֵ}
  StudentList := [];
  while True do
  begin
    ShowMenu();
    UserChoose();
  end;
  Readln;
end.

