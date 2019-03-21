#!/bin/sh

PARAM=$1

DEV_URLS=(
    "https://github.com"
    "https://gitstalk.netlify.com"
)

MAIL_URLS=(
    "https://mail.google.com/"
    "https://outlook.live.com/"
)

SOCIAL_URLS=(
    "https://reddit.com"
    "https://twitter.com"
    "https://messenger.com"
)

CHILL_URLS=(
    "https://music.youtube.com"
    "https://youtube.com"
    "https://netflix.com"
)

if [ $PARAM ]
then
    if [ $PARAM = "-d" ] || [ $PARAM = "--dev" ]
    then
        USER=$2
        if [ $USER ]
        then
            DEV_URLS[0]="https://github.com/$USER"
            DEV_URLS[1]="https://gitstalk.netlify.com/$USER"
        fi
        open -a "Google Chrome" ${DEV_URLS[*]}
    elif [ $PARAM = "-m" ] || [ $PARAM = "--mail" ]
    then
        open -a "Google Chrome" ${MAIL_URLS[*]}
    elif [ $PARAM = "-s" ] || [ $PARAM = "--social" ]
    then
        open -a "Google Chrome" ${SOCIAL_URLS[*]}
    elif [ $PARAM = "-c" ] || [ $PARAM = "--chill" ]
    then
        open -a "Google Chrome" ${CHILL_URLS[*]}
    elif [ $PARAM = "-a" ] || [ $PARAM = "--all" ]
    then
        USER=$2
        if [ $USER ]
        then
            DEV_URLS[0]="https://github.com/$USER"
            DEV_URLS[1]="https://gitstalk.netlify.com/$USER"
        fi
        open -a "Google Chrome" ${MAIL_URLS[*]} ${SOCIAL_URLS[*]} ${CHILL_URLS[*]} ${DEV_URLS[*]}
    else 
        open -a "Google Chrome" $PARAM
    fi
else
    open -a "Google Chrome" ./
fi