@echo off
setlocal enabledelayedexpansion

:: Sprawdzenie czy istnieje presentation_template.tex
IF NOT EXIST presentation_template.tex (
    echo Plik presentation_template.tex nie istnieje w tym katalogu!
    exit /b
)

:loop
    echo.
    echo ==============================
    echo Kompilacja PDFLaTeX (1/2)...
    pdflatex -interaction=nonstopmode presentation_template.tex

    echo Kompilacja PDFLaTeX (2/2)...
    pdflatex -interaction=nonstopmode presentation_template.tex

    echo Kompilacja zakonczona.
    echo ==============================
    echo.

    :: Sprawdz czy user cos kliknal
    choice /c CQ /n /t 0 /d C >nul
    if errorlevel 2 (
        echo Wykryto zadanie zamkniecia. Koniec.
        exit /b
    )

goto loop
