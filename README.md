



# RedPen: AA228Student

This repository is used to submit project files for [AA228/CS238: Decision Making under Uncertainty](https://aa228.stanford.edu) taught by [Mykel Kochenderfer](https://mykel.kochenderfer.com) at Stanford University.

The repository includes the `submit` command line tool to submit project files located in the `workspace` directory.

All data and starter code for the projects are included in the `workspace` directory. **Project submissions will occur within the `workspace` directory.**

> **Requirements:** Julia v1.2 and Git.

If you already have Julia v1.2 and Git, **skip to step #3** under "Installation".*


## Installation
1. **Install Julia v1.2** from https://julialang.org/downloads/ (follow their installation steps)
   - **Add `julia` to the command line path:** This will make `julia` available anywhere on the command line.
     - **Windows**:  Follow [these instructions](https://helpdeskgeek.com/windows-10/add-windows-path-environment-variable/) and add the Julia `bin` directory to your User PATH environment variable (replacing **<PATH_TO_JULIA>** with your actual Julia installation location).

           C:\<PATH_TO_JULIA>\Julia-1.2.0\bin\
     - **Linux**: Edit your `~/.bashrc` to add the following line (replacing **<PATH_TO_JULIA>** with your actual Julia installation location):

           export PATH=$PATH:/<PATH_TO_JULIA>/bin/
     - **Mac OS X**: Open a terminal and run the following (this will create a`julia` alias and place it in `/usr/local/bin` which is already on the terminal path):

           sudo sh -c 'mkdir -p /usr/local/bin && ln -fs "/Applications/Julia-1.2.app/Contents/Resources/julia/bin/julia" /usr/local/bin/julia'


2. **Install Git** from https://git-scm.com/downloads
3. **Download and run `aa228download.jl`**:
   1. Right-click and "Save link as..." `aa228download.jl` in your desired location:
      - [aa228download.jl](https://github.com/sisl/AA228Student.jl/raw/master/aa228download.jl)
      - ***Or*** you can use `curl`:

            curl https://raw.githubusercontent.com/sisl/AA228Student.jl/master/aa228download.jl -o aa228download.jl
      - ***Or*** you can run this monstrosity of a one-liner (if you do, *skip the next step ii*):

            julia --color=yes -e "if VERSION < v\"1.2\";error(\"Julia v1.2 is required. Your current version is v$VERSION\");end;using Pkg;using LibGit2;@info \"Downloading RedPen and AA228Student (requires git)...\";Pkg.add(PackageSpec(url=\"https://github.com/sisl/Obfuscatee.jl.git\"));Pkg.add(PackageSpec(url=\"https://github.com/sisl/RedPen.jl.git\"));function gitpull(repo::GitRepo);LibGit2.fetch(repo);eval(Meta.parse(\"LibGit2.merge\"*Char(33)))(repo);end;if basename(pwd()) == \"AA228Student\";aa228path = pwd();repo = GitRepo(aa228path);gitpull(repo);elseif isdir(\"AA228Student\");aa228path = joinpath(pwd(), \"AA228Student\");repo = GitRepo(aa228path);gitpull(repo);else;LibGit2.clone(\"https://github.com/sisl/AA228Student.jl.git\", \"AA228Student\");aa228path = joinpath(pwd(), \"AA228Student\");end;@info string(\"Using AA228Student repository from: \", aa228path);Pkg.add(PackageSpec(path=aa228path));@info \"Precompiling AA228Student...\";Pkg.build();using AA228Student ;@info(string(\"Please submit projects from the following directory:\n\", joinpath(aa228path, \"workspace\")))"
        - This works on *Windows/Linux/Mac OS X*: it will download the `AA228Student` repo and it's dependencies.
   2. Open a terminal and `cd` to the location of `aa228download.jl`
      - Run the following (from the command line, `--color=yes` argument is optional):

            julia --color=yes aa228download.jl
        - This will download the necessary Julia packages and will clone this repository into the directory `AA228Student`

# Submitting
To submit your project file(s), you'll do all of it via the command line (using the terminal of your choice):
1. Open your terminal
2. `cd` to the `AA228Student/workspace` repository directory
3. Place all required files in their `project#` directory
   - **Example**: the `README.pdf`, `small.gph`, etc. files will be placed in the `AA228Student/workspace/project1/` directory
   - **Note**: For Project 0, place the required `project0.txt` file directly in the `workspace` directory.
 4. Now you can submit your project file(s) from the `workspace` directory:
     - **Windows examples (using `submit.bat`):** Note, `.bat` can be omitted as Windows figures out the extension.

           submit project0.txt <YOUR_EMAIL>

           submit project1 <YOUR_EMAIL>

           submit project1 <YOUR_EMAIL> <NICKNAME>

           submit project2 <YOUR_EMAIL> <NICKNAME>

    - **Linux/Mac OS X examples (using `submit`):** Use the same arguments as the Windows examples, but use `./submit` to run the submit script:

          ./submit project0.txt <YOUR_EMAIL>
      > - Replace **<YOUR_EMAIL>** below with your **SUNetID**@stanford.edu email address.
      > - You can also provide an *optional nickname* to appear on the leaderboard, but it'll default to your SUNet ID if nothing is provided (replace **\<NICKNAME\>** with your desired nickname).

# Status
You can request the status of your submissions via:

    submit status <YOUR_EMAIL>

And you'll receive a message similar to this:

    ┌ Info: Submission successful!
    │ Status of submissions (<YOUR_EMAIL>@stanford.edu):
    └       Project 0: Submitted!

# Updating
By default, running the `submit` script will update the required packages automatically. If an update needs to be pushed out to `AA228Student` *before a submission*, you can do either of the following (we will instruct you to do so):
- `cd` to the `AA228Student` directory and run `git pull`

  ***or***

- `cd` to the `AA228Student` directory and run `julia aa228download.jl`

# Troubleshooting
> Note, we'll put tips for frequently occurring issues here.

The project submission code `RedPen` and the `AA228Student` submission repository are new starting the Autumn 2019 semester—so please redirect any major issues to Robert Moss (mossr@stanford.edu) or submit them on [Piazza](https://piazza.com/) for others to see.