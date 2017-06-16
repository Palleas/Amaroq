#!/usr/bin/env bash

printenv  | grep HOCKEYAPP

cd $BUDDYBUILD_PRODUCT_DIR

find . -name "*.dSYM" | xargs -I \{\} zip -r all-dSYM.zip {}

curl -F "ipa=@$BUDDYBUILD_IPA_PATH" \
    -F "dsym=all-dSYM.zip" \
    -H "X-HockeyAppToken: $HOCKEYAPP_API_TOKEN" \
    "https://rink.hockeyapp.net/api/2/apps/$HOCKEYAPP_APP_ID/app_versions/upload"
