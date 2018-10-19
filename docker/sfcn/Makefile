.PHONY: all build

NAME = sfcn
ORG = haphan
INSTANCE = default

default: build push

build:
	docker build --no-cache --tag "$(ORG)/$(NAME):latest" .

push:
	docker push "$(ORG)/$(NAME):latest"

run:
	docker run -d --name sfcn -p 8000:80 haphan/sfcn:latest

rm:
	docker rm -f sfcn