unit UnitDemo3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;


type
  TForm1 = class(TForm)
    btnRead: TButton;
    mmoDisplay: TMemo;
    procedure btnReadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // 函数声明
  function MyFileRead(Path:string;Num:Integer;readPos:Integer): TBytes;
  function MyFileWrite(Path:string;Num:Integer;writePos:Integer): TBytes;
  function MyEcgCaculation(ecgBuff:TBytes): Integer;
var
  Form1: TForm1;
const
  SOURCE_PATH = 'D:\ecgTest.txt';
  NUM_READ:Integer = 10000;
implementation
  // 函数实现
  function MyFileWrite(Path:string;Num:Integer;writePos:Integer): TBytes;
  var
    WriteFileStream:TFileStream;
  begin
    try
      // 只读方式打开
      WriteFileStream := TFileStream.Create(path, fmOpenWrite);
      WriteFileStream.Seek(writePos,soFromBeginning);
    finally
      // 释放资源
      FreeAndNil(WriteFileStream);
    end;
  end;

  function MyFileRead(path:string;num:Integer;readPos:Integer): TBytes;
  var
    ReadFileStream:TFileStream;
  begin
    Result := nil;
    // 文件不存在则结束读取
    if (not FileExists(path)) then
      Exit;
    try
      // 只读方式打开
      ReadFileStream := TFileStream.Create(path, fmOpenRead);
      // 判断剩下的字节数目是否足够
      if( ReadFileStream.Size-readPos < NUM_READ ) then
      begin
        Num := ReadFileStream.Size-readPos;
      end;
      // 设定TBytes数组长度
      SetLength(Result, Num);
      ReadFileStream.Seek(readPos,soFromBeginning);
      // 读num个字节
      ReadFileStream.Read(Result, num);
    finally
      // 释放资源
      FreeAndNil(ReadFileStream);
    end;
  end;

  function MyEcgCaculation(ecgBuff:TBytes): Integer;
  var
    EcgReadPosition:Integer;      // ecg数据读取位置
    EcgReadPositionOld:Integer;   // ecg数据读取位置
    tmpReadPosition:Integer;
    datPackSize:Integer;          // 从包中取得的长度
    ecgNumSize:Integer;           // 根据标志计算得到ECG包长
    kk:Byte;                          // 通道数码
  begin
    EcgReadPosition :=0;
    EcgReadPositionOld :=0;
    tmpReadPosition:=0;
    datPackSize:=0;
    ecgNumSize:=0;
  // 最小的包FMT21为17个字节
  while EcgReadPosition < ( Length(ecgBuff)-17 + 1 ) do
  begin
    { 判断数据 }
    ShowMessage('1:EcgReadPosition='+IntToStr(EcgReadPosition));
    if (ecgBuff[EcgReadPosition+0]=$7f) and (ecgBuff[EcgReadPosition+1]=$7f) then
    begin
      EcgReadPositionOld := EcgReadPosition;      // 保存当前读取位置
      datPackSize:=ecgBuff[EcgReadPosition+2]+ecgBuff[EcgReadPosition+3]*256;
      // 数据已不足
      if( Length(ecgBuff)- EcgReadPosition)< datPackSize then
      begin
        Result := EcgReadPositionOld;
        Exit;
      end;
      // 判断格式 FMT22
      if ecgBuff[EcgReadPosition+5]=22 then      // 判断FMT格式    22数据包
      begin
        for kk := 1 to ecgBuff[EcgReadPosition+7+4] do
        begin
          tmpReadPosition:= ecgNumSize+EcgReadPosition+13;
          // 防止超界
          if( tmpReadPosition >= Length(ecgBuff) ) then
          begin
            Result:= EcgReadPositionOld;
            Exit;
          end;
          // and两边是整数型，则是按位与
          if ecgBuff[tmpReadPosition] and $07 = 0 then
          begin
            Inc(ecgNumSize,101);
          end
          else
          begin
            Inc(ecgNumSize,52);
          end;
        end;
        // 数据总长度+头部长度
        Inc(ecgNumSize,13);
        // 判断计算得到的长度和包内给定长度是否一致
        if(ecgNumSize<>datPackSize) then
        begin
          // 输出提示
          Form1.mmoDisplay.Lines.Add('ecgNumSize='+IntToStr(ecgNumSize));
          Form1.mmoDisplay.Lines.Add('datPackSize='+IntToStr(datPackSize));
          Form1.mmoDisplay.Lines.Add('FMT22 Lost');
          // 重新查找开始的头部7f 7f
          while ( EcgReadPosition < ( Length(ecgBuff)-1 ) ) do
          begin
            Inc(EcgReadPosition,1);
            if ( ecgBuff[EcgReadPosition]= $7f )and(ecgBuff[EcgReadPosition+1]= $7f) then
            begin
               Break;
            end;
          end;
          // 数据部分丢失
          {if (EcgReadPosition-EcgReadPositionOld)<datPackSize then
          begin
            Form1.mmoDisplay.Lines.Add('FMT22 error from lost data.');
          end;        }
          // 数据已全部读完，没有头部
          if(EcgReadPosition>=Length(ecgBuff)-1) then
          begin
            Result:= EcgReadPositionOld;
            Exit;
          end;
        end
        else
        begin
          Inc(EcgReadPosition,ecgNumSize);
        end;

      end
      else if ecgBuff[EcgReadPosition+5]=20 then   // 判断FMT格式  20空闲包
      begin
        ecgNumSize:=datPackSize;
        if ecgNumSize<>24 then
        begin
          Form1.mmoDisplay.Lines.Add('FMT20 Dat Error.datPackSize='+IntToStr(datPackSize));
        end;

        tmpReadPosition:= EcgReadPosition+24+2;    // 需要判断后面的字节是否为7f 7f来判断数据是否完整
        // 防止超界
        if( tmpReadPosition >= Length(ecgBuff) ) then
        begin
          Result:= EcgReadPositionOld;
          Exit;
        end;

        if ( ecgBuff[EcgReadPosition] <> $7f )or(ecgBuff[EcgReadPosition+1]<> $7f) then
        begin
          Form1.mmoDisplay.Lines.Add('FMT20 Dat Lost.');
          // 重新查找开始的头部7f 7f
          while ( EcgReadPosition < ( Length(ecgBuff)-1 ) ) do
          begin
            Inc(EcgReadPosition,1);
            if ( ecgBuff[EcgReadPosition]= $7f )and(ecgBuff[EcgReadPosition+1]= $7f) then
            begin
               Break;
            end;
          end;

          // 数据已全部读完，没有头部
          if(EcgReadPosition>=Length(ecgBuff)-1) then
          begin
            Result:= EcgReadPositionOld;
            Exit;
          end;
        end
        else
        begin
          Inc(EcgReadPosition,ecgNumSize);
        end;
      end
      else if ecgBuff[EcgReadPosition+5]=21 then   // 判断FMT格式  21信息包
      begin
        ecgNumSize:=datPackSize;
        if ecgNumSize<>17 then
        begin
          Form1.mmoDisplay.Lines.Add('FMT21 Dat Error.datPackSize='+IntToStr(datPackSize));
        end;

        tmpReadPosition:= EcgReadPosition+17+2;    // 需要判断后面的字节是否为7f 7f来判断数据是否完整
        // 防止超界
        if( tmpReadPosition >= Length(ecgBuff) ) then
        begin
          Result:= EcgReadPositionOld;
          Exit;
        end;

        if ( ecgBuff[EcgReadPosition] <> $7f )or(ecgBuff[EcgReadPosition+1]<> $7f) then
        begin
          Form1.mmoDisplay.Lines.Add('FMT20 Dat Lost.');
          // 重新查找开始的头部7f 7f
          while ( EcgReadPosition < ( Length(ecgBuff)-1 ) ) do
          begin
            Inc(EcgReadPosition,1);
            if ( ecgBuff[EcgReadPosition]= $7f )and(ecgBuff[EcgReadPosition+1]= $7f) then
            begin
               Break;
            end;
          end;

          // 数据已全部读完，没有头部
          if(EcgReadPosition>=Length(ecgBuff)-1) then
          begin
            Result:= EcgReadPositionOld;
            Exit;
          end;
        end
        else
        begin
          Inc(EcgReadPosition,ecgNumSize);
        end;
      end;

    end
    else
    begin
      Form1.mmoDisplay.Lines.Add('Head Error.');
      // 重新查找开始的头部7f 7f
      while ( EcgReadPosition < ( Length(ecgBuff)-1 ) ) do
      begin
        Inc( EcgReadPosition,1 );
        if ( ecgBuff[EcgReadPosition]= $7f )and(ecgBuff[EcgReadPosition+1]= $7f) then
        begin
           Break;
        end;
      end;

      // 数据已全部读完，没有头部
      if(EcgReadPosition>=Length(ecgBuff)-1) then
      begin
        Result:= EcgReadPositionOld;
        Exit;
      end;
    end;

  end;

