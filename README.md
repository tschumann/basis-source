Basis Source
============

Something like Spirit of Half-Life.


How to fork this without using GitHub's forking
-----------------------------------------------

$ # clone the repo

$ git clone --mirror https://github.com/tschumann/basis-source

$ cd basis-source

$ # push the checkout of Basis Source into a repo that you have created

$ git push --mirror https://github.com/you/repo


$ # clone your repo

$ git clone https://github.com/you/repo

$ # note that similar steps below in update.bat too

$ # create a new remote that points to Basis Source

$ git remote add basis https://github.com/tschumann/basis-source

$ # pull the latest changes from Basis Source

$ git pull basis master


Setting up local development
----------------------------

$ # clone the repo

$ git clone https://github.com/tschumann/basis-source

$ # create a new remote to link back to Valve's source-sdk-2013 repo

$ git remote add valve https://github.com/ValveSoftware/source-sdk-2013

$ # pull the latest changes from source-sdk-2013

$ git pull valve master
