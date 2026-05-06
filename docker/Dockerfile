FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0

RUN apt-get update && apt-get install -y --no-install-recommends \
  spin \
  build-essential \
  make \
  tk \
  tcl \
  graphviz \
  curl \
  ca-certificates \
  xvfb \
  fluxbox \
  x11vnc \
  novnc \
  websockify \
  xterm \
  procps \
  && rm -rf /var/lib/apt/lists/*

RUN curl -L \
  https://raw.githubusercontent.com/nimble-code/Spin/master/optional_gui/ispin.tcl \
  -o /usr/local/bin/ispin.tcl \
  && chmod +x /usr/local/bin/ispin.tcl

COPY start-ispin.sh /usr/local/bin/start-ispin.sh
RUN chmod +x /usr/local/bin/start-ispin.sh

WORKDIR /work

EXPOSE 6080

CMD ["/usr/local/bin/start-ispin.sh"]