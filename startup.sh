#!/bin/bash
if [ ! -f /code/startup.sh ]; then
    touch /code/.env
    echo -e "NODE_ENV=production\nDATABASE_URL=$DATABASE_URL\nSESSION_SECRET=$SESSION_SECRET\nSECRET=$SECRET" >> /code/.env
fi
npm start