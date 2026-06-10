FROM ruby:3.2-alpine
WORKDIR /github-polyglot
COPY . .
RUN \
	apk --update add --virtual .build-deps \
		build-base \
		libc-dev \
		cmake \
		zlib \
		zlib-dev \
		openssl-dev \
	&& apk add icu-dev \
	&& gem build -o github-polyglot.gem \
	&& gem install ./github-polyglot.gem \
	&& apk del .build-deps \
	&& rm /var/cache/apk/*
ENTRYPOINT ["github-polyglot"]
