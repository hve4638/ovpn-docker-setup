DOCKERIMG="alekslitvinenk/openvpn"
help:
	@echo "Usage: make [option]"
	@echo "\tinfo\t\tShow env"
	@echo "\tstart\t\tStart server"
	@echo "\tstop\t\tStop server"
	@echo "\tup\t\tInitialize and run ovpn server"
	@echo "\tdown\t\tStop and delete ovpn server"
	@echo "\tversion\tPrint ovpn server version"
	@echo "\tinteractive\t\tOpen shell"
	@echo "\tclean\t\tClean configuration"
info:
	@echo OVPN_NAME : $(OVPN_NAME)
	@echo OVPN_HOST : $(OVPN_HOST)
	@echo OVPN_PORT : $(OVPN_PORT)
	@echo OVPN_PORT_HTTP : $(OVPN_PORT_HTTP)
	@echo OVPN_CONF : $(OVPN_CONF)

start:
	docker start $(OVPN_NAME)
stop:
	docker stop $(OVPN_NAME)
up:
	docker run -it --restart unless-stopped --cap-add=NET_ADMIN -p $(OVPN_PORT):1194/udp -p $(OVPN_PORT_HTTP):8080/tcp -e HOST_ADDR=$(OVPN_HOST) --name $(OVPN_NAME) $(DOCKERIMG)
down:
	docker container rm $(OVPN_NAME) -f
version:
	docker exec $(OVPN_NAME) ./version.sh
interative:
	docker exec -it $(OVPN_NAME) /bin/bash
pull:
	docker pull $(DOCKERIMG)

clean:
	sudo rm $(OVPN_CONF)/.gen -f
	sudo rm $(OVPN_CONF)/ta.key -f
	sudo rm $(OVPN_CONF)/clients -rf
	ls -a $(OVPN_CONF)