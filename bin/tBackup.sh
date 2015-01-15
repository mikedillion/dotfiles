#!/bin/sh
# Simple Twitter backup script

export DAY=`date +'%Y-%m-%d'`
export account=$1

echo "Backing up tweets..."
t timeline $account --csv --number 3000 > tweets-$DAY.csv
echo "Backing up retweets..."
t retweets --csv --number 3000 > retweets-$DAY.csv
echo "Backing up favorites..."
t favorites --csv --number 3000 > favorites-$DAY.csv
echo "Backing up DM received..."
t direct_messages --csv --number 3000 > dm_received-$DAY.csv
echo "Backing up DM sent..."
t direct_messages_sent --csv --number 3000 > dm_sent-$DAY.csv
echo "Backing up followings..."
t followings --csv > followings-$DAY.csv

echo -e "\nBacked up the following:"
echo -e "- "`wc -l tweets-$DAY.csv|cut -d" " -f 1`" tweets"
echo -e "- "`wc -l retweets-$DAY.csv|cut -d" " -f 1`" retweets"
echo -e "- "`wc -l favorites-$DAY.csv|cut -d" " -f 1`" favorites"
echo -e "- "`wc -l dm_received-$DAY.csv|cut -d" " -f 1`" DM received"
echo -e "- "`wc -l dm_sent-$DAY.csv|cut -d" " -f 1`" DM sent"
echo -e "- "`wc -l followings-$DAY.csv|cut -d" " -f 1`" followings"

echo -e "\nDone\n"
