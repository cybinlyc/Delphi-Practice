program ProjectTObjectDemo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Generics.Collections;

type
  { Declare a new object type. }
  TNewObject = class
  private
    FName: string;
  public
    constructor Create(const AName: string); overload;
    destructor Destroy(); override;
  end;

{ TNewObject }

constructor TNewObject.Create(const AName: string);
begin
  Self.FName := AName;
end;

destructor TNewObject.Destroy;
begin
   { Show a message whenever an object is destroyed. }
  writeln('Object "' + FName + '" was destroyed!');
  inherited;
end;

var
  List: TObjectList<TNewObject>;
  Obj: TNewObject;

begin
  { Create a new List. }
  { The OwnsObjects property is set by default to true -- the list will free the owned objects automatically. }
  List := TObjectList<TNewObject>.Create();
  {OwmObjects����ΪFalse��Removeɾ�������Աʱ�������Զ��ͷ�}
  //List.OwnsObjects := False;
  { Add some items to the List. }
  List.Add(TNewObject.Create('One'));
  List.Add(TNewObject.Create('Two'));

  { Add a new item, but keep the reference. }
  Obj := TNewObject.Create('Three');
  List.Add(Obj);
  {
    Remove an instance of the TNewObject class. The destructor
    is called for the owned objects, because you have set the OwnsObjects
    to true.
  }
  List.Delete(0);
  {ɾ��0��Ŀ��Obj��Ϊ��1��Ŀ}
  //List.Delete(1);
  {ʹ��Extract���Ƴ�Obj���󣬷���Obj���󣬵��ǲ����Զ��ͷ�}
  List.Extract(Obj);
  { Destroy the List completely -- more message boxes will be shown. }
  List.Free;
  readln;
end.

