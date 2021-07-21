FROM pandoc/latex:2.14.1

RUN tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet
RUN tlmgr update --self --all
RUN tlmgr install \
    collection-langjapanese \
    collection-luatex \
    latexmk \
    collection-fontsrecommended filehook type1cm mdframed needspac

ENTRYPOINT ["/bin/sh", "-c"]

WORKDIR /data