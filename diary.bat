@echo off
::Set to be able to type in Russian
chcp 65001

echo Привет, Нина! :)

::Set the directory name; Replace it in your script
set "dirname=C:\Users\nailc\Documents\diary\"

::Get the date
for /f %%# in ('wmic os get localdatetime^|findstr .') do if "%%#" neq "" set date=%%#
set year=%date:~,4%
set month=%date:~4,2%
set day=%date:~6,2%

::Get the time of execution
set currenttime=%time:~0,5%

::Get month
if %month%==01 (set mname=Января 
	set fname=jan)
if %month%==02 (set mname=Февраля
	set fname=feb)
if %month%==03 (set mname=Марта
	set fname=mar)
if %month%==04 (set mname=Апреля
	set fname=apr)
if %month%==05 (set mname=Мая
	set fname=may)
if %month%==06 (set mname=Июня
	set fname=jun)
if %month%==07 (set mname=Июля
	set fname=jul)
if %month%==08 (set mname=Августа
	set fname=aug)
if %month%==09 (set mname=Сентября
	set fname=sen)
if %month%==10 (set mname=Октября
	set fname=oct)
if %month%==11 (set mname=Ноября
	set fname=nov)
if %month%==12 (set mname=Декабря
	set fname=dec)

::Make relevant directory
if not exist "%dirname%%year%" mkdir "%dirname%%year%"
if not exist "%dirname%%year%\%month%" mkdir "%dirname%%year%\%month%"

::Assign the name of the file
set "filename=%dirname%%year%\%month%\%day%_%fname%.tex"

::Enter the title
set /P "entry_title=Введи название записи в дневнике:"

::LaTeX markup
echo \subsection*{%day% %mname% --- %entry_title%} > %filename%
echo \addcontentsline{toc}{subsection}{%day% %mname% --- %entry_title%} >> %filename%
echo: >> %filename%
echo: >> %filename%
echo %currenttime% >> %filename%

::Add the record for the diary entry in the toc
set "mainmatter=%dirname%mainmatter.tex"
set "backmatter=%dirname%backmatter.tex"

echo \input{./%year%/%month%/%day%_%fname%} >> %mainmatter%

::Assemble the document with toc as a book with chapters: 
::2) List of entries for each month and their assignment to toc
::3) Backmatter of the diary
type %mainmatter% %backmatter% > %dirname%diary.tex

::Start Sublime Text 3 to edit the file; Replace with your favourite text/LaTeX editor
subl %filename%
