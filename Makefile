build:
	echo "Building App ..."
	docker compose build

run:
	echo "Running App ..."
	#docker compose up --build
	minikube start
	kubectl apply -f ./statefulset-backend.yml
	sleep 10
	kubectl apply -f ./consumer/deploy-consumer.yml
	sleep 10
	kubectl apply -f ./producer/deploy-producer.yml
