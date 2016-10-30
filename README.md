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

$ # note that the steps below are in update.bat too

$ # create a new remote that points to Basis Source

$ git remote add basis https://github.com/tschumann/basis-source

$ # pull the latest changes from Basis Source

$ git pull basis master