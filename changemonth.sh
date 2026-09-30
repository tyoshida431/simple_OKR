#!/bin/zsh

if [ $# != 4 ]; then
  echo "usage : 先々月(202109) 先月(202110) 先月 (10) 今月(11)"
  exit
fi

if [ ${1} = "-h" ]; then
  echo "usage : 先々月(202109) 先月(202110) 先月 (10) 今月(11)"
  exit
fi

PRETWOMONTH=${1}
PREMONTH=${2}
PREMONTHNUM=${3}
NOWMONTHNUM=${4}

mv index.html ${PREMONTH}.html
cp -p index.md index_${PREMONTH}.md
echo "" > index.md
cp -p index_colored.md index_colored_${PREMONTH}.md
echo "" > index_colored.md

cat ${PREMONTH}.html | perl -pe s/"    \<li\>\<a href=\".\/index.html\"\>トップ\<\/a\>\<\/li\>"/"    \<li\>\<a href=\".\/index.html\"\>トップ\<\/a\>\<\/li\>\\n    \<li\>\<a href=\".\/index.html\"\>次の月\>\>\<\/a\>\<\/li\>"/g > ${PREMONTH}.tmp

mv ${PREMONTH}.tmp ${PREMONTH}.html

sed -i -e s/"a href=\".\/index.html\"\>次の月"/"a href=\".\/${PREMONTH}.html\"\>次の月"/g ${PRETWOMONTH}.html

sed -i -e s/"${PREMONTHNUM}月"/"${NOWMONTHNUM}月"/g head.tmpl
sed -i -e s/"${PRETWOMONTH}.html"/"${PREMONTH}.html"/g head.tmpl
sed -i -e s/"${PRETWOMONTH}.html"/"${PREMONTH}.html"/g tail.tmpl

scp ${PRETWOMONTH}.html ${PREMONTH}.html ${SERVER_IP}:${SERVER_OKR_PATH}
