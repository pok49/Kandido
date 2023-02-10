/<body>/,/binary/{
# s:<sub>20</sub>:₂₀:g
s:([0-9])\.([0-9]):\1 \2:g
s:([0-9])([kmc]):\1 \2:g  # 4_km
s:([Ĉĉ]ap|\bp)\. ?([0-9]):\1. \2:g  # ĉap._2, p._99
s:— <emphasis>([SL]\.</emphasis></p>):<emphasis>— \1:

# s%<strong>\[([ABGHLPRSV])(<sub>20</sub>)?\]</strong>%[<code>\1</code>\2]%g
# s%\[([ABGHLPRSV])(<sub>20</sub>)?\]%[<code>\1</code>\2]%g
# s%<strong>([ABGHLPRSV])(<sub>20</sub>)?:</strong>%<code>\1</code>\2 :%g
# s%<strong>([ABGHLPRSV])(<sub>20</sub>)?</strong>%<code>\1</code>\2%g
# s%\<([ABGHLPRSV])\>([^]."<>’])%<code>\1</code>\2%g
# s%\<([ABGHLPRSV])(<sub>20</sub>)?</a>%<code>\1</code>\2</a>%g
# fooo

s%\[([ABGHLPRSV])(<sub>20</sub>)?\]%[<strong>\1\2</strong>]%g
s%(<strong>[ABGHLPRSV]<sub>20</sub>):</strong>%\1</strong> :%g
s%(<strong>[ABGHLPRSV]):</strong>%\1</strong> :%g
s%\<([ABGHLPRSV])\>([^]."<>’])%<strong>\1</strong>\2%g
s%\<([ABGHLPRSV])(<sub>20</sub>)?</a>%<strong>\1</strong>\2</a>%g


}
/FB2:/,/--2BF--/d; /PDF:/d; /FDP/d  # Remove FB2, uncomment PDF


