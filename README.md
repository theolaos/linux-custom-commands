# Custom Linux Commands

These commands work mostly as macros.

To get the custom commands in your machine run the installer.

```bash
./installer.sh -all #will install every single command
./installer.sh -install peak cllear other_command_name etc. # will install only the commands you want
./installer.sh -install -all # if you only want to install
./installer.sh -compile peak cllear other_command_name etc. # will compile only the commands you want
./installer.sh -compile -all # if you want to only compile everything
./installer.sh -help # to show the help
./installer.sh -remove # to remove all the commands that are installed
```
TODO: add -> -remove command_name etc.

- Types `ls -l` in the directory that you typed, without the need to visit that directory directly:
    ```bash
    $ peak <path/to/directory>
    ```

- Clears the terminal and runs `ls -l`:
    ```bash
    $ cllear
    ```