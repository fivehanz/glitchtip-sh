default: start

init: prod-nginx-link



### PRODUCTION COMMANDS
prod-release: prod-start

STACK_NAME = glitchtip
SWARM_FILE = ./docker-swarm.yml

prod-start:
	docker stack deploy -c $(SWARM_FILE) $(STACK_NAME) --detach=true

prod-update: prod-start

prod-stop:
	docker stack rm $(STACK_NAME) 

prod-rm:
	docker stack rm $(STACK_NAME)  

prod-nginx-link:
	ln -s ${shell pwd}/nginx/vhost.conf /etc/nginx/sites-enabled/gt.jsmx.org.conf
	nginx -s reload
