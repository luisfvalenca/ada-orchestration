#build:
#	echo "Building App ..."
#	docker compose build

run:
	echo "Running App ..."
#	docker compose up --build
#	Start no minikube e aplica configuracoes
	minikube start
#	Configura servicos e ingresss
	minikube addons enable ingress
	minikube addons enable metrics-server
	sudo echo "$(minikube ip) minio.ada-orchestration" >> /etc/hosts
	sudo echo "$(minikube ip) rabbitmq.ada-orchestration" >> /etc/hosts
	sudo echo "$(minikube ip) redis.ada-orchestration" >> /etc/hosts
	
#	Cria os namespaces e faz apply dos controlers
	kubectl create namespace backend
	kubectl apply -f ./statefulset-backend.yml
	sleep 10
	kubectl create namespace apps
	kubectl apply -f ./consumer/deploy-consumer.yml
	sleep 10
	kubectl apply -f ./producer/deploy-producer.yml

	kubectl -- port-forward service/rabbitmq-svc 15672:15672
	kubectl -- port-forward service/minio-svc 9000:9000
	kubectl -- port-forward service/minio-svc 9001:9001
	kubectl -- port-forward service/redis-svc 8001:8001
