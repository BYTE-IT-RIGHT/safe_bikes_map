enum SettingOption {
  none,
  medium,
  high,
}

extension BikesExtension on int {
  String getBikeByType() {
    if (this == 0) {
      return 'Cross';
    } else if (this == 1) {
      return 'Road';
    } else if (this == 2) {
      return 'Mountain';
    } else {
      return '';
    }
  }
}

extension SettingOptionExtenstion on SettingOption {
  double getApiValue(bool reverse) {
    switch (this) {
      case SettingOption.none:
        return reverse ? 0 : 1;
      case SettingOption.medium:
        return 0.5;
      case SettingOption.high:
        return reverse ? 1 : 0;
    }
  }
}

class Settings {
  final int bikeType;
  final SettingOption avoidBadSurface;
  final SettingOption avoidHighTraficRoads;
  final SettingOption avoidHills;
  final bool fastestRoute;

  const Settings({
    required this.bikeType,
    required this.avoidBadSurface,
    required this.avoidHighTraficRoads,
    required this.avoidHills,
    required this.fastestRoute,
  });

  Settings copyWith({
    int? bikeType,
    SettingOption? avoidBadSurface,
    SettingOption? avoidHighTraficRoads,
    SettingOption? avoidHills,
    bool? fastestRoute,
  }) =>
      Settings(
        bikeType: bikeType ?? this.bikeType,
        avoidBadSurface: avoidBadSurface ?? this.avoidBadSurface,
        avoidHighTraficRoads: avoidHighTraficRoads ?? this.avoidHighTraficRoads,
        avoidHills: avoidHills ?? this.avoidHills,
        fastestRoute: fastestRoute ?? this.fastestRoute,
      );
}
