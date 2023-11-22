#!/bin/bash

#give permission for everything in the express-app directory
sudo chmod -R 777 /home/ec2-user/express-app

#navigate into our working directory where we have all our github files
cd /home/ec2-user/express-app

#add npm and node to path
export NVM_DIR="$HOME/.nvm"	
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # loads nvm	
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # loads nvm bash_completion (node is in path now)

#install node modules
npm install
npm install express

# Install Mailchimp API dependencies
npm install @mailchimp/marketing

# Set up environment variables for Mailchimp API
echo "export MAILCHIMP_API_KEY=a13dba0cf4d0c949ea09a9e1ecb3af8f-us8" >> ~/.bashrc
echo "export MAILCHIMP_LIST_ID=8b8bf9d05f" >> ~/.bashrc

# Source the updated bashrc to make environment variables available
source ~/.bashrc

#start our node app in the background
node app.js > app.out.log 2> app.err.log < /dev/null & 
