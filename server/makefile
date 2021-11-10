all: clean verify compile

clean:
	@chmod u+x build_scripts.sh
	@./build_scripts.sh clean_code

verify:
	@chmod u+x build_scripts.sh
	@./build_scripts.sh verify

compile:
	@chmod u+x build_scripts.sh
	@./build_scripts.sh compile
	@./build_scripts.sh move_outputs

#unit-test:
#	@chmod u+x build_scripts.sh
#	@./build_scripts.sh unit_test

#docker:
#	@chmod u+x build_scripts.sh
#	@./build_scripts.sh docker_image