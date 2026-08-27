@echo off
rem Copie le theme du depot vers le dossier BetterDiscord.
rem A lancer apres chaque modification de Galaxy.theme.css.
rem Pas de backslash final sur la destination : entre guillemets, il
rem echappe le guillemet fermant et casse la commande copy.
copy /Y "%~dp0Galaxy.theme.css" "%APPDATA%\BetterDiscord\themes" >nul
if errorlevel 1 (
  echo Echec de la copie.
  exit /b 1
)
echo Theme synchronise. BetterDiscord recharge automatiquement.
