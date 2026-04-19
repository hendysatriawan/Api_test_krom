#!/bin/bash

set -e

cd "$(dirname "$0")"

echo "==================================="
echo " Cleaning old report folder"
echo "==================================="

rm -rf report
mkdir -p report

echo "Report folder recreated ✔"

echo "==================================="
echo " Running Pet API Collection"
echo "==================================="

newman run Postman/pet.postman_collection.json \
  -e Postman/test_Env.postman_environment.json \
  -r cli,htmlextra \
  --reporter-htmlextra-export report/pet-report.html \
  --reporter-htmlextra-title "Pet API Test Report" \
  --reporter-htmlextra-darkTheme

echo "✔ Pet API done"

echo "==================================="
echo " Running User API Collection"
echo "==================================="

newman run Postman/user.postman_collection.json \
  -e Postman/test_Env.postman_environment.json \
  -r cli,htmlextra \
  --reporter-htmlextra-export report/user-report.html \
  --reporter-htmlextra-title "User API Test Report" \
  --reporter-htmlextra-darkTheme

echo "✔ User API done"

echo "==================================="
echo " Running Store API Collection"
echo "==================================="

newman run Postman/store.postman_collection.json \
  -e Postman/test_Env.postman_environment.json \
  -r cli,htmlextra \
  --reporter-htmlextra-export report/store-report.html \
  --reporter-htmlextra-title "Store API Test Report" \
  --reporter-htmlextra-darkTheme

  --reporter-html-export report/store-report.html

echo "✔ Store API done"

echo "==================================="
echo " ALL COLLECTIONS COMPLETED SUCCESSFULLY"
echo " REPORT LOCATION: /report"
echo "==================================="