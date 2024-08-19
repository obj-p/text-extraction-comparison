GROBID_VERSION := 0.8.0
BUILDDIR       ?= build

.PHONY: builddir
builddir:
	mkdir -p $(BUILDDIR)

.PHONY: clean
clean:
	rm $(BUILDDIR)/$(GROBID_VERSION).zip
	rm -rf $(BUILDDIR)/grobid

.PHONY:
grobid: builddir
	@cd $(BUILDDIR) && curl -LO https://github.com/kermitt2/grobid/archive/$(GROBID_VERSION).zip \
		&& unzip -o $(GROBID_VERSION).zip \
		&& mv grobid-$(GROBID_VERSION) grobid

.PHONY: grobid-run
ifeq ($(shell uname -m), arm64)
grobid-run:
	@cd $(BUILDDIR)/grobid && ./gradlew run
else
grobid-run:
	docker compose up grobid
endif
