:: make sure the remote is correct
git remote rm valve
git remote add valve https://github.com/ValveSoftware/source-sdk-2013
:: pull in the latest upstream changes
git pull valve master

pause