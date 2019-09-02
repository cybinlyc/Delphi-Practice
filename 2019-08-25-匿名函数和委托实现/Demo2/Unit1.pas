unit Unit1;

interface
type
{接口}
  IEat  = interface
    function Eating():Integer;
  end;
  TDog = class(TInterfacedObject,IEat)
    public
      function Eating():Integer;
  end;
  TCat = class(TInterfacedObject,IEat)
    private
      FEat:IEat;
    public
    {利用属性Eat委托实现IEat接口，Eat必须是IEat的类型了。实际中将实现了IEat接口的类赋值给Eat即可，
    也就是多态，继承了接口的类可以赋值给接口变量}
      property Eat:IEat read FEat write FEat implements IEat;
  end;
implementation

{ TDog }

function TDog.Eating: Integer;
begin
  Writeln('狗吃东西');
end;

end.
