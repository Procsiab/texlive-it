# Crea immagine Docker di TexLive 2019 in Italiano, per Raspberry Pi (ARMv7 32bit)

# Immagine base "snellita" (no manpage, no accessibilità, ecc...)
FROM arm32v7/debian:unstable-slim

# Cartella in cui sarà scaricato l'installer di texlive aggiunta alla PATH
ENV PATH /usr/local/texlive/2019/bin/armhf-linux:$PATH

# Disabilita chache per apt, aggiorna e installa pacchetti
RUN echo -e "Dir::Cache "";\nDir::Cache::archives "";" > /etc/apt/apt.conf.d/02nocache && \
	apt update && apt install -y make perl wget xz-utils tar && mkdir /tmp/install-tl-unx

# Copia file profilo installazione personalizzato
COPY texlive.profile /tmp/install-tl-unx/

# Scarica archivio col net installer di texlive
RUN wget -qO - ftp://tug.org/historic/systems/texlive/2019/install-tl-unx.tar.gz | \
    tar -xz -C /tmp/install-tl-unx --strip-components=1
# Installa usando il profilo personalizzato
RUN /tmp/install-tl-unx/install-tl \
      --profile=/tmp/install-tl-unx/texlive.profile
# Rimuovi cartella con installer e pacchetti inutili
RUN rm -rf /tmp/install-tl-unx

# Imposta cartella di lavoro ed esponi punto montaggio volume
WORKDIR /workdir
VOLUME ["/workdir"]

# Avvia shell bash quando container avviato con comando
CMD ["bash"]
