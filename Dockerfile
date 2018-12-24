FROM alpine:3.8

RUN apk --no-cache add curl perl-dev alpine-sdk git expat-dev
RUN cpan -T install Mojolicious::Lite CHI DateTime Try::Tiny Path::Tiny JSON Hash::AsObject \
  List::MoreUtils CHI Data::UUID DateTime Sub::Identify XML::Simple Digest::JHash XML::Parser
RUN git clone https://github.com/nebulous/infinitude.git && chmod +x infinitude/infinitude

WORKDIR /infinitude
CMD ./infinitude daemon -m production
