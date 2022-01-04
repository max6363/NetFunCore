documentation:
	@jazzy \
	--module NetFunCore \
	--theme fullwidth \
	--output ./docs \
	--documentation=./*.md \
	--author "Minhaz Panara"

	@rm -rf ./build