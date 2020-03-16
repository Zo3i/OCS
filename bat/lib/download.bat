@echo off
color 0b
REM 声明采用UTF-8编码
chcp 65001


::删除文件
if exist .\client\frpc.ini del .\client\frpc.ini
if exist .\client\frpc.exe del .\client\frpc.exe
if exist .\client\frpc_full.ini del .\client\frpc_full.ini
if exist .\client\frpc.log del .\client\frpc.log


:: 下载
set downloadFrpUrl=http://34.80.211.24/frpc.ini
call :downloadFunc %downloadFrpUrl%
echo success

set downloadFrpConfigUrl=http://34.80.211.24/frpc_full.ini
call :downloadFunc %downloadFrpConfigUrl%
echo success

set downloadExeUrl=http://34.80.211.24/frpc.exe
call :downloadFunc %downloadExeUrl%
echo success
goto:EXIT



::::::::::::::::::::函数::::::::::::::::::::
:: 下载函数
:downloadFunc
  set Save=.\client
  if exist %Save% (echo 位置：%Save%) else (mkdir %Save% & echo 已创建：%Save%)
  set Url=%1
  for %%a in ("%Url%") do set "FileName=%%~nxa"
    echo 正在下载%FileName%，请勿关闭窗口...
    if not defined Save set "Save=%cd%"
    (echo Download Wscript.Arguments^(0^),Wscript.Arguments^(1^)
    echo Sub Download^(url,target^)
    echo   Const adTypeBinary = 1
    echo   Const adSaveCreateOverWrite = 2
    echo   Dim http,ado
    echo   Set http = CreateObject^("Msxml2.ServerXMLHTTP"^)
    echo   http.open "GET",url,False
    echo   http.send
    echo   Set ado = createobject^("Adodb.Stream"^)
    echo   ado.Type = adTypeBinary
    echo   ado.Open
    echo   ado.Write http.responseBody
    echo   ado.SaveToFile target
    echo   ado.Close
    echo End Sub)>DownloadFile.vbs
    DownloadFile.vbs "%Url%" "%Save%\%FileName%"
    ::下载完删除生成的vbs文件
    del DownloadFile.vbs
:EXIT
