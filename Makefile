build:
	echo "Building App ..."
	docker compose build

run:
	echo "Running App ..."
	docker compose up --build
