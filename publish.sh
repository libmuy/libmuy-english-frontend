#!/bin/sh

# . .env
# flutter build web && \
# ssh $LIBMUY_ENGLISH_SRV_HOST rm -rf $LIBMUY_ENGLISH_SRV_PATH/* && \
# scp -r build/web/* $LIBMUY_ENGLISH_SRV_HOST:$LIBMUY_ENGLISH_SRV_PATH

flutter build web && \
cd gh-pages && \
git pull && \
find . -type f ! -name 'CNAME' -delete && \
find . -type d -empty -delete && \
cp -r ../build/web/* docs/ && \
git add --all && \
git commit -m "Publishing to gh-pages" && \
git push origin
