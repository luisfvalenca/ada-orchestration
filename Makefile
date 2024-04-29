build:
	echo "Building App ..."
	docker pull rabbitmq:3.12.13-management
	docker pull redis/redis-stack:7.2.0-v10
	docker pull bitnami/minio:2024.3.30
	docker compose build

run:
	echo "Running App ..."
	#docker compose up --build
	minikube start
	kubectl create namespace backend
	kubectl apply -f ./statefulset-backend.yml
	sleep 10
	kubectl create namespace apps
	kubectl apply -f ./consumer/deploy-consumer.yml
	sleep 10
	kubectl apply -f ./producer/deploy-producer.yml
