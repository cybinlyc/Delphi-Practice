unit uPerson;

interface

type
  TAnimal = class
  public
    procedure Talk;
    {虚拟方法}
    function Run(): Integer; virtual;
    {动态方法}
    procedure Eat(); dynamic;
    {类方法}
    class procedure Drink;
    {抽象方法,规范，一般指规定}
    procedure Sleep;virtual;abstract;

  end;

type
  TDog = class(TAnimal)
  public
    function Run(): Integer;
    procedure Eat();
    constructor Create();
    procedure Sleep;
  end;

implementation

{ TPerson }

constructor TDog.Create;
begin
  Write('构造方法执行了');
end;

class procedure TAnimal.Drink;
begin
  Writeln('Drink');
end;

procedure TAnimal.Eat;
begin

end;

function TAnimal.Run: Integer;
begin
  {一般情况下，父类的虚方法有一个空实现}
  {虚方法一般表示一个类具有这个功能，功能实现根据不同子类有不同实现方法，虚方法是留给子类实现的具体功能}
end;

procedure TAnimal.Talk;
begin
  Writeln('Talk');
end;

{ TDog }

procedure TDog.Eat;
begin
  Writeln('Dog Eat');
end;

function TDog.Run: Integer;
begin
  Writeln('四条腿跑');
end;

procedure TDog.Sleep;
begin
  Writeln('TDog Sleep');
end;

end.

