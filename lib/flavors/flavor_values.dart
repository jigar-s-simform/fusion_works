class FlavorValues {
  factory FlavorValues(
      {required String baseUrl, required String baseUrlModel}) {
    _instance ??= FlavorValues._internal(baseUrl, baseUrlModel);
    return _instance!;
  }

  FlavorValues._internal(this.baseUrl, this.baseUrlModel);

  final String baseUrl;
  final String baseUrlModel;

  static FlavorValues? _instance;

  static FlavorValues get instance {
    return _instance!;
  }
}
