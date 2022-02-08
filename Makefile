.PHONY: rebuild
rebuild:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter packages pub run build_runner build  --delete-conflicting-outputs

.PHONY: generate
generate: 
	fvm flutter packages pub run build_runner build  --delete-conflicting-outputs

.PHONY: clean
clean:
	fvm flutter clean

.PHONY: analyze
analyze:
	fvm flutter analyze

.PHONY: test
test:
	fvm flutter test --coverage
	lcov --remove coverage/lcov.info "lib/data/datasource/remote/*.g.dart" "lib/data/model/*" -o coverage/lcov_ex.info
	genhtml coverage/lcov_ex.info -o coverage/html