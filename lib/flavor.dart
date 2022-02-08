/// Flavor type defination.
enum Flavor {
  develop,
  staging,
  product,
}

/// Current runtime flavor.
/// Base on `Flavor` parameter of `flutter run`.
/// See '.vscode/launch.json'
Flavor get currentFlavor {
  final flavor = String.fromEnvironment('FLAVOR');
  switch (flavor) {
    case 'develop':
      return Flavor.develop;
    case 'staging':
      return Flavor.staging;
    case 'product':
      return Flavor.product;
  }
  return Flavor.develop;
}
