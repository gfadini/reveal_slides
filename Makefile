.PHONY: clean all 
SLIDES_DIR=slides
SOURCE_DIR=sources
SRCS := $(wildcard $(SOURCE_DIR)/*.md)
SRC_NAMES := $(SRCS:$(SOURCE_DIR)%.md=%)
CURRENT_DIR = $(shell pwd)

all: $(SRC_NAMES)

%:
	@pandoc \
        -o $(SLIDES_DIR)/$@.html \
        $(SOURCE_DIR)/$@.md \
        -d $(SOURCE_DIR)/config.yaml
	@echo "Created $(SLIDES_DIR)$@.html"

clean:
	@rm -rf *.html
	@echo "Cleaned all html in directory $(CURRENT_DIR)"
	@rm -rf $(SLIDES_DIR)/*.html
	@echo "Cleaned all html in directory $(CURRENT_DIT)/$(SLIDES_DIR)"

ls_sources:
	@echo "${SRCS}"
