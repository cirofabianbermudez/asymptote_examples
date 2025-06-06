##==============================================================================
## [Filename]     -
## [Project]      -
## [Author]       -
## [Language]     -
## [Created]      2025-06-05
## [Modified]     -
## [Description]  -
## [Notes]        -
## [Status]       -
## [Revisions]    -
##==============================================================================

# ===============================  VARIABLES  =================================

# Miscellaneous variables
CUR_DATE   := $(shell date +%Y-%m-%d_%H-%M-%S)

# Directories
GIT_DIR     := $(shell git rev-parse --show-toplevel)
ROOT_DIR    := $(CURDIR)
OUT_DIR     := $(ROOT_DIR)/output

#Files
FILE = *.asy

# Colors
C_RED := \033[31m
C_GRE := \033[32m
C_BLU := \033[34m
C_YEL := \033[33m
C_ORA := \033[38;5;214m
NC    := \033[0m 

# ================================  TARGETS  ==================================

SHELL         := bash
.DEFAULT_GOAL := all

.PHONY: all
all: help
#______________________________________________________________________________

.PHONY: compile
compile: ## Compilation Asymptote
	@echo -e "$(C_ORA)Compile Asymptote$(NC)"
#@mkdir -p $(OUT_DIR)
	asy $(FILE)
#______________________________________________________________________________

.PHONY: clean
clean: ## Clean generated files
	@echo -e "$(C_ORA)Deleting generated files...$(NC)"
	rm -rf *.pdf *.eps *.aux *.log 
#______________________________________________________________________________

.PHONY: help
help: ## Displays help message
	@echo ""
	@echo "======================================================================"
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "--------------------------- Targets ----------------------------------"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "- make \033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "--------------------------- Variables -------------------------------"
	@echo ""
	@echo "-------------------------- Variable Values --------------------------"
	@echo ""
	@echo "======================================================================"
	@echo ""

