freeze:
	pip3 freeze | grep -Ev "pkg-resources|twine|osm-humanized-opening-hours|mccabe|pycodestyle|pyflakes|flake8" > requirements.txt

freeze-dev:
	pip3 freeze | grep -Ev "pkg-resources|osm-humanized-opening-hours" > requirements-dev.txt

tests:
	python3 humanized_opening_hours/tests.py

flake8:
	python3 -m flake8 humanized_opening_hours

benchmark:
	@echo "Time for a single field:"
	@python3 -m timeit -n 1 -s 'import humanized_opening_hours as hoh' 'oh = hoh.OHParser("Mo-Fr 08:00-19:00")'
	@echo "Time for 100 fields:"
	@python3 -m timeit -n 100 'oh = hoh.OHParser("Mo-Fr 08:00-19:00")' -s 'import humanized_opening_hours as hoh'
	@echo "Time for 1000 fields:"
	@python3 -m timeit -n 1000 'oh = hoh.OHParser("Mo-Fr 08:00-19:00")' -s 'import humanized_opening_hours as hoh'

help:
	@echo "Available commands:"
	@echo "  freeze          Updates 'requirements.txt'"
	@echo "  tests           Runs unit tests"
	@echo "  flake8          Runs flake8 tests"
