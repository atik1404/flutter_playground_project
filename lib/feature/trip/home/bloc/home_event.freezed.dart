// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchTrips value)?  fetchTrips,TResult Function( SelectDay value)?  selectDay,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchTrips() when fetchTrips != null:
return fetchTrips(_that);case SelectDay() when selectDay != null:
return selectDay(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchTrips value)  fetchTrips,required TResult Function( SelectDay value)  selectDay,}){
final _that = this;
switch (_that) {
case FetchTrips():
return fetchTrips(_that);case SelectDay():
return selectDay(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchTrips value)?  fetchTrips,TResult? Function( SelectDay value)?  selectDay,}){
final _that = this;
switch (_that) {
case FetchTrips() when fetchTrips != null:
return fetchTrips(_that);case SelectDay() when selectDay != null:
return selectDay(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int page)?  fetchTrips,TResult Function( int day)?  selectDay,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchTrips() when fetchTrips != null:
return fetchTrips(_that.page);case SelectDay() when selectDay != null:
return selectDay(_that.day);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int page)  fetchTrips,required TResult Function( int day)  selectDay,}) {final _that = this;
switch (_that) {
case FetchTrips():
return fetchTrips(_that.page);case SelectDay():
return selectDay(_that.day);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int page)?  fetchTrips,TResult? Function( int day)?  selectDay,}) {final _that = this;
switch (_that) {
case FetchTrips() when fetchTrips != null:
return fetchTrips(_that.page);case SelectDay() when selectDay != null:
return selectDay(_that.day);case _:
  return null;

}
}

}

/// @nodoc


class FetchTrips implements HomeEvent {
  const FetchTrips(this.page);
  

 final  int page;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchTripsCopyWith<FetchTrips> get copyWith => _$FetchTripsCopyWithImpl<FetchTrips>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchTrips&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'HomeEvent.fetchTrips(page: $page)';
}


}

/// @nodoc
abstract mixin class $FetchTripsCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $FetchTripsCopyWith(FetchTrips value, $Res Function(FetchTrips) _then) = _$FetchTripsCopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class _$FetchTripsCopyWithImpl<$Res>
    implements $FetchTripsCopyWith<$Res> {
  _$FetchTripsCopyWithImpl(this._self, this._then);

  final FetchTrips _self;
  final $Res Function(FetchTrips) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(FetchTrips(
null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SelectDay implements HomeEvent {
  const SelectDay(this.day);
  

 final  int day;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectDayCopyWith<SelectDay> get copyWith => _$SelectDayCopyWithImpl<SelectDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectDay&&(identical(other.day, day) || other.day == day));
}


@override
int get hashCode => Object.hash(runtimeType,day);

@override
String toString() {
  return 'HomeEvent.selectDay(day: $day)';
}


}

/// @nodoc
abstract mixin class $SelectDayCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $SelectDayCopyWith(SelectDay value, $Res Function(SelectDay) _then) = _$SelectDayCopyWithImpl;
@useResult
$Res call({
 int day
});




}
/// @nodoc
class _$SelectDayCopyWithImpl<$Res>
    implements $SelectDayCopyWith<$Res> {
  _$SelectDayCopyWithImpl(this._self, this._then);

  final SelectDay _self;
  final $Res Function(SelectDay) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? day = null,}) {
  return _then(SelectDay(
null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
