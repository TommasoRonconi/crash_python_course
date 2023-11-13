# Batches and Scripts

Both are lists of commands to be executed in a given order.

Rule of thumb:
* if you are calling a sequence of commands it is a **batch**
* if you are defining functions, making loops, storing variables and executing commands it is a **script**

In this directory you can find 3 examples of bash batch/scripts. All of them have the extension `.sh`, but it is just a convention, the system doesn't care about it they could also have been called `script.dajeforte`.
Names and extensions have just the purpose of being human readable.

A bash batch/script is executed by *sourcing* it:

```bash
$ source simple_batch.sh
$ source simple_script.sh
$ source cleanup.sh
```

*Since the difference between batches and scripts is not that much important, I will just call everything "a script"*

## Making a script executable

If you inspect the code of the above files (e.g. by opening them with a text editor), you will notice that all of them begin with the two symbols `!#`, this two symbols toghether are called a **shebang**.
Following the shebang there is a path to a file: `/bin/bash`.

Every text file beginning with a shebang can be converted into an **executable**.
For doing so, one has to change the **file permissions** (i.e. the type of access rights different users do have on the given file, for more info check the [wiki page](https://en.wikipedia.org/wiki/File-system_permissions#Notation_of_traditional_Unix_permissions)).

If we check the permissions of these files as they are now, we will see:

```bash
(base) tomi@ava exercise0_bash (main)$ ls -lrth
total 16K
-rw-rw-r-- 1 tomi tomi   79 Dec  5 17:06  simple_batch.sh
-rw-rw-r-- 1 tomi tomi   37 Dec  5 17:14  cleanup.sh
-rw-rw-r-- 1 tomi tomi  249 Dec  5 17:23  simple_script.sh
-rw-rw-r-- 1 tomi tomi 1.2K Dec  6 14:34  readme.md
```

i.e. all the files provide `r`ead and `w`rite access to both the user and their group, while other users can just read the file.

We want all the files ending with `.sh` to become executables (but just for the user, not for the other members of their group) so we will type:

```bash
$ chmod u+x *.sh
```

breaking down the above command:
* `chmod` a.k.a. `ch`ange the file `mod`e bytes (i.e. the way the system sees it)
* `u+x` add (`+`) to the `u`ser triad the permission to e`x`ecute
* `*.sh` do this for all (`*`) the files ending in `.sh`

**Note that** you could also remove permissions, for exemple if you would like to not allow reading persmission to users that are not in your group you could type:

```bash
$ chmod o-r *.sh
```

where `o` stands for "others" and `-r` means "remove reading permission".

Well done! Now you can run the scripts as if they were commands:

```bash
$ ./simple_script.sh
$ ./cleanup.sh
$ ./simple_batch.sh
```

### Advanced topic: make the script executable from *everywhere*

As you might have noticed, to call the executable scripts we still need to prepend the `./` string.
This tells our system where to search for the above command (i.e. in the current directory).

If we moved away from the current directory we would have needed to call the above scripts with:

```bash
$ /path/to/my/dir/simple_script.sh
```

where `/path/to/my/dir/simple_script.sh` is the absolute path (i.e. starting from **root** `/`) to the directory where `simple_script.sh` is located.
If for some reason we plan to use a lot the script we have created, this could easily become quite annoying.

Unix and Linux systems define an **environment variable** called `PATH` that stores all the positions in the file system where to search for commands.
We can see what is the content of that variable by typing

```bash
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

Which is actually a list of absolute paths, separated by a colon `:`. 

We have two choices to modify this behaviour:
* move the script to one of the positions listed in our standard `PATH` (e.g. in `/usr/loca/bin`).
  This probably requires super-user privileges that we can obtain by running the command with `sudo`:
  ```bash
  $ sudo mv somefile.exension /usr/local/bin/
  [sudo] password for tomi:
  ```
  But this procedure is discouraged because we don't want to mess up much with the standard directories. 
* we can add the position of our script in the file system to the standard `PATH` (this is the recommended option).
  Given that the script is in `/path/to/my/dir`, we'll do so by
  ```bash
  $ export PATH=${PATH}:/path/to/my/dir
  ```
  By pre-pending `${PATH}:` we are **appending** at the end of the `PATH` variable a new value, without modifying the other elements already in the list.

Of course, as always, if you want to make this change permanent, just write `export PATH=${PATH}:/path/to/my/dir` in your `.bashrc` or `.bash_profile` file.


