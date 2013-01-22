#! /bin/bash

# Determine if npm is installed (hint: it should be)
npm --version >/dev/null 2>&1 || { echo "Requires npm and node.js to be installed. Aborting launch."; exit 1;}
# Determine if supervisor is installed
supervisor >/dev/null 2>&1 || { echo >&2 "Requires supervisor. Attempting to install..."; npm install -g supervisor;}
# Update npm
npm install
# Launch the application and pass thru any params passed in
supervisor --watch .,src --extensions coffee -- bootstrap.js $@