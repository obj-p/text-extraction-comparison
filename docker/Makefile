BUILDDIR := build
GROBID_VERSION := 0.8.0

.PHONY: builddir
builddir:
	mkdir -p $(BUILDDIR)

.PHONY: clean
clean:
	rm -rf $(BUILDDIR)

.PHONY:
grobid: builddir
	@cd $(BUILDDIR) && curl -LO https://github.com/kermitt2/grobid/archive/$(GROBID_VERSION).zip
	@cd $(BUILDDIR) && unzip -o $(GROBID_VERSION).zip
	@cd $(BUILDDIR)/grobid-$(GROBID_VERSION) && docker build -t grobid/grobid:$(GROBID_VERSION) \
		--build-arg GROBID_VERSION=$(GROBID_VERSION) --file Dockerfile.crf .
