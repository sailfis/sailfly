#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��N�bconfigure.sh }RMo�0��WV�is�֡95�z[�B�i[�-�v��'ى��|�����N��-$)Z�\�N{�Q�h�-d9���ߘi 2ŬP�βY&6���
�Oh���.�V+�g��Ju�r˯�;�����ڐ�^��W�4�t�k�����H$U�N.����÷��I�^���n������	��3V���#��Ҋ�ƭ��uoUf~�$�r�d:<2�i2(�o��қ6?��7;q�n�	�yU�����g熇ݯ�q�;�g&�]�\7|�f�Z˲��9||���ի�RK�|:>��S0����<�O�0$SY�d��Y��	mE�qEM���L�4�HY�J��+	m�ʷ0Or,DWKR��T����������yY��7���6m-}��erX,�G!*a�l\��(>-�T�e��  