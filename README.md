# CS 323: Nix Environment

To work on the project on your laptop:

1. Install the `nix` package manager:

    `curl -L https://nixos.org/nix/install | sh`

If you use Windows, you'll have to set up the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10#update-to-wsl-2) and run the command in the Linux distribution of your choice. If you're new to Unix, I'd reccomend Ubuntu. Mac OS and Linux users can use their native terminal emulators.

Running that `curl` command as a user who is _not_ root should configure everything without issue. If you run into problems, consult [the official Nix documentation](https://nixos.org/download.html) for further instructions, and feel free to reach out to me on Piazza for help.

2. Clone this repository onto your machine and `cd` into it.

3. Run `nix-shell` in the directory you entered in the last step.

Tada! You're done. You now have the right versions of `llvm` and other system dependencies required to work on the homework. This project is also configured to run some linters and formatters every time you make a `git` commit. Your `$PATH` is configured properly too.
