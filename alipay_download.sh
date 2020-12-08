#/usr/bin/bash
#======alipay====
> /projects/daemon/common-audit/alipay/cmd.txt
ftp -in<<EOF
o 10.252.185.49
user gmccthirdpayment Tdy2743*#
prompt off
bin
passive
cd /data/ecop/thirdpayment/target
lcd /projects/daemon/common-audit/alipay/temp/
mget PVAX*_GZ.nnn
bye
EOF

cd /projects/daemon/common-audit/alipay/temp/
file=`ls`
echo "ftp -in<<EOF
o 10.252.22.251
user ftptossn Yn9!Lx8!
cd /hwjkfile2/FileTtmp/DZQDPV/DZQD2CRM/
lcd /projects/daemon/common-audit/alipay/temp/" >>/projects/daemon/common-audit/alipay/cmd.txt
for f in ${file}
do
echo "put ${f}" >>/projects/daemon/common-audit/alipay/cmd.txt
echo "rename /hwjkfile2/FileTtmp/DZQDPV/DZQD2CRM/${f} /hwjkfile2/FileTrans/DZQDPV/DZQD2CRM/${f}"
done
echo "bye
EOF" >> /projects/daemon/common-audit/alipay/cmd.txt

echo "ftp -in<<EOF
o 10.252.185.49
user gmccthirdpayment Tdy2743*#
prompt off
bin
passive" >> /projects/daemon/common-audit/alipay/cmd.txt
for f in ${file}
do
echo "rename /data/ecop/thirdpayment/target/${f} /data/ecop/thirdpayment/bak/${f}" >> /projects/daemon/common-audit/alipay/cmd.txt
done
echo "bye
EOF" >> /projects/daemon/common-audit/alipay/cmd.txt

sh /projects/daemon/common-audit/alipay/cmd.txt
