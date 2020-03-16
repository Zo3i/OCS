@echo off
REM 声明采用UTF-8编码
chcp 65001
setlocal enabledelayedexpansion

if exist client (
   echo "已经存在文件夹"
) else (
md client
)

::下载
call .\lib\download.bat

::修改

set replaced=FIX_NAME
set all=
set /p all=  请输入项目名：
call :modifyFuc %replaced% %all%

set replaced=FIX_PORT
set all=
set /p all=  请输入项目端口：
call :modifyFuc %replaced% %all%

set replaced=FIX_DOMAIN
set all=
set /p all=  请输入二级域名(英文)：
call :modifyFuc %replaced% %all%

echo 公网访问: %all%.vae.one:99

:: 运行frp客户端
.\client\frpc.exe -c .\client\frpc.ini

pause
:::::::::::::::::::::::函数:::::::::::::::::::::::

:modifyFuc
  set file=.\client\frpc.ini
  set "file=%file:"=%"
  for %%i in ("%file%") do set file=%%~fi
  echo.
  for /f "delims=" %%i in ('type "%file%"') do (
     set str=%%i
     set "str=!str:%replaced%=%all%!"
     echo !str!>>"%file%"_tmp.txt
  )
  copy "%file%" "%file%"_bak.txt >nul 2>nul
  move "%file%"_tmp.txt "%file%" >nul 2>nul
  del "%file%"_bak.txt
:EXIT
