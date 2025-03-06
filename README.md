# 🖥️For School 21 students who love Windows too much💔

This tool helps Windows users run their C programs using a Docker Linux container.

## 📌 Features:
- `clang-format` — automatic code formatting
- `cppcheck` — static code analysis
- `valgrind` — memory leak detection

## 🚀 How to get started:
1. **Download and Install** [Docker Desktop](https://docs.docker.com/desktop/setup/install/windows-install/) for Windows with WSL2 support.
2. **Update the Execution Policy** for PowerShell (run it as Administrator):
   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```
   ⚠️ **Warning!** This can be risky! Be careful with downloaded files from now on.
3. In PowerShell, navigate to the source folder and run:
   ```powershell
   cd %PATH_TO_PROJECT%\src
   .\run.ps1
   ```
   
