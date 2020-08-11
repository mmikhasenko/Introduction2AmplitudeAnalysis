# Introduction2AmplitudeAnalysis
material for CERN Summer Student Workshop

A link to run notebooks in the clouds [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mmikhasenko/Introduction2AmplitudeAnalysis/master)

## Running the notebooks locally:
1. Get `Julia`
(1.5 for Windows) Install `Git / Git Bash`
2. Clone the repository
 ```bash
 git clone https://github.com/mmikhasenko/Introduction2AmplitudeAnalysis
 ```
3. Start julia, instatiate in the forder to get all packages installed
 ```python
 ; cd PATH_TO_THE_FOLDER
 instantiate
 ```
4. Add `IJulia` to get the `jupyter-notebook` installed
5. Start the `jupyter-server` in julia terminal
```bash
using IJulia
notebook()
```

## Julia workflow (beside the workshop)

Use `Julia` in the Visual Studio code (VScode):
1. Install `Julia`
2. Install `VScode`
3. Install julia extension in the VScode
4. Add the path to julia binnary in the extension settings if needed
5. Set the `inline` code evaluation
6. Change the key bindings to `Execute code` Ctlk-Enter and `Execute Code and Move` to Shift-Enter
7. Enjoy

 #### Contact mikhail.mikhasenko@cern.ch

