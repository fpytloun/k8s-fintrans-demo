ORGANISATION := $(shell id -n -u)
IMAGE_PREFIX := fintrans-

build: build-generator build-influx-ingest build-laundering-detector
push: push-generator push-influx-ingest push-laundering-detector

build-%:
	$(eval IMAGE := $(patsubst build-%,%,$@))
	@echo "Building image $(ORGANISATION)/$(IMAGE_PREFIX)$(IMAGE)"
	(cd $(IMAGE) && docker build -t $(ORGANISATION)/$(IMAGE_PREFIX)$(IMAGE) .)

push-%:
	$(eval IMAGE := $(patsubst push-%,%,$@))
	@echo "Pushing image $(ORGANISATION)/$(IMAGE_PREFIX)$(IMAGE)"
	docker push $(ORGANISATION)/$(IMAGE_PREFIX)$(IMAGE)
