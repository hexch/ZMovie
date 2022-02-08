import 'package:zmovies/flavor.dart';

class Constants {
  const Constants({
    required this.flavor,
    required this.baseUrl,
    required this.apiKey,
    this.connectTimeout = 3000,
    this.receiveTimeout = 3000,
    this.sendTimeout = 3000,
  });

  factory Constants.of() {
    if (_instance != null) return _instance!;
    final flavor = currentFlavor;

    switch (flavor) {
      case Flavor.develop:
        _instance = Constants._development();
        break;
      case Flavor.staging:
        _instance = Constants._staging();
        break;
      case Flavor.product:
      default:
        _instance = Constants._product();
        break;
    }
    return _instance!;
  }

  factory Constants._development() {
    return const Constants(
      flavor: Flavor.develop,
      baseUrl: 'https://api.themoviedb.org/3',
      apiKey: '2cbc7e68dc9b20f28644bae3a5f10b57',
    );
  }

  factory Constants._staging() {
    return const Constants(
      flavor: Flavor.staging,
      baseUrl: '',
      apiKey: '',
    );
  }

  factory Constants._product() {
    return const Constants(
      flavor: Flavor.product,
      baseUrl: '',
      apiKey: '',
    );
  }
  static Constants? _instance;

  final Flavor flavor;
  final String baseUrl;
  final String apiKey;
  final int connectTimeout;
  final int sendTimeout;
  final int receiveTimeout;
}
