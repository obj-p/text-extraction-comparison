.PHONY: grobid-run
grobid-run:
	@cd $(BUILDDIR)/grobid && ./gradlew run
