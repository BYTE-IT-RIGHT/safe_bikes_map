enum SettingOption {
  none,
  medium,
  high,
}

class Settings {
  final int bikeType;
  final SettingOption avoidBadSurface;
  final SettingOption avoidHighTraficRoads;
  final SettingOption avoidHills;

  const Settings({
    required this.bikeType,
    required this.avoidBadSurface,
    required this.avoidHighTraficRoads,
    required this.avoidHills,
  });

  Settings copyWith({
    int? bikeType,
    SettingOption? avoidBadSurface,
    SettingOption? avoidHighTraficRoads,
    SettingOption? avoidHills,
  }) =>
      Settings(
        bikeType: bikeType ?? this.bikeType,
        avoidBadSurface: avoidBadSurface ?? this.avoidBadSurface,
        avoidHighTraficRoads: avoidHighTraficRoads ?? this.avoidHighTraficRoads,
        avoidHills: avoidHills ?? this.avoidHills,
      );
}
