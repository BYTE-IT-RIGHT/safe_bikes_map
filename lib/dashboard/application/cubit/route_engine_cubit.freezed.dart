// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_engine_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RouteEngineState {
  bool get toDestinationSelected => throw _privateConstructorUsedError;
  bool get fromDestinationSelected => throw _privateConstructorUsedError;
  LatLng? get startPoint => throw _privateConstructorUsedError;
  LatLng? get endPoint => throw _privateConstructorUsedError;
  Set<Marker> get markers => throw _privateConstructorUsedError;

  /// Create a copy of RouteEngineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteEngineStateCopyWith<RouteEngineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteEngineStateCopyWith<$Res> {
  factory $RouteEngineStateCopyWith(
          RouteEngineState value, $Res Function(RouteEngineState) then) =
      _$RouteEngineStateCopyWithImpl<$Res, RouteEngineState>;
  @useResult
  $Res call(
      {bool toDestinationSelected,
      bool fromDestinationSelected,
      LatLng? startPoint,
      LatLng? endPoint,
      Set<Marker> markers});
}

/// @nodoc
class _$RouteEngineStateCopyWithImpl<$Res, $Val extends RouteEngineState>
    implements $RouteEngineStateCopyWith<$Res> {
  _$RouteEngineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteEngineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toDestinationSelected = null,
    Object? fromDestinationSelected = null,
    Object? startPoint = freezed,
    Object? endPoint = freezed,
    Object? markers = null,
  }) {
    return _then(_value.copyWith(
      toDestinationSelected: null == toDestinationSelected
          ? _value.toDestinationSelected
          : toDestinationSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      fromDestinationSelected: null == fromDestinationSelected
          ? _value.fromDestinationSelected
          : fromDestinationSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      startPoint: freezed == startPoint
          ? _value.startPoint
          : startPoint // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      endPoint: freezed == endPoint
          ? _value.endPoint
          : endPoint // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteEngineStateImplCopyWith<$Res>
    implements $RouteEngineStateCopyWith<$Res> {
  factory _$$RouteEngineStateImplCopyWith(_$RouteEngineStateImpl value,
          $Res Function(_$RouteEngineStateImpl) then) =
      __$$RouteEngineStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool toDestinationSelected,
      bool fromDestinationSelected,
      LatLng? startPoint,
      LatLng? endPoint,
      Set<Marker> markers});
}

/// @nodoc
class __$$RouteEngineStateImplCopyWithImpl<$Res>
    extends _$RouteEngineStateCopyWithImpl<$Res, _$RouteEngineStateImpl>
    implements _$$RouteEngineStateImplCopyWith<$Res> {
  __$$RouteEngineStateImplCopyWithImpl(_$RouteEngineStateImpl _value,
      $Res Function(_$RouteEngineStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouteEngineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toDestinationSelected = null,
    Object? fromDestinationSelected = null,
    Object? startPoint = freezed,
    Object? endPoint = freezed,
    Object? markers = null,
  }) {
    return _then(_$RouteEngineStateImpl(
      toDestinationSelected: null == toDestinationSelected
          ? _value.toDestinationSelected
          : toDestinationSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      fromDestinationSelected: null == fromDestinationSelected
          ? _value.fromDestinationSelected
          : fromDestinationSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      startPoint: freezed == startPoint
          ? _value.startPoint
          : startPoint // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      endPoint: freezed == endPoint
          ? _value.endPoint
          : endPoint // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
    ));
  }
}

/// @nodoc

class _$RouteEngineStateImpl implements _RouteEngineState {
  const _$RouteEngineStateImpl(
      {this.toDestinationSelected = false,
      this.fromDestinationSelected = true,
      this.startPoint,
      this.endPoint,
      final Set<Marker> markers = const {}})
      : _markers = markers;

  @override
  @JsonKey()
  final bool toDestinationSelected;
  @override
  @JsonKey()
  final bool fromDestinationSelected;
  @override
  final LatLng? startPoint;
  @override
  final LatLng? endPoint;
  final Set<Marker> _markers;
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  @override
  String toString() {
    return 'RouteEngineState(toDestinationSelected: $toDestinationSelected, fromDestinationSelected: $fromDestinationSelected, startPoint: $startPoint, endPoint: $endPoint, markers: $markers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteEngineStateImpl &&
            (identical(other.toDestinationSelected, toDestinationSelected) ||
                other.toDestinationSelected == toDestinationSelected) &&
            (identical(
                    other.fromDestinationSelected, fromDestinationSelected) ||
                other.fromDestinationSelected == fromDestinationSelected) &&
            (identical(other.startPoint, startPoint) ||
                other.startPoint == startPoint) &&
            (identical(other.endPoint, endPoint) ||
                other.endPoint == endPoint) &&
            const DeepCollectionEquality().equals(other._markers, _markers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      toDestinationSelected,
      fromDestinationSelected,
      startPoint,
      endPoint,
      const DeepCollectionEquality().hash(_markers));

  /// Create a copy of RouteEngineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteEngineStateImplCopyWith<_$RouteEngineStateImpl> get copyWith =>
      __$$RouteEngineStateImplCopyWithImpl<_$RouteEngineStateImpl>(
          this, _$identity);
}

abstract class _RouteEngineState implements RouteEngineState {
  const factory _RouteEngineState(
      {final bool toDestinationSelected,
      final bool fromDestinationSelected,
      final LatLng? startPoint,
      final LatLng? endPoint,
      final Set<Marker> markers}) = _$RouteEngineStateImpl;

  @override
  bool get toDestinationSelected;
  @override
  bool get fromDestinationSelected;
  @override
  LatLng? get startPoint;
  @override
  LatLng? get endPoint;
  @override
  Set<Marker> get markers;

  /// Create a copy of RouteEngineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteEngineStateImplCopyWith<_$RouteEngineStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
