#!/usr/bin/env bash

echo 'Configuring postgresql and populating it...'
echo 'Be patient...'
echo 'Please'
sudo -u postgres psql < postgresql/sql/create.sql && \
sudo -u postgres psql < postgresql/sql/indexes.sql && \
sudo -u postgres psql < postgresql/sql/view.sql && \
python3 main.py
