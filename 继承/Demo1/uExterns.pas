unit uExterns;

interface

type
  {定义一个类}
  TAnimal = class
  private
    {定义字段}
    FHeight: Integer;
    function GetHeight: Integer;
    procedure SetHeight(const Value: Integer);
  public
    {定义构造方法}
    constructor Create(FHeight: Integer);
    {定义属性}
    property _FHeight: Integer read GetHeight write SetHeight;
    {定义虚方法}
    procedure GetName(); virtual;
  end;
  {定义一个派生类,TDog继承于TAnimal}

  TDog = class(TAnimal)
  public
    constructor Create();
    procedure GetName(); override;
  end;

implementation
 { TAnimal }

{定义一个构造方法}
{ TDog }

constructor TDog.Create;
begin
  inherited Create(1001);     // 指定了方法名称，表示调用指定的方法，有重载的时候就需要这样
end;

constructor TAnimal.Create(FHeight: Integer);
begin
  Self._FHeight := FHeight;
end;

function TAnimal.GetHeight: Integer;
begin
  Result := Self.FHeight;
end;

procedure TAnimal.GetName;
begin
  Writeln('动物类的虚方法');
end;

procedure TAnimal.SetHeight(const Value: Integer);
begin
  Self.FHeight := Value;
end;

procedure TDog.GetName;
begin
  inherited;  // 没有指定具体方法名称，表示调用同名的父类方法
  Writeln('狗类的GetName');
end;

end.

