VERSION=$(shell git rev-list --count HEAD)-$(shell git describe --always --long)
DEPLOYMENT=stable

.PHONY: build-image
build-image:
	docker build -t justinbarrick/node-red:$(VERSION) -f docker/Dockerfile .

.PHONY: push-image
push-image:
	docker push justinbarrick/node-red:$(VERSION)

.PHONY: deploy
deploy:
	helm install --set image.tag=$(VERSION) helm

.PHONY: upgrade-deploy
upgrade-deploy:
	helm upgrade --set image.tag=$(VERSION) $(DEPLOYMENT) helm
