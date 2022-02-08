import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zmovies/data/datasource/locale/local_info_data_source.dart';

void main() {
  final dataSource = LocalInfoDataSource();
  setUp(() => SharedPreferences.setMockInitialValues({}));
  test('String', () async {
    final key = 'StringTest';
    final value = 'test string value';
    final save = await dataSource.save(key, value: value);
    expect(save, true);
    String load = await dataSource.load(key);
    expect(load, value);
  });
  test('int', () async {
    final key = 'StringTest';
    final value = 101;
    final save = await dataSource.save(key, value: value);
    expect(save, true);
    int load = await dataSource.load(key);
    expect(load, value);
  });

  test('Double', () async {
    final key = 'StringTest';
    final value = 3.1415;
    final save = await dataSource.save(key, value: value);
    expect(save, true);
    double load = await dataSource.load(key);
    expect(load, value);
  });
  test('Bool', () async {
    final key = 'StringTest';
    final value = false;
    final save = await dataSource.save(key, value: value);
    expect(save, true);
    bool load = await dataSource.load(key);
    expect(load, value);
  });

  test('List', () async {
    final key = 'StringTest';
    final value = [1, 2, 3, 4];
    final save = await dataSource.save(key, value: value);
    expect(save, false);
  });
}
