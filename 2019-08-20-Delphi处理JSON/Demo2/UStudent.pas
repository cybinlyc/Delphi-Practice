unit UStudent;

interface

uses
  System.SysUtils,Vcl.Dialogs;

type
  TStudent = class
  private
    FFirstName: string;
    FSecondName: string;
    FAge: Integer;
    FLike: TArray<string>;
    procedure SetAge(const Value: Integer);
    procedure SetFirstName(const Value: string);
    procedure SetSecondName(const Value: string);
    procedure SetLike(const Value: TArray<string>);
  public
    property FirstName: string read FFirstName write SetFirstName;
    property SecondName: string read FSecondName write SetSecondName;
    property Age: Integer read FAge write SetAge;
    property Like: TArray<string> read FLike write SetLike;
    constructor Create(FFirstName: string; FSecondName: string; FAge: Integer); overload;
  end;

implementation

{ TStudent }

constructor TStudent.Create(FFirstName, FSecondName: string; FAge: Integer);
begin
  Self.FFirstName := FFirstName;
  Self.FSecondName := FSecondName;
  Self.FAge := FAge;
end;

procedure TStudent.SetAge(const Value: Integer);
begin
  FAge := Value;
end;

procedure TStudent.SetFirstName(const Value: string);
begin
  FFirstName := Value;
end;

procedure TStudent.SetLike(const Value: TArray<string>);
var
  Num: Integer;
begin
  // 动态数组，必须先设定长度才能赋值，否则出错
  SetLength(FLike, 10);
  for Num := Low(Value) to High(Value) do
  begin
    // 最多能有10个爱好
    if Num > 9 then
    begin
      ShowMessage('爱好不能超过10个');
      Break;
    end;
    FLike[Num] := Value[Num];
  end;
end;

procedure TStudent.SetSecondName(const Value: string);
begin
  FSecondName := Value;
end;

end.

