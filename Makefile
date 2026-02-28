.PHONY: local build hugo-upgrade update

local:
	chmod -R u+w public/ 2>/dev/null || true
	hugo server -D

build:
	chmod -R u+w docs/ 2>/dev/null || true
	hugo --destination docs

hugo-upgrade:
	brew upgrade hugo

update:
	hugo mod get -u github.com/jpanther/congo/v2
	hugo mod tidy
