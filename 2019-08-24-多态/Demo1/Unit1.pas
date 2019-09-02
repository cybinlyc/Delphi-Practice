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
  Writeln('������');
end;

procedure TDog.Run;
begin
  Writeln('����');
end;

{ TCat }

procedure TCat.CatchMouse;
begin
  Writeln('èץ����');
end;

procedure TCat.Run;
begin
  Writeln('è����');
end;

end.

