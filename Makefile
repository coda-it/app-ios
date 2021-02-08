MAKE=make

.PHONY: version
version:
	git tag $(V)
	./scripts/changelog.sh
	git add ./docs/changelogs/CHANGELOG_$(V).md
	sed -i '' '/CFBundleShortVersionString/{n;s/.*/\t<string>$(V)<\/string>/;}' ./app/Info.plist
	sed -i '' '/CFBundleVersion/{n;s/.*/\t<string>$(V)<\/string>/;}' ./app/Info.plist
	git add ./app/Info.plist
	git commit --allow-empty -m "Build $(V)"
	git tag --delete $(V)
	git tag $(V)

.PHONY: help
help:
	@echo  '=================================='
	@echo  'Available tasks:'
	@echo  '=================================='
	@echo  '* Release:'
	@echo  '- version         - Phony task. Creates changelog from latest'
	@echo  '                    git tag till the latest commit. Creates commit'
	@echo  '                    with given version (as argument) and tags'
	@echo  '                    this commit with this version. Version has to'
	@echo  '                    be passed as `V` argument with ex. `v0.0.0`'
	@echo  '                    format'
	@echo  ''
	
