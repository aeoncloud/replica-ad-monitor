@echo off
setlocal

REM Verifica o status da replicação do AD
repadmin /replsummary > replstatus.txt

REM Procura por falhas na replicação
findstr /i "Fails" replstatus.txt > nul
if %errorlevel% equ 0 (
    echo FAILED
) else (
    echo OK
)

REM Limpa o arquivo temporário
del replstatus.txt

endlocal
