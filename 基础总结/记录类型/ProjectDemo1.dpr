program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
type
{����һ��ѧ���ļ�¼}
  TStudent = record
  Id:Integer;
  Name:string;
  end;
var
  ZhangSanStudent:TStudent;
begin
  ZhangSanStudent.Id:=1000110;
  ZhangSanStudent.Name := '����';
end.
