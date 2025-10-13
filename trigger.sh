#!/bin/bash

curl -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/bariamanoj/ios-builder/actions/workflows/ios-build-deploy.yml/dispatches \
  -d '{
    "ref": "main",
    "inputs": {
      "repo_url": "bariamanoj/NewAppSample1",
      "app_name": "NewAppSample1",
      "bundle_identifier": "com.san.mainAp"
    }
  }'
