unit uPerson;

interface

type
  TAnimal = class
  public
    procedure Talk;
    {���ⷽ��}
    function Run(): Integer; virtual;
    {��̬����}
    procedure Eat(); dynamic;
    {�෽��}
    class procedure Drink;
    {���󷽷�,�淶��һ��ָ�涨}
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
  Write('���췽��ִ����');
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
  {һ������£�������鷽����һ����ʵ��}
  {�鷽��һ���ʾһ�������������ܣ�����ʵ�ָ��ݲ�ͬ�����в�ͬʵ�ַ������鷽������������ʵ�ֵľ��幦��}
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
  Writeln('��������');
end;

procedure TDog.Sleep;
begin
  Writeln('TDog Sleep');
end;

end.

