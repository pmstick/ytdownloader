FROM python:3.7.0-slim
RUN apt-get update \ 
&& apt-get  install -y \
                       # wget dependency
                       openssl \
                       # dev dependencies
                       git \
                       bash \
                       sudo \
					   ffmpeg \					   
                       #py3-pip \                       
&& apt-get clean				


RUN git clone https://github.com/PizzaWaffles/Automatic-Youtube-Downloader.git /app/
COPY main.py /app/main.py
WORKDIR /app
RUN pip install -r ./requirements.txt

RUN python3 ./poetry/get_poetry.py --version 0.12.11
RUN mkdir ./logs && touch ./logs/main.log
VOLUME /app/data /downloads
CMD ["python3" , "./main.py"]
