enum Flavor {
  develop,
  staging,
  product,
}

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
