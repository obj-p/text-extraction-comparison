.PHONY: brew
brew:
	brew bundle --no-lock
	pipx ensurepath
