@echo OFF
@rem Must be run as Administrator due to the commands modifying a file

@rem Define the path to CONDA installation 
@set CONDAPATH=C:\Users\Christian\miniconda3

@rem Create and activate new environment
@Call conda create --prefix D:\Conda\remote-sensing python=3.6

@set ENVNAME=remote-sensing
@rem The following command activates the base environment
if %ENVNAME%==base (set ENVPATH=%CONDAPATH%) else (set ENVPATH=D:\Conda\%ENVNAME%)
@Call %CONDAPATH%\Scripts\activate.bat %ENVPATH%

@rem Install additional packages
@Call conda env update --prefix %ENVPATH% --file environment.yml --prune
pause