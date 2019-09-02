unit uTools;

interface
{声明区域,此处声明外部可以引用}

uses
  uDemo;

type
  TPerson = class
    {字段，域}
  private
    FName: string;
    FAge:Integer;
    function GetAge():Integer;
    procedure SetAge(FAge:Integer);
  public
  {属性}
  // Name为外部可以访问的属性，它读就是调用FName，写就是写进FName;
    property Name: string read FName write FName;
    property Age:Integer read GetAge write SetAge;
  end;

implementation
{实现区域}

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
{初始化区域}



finalization
{销毁区域}

end.

