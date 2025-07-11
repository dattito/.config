if type -q zellij; and status is-interactive

  function zr
    zellij run --name "$argv" -- zsh -ic "$argv"
  end

  function zrf
    zellij run --name "$argv" --floating -- zsh -ic "$argv"
  end

  function ze
    zellij edit "$argv"
  end

  function zef
    zellij edit --floating "$argv"
  end

  if test "$NO_MULTIPLEXER" != "1"
    set -x ZELLIJ_AUTO_ATTACH "true"
    set -x ZELLIJ_AUTO_EXIT "true"
    eval (zellij setup --generate-auto-start fish | string collect)
  end
end
