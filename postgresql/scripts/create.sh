#!/usr/bin/env bash

sudo -u postgres psql < postgresql/sql/create.sql && \
sudo -u postgres psql < postgresql/sql/indexes.sql && \
sudo -u postgres psql < postgresql/sql/view.sql && \
python main.py
