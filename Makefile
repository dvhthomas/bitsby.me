serve:
	hugo server -D

post:
	hugo new posts/$(title)/index.md

setup:
	python3 -m venv .venv
	python3 -m pip install --upgrade pip
	.  ./.venv/bin/activate
	python3 -m pip install -r requirements.txt

reset:
	. deactivate
	rm -rf .venv