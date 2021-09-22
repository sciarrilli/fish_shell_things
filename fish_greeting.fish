function fish_greeting
        echo \n
        echo '                 '(set_color F00)'___
  ___======____='(set_color FF7F00)'-'(set_color FF0)'-'(set_color FF7F00)'-='(set_color F00)')
/T            \_'(set_color FF0)'--='(set_color FF7F00)'=='(set_color F00)')
[ \ '(set_color FF7F00)'('(set_color FF0)'0'(set_color FF7F00)')   '(set_color F00)'\~    \_'(set_color FF0)'-='(set_color FF7F00)'='(set_color F00)')
 \      / )J'(set_color FF7F00)'~~    \\'(set_color FF0)'-='(set_color F00)')
  \\\\___/  )JJ'(set_color FF7F00)'~'(set_color FF0)'~~   '(set_color F00)'\)
   \_____/JJJ'(set_color FF7F00)'~~'(set_color FF0)'~~    '(set_color F00)'\\
   '(set_color FF7F00)'/ '(set_color FF0)'\  '(set_color FF0)', \\'(set_color F00)'J'(set_color FF7F00)'~~~'(set_color FF0)'~~     '(set_color FF7F00)'\\
  (-'(set_color FF0)'\)'(set_color F00)'\='(set_color FF7F00)'|'(set_color FF0)'\\\\\\'(set_color FF7F00)'~~'(set_color FF0)'~~       '(set_color FF7F00)'L_'(set_color FF0)'_
  '(set_color FF7F00)'('(set_color F00)'\\'(set_color FF7F00)'\\)  ('(set_color FF0)'\\'(set_color FF7F00)'\\\)'(set_color F00)'_           '(set_color FF0)'\=='(set_color FF7F00)'__
   '(set_color F00)'\V    '(set_color FF7F00)'\\\\'(set_color F00)'\) =='(set_color FF7F00)'=_____   '(set_color FF0)'\\\\\\\\'(set_color FF7F00)'\\\\
          '(set_color F00)'\V)     \_) '(set_color FF7F00)'\\\\'(set_color FF0)'\\\\JJ\\'(set_color FF7F00)'J\)
                      '(set_color F00)'/'(set_color FF7F00)'J'(set_color FF0)'\\'(set_color FF7F00)'J'(set_color F00)'T\\'(set_color FF7F00)'JJJ'(set_color F00)'J)
                      (J'(set_color FF7F00)'JJ'(set_color F00)'| \UUU)
                       (UU)'(set_color normal)

        echo \n
        set -l start (date -j -f "%b %d %Y %H:%M:%S" "Aug 31 2021 08:00:00" +%s)
        set -l now (date +%s)
        set -l days (math round"(($now-$start)/86400)")
        set -l line3 (printf '%i days no 🍺' $days)\n
        echo $line3

    if not set -q fish_greeting
        set -l start (date -j -f "%b %d %Y %H:%M:%S" "Sep 1 2021 08:00:00" +%s)
        set -l now (date +%s)
        set -l days (math round"(($now-$start)/86400)")

        set -l line1 \n(_ '🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟')\n
        set -l line2 (_ '🐟                        🐟')\n
        set -l line3 (printf '🐟   %i without beer 🍺   🐟' $days)\n
        set -l line4 (_ '🐟                        🐟')\n
        set -l line5 (_ '🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟')\n

        set -g fish_greeting "$line1$line2$line3$line4$line5"
    end

    if set -q fish_private_mode
        set -l line (_ "fish is running in private mode, history will not be persisted.")
        if set -q fish_greeting[1]
            set -g fish_greeting $fish_greeting\n$line
        else
            set -g fish_greeting $line
        end
    end

    # The greeting used to be skipped when fish_greeting was empty (not just undefined)
    # Keep it that way to not print superfluous newlines on old configuration
    test -n "$fish_greeting"
    and echo $fish_greeting
end
