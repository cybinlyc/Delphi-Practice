unit Unit2;

interface
  type
    TStudent = class
      private
        FName:string;
    procedure SetName(const Value: string);
      public
        property Name:string  read FName write SetName;
        //constructor Create;overload;
        constructor Create(FName:string);overload;
    end;
implementation

{ TStudent }
{
constructor TStudent.Create;
begin
  //调用父类的构造方法
  inherited;
end;
}
constructor TStudent.Create(FName: string);
begin
  Self.Name:=FName;
end;

procedure TStudent.SetName(const Value: string);
begin
  FName := Value;
end;

end.
