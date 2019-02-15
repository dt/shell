if [[ -d /usr/local/opt/ccache/libexec ]]; then
    export PATH=/usr/local/opt/ccache/libexec:$PATH
fi

  export LDFLAGS="-L/usr/local/opt/libedit/lib"
  export CPPFLAGS="-I/usr/local/opt/libedit/include"