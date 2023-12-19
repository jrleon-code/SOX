:: SOX UF3 A1.2 Automatitzem la gestió de recursos compartits en Windows
:: @author: Jose Leon

@echo off
cls

:: Creació de directoris
if not exist E:\INSVIDRERES\DIRECCIO mkdir E:\INSVIDRERES\DIRECCIO
if not exist E:\INSVIDRERES\MAGATZEM mkdir E:\INSVIDRERES\MAGATZEM
if not exist E:\INSVIDRERES\MARKETING mkdir E:\INSVIDRERES\MARKETING


:: Deixem de compartir els recursos
net share DIRECCIO /del > nul
net share MAGATZEM /del > nul
net share MARKETING /del > nul


:: Compartició dels directoris
net share DIRECCIO=E:\INSVIDRERES\DIRECCIO ^
/remark:"Documents de Direccio" ^
/g:Direccio,FULL ^
/g:Magatzem,READ ^
/g:Marketing,READ


:: els grups direccio, Magatzem i Marketing han d'estar creats per poder continuar

net share MAGATZEM=E:\INSVIDRERES\MAGATZEM ^
/remark:"Documents de Magatzem" ^
/g:Direccio,READ ^
/g:Magatzem,FULL ^
/g:Marketing,READ /g:Marketing,CHANGE

net share MARKETING=E:\INSVIDRERES\MARKETING ^
/remark:"Documents de Magatzem" ^
/g:Direccio,READ ^
/g:Magatzem,READ /g:Magatzem,CHANGE ^
/g:Marketing,FULL

:: Alliberem les unitats lògiques necessàries
net use R: /del > nul
net use M: /del > nul
net use K: /del > nul


:: Assignem unitats lògiques
echo Assignem R: al recurs DIRECCIO ... && net use R: \\%computername%\DIRECCIO > nul
echo Assignem M: al recurs MAGATZEM ... && net use M: \\%computername%\MAGATZEM > nul
echo Assignem K: al recurs MARKETING... && net use K: \\%computername%\MARKETING > nul


:: Mostrem els recursos compartits
net share






