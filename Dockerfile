FROM ubuntu:20.10
MAINTAINER Vladislav Khokhlov <vskhokhlov@edu.hse.ru>
ENV DEBIAN_FRONTEND noninteractive

RUN 	apt update && apt upgrade -y && \
	apt-get install -y software-properties-common && \
	add-apt-repository universe multiverse && \
	apt update && apt upgrade -y && \
	apt-get install --no-install-recommends --yes \
	texlive-plain-generic \
	texlive-fonts-recommended \
	texlive-latex-extra \
	texlive-fonts-extra \
	dvipng \
	texlive-latex-recommended \
	texlive-base \
	texlive-pictures \
	texlive-lang-cyrillic \
	texlive-science \
	cm-super && \
	rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]
WORKDIR /data
COPY CV /data
CMD pdflatex -interaction=nonstopmode /data/main.tex

