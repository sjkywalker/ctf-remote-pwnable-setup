# CTF Pwnables Setup Automation Script

These are shell scripts that automate some procedures shown [here](https://github.com/pwning/docs/blob/master/suggestions-for-running-a-ctf.markdown). These scripts are helpful when adding remote pwnable problems to your ctf server.

Several features are:

* Creates directories along with default files (binary & flag)
* Sets recommended permissions associated to each file
* Does not harm other files in server

## Getting started

### Overview

* makeprob.sh
* removeprob.sh
* dropprob.sh
* reloadprob.sh

### Environment

```bash
user@ubuntu:~/ctf-remote-pwnable-setup$ uname -a
Linux ubuntu 4.15.0-30-generic #32~16.04.1-Ubuntu SMP Thu Jul 26 20:25:39 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
```

### Prerequisites

You need the following package(s) pre-installed.
```bash
xinetd
```

## Running the program

### Build

They are all shell scripts (bash). No need to build!

You might want to remove the `.sh` extension so that scripts can be executed just like any other command.

### Run

Formats are specified in each file.

You need root priviledges to run all four scripts because they can cause fatal issues in your directory tree.

* *`makeprob.sh` will create a default executble and flag. Replace those with your own ones*
* *When you want to keep the problem but off the port, use `dropprob.sh`*
* *To re-run a dropped problem on a specific port, use `reloadprob.sh`*
* *`removeprob.sh` to delete everything related to a problem from the server* 

## Acknowledgements

* [Suggestions for running a ctf](https://github.com/pwning/docs/blob/master/suggestions-for-running-a-ctf.markdown)

## Authors

* **James Sung** - *Initial work* - [sjkywalker](https://github.com/sjkywalker)
* Copyright © 2018 James Sung. All rights reserved.
