# Python Scripts for Satellite Image Processing
It contains basic python script for downloading Sentinel-2 and 3 images. It also contains batch script to automatically create conda environment with the required dependencies. 

- s2Downloader.ipynb
- Create-conda_env.bat
- Run-jupyter_notebook.bat
- environment.yml

## Features

- Creates conda environment without accessing Anaconda prompt
- Run jupyter notebook without accessing Anaconda prompt
- Automatically download sentinel images and save it in designated folder

## Usage
This jupyter notebook script requires [Miniconda3](https://docs.conda.io/en/latest/miniconda.html) to be installed 

After installing Miniconda3, make sure that you change the _CONDAPATH_ in ```Create-conda_env``` and ```Run-jupyter_notebook```. Search for the directory of miniconda 3 in the computer. 

##### Create-conda_env.bat

```sh
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
```

##### Run-jupyter_notebook.bat

```sh
@echo OFF
@rem How to run a Python Script in a given conda environment from a batch file

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
```

##### s2Downloader.ipynb

In the s2Downloader.ipynb, change the scihub user account and password. Also, specify the parameters to be used in downloading sentinel images. Change the directory of the geojson shapefile, _boundary_, and output directory of the images, _s2OutDir_ and _s3OutDir_.  

```sh
def main():
    ## Watershed boundary using Geojson
    boundary = r'D:\__s2__\__boundary\watershedBoundary.geojson'
    
    ## Output Directory
    s2OutDir = r'D:\__s2__\__zip'
    s3OutDir = r'D:\__s3__\__zip'
    
    ## Username and Password for Copernicushub
    username = '***'
    password = '***'
    
    ## Query details
    startDate = '20200101'
    endDate = '20200131'

    ## Sentinel-2
    processingLevel = 'Level-2A'
    tileName = 'T51PUR'
    year = startDate[0:4]

    ## Sentinel-3
    productType = 'OL_1_EFR___'
```
