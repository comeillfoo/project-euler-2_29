SHELL:=/bin/bash

RACO?=raco
FMT?=fmt
REVIEW?=review
TEST?=test

SCRIPTSDIR=scripts
RKTDIR=$(SCRIPTSDIR)/rkt
PYDIR=$(SCRIPTSDIR)/py
TESTSDIR=tests
PYTESTSDIR=$(TESTSDIR)/py


racket-format:
	diff -u <(cat $(RKTDIR)/*.rkt ) <($(RACO) $(FMT) $(RKTDIR)/*.rkt )


racket-format-fix:
	$(RACO) $(FMT) -i $(RKTDIR)/*.rkt

python-lint:
	pylint $(PYDIR)/*.py $(PYTESTSDIR)/*.py

racket-lint:
	find $(RKTDIR) -type f -name *.rkt -print0 | xargs -0 -n1 $(RACO) $(REVIEW)

lint: python-lint racket-lint

python-test: export PYTHONPATH=$(PYDIR)

python-test:
	pytest

racket-test:
	$(RACO) $(TEST) $(RKTDIR)

test: python-test racket-test

.PHONY: test lint python-lint racket-lint racket-format racket-format-fix python-test racket-test
