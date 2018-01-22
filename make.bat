@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXOPTS%" == "" (
	set SPHINXOPTS=-W --keep-going
)
if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set SOURCEDIR=source
set BUILDDIR=build

if "%DECKTAPEOPTS%" == "" (
	set DECKTAPEOPTS=--load-pause 100 --size 1200x875 --slides 1-10
)
if "%DECKTAPE%" == "" (
	set DECKTAPE=decktape
)

if "%1" == "" goto help
if "%1" == "revealjspdf" goto revealjspdf

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.http://sphinx-doc.org/
	exit /b 1
)

%SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
goto end

:revealjspdf
%DECKTAPE% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'decktape' command was not found. Make sure you have DeckTape
	echo.installed, then set the DECKTAPE environment variable to point
	echo.to the full path of the 'decktape' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	exit /b 1
)

%DECKTAPE% reveal %DECKTAPEOPTS% file://%CD%/%BUILDDIR%/revealjs/index.html?altMode=2 %BUILDDIR%/revealjs/index.pdf
goto end

:help
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
echo.Supplements:
echo.  revealjs    to make Reveal.js HTML presentation (if enabled)
echo.  revealjspdf to export PDF from Reveal.js presentation (if enabled)
echo.  spelling    to run spelling checker (if enabled)

:end
popd
