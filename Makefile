VERSION=$(shell git rev-list --count HEAD)-$(shell git describe --always --long)
DEPLOYMENT=node-red

.PHONY: build-image
build-image:
	docker build -t justinbarrick/node-red:$(VERSION) .

.PHONY: push-image
push-image:
	docker push justinbarrick/node-red:$(VERSION)

.PHONY: deploy
deploy:
	helm install --set image.tag=$(VERSION) --name $(DEPLOYMENT) helm

.PHONY: upgrade-deploy
upgrade-deploy:
	helm upgrade --set image.tag=$(VERSION) $(DEPLOYMENT) helm