end;

{$R *.dfm}

procedure TForm1.btnReadClick(Sender: TObject);
var
  ReadPosition:Integer;   // 读取位置
  EcgReadPosition:Integer;// ecg数据读取位置
  ReadNum:Integer;        // 读取个数
  ecgBuf:TBytes;          // Byte数组
  cnt:Integer;
  SourEncoding, DestEncoding: TEncoding;
  WriteFile:TextFile;
  ecgWriteBuf:TBytes;

begin
  ReadPosition:=0;        // 初始化读取初始位置
  EcgReadPosition:=0;     // 初始化Ecg读取初始位置
  readNum:=NUM_READ;      // 初始化初始读取个数
  DestEncoding:= TEncoding.UTF8;
  try
    // 只读方式打开
    // 将磁盘上的文件跟我们的变量关联绑定
    AssignFile(WriteFile,'D:\ecgDataTestxx.txt');
    // 打开文件 rewirte方式打开，如果该文件已存在，将被覆盖
    Rewrite(WriteFile);
    while True do
    begin
        // 读出数据到ecgBuf
        ecgBuf:=MyFileRead(SOURCE_PATH,ReadNum,ReadPosition);
        for cnt := 0 to Length(ecgBuf)-1 do
        begin
          Write(WriteFile,IntToHex(ecgBuf[cnt]));
          write(WriteFile,' ');
        end;
        // 更新读取位置
        //Inc(ReadPosition,MyEcgCaculation(ecgBuf));
        Inc(ReadPosition,Length(ecgBuf));
        //ShowMessage(IntToStr(ReadPosition));

        // 判断数据已全部读取完成
        if Length(ecgBuf) < NUM_READ then
        begin
          Break;
        end;
    end;
  finally
  end;
  // DEBUG Message
  ShowMessage(IntToStr(ReadPosition));
end;

end.
