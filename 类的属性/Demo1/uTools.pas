unit uTools;

interface
{��������,�˴������ⲿ��������}

uses
  uDemo;

type
  TPerson = class
    {�ֶΣ���}
  private
    FName: string;
    FAge:Integer;
    function GetAge():Integer;
    procedure SetAge(FAge:Integer);
  public
  {����}
  // NameΪ�ⲿ���Է��ʵ����ԣ��������ǵ���FName��д����д��FName;
    property Name: string read FName write FName;
    property Age:Integer read GetAge write SetAge;
  end;

implementation
{ʵ������}

{ TPerson }

function TPerson.GetAge: Integer;
begin
  Result:=Self.FAge;
end;

procedure TPerson.SetAge(FAge: Integer);
begin
  Self.FAge:=FAge;
end;

initialization
{��ʼ������}



finalization
{��������}

end.

