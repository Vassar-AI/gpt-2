.PHONY : build run download

tag=$(shell date +%F_%H-%M-%S)

build :
	docker build docker -t gpt-2:${tag} -f docker/Dockerfile.gpu
	docker tag gpt-2:${tag} gpt-2:latest

run :
	docker run --rm --gpus='all' -it -v ${PWD}:/gpt-2 -u $(shell id -u):$(shell id -g) gpt-2:latest

download : m124 m355 m774 m1558

m124 : models/124M
	python3 download_model.py 124M
m355 : models/355M
	python3 download_model.py 355M
m774 : models/774M
	python3 download_model.py 774M
m1558 : models/1558M
	python3 download_model.py 1558M
