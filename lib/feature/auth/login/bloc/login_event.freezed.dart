// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PhoneChanged value)?  phoneChanged,TResult Function( PasswordChanged value)?  passwordChanged,TResult Function( Submitted value)?  submitted,TResult Function( ObscurePasswordToggled value)?  obscurePasswordToggled,TResult Function( FetchProfile value)?  fetchProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PhoneChanged() when phoneChanged != null:
return phoneChanged(_that);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case Submitted() when submitted != null:
return submitted(_that);case ObscurePasswordToggled() when obscurePasswordToggled != null:
return obscurePasswordToggled(_that);case FetchProfile() when fetchProfile != null:
return fetchProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PhoneChanged value)  phoneChanged,required TResult Function( PasswordChanged value)  passwordChanged,required TResult Function( Submitted value)  submitted,required TResult Function( ObscurePasswordToggled value)  obscurePasswordToggled,required TResult Function( FetchProfile value)  fetchProfile,}){
final _that = this;
switch (_that) {
case PhoneChanged():
return phoneChanged(_that);case PasswordChanged():
return passwordChanged(_that);case Submitted():
return submitted(_that);case ObscurePasswordToggled():
return obscurePasswordToggled(_that);case FetchProfile():
return fetchProfile(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PhoneChanged value)?  phoneChanged,TResult? Function( PasswordChanged value)?  passwordChanged,TResult? Function( Submitted value)?  submitted,TResult? Function( ObscurePasswordToggled value)?  obscurePasswordToggled,TResult? Function( FetchProfile value)?  fetchProfile,}){
final _that = this;
switch (_that) {
case PhoneChanged() when phoneChanged != null:
return phoneChanged(_that);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case Submitted() when submitted != null:
return submitted(_that);case ObscurePasswordToggled() when obscurePasswordToggled != null:
return obscurePasswordToggled(_that);case FetchProfile() when fetchProfile != null:
return fetchProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String phone)?  phoneChanged,TResult Function( String password)?  passwordChanged,TResult Function()?  submitted,TResult Function()?  obscurePasswordToggled,TResult Function()?  fetchProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PhoneChanged() when phoneChanged != null:
return phoneChanged(_that.phone);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case Submitted() when submitted != null:
return submitted();case ObscurePasswordToggled() when obscurePasswordToggled != null:
return obscurePasswordToggled();case FetchProfile() when fetchProfile != null:
return fetchProfile();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String phone)  phoneChanged,required TResult Function( String password)  passwordChanged,required TResult Function()  submitted,required TResult Function()  obscurePasswordToggled,required TResult Function()  fetchProfile,}) {final _that = this;
switch (_that) {
case PhoneChanged():
return phoneChanged(_that.phone);case PasswordChanged():
return passwordChanged(_that.password);case Submitted():
return submitted();case ObscurePasswordToggled():
return obscurePasswordToggled();case FetchProfile():
return fetchProfile();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String phone)?  phoneChanged,TResult? Function( String password)?  passwordChanged,TResult? Function()?  submitted,TResult? Function()?  obscurePasswordToggled,TResult? Function()?  fetchProfile,}) {final _that = this;
switch (_that) {
case PhoneChanged() when phoneChanged != null:
return phoneChanged(_that.phone);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case Submitted() when submitted != null:
return submitted();case ObscurePasswordToggled() when obscurePasswordToggled != null:
return obscurePasswordToggled();case FetchProfile() when fetchProfile != null:
return fetchProfile();case _:
  return null;

}
}

}

/// @nodoc


class PhoneChanged implements LoginEvent {
  const PhoneChanged(this.phone);
  

 final  String phone;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneChangedCopyWith<PhoneChanged> get copyWith => _$PhoneChangedCopyWithImpl<PhoneChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneChanged&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'LoginEvent.phoneChanged(phone: $phone)';
}


}

/// @nodoc
abstract mixin class $PhoneChangedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $PhoneChangedCopyWith(PhoneChanged value, $Res Function(PhoneChanged) _then) = _$PhoneChangedCopyWithImpl;
@useResult
$Res call({
 String phone
});




}
/// @nodoc
class _$PhoneChangedCopyWithImpl<$Res>
    implements $PhoneChangedCopyWith<$Res> {
  _$PhoneChangedCopyWithImpl(this._self, this._then);

  final PhoneChanged _self;
  final $Res Function(PhoneChanged) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(PhoneChanged(
null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PasswordChanged implements LoginEvent {
  const PasswordChanged(this.password);
  

 final  String password;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordChangedCopyWith<PasswordChanged> get copyWith => _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'LoginEvent.passwordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class $PasswordChangedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $PasswordChangedCopyWith(PasswordChanged value, $Res Function(PasswordChanged) _then) = _$PasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(this._self, this._then);

  final PasswordChanged _self;
  final $Res Function(PasswordChanged) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(PasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Submitted implements LoginEvent {
  const Submitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Submitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.submitted()';
}


}




/// @nodoc


class ObscurePasswordToggled implements LoginEvent {
  const ObscurePasswordToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ObscurePasswordToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.obscurePasswordToggled()';
}


}




/// @nodoc


class FetchProfile implements LoginEvent {
  const FetchProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.fetchProfile()';
}


}




// dart format on
