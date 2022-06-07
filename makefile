spring-build:
        @echo "RUN & Build & Deploy Docker Compose"
        docker compose build

docker-push:
        @echo "Push Docker Images to Docker Registry"
        docker tag aize-frontend:1.0 janithp/aize-frontend:1.0
        docker  push janithp/aize-frontend:1.0

        docker tag aize-nginx:1.0 janithp/aize-nginx:1.0
        docker  push janithp/aize-nginx:1.0

        docker tag aize-springapi:1.0 janithp/aize-springapi:1.0
        docker  push janithp/aize-springapi:1.0

run-frontend:
        @echo "Deploy the Frontend..."
        docker compose run -d nginx

run-API:
        @echo "Deploy the API..."
        docker compose run -d springboot-api

docker-logs:
        @echo "Accessing the Log Files..."
        docker compose -f docker-compose.yml logs

docker-stop:
        @echo "Stop and Remove Created Containers..."
        docker compose down -v

docker-cleanup:
        @echo "Cleaning up Docker Environment..."
        docker compose down -v && docker system prune -a
