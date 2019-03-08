FROM paperbenni/alpine
RUN apk add --update wget tar curl bash grep tmux && rm -rf /var/cache/apk/*
RUN mkdir -p /home/user
WORKDIR /home/user

RUN wget http://cdn.limetric.com/games/openrct2/0.2.1/master/8ac731e/9/OpenRCT2-0.2.1-linux-x86_64.tar.gz && \
tar -xzf *.tar.gz && rm *.tar.gz && \
ls -l && \
chmod -R 777 /home
