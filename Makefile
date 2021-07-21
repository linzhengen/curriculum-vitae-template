.PHONY: help
help: ## Print help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

get-github-css: ## Download github css
	curl https://raw.githubusercontent.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css -o github-markdown.css
	sed -i -e s/.markdown-// github-markdown.css

md-to-docx: ## Convert md to docx
	docker run -it --rm -v $$(pwd):/data pandoc/latex:2.14.1 -d /data/docx.yaml
