import 'package:zmovies/flavor.dart';

/// Constants defination.
class Constants {
  const Constants({
    // Flavor
    required this.flavor,
    // Base url of remote service
    required this.baseUrl,
    // Api key of remote service
    required this.apiKey,
    // Network configuration
    this.connectTimeout = 3000,
    // Network configuration
    this.receiveTimeout = 3000,
    // Network configuration
    this.sendTimeout = 3000,
  });

  /// Factory constructor.
  /// Use this to get an instance of Constaants.
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
