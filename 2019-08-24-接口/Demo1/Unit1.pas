unit Unit1;

interface
type
{定义一个接口}
  IUsb = interface
    {CTRL+SHIRT+G}
    ['{ED730D3E-D5C7-4C40-9FB9-5254BFD2CB93}']
    {接口中只能写方法的声明}
    procedure read();
  end;
  IUsb2 = interface
    ['{08F4788F-E07E-4CF3-BF1A-65073AE21FA0}']
    procedure write();
  end;
  {接口也可以继承}
  IUsb3 = interface(IUsb2)
  end;
  {定义一个类,将类和接口关联起来，在类中实现接口的方法}
  {类可以跟多个接口关联}
  TComputor = class(TInterfacedObject,IUsb2)
    procedure write();
  end;
  {因为Delphi中是单继承，想要一个类跟接口关联起来，必须要继承于TInterfacedObject,
  同时，这个类又想继承于另一个类，那就只能要继承的另一个类继承于TInterfacedObject}
  TLabtop = class(TComputor,IUsb)
    procedure read();
  end;
implementation

{ TComputor }

procedure TComputor.write;
begin

end;

{ TLabtop }

procedure TLabtop.read;
begin

end;

end.
