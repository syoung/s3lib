queued() {
    echo "rabbitmqctl list_queues -p rabbitvhost name messages messages_ready memory | grep $1";
    rabbitmqctl list_queues -p rabbitvhost name messages messages_ready memory | grep $1;
}

queues() {
    echo "rabbitmqctl list_queues -p rabbitvhost name messages messages_ready memory";
    rabbitmqctl list_queues -p rabbitvhost name messages messages_ready memory
}
