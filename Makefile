TURNIN_FILES=readme.txt,team.txt,create.sql,load.sql,queries.sql,query.php,violate.sql
UID=604610103

zip:
	chmod +x p1a_test
	@mkdir $(UID)
	@cp {$(TURNIN_FILES)} $(UID)
	@zip -r P1A.zip $(UID)
	@rm -r $(UID)
	@./p1a_test $(UID)
