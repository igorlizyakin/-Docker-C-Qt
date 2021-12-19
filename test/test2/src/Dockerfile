#этот контейнер выполняется эмулированным с помощью QEMU, если сборка не выполняется на оборудовании ARMv7.
#В нашем случае мы используем команду для установки зависимостей сборки Qt.

FROM --platform=linux/arm/v7 balenalib/rpi-raspbian:buster as builder

#после того как установим наши зависимости на нашем шаге ARM, можно переключиться на собственную архитектуру x86

#FROM --platform=linux/amd64 debian:buster


#задаем временную зону внутри контейнера Europe/Moscow.
ENV TZ=Europe/Moscow
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# проверяем работу кайтейнера созданием файлв txt
RUN echo "test create docker" > /test.txt


#После того, как мы переключились на x86, мы можем копировать файлы с предыдущего шага.
# Мы делаем это для того, чтобы создать системный корень, который мы можем использовать для Qt.

#RUN mkdir -p /sysroot/usr /sysroot/opt /sysroot/lib

#COPY --from=builder /lib/ /sysroot/lib/

#COPY --from=builder /usr/include/ /sysroot/usr/include/

#COPY --from=builder /usr/lib/ /sysroot/usr/lib/

#COPY --from=builder /opt/vc/ sysroot/opt/vc/

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

#система сбоки./команда добавит инструменты (экземпляры cmake и Mingw-w64 и пр.) для статической сборки проекта под 64-битную архитектуру,
# а после соберет с их помощью Qt

RUN make MXE_TARGETS=x86_64-w64-mingw32.static  qtbase  -j4 JOBS=4

#Если в проекте используются С++ 17
# создает комплект для статической сборки 64-битных приложений с использованием компилятора седьмой версии (7.4.0).

#RUN make MXE_TARGETS=x86_64-w64-mingw32.static MXE_PLUGIN_DIRS=plugins/gcc7 qtbase  -j4 JOBS=4

#добавляем в PATH путь к исполняемым файлам mxe:
ENV PATH="/cross/mxe/usr/bin:${PATH}"

#при запуске контейнера, в папку /test2/src/ будет смонтирована папка с исходниками, содержащая *.pro файл,
#в директории /test2/res/ смонтировано место, куда следует сложить результаты сборки.

ENTRYPOINT x86_64-w64-mingw32.static-qmake-qt5 /test2/src/SimpleQtProject.pro \
           && make release \
           && cp release/SimpleQtProject.exe /test2/res/

#чистим систему от метаданных и кэша пакетов после установки;
RUN yum clean all
# устанавливаем порт по умолчанию 80
EXPOSE 80
#запускаем файлов
CMD ["CMakeLists.txt", "main.cpp"]
