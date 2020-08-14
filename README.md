# Introduction2AmplitudeAnalysis
material for CERN Summer Student Workshop

## Program
The workshop will consist of two main blocks:
I. Partial-wave analysis in the light meson system
II. Dalitz-plot analysis for the three-body decays of heavy mesons

Within each block, I plan to have three form of material:
 - a short introduction with slides
 - live derivations with the white board
 - live codding and going through prepared jupyther notebooks.
The workshop is oriented to the `learning-by-doing` approach:
there will be various exercises on the way requiring thinking, taking integrals and derivatives, and writting quick programs, making plots.
The examples will be given along the lines of the recent publications by the COMPASS collaboration, LHCb collaboration,
and our theory group from the Joint Physics Analysis Center (JPAC).
 * [Odd and Ever waves](https://inspirehep.net/literature/1311486) paper
 * [a₂(1320) investigation](https://inspirehep.net/literature/1665092)
 * [Pole position of the light habrid candidate π₁(1600)](https://inspirehep.net/literature/1697661)
 * [X(2900) to be published soon](https://lhcb-public.web.cern.ch/)
 * [Dalitz-plot decomposition](https://inspirehep.net/literature/1758460)
 * The first pentaquarks candidate [Pc(4450)](https://inspirehep.net/literature/1382595) and later [Pc(4312)](https://inspirehep.net/literature/1728691).


### Material of the workshop
 - A link to [indico page](https://indico.cern.ch/event/945453/) of the workshop on August 14, 202
 - The slides are available from the [cernbox](https://cernbox.cern.ch/index.php/s/4f90LZKZy6Oaf51)
 - White board notes are saved in the [`notes`](notes/etapi_PWA.pdf) folder
 - Recording of the workshop might become eventially at the Summer program [webpage](https://summerstudent.web.cern.ch/seminars-and-tutorials-2020).

### More material
Together with my colleagues from JPAC we organized a summer school on the reaction theory.
Recorded lectures, exercise sheets, and a lot of learning material is available at [JPAC webpage](http://cgl.soic.indiana.edu/jpac/index.php).

## How to follow the worhshop
A Zoom like is give in the [indico page](https://indico.cern.ch/event/945453/).
You will need a pen, sheets, and your computer with the either pre-installed software (recommended), or running remotely.
We will be using `jupyter` notebooks with the `Julia` kernel.

`Julia` is a high level programming language as flexible as `python`, `matlab` and `Mathematica` and as fast as `c++` and `fortran`.
To run the code in clouds, the great `binder` service is suggested.
However, it is recommended to get a `julia+jupyther` installation at your local computer.
It will guarantee a stable connection (the `binder` might cut long or unactive session) and allow you having the modifications saved.

### Running the notebooks in the clouds
Click the link [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mmikhasenko/Introduction2AmplitudeAnalysis/master).
Once the docker image is ready, the set of notebooks will appear.

### Getting `julia+jupyther` locally:
1. Get `Julia`: [download v1.5](https://julialang.org/), install
2. (for Windows) [Download](https://git-scm.com/download/win) and install `Git / Git Bash`
3. Go to [Github repository](ttps://github.com/mmikhasenko/Introduction2AmplitudeAnalysis) of the workshop.
Clone it to your local machine using the terminal (or `Git Bash` on Windows)
 ```bash
 git clone https://github.com/mmikhasenko/Introduction2AmplitudeAnalysis PATH_TO_THE_LOCAL_FOLDER
 ```
4. Start `Julia`, do update by typing in the open terminal
```python
] up
``` 
(the text in the command line will turn to blue after pressing `]`.
The blue line is the `Package manager` mode`, green is the REPL - codding and evaluation, and the red and the terminal).
Go to the repository forder.
Instantiate to get all packages needed for tutorial installed
```python
; cd PATH_TO_THE_LOCAL_FOLDER
] activate .
] instantiate
```
The first installation might take a few minutes (btw, the list of dependences is in the `Project.toml` file)
4. type ` using IJulia` (perhaps, `Backspace` before to get back to the REPL mode, the green text in the command line).
It will install all required `python` packages to run the server.
5. Start the Jupyter server in Julia terminal
```bash
notebook()
```
The window in the browser should open authomatically.

### Julia development workflow (besides the workshop)
Here is a short suggestions on the tools you might want to use for the development
of the serious scientific program.

Use `Julia+VScode` installation:
1. Download and install `Julia`
2. Download and install `VScode`
3. Install `julia extension` in the VScode
4. Add the path to julia binnary in the extension settings
5. Set the `inline` code evaluation
6. Change the key bindings to `Execute code` Ctlk-Enter and `Execute Code and Move` to Shift-Enter
7. Check out interesing talks at [JuliaCon](https://live.juliacon.org/), join topical discussion on [Discourse](https://discourse.julialang.org/)

You might want to convert the obtained knowledge to a serious scientific project.

#### Contact mikhail.mikhasenko@cern.ch

