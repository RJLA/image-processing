@echo OFF
@rem How to run a Python Script in a given conda environment from a batch file

@rem It doesn't require:
@rem - conda to be in a path 
@rem - cmd.exe to be initialized with conda init 

@rem Define the path to CONDA installation 
@set CONDAPATH=C:\Users\Christian\miniconda3
@rem Define the name of environment
@set ENVNAME=remote-sensing

@rem The following command activates the base environment
if %ENVNAME%==base (set ENVPATH=%CONDAPATH%) else (set ENVPATH=D:\Conda\%ENVNAME%)

@rem Activate the conda environment 
@rem Using call is required here
@Call %CONDAPATH%\Scripts\activate.bat %ENVPATH%
@Call jupyter notebook
pause
