unit Unit2;

interface

type
  TStudent = class
  private
    FName: string;
    FAge: Integer;
    FId: string;
    procedure SetName(const Value: string);
    procedure SetAge(const Value: Integer);
    procedure SetId(const Value: string);
  public
    property Name: string read FName write SetName;
    property Age: Integer read FAge write SetAge;
    property Id: string read FId write SetId;
    constructor Create(FId: string; FName: string; FAge: Integer);
  end;

implementation

{ TStudent }

constructor TStudent.Create(FId: string; FName: string; FAge: Integer);
begin
  Self.FId := FId;
  Self.Name := FName;
  Self.Age := FAge;
end;

procedure TStudent.SetAge(const Value: Integer);
begin
  FAge := Value;
end;

procedure TStudent.SetId(const Value: string);
begin
  FId:=Value;
end;

procedure TStudent.SetName(const Value: string);
begin
  FName := Value;
end;

end.

