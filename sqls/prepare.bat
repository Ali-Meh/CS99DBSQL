@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

echo [1/4]reseting DB
sqlcmd -S . -i ResetDB.sql -d chainStoreDB >NUL
echo [2/4]migrating DB
sqlcmd -S . -i MigrateDataBase.sql -d chainStoreDB >NUL
echo [3/4]setting triggers up DB
sqlcmd -S . -i CalcTotalPriceTrigger.sql -d chainStoreDB >NUL
sqlcmd -S . -i CalcPayablePriceTrigger.sql -d chainStoreDB >NUL
echo [4/4]Seeding DB
sqlcmd -S . -i seed.sql -d chainStoreDB >NUL
echo Done!
GOTO ENDSilent

:END
echo exiting...


:ENDSilent
endlocal