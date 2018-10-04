#!/usr/bin/env bash

echo 'Configuring MySQL and populating it...'
echo 'Be patient...'
echo 'Please'
sudo mysql < mysql/sql/create.sql && sudo mysql < mysql/sql/indexes.sql && sudo mysql < mysql/sql/populate.sql && sudo mysql < mysql/sql/view.sql