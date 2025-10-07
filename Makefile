# Local installation

.PHONY: install
install:
	@pip install '.[dev]'

.PHONY: clean
clean:
	@echo Cleaning workspace 🧹
	@rm -rf dist/ build/ .mypy_cache/ .pytest_cache/ .ruff_cache/ 
	@find . -type d -regex '.*\.egg-info' | xargs rm -rf
	@find . -type d -name __pycache__ | xargs rm -rf


# Testing

.PHONY: lint
lint:
	@ruff check --fix src tests
	@mypy src tests

.PHONY: fmt format
fmt format:
	@ruff format src tests

.PHONY: test
test:
	@PYTHONPATH=src/project pytest tests

.PHONY: unit
unit:
	@PYTHONPATH=src/project pytest tests/unit

.PHONY: functional
functional:
	@PYTHONPATH=src/project pytest tests/functional
