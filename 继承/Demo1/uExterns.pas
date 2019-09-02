unit uExterns;

interface

type
  {����һ����}
  TAnimal = class
  private
    {�����ֶ�}
    FHeight: Integer;
    function GetHeight: Integer;
    procedure SetHeight(const Value: Integer);
  public
    {���幹�췽��}
    constructor Create(FHeight: Integer);
    {��������}
    property _FHeight: Integer read GetHeight write SetHeight;
    {�����鷽��}
    procedure GetName(); virtual;
  end;
  {����һ��������,TDog�̳���TAnimal}

  TDog = class(TAnimal)
  public
    constructor Create();
    procedure GetName(); override;
  end;

implementation
 { TAnimal }

{����һ�����췽��}
{ TDog }

constructor TDog.Create;
begin
  inherited Create(1001);     // ָ���˷������ƣ���ʾ����ָ���ķ����������ص�ʱ�����Ҫ����
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
  Writeln('��������鷽��');
end;

procedure TAnimal.SetHeight(const Value: Integer);
begin
  Self.FHeight := Value;
end;

procedure TDog.GetName;
begin
  inherited;  // û��ָ�����巽�����ƣ���ʾ����ͬ���ĸ��෽��
  Writeln('�����GetName');
end;

end.

