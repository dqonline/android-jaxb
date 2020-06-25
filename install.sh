#!/bin/sh

set -e

USER_WHOAMI="ducquoc"
#USER_WHOAMI="`whoami`"
#USER_HOME="/Users/ducquoc"
USER_HOME="$HOME"
#INSTALL_DIR_BASE="/usr/share/$USER_WHOAMI"
INSTALL_DIR_BASE="/opt/$USER_WHOAMI"
INSTALL_DIR="${INSTALL_DIR_BASE}/android-jaxb"
#TMP_DIR="/tmp/ducquoc"
TMP_DIR="/tmp/$USER_WHOAMI"
JAR_FILE="android-jaxb-1.0.20200601-jar-with-dependencies.jar"
DOWNLOAD_URL="https://sites.google.com/site/ducquocvn/home/${JAR_FILE}"
HEADWAY_URL="https://github.com/ducquoc/fresher-training/tree/master/java-hardway-core"
AUTOMATION_URL="https://github.com/ducquoc/fresher-training/tree/master/qa-automation-browser"

mkdir -p ${INSTALL_DIR}
mkdir -p ${TMP_DIR}
cd ${TMP_DIR}
echo "Downloading AndroidJAXB from ${DOWNLOAD_URL}"
curl -L -O "${DOWNLOAD_URL}"
echo "Installing to ${INSTALL_DIR} ..."
[ -f ${JAR_FILE} ] && mv ${JAR_FILE} ${INSTALL_DIR}
cd ${INSTALL_DIR}
chmod +x ${INSTALL_DIR}/${JAR_FILE}
echo "java -jar ${INSTALL_DIR}/${JAR_FILE} \"\$@\"" > androidjaxb.sh
chmod +x ${INSTALL_DIR}/androidjaxb.sh
rm -f ${INSTALL_DIR}/androidjaxb && ln -sf ${INSTALL_DIR}/androidjaxb.sh androidjaxb
#ln -n androidjaxb ${INSTALL_DIR}/androidjaxb.sh
#chmod +x ${INSTALL_DIR}/androidjaxb
echo "Installation Complete"
PATH=${INSTALL_DIR}:$PATH
#"${INSTALL_DIR}"/androidjaxb
androidjaxb.sh
