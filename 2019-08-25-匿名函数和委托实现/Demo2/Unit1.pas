unit Unit1;

interface
type
{�ӿ�}
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
    {��������Eatί��ʵ��IEat�ӿڣ�Eat������IEat�������ˡ�ʵ���н�ʵ����IEat�ӿڵ��ำֵ��Eat���ɣ�
    Ҳ���Ƕ�̬���̳��˽ӿڵ�����Ը�ֵ���ӿڱ���}
      property Eat:IEat read FEat write FEat implements IEat;
  end;
implementation

{ TDog }

function TDog.Eating: Integer;
begin
  Writeln('���Զ���');
end;

end.
