program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

{����ֵ}
{1��result����ֵ}
{�������أ���������ͬ�������б�ͬ�����������ĸ��������͡�ʹ�ùؼ���overload }

function Add(Number0: Integer; Number1: Integer): Integer; overload;
begin
  Result := Number0 + Number1;
  {Result��û��C������return�����������߳���Ĺ��ܣ�Ҫ����������ʹ��Exit����}
  Exit;
end;
{�������أ���������ͬ�������б�ͬ��ʹ�ùؼ���overload}

function Add(Number0: Double; Number1: Double): Double; overload;
begin
  Result := Number0 + Number1;
  {Result��û��C������return�����������߳���Ĺ��ܣ�Ҫ����������ʹ��Exit����}
  Exit;
end;

{forward�ؼ���ǰ������}
function mun(Number0: Integer; Number1: Integer; out Sum: Integer): Integer; forward;

function get(Number0: Integer; Number1: Integer): Integer; forward;
{2��ʹ��var�ؼ��֣����õ����õ�����ֵ}

function Add1(Number0: Integer; Number1: Integer; var Sum: Integer): Integer;
begin
  Sum := Number0 + Number1;
end;
{3��ʹ��out�ؼ��ֵĽ��������}

function mun(Number0: Integer; Number1: Integer; out Sum: Integer): Integer;
begin
  Sum := Number0 * Number1;
end;
{4��ʹ�ú������õ���ȡ���}

function get(Number0: Integer; Number1: Integer): Integer;
begin
  get := Number0 + Number1;
end;

begin

end.

