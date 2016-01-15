FROM haskell:7.10

RUN cabal update

RUN cabal install \
    "mwc-random==0.13.*" \
    "containers==0.5.*" \
    "old-time==1.1.*" \
    "bytestring==0.10.*" \
    "ListZipper==1.2.*" \
    "random==1.0.*" \
    "filepath==1.3.*" \
    "directory==1.2.*" \
    "tuple==0.3.*"

RUN cabal install \
    "transformers==0.4.*" \
    "mtl==2.2.*" \
    "process==1.2.*"

RUN mkdir /build
ADD . /build

RUN cd /build &&\
   cabal configure &&\
   cabal build

RUN mkdir /src
VOLUME ["/src"]

WORKDIR /src
ENTRYPOINT ["/build/dist/build/fungi/fungi"]
CMD [ "--help" ]
