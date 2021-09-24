@echo off
echo Concluído com Sucesso!
tasklist | find /i "ngrok.exe" >Nul && goto check || echo "Não foi possível obter o túnel NGROK, certifique-se de que NGROK_AUTH_TOKEN está correto em Configurações> Segredos> Segredo do repositório. Talvez sua VM anterior ainda esteja em execução: https://dashboard.ngrok.com/status/tunnels" & ping 127.0.0.1 >Nul & exit
:check
ping 127.0.0.1 > null
cls
echo Concluído com Sucesso!
goto check
