#!/usr/bin/env bash
NPM_USERNAME="test"
NPM_PASSWORD="test"

echo "****"
echo "* npm adduser"
echo "****"

NPM_TOKEN=$(curl -LSs -H "Content-Type:application/json" -X PUT --data "{\"name\": \"${NPM_USERNAME}\", \"password\": \"${NPM_PASSWORD}\"}" \
  "http://${NPM_REGISTRY_SERVER}/-/user/org.couchdb.user:${NPM_USERNAME}" 2>&1 | grep -Po '(?<="token": ")[^"]*')

npm set registry "http://${NPM_REGISTRY_SERVER}"
npm set "//${NPM_REGISTRY_SERVER}/:_authToken" "${NPM_TOKEN}"

echo "****"
echo "* npm publish"
echo "****"

./bin/verify-songle-api.sh
npm publish --registry "http://${NPM_REGISTRY_SERVER}"
