.PHONY: help build run bootstrap teardown login
default: help

help:
	@echo '>make help 				/ this screen'
	@echo '>make build				/ Docker build command'
	@echo '>make bootstrap 			/ runs the docker container, builds infra'
	@echo '>make login 				/ runs the docker container, logs in'
	@echo '>make teardown 				/ runs the docker container, tears down things'
	@echo '>make bash				/ runs plain ole bash'

bootstrap: build
	docker run -v $(CURDIR):/host -v ~/.aws:/root/.aws -it sshpoc:latest /host/bootstrap.sh

login: build
	docker run -v $(CURDIR):/host -v ~/.aws:/root/.aws -it sshpoc:latest /host/login.sh

teardown: build
	docker run -v $(CURDIR):/host -v ~/.aws:/root/.aws -it sshpoc:latest /host/teardown.sh

build:
	docker build -t sshpoc:latest .

bash: build
	docker run -v $(CURDIR):/host -v ~/.aws:/root/.aws -it sshpoc:latest bash