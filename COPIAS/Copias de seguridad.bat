@echo off 

rem *******************************************************************************************************
rem ** Ejemplo de otra persona                                                                           **
rem *******************************************************************************************************
rem ** MYSQLdump --host=localhost --user=root --password=XXXXXXX --all-databases > d:\Backups\backup.sql **
rem **                                                                                                   **   
rem ** d:                                                                                                **   
rem ** cd \                                                                                              **   
rem ** cd backups                                                                                        **   
rem ** SET fecha="%date:~6,4%%date:~3,2%%date:~0,2%"                                                     **   
rem **                                                                                                   **   
rem ** set hora=%TIME:~,2%                                                                               **   
rem ** set min=%TIME:~3,2%                                                                               **   
rem ** set seg=%TIME:~6%                                                                                 **   
rem **                                                                                                   **   
rem ** echo %hor% : %min% : %seg%                                                                        **   
rem ** echo %fecha%                                                                                      **   
rem **                                                                                                   **   
rem ** ren backup.sql %fecha%_%hora%%min%_backup.sql                                                     **   
rem *******************************************************************************************************

cd C:\socger\COPIAS

SET fecha="%date:~6,4%%date:~3,2%%date:~0,2%"

set hora=%TIME:~,2%
set min=%TIME:~3,2%
set seg=%TIME:~6%

rem *******************************************************************************
rem ** creo todos los ficheros de copia de las diferentes Bd de MySQL            **
rem *******************************************************************************
echo SE CREAN LAS COPIAS DE mySQL

mysqldump --opt --password=sasa --user=root --port=3300 cristobal > cristobal.sql
ren "cristobal.sql" "%fecha%_%hora%%min%_cristobal.sql"

rem *******************************************************************************
rem ** Copiamos en la carpeta OneDrive                                           **
rem *******************************************************************************
xcopy C:\socger\COPIAS\*.sql C:\OneDrive\cortinas_cristobal /h /c
xcopy C:\socger\COPIAS\*.sql C:\socger\COPIAS\yaenOneDrive /h /c

rem borro todos los ficheros de copia de seguridad de MySQL
del "C:\socger\COPIAS\*.sql"



