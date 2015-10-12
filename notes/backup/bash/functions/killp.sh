function killp() {
    if [ -z "$1" ]; then
        exit;
    fi

    pid=$(netstat -ntulp | grep $1 | xargs -n 1 | grep node | sed "s/\/node//")
    echo "Pid: $pid"

    if [ "$pid" != "" ]; then
        echo "DOING kill -9 " $pid
        kill -9 $pid;
    fi
}
