build-jenkins-data:
	@echo "## build-jenkins-data ##"
	docker build -t jenkins-data -f data/Dockerfile .
	docker create --name jenkins-data jenkins-data

build-jenkins-master:
	@echo "## build-jenkins-master ##"
	docker build -t jenkins-master -f master/Dockerfile .

run:
	@echo "## build-jenkins-master ##" 
	docker run -d --name jenkins-master --volumes-from jenkins-data -p 8080:8080 -p 50000:50000 jenkins-master