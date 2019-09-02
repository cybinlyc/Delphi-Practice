unit UnitDao;

interface

uses
  Vcl.Dialogs, Unit2, System.Generics.Collections;

type
  TDao = class
  public
      {该方法不用创建对象}
    {添加}
    class procedure Add(Student: TStudent);
    {查询}
    class function ListStu(): TDictionary<string, TStudent>;
    {清空}
    class procedure Clear;
  end;

implementation
var
  // 初始化容器类
  Students: TDictionary<string, TStudent>;

{ TDao }

class procedure TDao.Add(Student: TStudent);
begin
  if not Students.ContainsKey(Student.Id) then
  begin
    Students.Add(Student.Id, Student);
  end
  else
  begin
    ShowMessage('Id 重复');
  end;
end;

class procedure TDao.Clear;
begin
  Students.Clear;
end;

class function TDao.ListStu: TDictionary<string, TStudent>;
begin
  Result := Students;
end;

initialization
  Students := TDictionary<string, TStudent>.Create();

end.

