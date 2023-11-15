# Exercise 1: a real world application

In this exercise we are going to try something I had to do for real once in my life in research.

In the directory [bandpasses](bandpasses) I have provided you with a collection of files containing some comments and tabulated values of wavelengths and bandpass transmissions (or "filters") from different experiments.
A list of all the files follows (remember the command ``tree``? I have shown this at lecture).

```bash
bandpasses/
├── ALMA_1300.dat
├── ALMA_3000.dat
├── ALMA_870.dat
├── ALMA_BAND3.asc
├── ALMA_BAND6.asc
├── ALMA_BAND7.asc
├── Aztec_1100.dat
├── b_goods.dat
├── FJ_BB.ASCII
├── GMRT_610MHz.asc
├── i_goods.dat
├── IRAC1.dat
├── IRAC2.dat
├── IRAC3.dat
├── IRAC4.dat
├── IRS16.dat
├── ISAACH.dat
├── ISAACJ.asc
├── ISAACJ_mod.asc
├── ISAACKs.dat
├── LABOCA_870.dat
├── MIPS1.dat
├── PACS_blue.dat
├── PACS_green.dat
├── PACS_red.dat
├── PLW.dat
├── PMW.dat
├── PSW.dat
├── v_goods.dat
├── VLA_C.dat
├── VLA_L.dat
└── z_goods.dat

0 directories, 34 files
```

If you check the file names, you might notice how the extension of these files is not uniform, some of them are ``.dat`` some ``.asc`` and some other ``.ASCII``.
Should I need to load these files in some more complex application it might be necessary to have a uniform extension. I would like to have all of them with the same extension.

Let's now check the content of these files. Without opening them, we can use commands such as ``head``, ``tail``, ``cat`` (check the man-pages in your terminal) to this purpose. For example The lowest wavelength filter of the [Very Large Array](https://public.nrao.edu/telescopes/vla/) looks something like this:

```bash
$ cat bandpasses/VLA_C.dat
# VLA_C
#photon
# C-band VLA 4.85GHz - 6cm
  219000000  0.0 
  319000000  1.0 
  619000000  1.0 
  919000000  1.0 
  1019000000 0.0
```

while the first 7 lines of the Band-7 [ALMA](https://www.almaobservatory.org/en/home/) filter are the following:

```bash
$ head -7 bandpasses/ALMA_870.dat
# ALMA_870
# energy
# ALMA_band_7 (0.8-1.1 mm)
#	Lambda	Transmission
	8000000 	1
	8050000		1
	8100000		1
```

You might notice that, in the comments (i.e. lines starting with ``#``) both files contain either the string ``photon`` or the string ``energy``.
This info tells me what type of passband filter is the one I'm looking at: whether it is given in units of collected photons or in terms of transmitted energy. The operation I will have to perform to use it would be different in the two different cases.
It is therefore quite annoying having to open the file everytime I am required to decide which of the two operations to perform.
It would be way more straightforward to have this information in the name of the file itself.

Of course you could decide to rename all the files manually, they are just 34, how long could it take? Half an hour? Of your life.. lost forever..

Also, it is quite a mechanical task, you could do it numbly while listening to a podcast or something, it shouldn't be difficult right? How many errors could you possibly do? None, right?

On the other side, if you authomatise the task in a script, you will

1. spare time (these are 34 files, what if they were 1000?)
2. have a way, if things go south in the process, to check what you did and spot eventual errors (i.e. by checking the **script** you have written)

## Assignment

The deliverable you will have to produce is a bash script.

### Preliminary

First of all, copy the directory containing the bandpass filters somewhere in your filesystem.

1. clone the github repository with the exercises locally
   ```bash
   $ git clone git@github.com:TommasoRonconi/crash_python_course.git
   ```
2. let's remember where we put this repository by assignining its **absolute path** to a variable:
   ```bash
   $ cpc_repo=${PWD}/crash_python_course
   ```
2. on some OTHER position in your filesystem create a directory for working on the assignment, let's say we want it in our home:
   ```bash
   $ cd
   $ mkdir -p assignments/ex1
   $ cd assignments/ex1
   ```
3. copy the bandpass filters directory in this working directory and change its name:
   ```bash
   $ cp -r ${cpc_repo}/exercise1_bash/bandpasses bandpass_raw
   ```

Well done! By listing the content of the directory you should see something like this:
```bash
$ ls
bandpass_raw
```

We can start working.

### Deliverable

The bash script you are going to write will have to

- generate a new directory to store the files following our prescriptions. We will not work on the original directory so that if we mess up we will be able to go back to the original state. Call this new directory ``bandpass_<yourname>``.
- print on screen all the extensions present in the ``bandpass_raw`` directory and count the occurrencies of each extension.
- Assuming the original file was named ``FILTER_X.ext``, rename each file:
  - if the file contains the string ``photons`` the new file will be called ``FILTER_X.photons.filt``
  - if the file contains the string ``energy`` the new file will be called ``FILTER_X.energy.filt``

Whatever your script does, make sure that when it has finished working, you are positioned in the original working directory you have created (i.e. the one you called ``assignments/ex1``).

You will send me the script you have written.

**NOTE THAT** usage of the ``rename`` bash function is not allowed, as it is not present in all the machines. In general, **DO NOT INSTALL NEW COMMANDS FOR THIS EXERCISE**, we do not want to pollute your system (nor mine) and we want to make it reproducible in whatever *Nix machine.

**VERY IMPORTANT:** a code, whatever the language, should be READABLE!! Comments exist for this purpose, so USE THEM.
Already mentioned above but, to comment something in a bash script you can use the ``#`` character, the system will not read anything after it. That line, or string, is there only to make the code more readable for humans.
```bash
# this is a comment
answer=42 # also this is a comment
```
Another pro of comments: if you come back after one year to some script you have written, instead of trying to figure out line-by-line how it was working, reading the comments you wrote will help.

**A GOOD CODE COMES WITH COMMENTS**

### Hints

A couple of suggestions

- you will probably need to perform **at least** a for-loop
- you might have to use if-statements (there is a useful link in the slides)
- commands such as ``sort`` and ``uniq`` exist in bash, their man-pages are very well written
- the command ``tr`` translates some character in a string into some other, i.e.
  ```bash
  $ echo 'ciao-ciao' | tr '-' ' '
  ciao ciao
  ```

Ideally, there will be N possible solutions to this problem, with N = the number of people trying to solve it. Therefore the suggestions above might be useless to the solution you have chosen.