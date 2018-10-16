.PHONY: all build

NAME = sfcn-base
ORG = haphan
INSTANCE = default

all: build

default: build push

build:
	docker build -t "$(ORG)/$(NAME):latest" .

push:
	docker push "$(ORG)/$(NAME):latest"
