MAKE   = make
PYTHON = python
SETUP  = $(PYTHON) ./setup.py

.PHONY: clean cleandocs coverage dist docs opendocs unit-coverage upload

help:
    @echo "Usage: \`make <target>' where <target> is one or more of"
	@echo "  clean          delete intermediate work product and start fresh"
	@echo "  cleandocs      delete cached HTML documentation and start fresh"
	@echo "  coverage       report overall test coverage"
	@echo "  docs           build HTML documentation using Sphinx (incremental)"
	@echo "  opendocs       open local HTML documentation in browser"
	@echo "  dist           generate source and wheel distribution into dist/"
	@echo "  unit-coverage  report unit test coverage"
	@echo "  upload         upload distribution to PyPI"

clean:
	find . -type f -name \*.pyc -exec rm {} \;
	find . -type f -name .DS_Store -exec rm {} \;
	rm -rf dist .coverage


dist:
	rm -rf dist/
	$(SETUP) sdist bdist_wheel

upload:
	rm -rf dist/
	$(SETUP) sdist bdist_wheel
	twine upload dist/*