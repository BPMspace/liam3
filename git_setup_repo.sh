#!/bin/sh
# prepare git hook pre-commit
## COPY ./hooks/pre-commit ./git/hooks/pre-commit
## CHMOD +x ./git/hooks/pre-commit
# rename sql files 
## Info https://stackoverflow.com/questions/15715825/how-do-you-get-the-git-repositorys-name-in-some-git-repository?lq=1
## ProjectNameVar = basename $(git remote get-url origin)
## IF .\sqldump\PROJECT_NAME_diff.sql EXISTS AND .\sqldump\($ProjectNameVar)_diff.sql NOT EXITS then rename .\sqldump\PROJECT_NAME_diff.sql -> .\sqldump\($ProjectNameVar)_diff.sql ELSE delete .\sqldump\PROJECT_NAME_diff.sql
## IF .\sqldump\PROJECT_NAME_statemachine.sql EXISTS AND .\sqldump\($ProjectNameVar)_statemachine.sql NOT EXITS then rename .\sqldump\PROJECT_NAME_statemachine.sql -> .\sqldump\($ProjectNameVar)_statemachine.sql ELSE delete .\sqldump\PROJECT_NAME_statemachine.sql
## IF .\sqldump\PROJECT_NAME_structure.sql EXISTS AND .\sqldump\($ProjectNameVar)_structure.sql NOT EXITS then rename .\sqldump\PROJECT_NAME_structure.sql -> .\sqldump\($ProjectNameVar)_structure.sql ELSE delete .\sqldump\PROJECT_NAME_structure.sql



  