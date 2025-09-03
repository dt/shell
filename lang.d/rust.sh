if [[ -d ~/.cargo ]]; then
  case ":${PATH}:" in
      *:"$HOME/.cargo/bin":*)
          ;;
      *)
          # Prepending path in case a system-installed rustc needs to be overridden
          export PATH="$HOME/.cargo/bin:$PATH"
          ;;
  esac
fi