install:
	@pip install '.[dev]'


# CI step wrappers

ci: format_check lint_check test mypy

format_check:
	@ruff format --check .

lint_check:
	@ruff check .

test:
	@PYTHONPATH=src/project pytest

mypy:
	@mypy

# Local helpers

clean:
	@echo Cleaning workspace 🧹
	@rm -rf dist/ build/ .mypy_cache/ .pytest_cache/ .ruff_cache/ 
	@find . -type d -regex '.*\.egg-info' | xargs rm -rf
	@find . -type d -name __pycache__ | xargs rm -rf

format:
	@ruff check --fix .
	@ruff format .
