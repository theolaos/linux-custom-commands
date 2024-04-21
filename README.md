# Custom Linux Commands

[![wakatime](https://wakatime.com/badge/user/018c54ba-f9f5-426e-9733-6deb502d647d/project/018ef1ea-6fa3-4825-88db-e4f7bed99f7f.svg)](https://wakatime.com/badge/user/018c54ba-f9f5-426e-9733-6deb502d647d/project/018ef1ea-6fa3-4825-88db-e4f7bed99f7f)

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
