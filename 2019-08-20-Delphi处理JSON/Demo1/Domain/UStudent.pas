unit UStudent;

interface

type
  TStudent = class
  private
    FName: string;
    FAge: Integer;
    procedure SetAge(const Value: Integer);
    procedure SetName(const Value: string);
  public
    property Name: string read FName write SetName;
    property Age: Integer read FAge write SetAge;
    constructor Create(FName: string; FAge: Integer);overload;
  end;

implementation

{ TStudent }

constructor TStudent.Create(FName: string; FAge: Integer);
begin
  Self.FName := FName;
  Self.FAge := FAge;
end;

procedure TStudent.SetAge(const Value: Integer);
begin
  FAge := Value;
end;

procedure TStudent.SetName(const Value: string);
begin
  FName := Value;
end;

end.

