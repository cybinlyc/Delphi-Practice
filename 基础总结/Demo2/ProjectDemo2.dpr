program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  {定义一个学生的记录类型}
  TStudent = record
    Name: string;
    Id: string;
  end;
  {数组，存储信息}

  TStudentList = array of TStudent;

var
  StudentList: TStudentList;
{选择菜单}

procedure ShowMenu();
begin
  Writeln('');
  Writeln('*********学生信息管理系统***********');
  Writeln('1、添加信息');
  Writeln('2、删除信息');
  Writeln('3、查询信息');
  Writeln('4、修改信息');
  Writeln('************************************');
end;
{添加信息功能}

procedure AddStudent();
var
  Student: TStudent;
  ArrayLength: Integer;
  MyGuid0: TGUID;
  Str: string;
begin
  Writeln('您选择了添加功能，请输入学生姓名：');
  ArrayLength := Length(StudentList);
  { Generating a random GUID. }
  CreateGUID(MyGuid0);
  Student.Id := GUIDToString(MyGuid0);
  {将用户输入的内容赋值给记录类型的Name变量}
  Readln(Student.Name);
  Insert(Student, StudentList, ArrayLength - 1);
  if Length(StudentList) > ArrayLength then
  begin
    Writeln('添加成功');
  end
  else
  begin
    Writeln('添加失败');
  end;
end;
{查询所有信息}

procedure ListStudent();
var
  Student: TStudent;
begin
  Writeln('您选择了查询功能，信息列表如下:');
  for Student in StudentList do
  begin
    {with语句}
    with Student do
    begin
      Writeln('Id:', Id, '姓名：', Name);
    end;
  end;
end;
{删除功能}

procedure DeleteStduent();
var
  Student: TStudent;
  UserName: string;
  IsTrue: string;
  Indexs: Integer;
  ArrayLength: Integer;
begin
  Indexs := 0;
  Writeln('您选择了删除功能，请输入要删除的学生姓名：');
  Readln(UserName);
  ArrayLength := Length(StudentList);
  for Student in StudentList do
  begin
    {with语句}
    with Student do
    begin
      if UserName = Name then
      begin
        {删除操作一般慎用，需要用户二次确认}
        Writeln('你确认要删除【', Id, Name, '】信息吗？Y/N');
        Readln(IsTrue);
        if IsTrue = 'Y' then
        begin
          Delete(StudentList, Indexs, 1);
          if Length(StudentList) < ArrayLength then
          begin
            Writeln('删除成功');
          end
          else
          begin
            Writeln('删除失败');
          end;
        end;
        Exit;
      end;
    end;
    Inc(Indexs);
  end;
end;
{修改信息}

procedure UpdateStudent();
var
  UserName: string;
  I: Integer;
  IsExist:Boolean;
begin
  Writeln('您选择了修改功能，请输入要修改的学生名字');
  Readln(UserName);
  IsExist:=False;
  for I := Low(StudentList) to High(StudentList) do
  begin
    with StudentList[I] do
    begin
      if UserName = Name then
      begin
        Writeln('请输入新的名字：');
        Readln(Name);
        IsExist:=True;
        break;
      end;
    end;
  end;
  if IsExist=False then
  begin
    Writeln('修改失败，查无此人');
  end;
end;
{用户选择功能}

procedure UserChoose();
var
  UserChooseIndex: Integer;
begin
  Writeln('请输入您要选择的功能:');
  {获取用户输入的编号}
  Readln(UserChooseIndex);
  {判断用户输入的编号}
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
      Writeln('输入有误');
    end;
  end;
end;

begin
  {初始化赋值}
  StudentList := [];
  while True do
  begin
    ShowMenu();
    UserChoose();
  end;
  Readln;
end.

