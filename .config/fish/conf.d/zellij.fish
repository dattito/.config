if type -q zellij
  set -x ZELLIJ_AUTO_ATTACH "true"
  # set -x ZELLIJ_AUTO_EXIT "true"

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
    if not set -q ZELLIJ
                if test "$ZELLIJ_AUTO_ATTACH" = "true"
                    zellij attach -c
                else
                    zellij
                end

                if test "$ZELLIJ_AUTO_EXIT" = "true"
                    kill $fish_pid
                end
            end
      end
end
