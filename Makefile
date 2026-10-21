.PHONY: all demo check run
all: demo
demo:
	python3 tools/demo.py
check:
	python3 tools/demo.py --check
run:
	./run-kadry.sh
