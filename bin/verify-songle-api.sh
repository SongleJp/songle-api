#!/usr/bin/env bash
LOCAL_SONGLE_API_PATH="./lib/api.js"
SONGLE_API_MODULE_URL="https://api.songle.jp/v2/api.js"

if [[ ! -f ${LOCAL_SONGLE_API_PATH} ]]; then
  echo "'${LOCAL_SONGLE_API_PATH}' is not found."
  exit 1
fi

if [[ ! $(curl -LSs ${SONGLE_API_MODULE_URL} -o /dev/null -w "%{http_code}\n") -eq 200 ]]; then
  echo "'${SONGLE_API_MODULE_URL}' is not found."
  exit 1
fi

diff <(cat ${LOCAL_SONGLE_API_PATH}) <(curl -LSs ${SONGLE_API_MODULE_URL}) >/dev/null
EXIT_CODE=$?

if [[ ${EXIT_CODE} -eq 0 ]]; then
  echo "OK"
  exit 0
else
  echo "NG"
  exit 1
fi
