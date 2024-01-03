#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYK?  �_�Tp}���~�ގ����  D   � P @�klm�H54I��f����Q�LC A���'�ba�"xJl@ОI�ɦ� 4� �@�24Ѧ@b`� h�@`L�$��d�S����4���d3Pz@�f��h�h�0���w�#��|�-C�u���$��H����/��3�s3L͉�m�f�k�@�@ia'��Ȍ���D�-;���}��ܡv%%��>�+���(]�:��<���.;f��k)�ST{	X/0 �����7�U`uh�4K���n��k��l��S-��6�G�f��ި=�i�A�~b�+_��� ���F6%�����f���U��K��*�66᤯����w@���g1]�	f�$����LJ�d�r�{���x?P�i�`��<_	��%!�WN\\���f�Ѥ"39�թ�094�����"D�\lF�(�1%h`0��+��9�NuT�a u�l�Gp��o@��Aj��B @������(:�v�܉��@��>��f'��'�R�&A��K���^�#���9/|J���N��k�R��j�,E#��)&JA��B+� ����\�S�wŲ۔1����Q���ì&�5h��\��Bg#i4fbR�~�|�]m��C;�y C��b\��*��kda�5�ⱻO�C�%]�h�X�įA:u҄,��FU��ɵ���۪��z�*��`�ꨐ�O,������MX	a�A0T���a���+Z���J�}�\H�A�*V��d�@�IDquİ�'��i
.�(�RW���|�����2�z�� K�v�_�v�=�;�JIИ@��.�p� >*�~