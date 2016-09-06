#Readme

[Parkt](https://parktserver.herokuapp.com/)

##Setting up Your Development Environment

###[Optional] SSH key setup

* open the terminal `ssh-keygen`
* press enter until the key is finished generating (disregard location and passphrase)
* open file: */.ssh/id_rsa.pub with text editor
* copy everything in the file (ctrl-a, ctrl-c)
* go to your account settings page on github
* add your ssh key


###Get the Project from GitHub

* go to the main page of the project (master branch)
* select the SSH option for cloning and copy the address
* open terminal and move to desired location for cloning
```
cd <path/folder>
git clone <address>
```


###Start Coding!

* install the required gems `bundle install --without production`
* make a new branch before making changes `git checkout -b <initials-branchname>`
* check status of changes `git status`
* stages changes for commit (all) `git add .`
* commit changes with a short message `git commit -m '<message>'`



###Ruby on Rails Instructions

* use rake gem to run tests `rake test`
* you can generate: controllers, migrations, views, models `rails generate <item> <name>`

* create/update the schema by running database migrations
* reset will re-migrate all migrations
* rollback will revert to the previous version of the schema
```
rake db:migrate
rake db:reset
rake db:rollback
```

Note: the naming convention uses camel case


###Push Your Changes to GitHub

* make sure the branch and master have no conflicts through interactive rebasing
```
git checkout master
git pull origin master
git checkout <initials-branchname>
git rebase -i master
```
* resolve conflicts and continue until rebase is complete
* push your branch to github `git push origin <initials-branchname>`


# Sources
The "Twitter Tutorial" comment identifies pieces of code that was provided from a 
[twitter/ruby on rails tutorial](https://gorails.com/episodes/omniauth-twitter-sign-in)
