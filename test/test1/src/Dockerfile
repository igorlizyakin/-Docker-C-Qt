#используем базовый образ centos 7;
#FROM centos:7

# В качестве базового образа для сборки используем gcc:latest
FROM gcc:latest as build

#задаем временную зону внутри контейнера Europe/Moscow.
ENV TZ=Europe/Moscow
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# проверяем работу кайтейнера созданием файлв txt
RUN echo "test create docker" > /test.txt


#делаем копии деректории в Docker контейнер

WORKDIR /test/test1/src

COPY . /test/test1/src

ADD . /test/test1

#установка рабочей директории
WORKDIR /test
LABEL maintainer="Pascal Kraft" \
      description="Basic C++ stuff for CircleCi repo." \
      version="0.1.0"
ARG DEBIAN_FRONTEND=noninteractive

#Установка необходимого окружения

#RUN apt-get update &&\
 #   apt-get install -y cmake
#RUN apt-get update -y && \
 #   apt-get install -y tzdata
#RUN apt-get install -y --no-install-recommends\
 #                   git \
  #                  curl \
    #                gcc-9 \
     #               g++ \
      #              clang-10 \
       #             build-essential \
        #            cmake \
         #           unzip \
         #           tar \
          #          ca-certificates && \
   # apt-get autoclean && \
   # apt-get autoremove && \
   # apt-get clean && \
   # rm -rf /var/lib/apt/lists/*


#клонирование репозитория из Githuba

#RUN mkdir /cross \
 #  && cd /cross \
  # && git clone https://github.com/mxe/mxe.git \
   #&& cd mxe \
   #&& git checkout build-2019-06-02

# Выполним сборку нашего проекта
RUN cmake ../src
   && cmake --build .

#чистим систему от метаданных и кэша пакетов после установки;
RUN yum clean all
# устанавливаем порт по умолчанию 80
EXPOSE 80
#запускаем файлов
CMD ["CMakeLists.txt", "main.cpp"]


