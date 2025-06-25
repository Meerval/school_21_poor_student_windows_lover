# 🐧For Peers Who Love Windows So Much 💔

This Docker project helps you write code in any Windows IDE and synchronize your changes with a Linux container in real time.

⚠️ **Note:** You may see the username `ashaclem` used in paths and commands. This is a placeholder for a personal login. Replace it with your own username if necessary.

## Getting Started

1. Choose the directory where you want to work on your School 21 projects and download this project into that directory.
2. Download and install [Docker for Windows](https://docs.docker.com/desktop/setup/install/windows-install/), then launch it.
3. Open PowerShell in the project directory and build the Docker image:

    ```ps1
    docker build -t s21 .
    ```

4. Create a container based on the image (think of it as creating a new computer):

    ```ps1
    docker create --name s21 -v "${PWD}:/home/ashaclem/s21" -it s21
    ```

5. Start the container (like powering on your new computer):

    ```ps1
    docker start -ai s21
    ```

    To stop the container, run:
    
    ```ps1
    docker stop s21
    ```

6. Verify the container is running:

    ```ps1
    docker ps
    ```

7. Access the container's terminal:

    ```ps1
    docker exec -it s21 /bin/bash
    ```

    Use `exit` to leave the terminal.

8. Set up SSH keys inside the container. Place your own SSH keys into the `.ssh/` directory of the project, and name them `id_ed25519` and `id_ed25519.pub`.

9. Run `dos2unix.sh` inside the container to convert script files from Windows to Linux line endings (`\r\n` → `\n`):

    ```sh
    ./dos2unix.sh
    ```

10. Run `docker_preset.sh` inside the container to install the SSH keys and assign correct permissions to your user:

    ```sh
    ./docker_preset.sh
    ```

## You're Done!

Now, to start working, just start your Docker container and you're good to go.

You can now also clone your GitLab projects directly inside the Docker container using SSH, and work with them using your Windows IDE in real time. This allows seamless development and version control integration across platforms.

> ⚠️ Sometimes, if you add files from the Windows side, you may need to manually reset ownership and permissions inside the container:
> ```sh
> sudo chown -R ashaclem:ashaclem /home/ashaclem/s21
> sudo chmod -R u+rwX /home/ashaclem/s21
> ```

> ⚠️ Also, if you try to run shell scripts created on Windows, you may need to re-run `dos2unix.sh`, or use this command to fix all relevant files inside the container:
> ```sh
> find . -type f \( -iname "*.sh" -o -iname "*.c" -o -iname "*.h" -o -iname "*.yml" -o -iname "Dockerfile" -o -iname "Makefile" \) -exec dos2unix {} +
> ```

> ⚠️ You may encounter a problem where files in your Git repository appear as changed when switching between Windows and Docker (Linux) environments, even though you didn’t actually modify them. This typically shows up as:
>   - Changes in file permissions (e.g., 100755 to 100644 and vice versa)
>   - Differences in line endings (CRLF on Windows vs LF on Linux)
>   - Different handling of symbolic links (symlinks)
>   - This happens because Windows and Linux have different file system behaviors and Git settings.
> ### 🔧 How to Fix It
> 1. Git Settings on Windows (Host)
> Open Git Bash or CLion terminal and run:
> ```sh
> git config core.filemode false       # Ignore permission changes
> git config core.autocrlf input       # Convert CRLF to LF on commit
> git config core.symlinks false       # Disable symlink support on Windows
> git config core.safecrlf true        # Warn about unsafe line endings
> git add --renormalize .              # Apply new settings to all files
> git reset --hard                     # Discard local changes caused by permission or line ending diffs
> git commit -m "Normalize file modes and line endings for Windows/Linux consistency"
> ```
> 2. Git Settings Inside the Docker Container
> ```sh
> git config --global core.filemode false
> git config --global core.autocrlf input
> git config --global core.symlinks false
> git config --global core.safecrlf true
> ```
> 3. Create a Simple .gitattributes via Bash (To enforce consistent line endings for all files, create a .gitattributes file in your repo root):
> ```sh
> echo "* text=auto eol=lf" > .gitattributes
> git add .gitattributes
> git commit -m "Add .gitattributes to enforce LF line endings on all files"
> ```

