function cleanup_docker
    echo "Stopping all running containers..."
    docker stop (docker ps -q)

    echo "Removing all stopped containers..."
    docker rm (docker ps -a -q)

    echo "Removing all unused images..."
    docker rmi (docker images -q)

    echo "Removing all dangling volumes..."
    docker volume rm (docker volume ls -qf dangling=true)

    echo "Removing all unused networks..."
    docker network rm (docker network ls -q)

    echo "Pruning unused resources..."
    docker system prune -af

    echo "Docker cleanup complete."
end
