@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
del /f "C:\Users\Public\Desktop\Unity Hub.lnk" > out.txt 2>&1
del /f "C:\Users\Public\Desktop\Google Cloud SDK Shell.lnk" > out.txt 2>&1
del /f "C:\Users\Public\Desktop\Microsoft Edge.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows 2022 VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user administrator 123abc+def /add >nul
net localgroup administrators administrator /add >nul
net user installer /delete
echo Tudo feito! Conecte sua VM usando RDP. Quando o RDP expirou e a VM desligou, execute novamente os trabalhos para obter um novo RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Não é possível obter o túnel NGROK, certifique-se de que NGROK_AUTH_TOKEN está correto em Configurações> Segredos> Segredo do repositório. Talvez sua VM anterior ainda esteja em execução: https://dashboard.ngrok.com/status/tunnels" 
echo Usuário: Administrator"
echo Senha: 123abc+def
curl -O https://raw.githubusercontent.com/c9ffin/rdp/main/Files/DisablePasswordComplexity.ps1 > out.txt 2>&1

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
diskperf -Y >nul
sc start audiosrv >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
ping -n 10 127.0.0.1 >nul
