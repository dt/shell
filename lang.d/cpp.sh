if [[ -d /usr/local/opt/ccache/libexec ]]; then
    export PATH=/usr/local/opt/ccache/libexec:$PATH
fi

if [[ -d /usr/lib/ccache ]]; then
    export PATH="/usr/lib/ccache:${PATH}"
fi

if [[ -d /usr/local/opt/libedit ]]; then
    export LDFLAGS="-L/usr/local/opt/libedit/lib"
    export CPPFLAGS="-I/usr/local/opt/libedit/include"
fi

