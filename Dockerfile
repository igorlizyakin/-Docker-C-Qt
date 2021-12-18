#РёСЃРїРѕР»СЊР·СѓРµРј Р±Р°Р·РѕРІС‹Р№ РѕР±СЂР°Р· centos 7;
FROM centos:7

#Р·Р°РґР°РµРј РІСЂРµРјРµРЅРЅСѓСЋ Р·РѕРЅСѓ РІРЅСѓС‚СЂРё РєРѕРЅС‚РµР№РЅРµСЂР° Europe/Moscow.
ENV TZ=Europe/Moscow
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
# Р Р€РЎРѓРЎвЂљР В°Р Р…Р С•Р Р†Р С‘Р С РЎР‚Р В°Р В±Р С•РЎвЂЎРЎС“РЎР‹ Р Т‘Р С‘РЎР‚Р ВµР С”РЎвЂљР С•РЎР‚Р С‘РЎР‹ Р Т‘Р В»РЎРЏ РЎРѓР В±Р С•РЎР‚Р С”Р С‘ GoogleTest
WORKDIR /test/test1/src

COPY . /test/test1/src

# Р РЋР С”Р С•Р С—Р С‘РЎР‚РЎС“Р ВµР С Р Т‘Р С‘РЎР‚Р ВµР С”РЎвЂљР С•РЎР‚Р С‘РЎР‹ /src Р Р† Р С”Р С•Р Р…РЎвЂљР ВµР в„–Р Р…Р ВµРЎР‚
ADD . /test/test1

# Р Р€РЎРѓРЎвЂљР В°Р Р…Р С•Р Р†Р С‘Р С РЎР‚Р В°Р В±Р С•РЎвЂЎРЎС“РЎР‹ Р Т‘Р С‘РЎР‚Р ВµР С”РЎвЂљР С•РЎР‚Р С‘РЎР‹ Р Т‘Р В»РЎРЏ РЎРѓР В±Р С•РЎР‚Р С”Р С‘ Р С—РЎР‚Р С•Р ВµР С”РЎвЂљР В°
WORKDIR /test

LABEL maintainer="Pascal Kraft" \
      description="Basic C++ stuff for CircleCi repo." \
      version="0.1.0"
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin


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
#С‡РёСЃС‚РёРј СЃРёСЃС‚РµРјСѓ РѕС‚ РјРµС‚Р°РґР°РЅРЅС‹С… Рё РєСЌС€Р° РїР°РєРµС‚РѕРІ РїРѕСЃР»Рµ СѓСЃС‚Р°РЅРѕРІРєРё;
RUN yum clean all
# Р Р€РЎРѓРЎвЂљР В°Р Р…Р С•Р Р†Р С‘Р С РЎвЂљР С•РЎвЂЎР С”РЎС“ Р Р†РЎвЂ¦Р С•Р Т‘Р В°
EXPOSE 80

CMD ["redis-server", "--protected-mode no"]
