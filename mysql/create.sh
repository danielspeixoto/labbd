#!/usr/bin/env bash

sudo mysql < mysql/sql/create.sql && sudo mysql < mysql/sql/indexes.sql && sudo mysql < mysql/sql/populate.sql && sudo mysql < mysql/sql/view.sql