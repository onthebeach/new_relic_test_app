REPO=onthebeach/new_relic_test_app
GIT_BRANCH:=$(shell git rev-parse --abbrev-ref HEAD  | sed 's/\//-/g')
GIT_SHA:=$(shell git rev-parse --verify HEAD)

docker-build:
	bundle package --all
	docker build --pull -t ${REPO}:${GIT_SHA} .
ifeq ("${GIT_BRANCH}", "master")
	docker tag ${REPO}:${GIT_SHA} ${REPO}:${GIT_BRANCH}
endif

docker-push:
	docker push ${REPO}:${GIT_SHA}
ifeq ("${GIT_BRANCH}", "master")
	docker push ${REPO}:${GIT_BRANCH}
endif

docker-run-hello-world:
	docker run \
		--rm \
		--env-file=.env \
		--env RACK_ENV=production \
		--net=host \
		${REPO}:${GIT_SHA} \
		bundle exec puma hello_world.ru 2:2 -w1 -C config/puma/hello_world.rb -p 5000
