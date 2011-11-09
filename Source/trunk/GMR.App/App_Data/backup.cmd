@echo off
echo STOP SERVICES
net stop MSSQL$SQL2008

copy "D:\Program Files\Microsoft SQL Server\MSSQL10.SQL2008\MSSQL\DATA\GMR_DB.mdf" GMR.mdf
net start MSSQL$SQL2008
pause