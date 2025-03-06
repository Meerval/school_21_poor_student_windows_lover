$NAME = "kind_c"

function Info {
    $currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff"
    Write-Host "[$currentDateTime][DOCKER][$NAME][INFO] $args" -foregroundcolor "DarkGray"
}

$imageExists = docker images -q $NAME
if (-not $imageExists) {
    Info "Image is not exists and has to be build ..."
    docker build -t $NAME .
}

$runningContainer = docker ps -aq -f "name=$NAME"
if ($runningContainer) {
    docker stop $NAME | Out-Null
    docker rm $NAME | Out-Null
    Info "Container was already running and has been stopped."c
}

Info "The container has started"
docker run --rm -it -v "${PWD}:/src" $NAME /bin/bash -c "make clang-format && make cppcheck && make build && make run"

Info "The container has stopped"

