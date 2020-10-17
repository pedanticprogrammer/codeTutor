#!/bin/bash
if [ ! -f /code/.env ]; then
    touch /code/.env
    echo -e "NODE_ENV=production\nDATABASE_URL=$DATABASE_URL\nSESSION_SECRET=$SESSION_SECRET\nSECRET=$SECRET" >> /code/.env
fi
npm start