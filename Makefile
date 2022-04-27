IMAGE_NAME ?= foobar
CLUSTER_NAME ?= k3s-default
k3d ?= /home/linuxbrew/.linuxbrew/bin/k3d

library/$(IMAGE_NAME): .
	sudo docker build -t $(IMAGE_NAME) $<

up: library/$(IMAGE_NAME)
	sudo $(k3d) cluster create $(CLUSTER_NAME) --image $< --api-port 6550 -p "8081:80@loadbalancer"

clean: 
	sudo $(k3d) cluster delete $(CLUSTER_NAME)