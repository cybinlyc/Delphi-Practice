program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
type
{定义一个学生的记录}
  TStudent = record
  Id:Integer;
  Name:string;
  end;
var
  ZhangSanStudent:TStudent;
begin
  ZhangSanStudent.Id:=1000110;
  ZhangSanStudent.Name := '张三';
end.
