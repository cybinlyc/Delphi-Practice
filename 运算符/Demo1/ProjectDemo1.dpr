program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{
  1、变量
    1)声明
    2)初始化
  2、运输符
  3、表达式
}
var
  packPos:Int32;                    // 当前取值位置
  tmpReadPosition:Integer;
  packPosOld:Int32;                 // 指示前一个位置7f 7f
  datPackSize:Int32;                // 从包中取得的长度
  ecgNumSize:Int32;

  ecgDataBuf:array of Byte;         // 读取ecg文件的缓冲区
  ecgFile:Textfile;                 // 定义一个文件变量
  ecgStr:string;                    // 存储文件中的所有内容
  ecgStrTmp:string;
  strPos:Int32;                     // 访问的字符串位置
  kk:Int32;
  fileName:string;                  // 文件名称
  sysIdReadNext:Byte;               // 包ID
  sysIdRead:Byte;                   // 从数据包读取的ID
  lostIdCnt:Int32;                  // 发生ID不连续的次数
  lostIdNum:Int32;                  // 发送ID丢失的个数
begin
  sysIdRead:=0;
  sysIdReadNext:=0;
  lostIdCnt:=0;
  lostIdNum:=0;
  try
    Writeln('请输入文件名称D:\xxx.txt');
    Readln(fileName);
  except
    Writeln('文件不存在');
  end;
  
  AssignFile(ecgFile,fileName);   // 将文件名与变量 F 关联
  //AssignFile(ecgFile,'D:\ecgDataTest.txt'); // 将文件名与变量 F 关联
  Reset(ecgFile);                   // 打开并读取文件 F

  // 读取文件中所有内容
  while not eof(ecgFile) do
  begin
    Readln(ecgFile,ecgStr);         // 读取1行文本文件内容到ecgStr中
  end;
  // 设置数组长度为Length(ecgStr),不定长数组,下标从0开始
  SetLength(ecgDataBuf,( Length(ecgStr) div 3 ) );

  // 循环读取字符串内容
  for strPos := 1 to Length(ecgStr) do
  begin
    if ecgStr[strPos]=' ' then
    begin
      ecgStrTmp:=Copy(ecgStr,strPos-2,2);
      ecgDataBuf[strPos div 3-1]:= StrToInt('$'+ecgStrTmp);
    end;
  end;

  // 循环检测ecgDataBuf
  packPos := 0;
  // 最小的包FMT21为17Byte
  while ( packPos < ( Length(ecgDataBuf)-17+1 ) ) do
  begin
    // 判读字头是否正确
    // and两边是bool类型，则是逻辑与
    if ( ecgDataBuf[packPos]= $7f )and(ecgDataBuf[packPos+1]= $7f) then
    begin
      datPackSize:=ecgDataBuf[packPos+2]+ecgDataBuf[packPos+3]*256;
      sysIdRead:=sysIdReadNext;
      sysIdReadNext:=ecgDataBuf[packPos+4];     // 读取包内给定的ID
      // 包不连续
      if ((sysIdReadNext-sysIdRead)<>1)and((sysIdRead-sysIdReadNext)<>255) then
      begin
        Inc(lostIdCnt,1);
        Writeln('packPos='+IntToStr(packPos));
        if (sysIdReadNext-sysIdRead) > 0 then
        begin
          Inc(lostIdNum,sysIdReadNext-sysIdRead);
        end
        else
        begin
          Inc(lostIdNum,sysIdRead-sysIdReadNext);
        end;
      end;

      if ecgDataBuf[packPos+5]=22 then      // 判断FMT格式    22数据包
      begin
        ecgNumSize:=0;
        for kk := 1 to ecgDataBuf[packPos+7+4] do
        begin
          tmpReadPosition:=  ecgNumSize+packPos+13;
          // 防止超界
          if( tmpReadPosition >= Length(ecgDataBuf) ) then
          begin
            Writeln('Data End.');
            Exit;
          end;
          // and两边是整数型，则是按位与
          if ecgDataBuf[ecgNumSize+packPos+13] and $07 = 0 then
          begin
            Inc(ecgNumSize,101);
          end
          else
          begin
            Inc(ecgNumSize,52);
          end;
        end;

        Inc(ecgNumSize,13);
        if(ecgNumSize<>datPackSize) then
        begin
          Writeln('ecgNumSize=',ecgNumSize);
          Writeln('datPackSize=',datPackSize);
          Writeln('packPos=',packPos);
          Writeln('FMT22 lost.');
          packPosOld:=packPos;
          while ( packPos < Length(ecgDataBuf) ) do
          begin
            Inc(packPos,1);
            if ( ecgDataBuf[packPos]= $7f )and(ecgDataBuf[packPos+1]= $7f) then
            begin
               Break;
            end;
          end;
          
          if (packPos-packPosOld)<datPackSize then
          begin
            Writeln('FMT22 error from lost data.');
          end;

          if(packPos>=(Length(ecgDataBuf)-1)) then
          begin
            Writeln('Data End.');
            Exit;
          end;

        end
        else
        begin
          Inc(packPos,ecgNumSize);          // 指示到下一个数据包
          //Writeln(ecgNumSize);
        end;
      end
      else if ecgDataBuf[packPos+5]=20 then   // 判断FMT格式  20空闲包
      begin
        ecgNumSize:=datPackSize;
        if ecgNumSize<>24 then
        begin
          Writeln('FMT20 lost.');
          Break;
        end;
        tmpReadPosition:= packPos+24+2;    // 需要判断后面的字节是否为7f 7f来判断数据是否完整
        // 防止超界
        if( tmpReadPosition >= Length(ecgDataBuf) ) then
        begin
          Writeln('Data End0.');
          Exit;
        end;

        if ( ecgDataBuf[packPos+24] <> $7f )or(ecgDataBuf[packPos+24+1]<> $7f) then
        begin
          Writeln('FMT20 Dat Lost.');
          // 重新查找开始的头部7f 7f
          while ( packPos < ( Length(ecgDataBuf)-1 ) ) do
          begin
            Inc(packPos,1);
            if ( ecgDataBuf[packPos]= $7f )and(ecgDataBuf[packPos+1]= $7f) then
            begin
               Break;
            end;
          end;

          // 数据已全部读完，没有头部
           if(packPos>=(Length(ecgDataBuf)-1)) then
          begin
            Writeln('Data End0.');
            Exit;
          end;
        end
        else
        begin
          Inc(packPos,ecgNumSize);
        end;
      end
      else if ecgDataBuf[packPos+5]=21 then   // 判断FMT格式  21信息包
      begin
        ecgNumSize:=datPackSize;
        if ecgNumSize<>17 then
        begin
          Writeln('FMT21 lost.');
          Break;
        end;

        tmpReadPosition:= packPos+17+2;    // 需要判断后面的字节是否为7f 7f来判断数据是否完整
        // 防止超界
        if( tmpReadPosition >= Length(ecgDataBuf) ) then
        begin
          Writeln('Data End1.');
          Exit;
        end;

        if ( ecgDataBuf[packPos+17] <> $7f )or(ecgDataBuf[packPos+17+1]<> $7f) then
        begin
          Writeln('FMT21 Dat Lost.');
          // 重新查找开始的头部7f 7f
          while ( packPos < ( Length(ecgDataBuf)-1 ) ) do
          begin
            Inc(packPos,1);
            if ( ecgDataBuf[packPos]= $7f )and(ecgDataBuf[packPos+1]= $7f) then
            begin
               Break;
            end;
          end;

          // 数据已全部读完，没有头部
           if(packPos>=(Length(ecgDataBuf)-1)) then
          begin
            Writeln('Data End1.');
            Exit;
          end;
        end
        else
        begin
          Inc(packPos,ecgNumSize);
        end;
      end
      else          // FMT格式错误
      begin
        Writeln('FMT error.');
        Break;
      end;

    end
    else          // 字头出错
    begin
      Writeln('Head error.');
    end;

  end;
  Writeln('lostIdCnt=',lostIdCnt-1);
  Writeln('lostIdNum=',lostIdNum);
  CloseFile(ecgFile);
  Readln;

end.


