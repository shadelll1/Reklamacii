@echo off
rem ===========================================================================
rem  One-time: create the git repository for this project and make the first commit.
rem  Double-click. Safe to run once; if .git already exists it does nothing.
rem ===========================================================================
cd /d "%~dp0.."
if exist ".git" (
  echo Repository already exists.
  git log --oneline -n 5
  pause
  exit /b 0
)
where git >nul 2>nul || (echo [ERROR] git not found in PATH & pause & exit /b 1)
git init -b master || (pause & exit /b 1)
git config core.autocrlf false
git config core.longpaths true
git config core.quotepath false
git config user.name  >nul 2>nul || git config user.name  "SHaDell26"
git config user.email >nul 2>nul || git config user.email "SHaDell2026@proton.me"
git add -A || (pause & exit /b 1)
git commit -q -F "tools\first-commit.txt" || (pause & exit /b 1)
echo.
echo [OK] Repository created:
git log --oneline
git status --short
pause
exit /b 0
