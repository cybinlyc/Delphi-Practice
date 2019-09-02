unit Unit1;

interface

type
  IEat = interface
  end;

  TAnimal = class(TInterfacedObject)
  public
    procedure Run; virtual; abstract;
  end;

  TDog = class(TAnimal, IEat)
    procedure Run; override;
    procedure LookDog;
  end;

  TCat = class(TAnimal)
    public
    procedure Run; override;
    procedure CatchMouse;
  end;

implementation

{ TDog }

procedure TDog.LookDog;
begin
  Writeln('狗看门');
end;

procedure TDog.Run;
begin
  Writeln('狗跑');
end;

{ TCat }

procedure TCat.CatchMouse;
begin
  Writeln('猫抓老鼠');
end;

procedure TCat.Run;
begin
  Writeln('猫在跑');
end;

end.

