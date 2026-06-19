// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seer_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeerUser {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'email') String? get email;@JsonKey(name: 'username') String? get username;@JsonKey(name: 'displayName') String? get displayName;@JsonKey(name: 'permissions') int get permissions;@JsonKey(name: 'avatar') String? get avatar;@JsonKey(name: 'requestCount') int get requestCount;
/// Create a copy of SeerUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerUserCopyWith<SeerUser> get copyWith => _$SeerUserCopyWithImpl<SeerUser>(this as SeerUser, _$identity);

  /// Serializes this SeerUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.permissions, permissions) || other.permissions == permissions)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.requestCount, requestCount) || other.requestCount == requestCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,displayName,permissions,avatar,requestCount);

@override
String toString() {
  return 'SeerUser(id: $id, email: $email, username: $username, displayName: $displayName, permissions: $permissions, avatar: $avatar, requestCount: $requestCount)';
}


}

/// @nodoc
abstract mixin class $SeerUserCopyWith<$Res>  {
  factory $SeerUserCopyWith(SeerUser value, $Res Function(SeerUser) _then) = _$SeerUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'email') String? email,@JsonKey(name: 'username') String? username,@JsonKey(name: 'displayName') String? displayName,@JsonKey(name: 'permissions') int permissions,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'requestCount') int requestCount
});




}
/// @nodoc
class _$SeerUserCopyWithImpl<$Res>
    implements $SeerUserCopyWith<$Res> {
  _$SeerUserCopyWithImpl(this._self, this._then);

  final SeerUser _self;
  final $Res Function(SeerUser) _then;

/// Create a copy of SeerUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = freezed,Object? username = freezed,Object? displayName = freezed,Object? permissions = null,Object? avatar = freezed,Object? requestCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as int,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,requestCount: null == requestCount ? _self.requestCount : requestCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerUser].
extension SeerUserPatterns on SeerUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerUser() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerUser value)  $default,){
final _that = this;
switch (_that) {
case _SeerUser():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerUser value)?  $default,){
final _that = this;
switch (_that) {
case _SeerUser() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'permissions')  int permissions, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'requestCount')  int requestCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerUser() when $default != null:
return $default(_that.id,_that.email,_that.username,_that.displayName,_that.permissions,_that.avatar,_that.requestCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'permissions')  int permissions, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'requestCount')  int requestCount)  $default,) {final _that = this;
switch (_that) {
case _SeerUser():
return $default(_that.id,_that.email,_that.username,_that.displayName,_that.permissions,_that.avatar,_that.requestCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'permissions')  int permissions, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'requestCount')  int requestCount)?  $default,) {final _that = this;
switch (_that) {
case _SeerUser() when $default != null:
return $default(_that.id,_that.email,_that.username,_that.displayName,_that.permissions,_that.avatar,_that.requestCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerUser implements SeerUser {
  const _SeerUser({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'email') this.email, @JsonKey(name: 'username') this.username, @JsonKey(name: 'displayName') this.displayName, @JsonKey(name: 'permissions') this.permissions = 0, @JsonKey(name: 'avatar') this.avatar, @JsonKey(name: 'requestCount') this.requestCount = 0});
  factory _SeerUser.fromJson(Map<String, dynamic> json) => _$SeerUserFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'email') final  String? email;
@override@JsonKey(name: 'username') final  String? username;
@override@JsonKey(name: 'displayName') final  String? displayName;
@override@JsonKey(name: 'permissions') final  int permissions;
@override@JsonKey(name: 'avatar') final  String? avatar;
@override@JsonKey(name: 'requestCount') final  int requestCount;

/// Create a copy of SeerUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerUserCopyWith<_SeerUser> get copyWith => __$SeerUserCopyWithImpl<_SeerUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.permissions, permissions) || other.permissions == permissions)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.requestCount, requestCount) || other.requestCount == requestCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,displayName,permissions,avatar,requestCount);

@override
String toString() {
  return 'SeerUser(id: $id, email: $email, username: $username, displayName: $displayName, permissions: $permissions, avatar: $avatar, requestCount: $requestCount)';
}


}

/// @nodoc
abstract mixin class _$SeerUserCopyWith<$Res> implements $SeerUserCopyWith<$Res> {
  factory _$SeerUserCopyWith(_SeerUser value, $Res Function(_SeerUser) _then) = __$SeerUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'email') String? email,@JsonKey(name: 'username') String? username,@JsonKey(name: 'displayName') String? displayName,@JsonKey(name: 'permissions') int permissions,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'requestCount') int requestCount
});




}
/// @nodoc
class __$SeerUserCopyWithImpl<$Res>
    implements _$SeerUserCopyWith<$Res> {
  __$SeerUserCopyWithImpl(this._self, this._then);

  final _SeerUser _self;
  final $Res Function(_SeerUser) _then;

/// Create a copy of SeerUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = freezed,Object? username = freezed,Object? displayName = freezed,Object? permissions = null,Object? avatar = freezed,Object? requestCount = null,}) {
  return _then(_SeerUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as int,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,requestCount: null == requestCount ? _self.requestCount : requestCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SeerRequestUser {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'displayName') String? get displayName;@JsonKey(name: 'avatar') String? get avatar;
/// Create a copy of SeerRequestUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerRequestUserCopyWith<SeerRequestUser> get copyWith => _$SeerRequestUserCopyWithImpl<SeerRequestUser>(this as SeerRequestUser, _$identity);

  /// Serializes this SeerRequestUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerRequestUser&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,avatar);

@override
String toString() {
  return 'SeerRequestUser(id: $id, displayName: $displayName, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $SeerRequestUserCopyWith<$Res>  {
  factory $SeerRequestUserCopyWith(SeerRequestUser value, $Res Function(SeerRequestUser) _then) = _$SeerRequestUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'displayName') String? displayName,@JsonKey(name: 'avatar') String? avatar
});




}
/// @nodoc
class _$SeerRequestUserCopyWithImpl<$Res>
    implements $SeerRequestUserCopyWith<$Res> {
  _$SeerRequestUserCopyWithImpl(this._self, this._then);

  final SeerRequestUser _self;
  final $Res Function(SeerRequestUser) _then;

/// Create a copy of SeerRequestUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = freezed,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerRequestUser].
extension SeerRequestUserPatterns on SeerRequestUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerRequestUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerRequestUser() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerRequestUser value)  $default,){
final _that = this;
switch (_that) {
case _SeerRequestUser():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerRequestUser value)?  $default,){
final _that = this;
switch (_that) {
case _SeerRequestUser() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'avatar')  String? avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerRequestUser() when $default != null:
return $default(_that.id,_that.displayName,_that.avatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'avatar')  String? avatar)  $default,) {final _that = this;
switch (_that) {
case _SeerRequestUser():
return $default(_that.id,_that.displayName,_that.avatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'avatar')  String? avatar)?  $default,) {final _that = this;
switch (_that) {
case _SeerRequestUser() when $default != null:
return $default(_that.id,_that.displayName,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerRequestUser implements SeerRequestUser {
  const _SeerRequestUser({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'displayName') this.displayName, @JsonKey(name: 'avatar') this.avatar});
  factory _SeerRequestUser.fromJson(Map<String, dynamic> json) => _$SeerRequestUserFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'displayName') final  String? displayName;
@override@JsonKey(name: 'avatar') final  String? avatar;

/// Create a copy of SeerRequestUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerRequestUserCopyWith<_SeerRequestUser> get copyWith => __$SeerRequestUserCopyWithImpl<_SeerRequestUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerRequestUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerRequestUser&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,avatar);

@override
String toString() {
  return 'SeerRequestUser(id: $id, displayName: $displayName, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$SeerRequestUserCopyWith<$Res> implements $SeerRequestUserCopyWith<$Res> {
  factory _$SeerRequestUserCopyWith(_SeerRequestUser value, $Res Function(_SeerRequestUser) _then) = __$SeerRequestUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'displayName') String? displayName,@JsonKey(name: 'avatar') String? avatar
});




}
/// @nodoc
class __$SeerRequestUserCopyWithImpl<$Res>
    implements _$SeerRequestUserCopyWith<$Res> {
  __$SeerRequestUserCopyWithImpl(this._self, this._then);

  final _SeerRequestUser _self;
  final $Res Function(_SeerRequestUser) _then;

/// Create a copy of SeerRequestUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = freezed,Object? avatar = freezed,}) {
  return _then(_SeerRequestUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SeerSeasonRequest {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'seasonNumber') int get seasonNumber;@JsonKey(name: 'status') int get status;
/// Create a copy of SeerSeasonRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerSeasonRequestCopyWith<SeerSeasonRequest> get copyWith => _$SeerSeasonRequestCopyWithImpl<SeerSeasonRequest>(this as SeerSeasonRequest, _$identity);

  /// Serializes this SeerSeasonRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerSeasonRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,seasonNumber,status);

@override
String toString() {
  return 'SeerSeasonRequest(id: $id, seasonNumber: $seasonNumber, status: $status)';
}


}

/// @nodoc
abstract mixin class $SeerSeasonRequestCopyWith<$Res>  {
  factory $SeerSeasonRequestCopyWith(SeerSeasonRequest value, $Res Function(SeerSeasonRequest) _then) = _$SeerSeasonRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'seasonNumber') int seasonNumber,@JsonKey(name: 'status') int status
});




}
/// @nodoc
class _$SeerSeasonRequestCopyWithImpl<$Res>
    implements $SeerSeasonRequestCopyWith<$Res> {
  _$SeerSeasonRequestCopyWithImpl(this._self, this._then);

  final SeerSeasonRequest _self;
  final $Res Function(SeerSeasonRequest) _then;

/// Create a copy of SeerSeasonRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? seasonNumber = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,seasonNumber: null == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerSeasonRequest].
extension SeerSeasonRequestPatterns on SeerSeasonRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerSeasonRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerSeasonRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerSeasonRequest value)  $default,){
final _that = this;
switch (_that) {
case _SeerSeasonRequest():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerSeasonRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SeerSeasonRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'seasonNumber')  int seasonNumber, @JsonKey(name: 'status')  int status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerSeasonRequest() when $default != null:
return $default(_that.id,_that.seasonNumber,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'seasonNumber')  int seasonNumber, @JsonKey(name: 'status')  int status)  $default,) {final _that = this;
switch (_that) {
case _SeerSeasonRequest():
return $default(_that.id,_that.seasonNumber,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'seasonNumber')  int seasonNumber, @JsonKey(name: 'status')  int status)?  $default,) {final _that = this;
switch (_that) {
case _SeerSeasonRequest() when $default != null:
return $default(_that.id,_that.seasonNumber,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerSeasonRequest implements SeerSeasonRequest {
  const _SeerSeasonRequest({@JsonKey(name: 'id') this.id, @JsonKey(name: 'seasonNumber') required this.seasonNumber, @JsonKey(name: 'status') this.status = 1});
  factory _SeerSeasonRequest.fromJson(Map<String, dynamic> json) => _$SeerSeasonRequestFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'seasonNumber') final  int seasonNumber;
@override@JsonKey(name: 'status') final  int status;

/// Create a copy of SeerSeasonRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerSeasonRequestCopyWith<_SeerSeasonRequest> get copyWith => __$SeerSeasonRequestCopyWithImpl<_SeerSeasonRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerSeasonRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerSeasonRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,seasonNumber,status);

@override
String toString() {
  return 'SeerSeasonRequest(id: $id, seasonNumber: $seasonNumber, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SeerSeasonRequestCopyWith<$Res> implements $SeerSeasonRequestCopyWith<$Res> {
  factory _$SeerSeasonRequestCopyWith(_SeerSeasonRequest value, $Res Function(_SeerSeasonRequest) _then) = __$SeerSeasonRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'seasonNumber') int seasonNumber,@JsonKey(name: 'status') int status
});




}
/// @nodoc
class __$SeerSeasonRequestCopyWithImpl<$Res>
    implements _$SeerSeasonRequestCopyWith<$Res> {
  __$SeerSeasonRequestCopyWithImpl(this._self, this._then);

  final _SeerSeasonRequest _self;
  final $Res Function(_SeerSeasonRequest) _then;

/// Create a copy of SeerSeasonRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? seasonNumber = null,Object? status = null,}) {
  return _then(_SeerSeasonRequest(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,seasonNumber: null == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SeerMediaInfoSeason {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'seasonNumber') int? get seasonNumber;@JsonKey(name: 'status') int? get status;
/// Create a copy of SeerMediaInfoSeason
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerMediaInfoSeasonCopyWith<SeerMediaInfoSeason> get copyWith => _$SeerMediaInfoSeasonCopyWithImpl<SeerMediaInfoSeason>(this as SeerMediaInfoSeason, _$identity);

  /// Serializes this SeerMediaInfoSeason to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerMediaInfoSeason&&(identical(other.id, id) || other.id == id)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,seasonNumber,status);

@override
String toString() {
  return 'SeerMediaInfoSeason(id: $id, seasonNumber: $seasonNumber, status: $status)';
}


}

/// @nodoc
abstract mixin class $SeerMediaInfoSeasonCopyWith<$Res>  {
  factory $SeerMediaInfoSeasonCopyWith(SeerMediaInfoSeason value, $Res Function(SeerMediaInfoSeason) _then) = _$SeerMediaInfoSeasonCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'seasonNumber') int? seasonNumber,@JsonKey(name: 'status') int? status
});




}
/// @nodoc
class _$SeerMediaInfoSeasonCopyWithImpl<$Res>
    implements $SeerMediaInfoSeasonCopyWith<$Res> {
  _$SeerMediaInfoSeasonCopyWithImpl(this._self, this._then);

  final SeerMediaInfoSeason _self;
  final $Res Function(SeerMediaInfoSeason) _then;

/// Create a copy of SeerMediaInfoSeason
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? seasonNumber = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerMediaInfoSeason].
extension SeerMediaInfoSeasonPatterns on SeerMediaInfoSeason {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerMediaInfoSeason value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerMediaInfoSeason() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerMediaInfoSeason value)  $default,){
final _that = this;
switch (_that) {
case _SeerMediaInfoSeason():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerMediaInfoSeason value)?  $default,){
final _that = this;
switch (_that) {
case _SeerMediaInfoSeason() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'seasonNumber')  int? seasonNumber, @JsonKey(name: 'status')  int? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerMediaInfoSeason() when $default != null:
return $default(_that.id,_that.seasonNumber,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'seasonNumber')  int? seasonNumber, @JsonKey(name: 'status')  int? status)  $default,) {final _that = this;
switch (_that) {
case _SeerMediaInfoSeason():
return $default(_that.id,_that.seasonNumber,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'seasonNumber')  int? seasonNumber, @JsonKey(name: 'status')  int? status)?  $default,) {final _that = this;
switch (_that) {
case _SeerMediaInfoSeason() when $default != null:
return $default(_that.id,_that.seasonNumber,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerMediaInfoSeason implements SeerMediaInfoSeason {
  const _SeerMediaInfoSeason({@JsonKey(name: 'id') this.id, @JsonKey(name: 'seasonNumber') this.seasonNumber, @JsonKey(name: 'status') this.status});
  factory _SeerMediaInfoSeason.fromJson(Map<String, dynamic> json) => _$SeerMediaInfoSeasonFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'seasonNumber') final  int? seasonNumber;
@override@JsonKey(name: 'status') final  int? status;

/// Create a copy of SeerMediaInfoSeason
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerMediaInfoSeasonCopyWith<_SeerMediaInfoSeason> get copyWith => __$SeerMediaInfoSeasonCopyWithImpl<_SeerMediaInfoSeason>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerMediaInfoSeasonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerMediaInfoSeason&&(identical(other.id, id) || other.id == id)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,seasonNumber,status);

@override
String toString() {
  return 'SeerMediaInfoSeason(id: $id, seasonNumber: $seasonNumber, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SeerMediaInfoSeasonCopyWith<$Res> implements $SeerMediaInfoSeasonCopyWith<$Res> {
  factory _$SeerMediaInfoSeasonCopyWith(_SeerMediaInfoSeason value, $Res Function(_SeerMediaInfoSeason) _then) = __$SeerMediaInfoSeasonCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'seasonNumber') int? seasonNumber,@JsonKey(name: 'status') int? status
});




}
/// @nodoc
class __$SeerMediaInfoSeasonCopyWithImpl<$Res>
    implements _$SeerMediaInfoSeasonCopyWith<$Res> {
  __$SeerMediaInfoSeasonCopyWithImpl(this._self, this._then);

  final _SeerMediaInfoSeason _self;
  final $Res Function(_SeerMediaInfoSeason) _then;

/// Create a copy of SeerMediaInfoSeason
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? seasonNumber = freezed,Object? status = freezed,}) {
  return _then(_SeerMediaInfoSeason(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,seasonNumber: freezed == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SeerMediaInfo {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'mediaType') String? get mediaType;@JsonKey(name: 'tmdbId') int? get tmdbId;@JsonKey(name: 'tvdbId') int? get tvdbId;@JsonKey(name: 'status') int? get status;@JsonKey(name: 'status4k') int? get status4k;@JsonKey(name: 'mediaAddedAt') String? get mediaAddedAt;@JsonKey(name: 'seasons') List<SeerMediaInfoSeason>? get seasons;@JsonKey(name: 'requests') List<SeerRequest>? get requests;@JsonKey(name: 'title') String? get title;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'posterPath') String? get posterPath;@JsonKey(name: 'backdropPath') String? get backdropPath;@JsonKey(name: 'releaseDate') String? get releaseDate;@JsonKey(name: 'firstAirDate') String? get firstAirDate;@JsonKey(name: 'jellyfinMediaId') String? get jellyfinMediaId;@JsonKey(name: 'jellyfinMediaId4k') String? get jellyfinMediaId4k;
/// Create a copy of SeerMediaInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerMediaInfoCopyWith<SeerMediaInfo> get copyWith => _$SeerMediaInfoCopyWithImpl<SeerMediaInfo>(this as SeerMediaInfo, _$identity);

  /// Serializes this SeerMediaInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerMediaInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.tmdbId, tmdbId) || other.tmdbId == tmdbId)&&(identical(other.tvdbId, tvdbId) || other.tvdbId == tvdbId)&&(identical(other.status, status) || other.status == status)&&(identical(other.status4k, status4k) || other.status4k == status4k)&&(identical(other.mediaAddedAt, mediaAddedAt) || other.mediaAddedAt == mediaAddedAt)&&const DeepCollectionEquality().equals(other.seasons, seasons)&&const DeepCollectionEquality().equals(other.requests, requests)&&(identical(other.title, title) || other.title == title)&&(identical(other.name, name) || other.name == name)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&(identical(other.jellyfinMediaId, jellyfinMediaId) || other.jellyfinMediaId == jellyfinMediaId)&&(identical(other.jellyfinMediaId4k, jellyfinMediaId4k) || other.jellyfinMediaId4k == jellyfinMediaId4k));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mediaType,tmdbId,tvdbId,status,status4k,mediaAddedAt,const DeepCollectionEquality().hash(seasons),const DeepCollectionEquality().hash(requests),title,name,posterPath,backdropPath,releaseDate,firstAirDate,jellyfinMediaId,jellyfinMediaId4k);

@override
String toString() {
  return 'SeerMediaInfo(id: $id, mediaType: $mediaType, tmdbId: $tmdbId, tvdbId: $tvdbId, status: $status, status4k: $status4k, mediaAddedAt: $mediaAddedAt, seasons: $seasons, requests: $requests, title: $title, name: $name, posterPath: $posterPath, backdropPath: $backdropPath, releaseDate: $releaseDate, firstAirDate: $firstAirDate, jellyfinMediaId: $jellyfinMediaId, jellyfinMediaId4k: $jellyfinMediaId4k)';
}


}

/// @nodoc
abstract mixin class $SeerMediaInfoCopyWith<$Res>  {
  factory $SeerMediaInfoCopyWith(SeerMediaInfo value, $Res Function(SeerMediaInfo) _then) = _$SeerMediaInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'mediaType') String? mediaType,@JsonKey(name: 'tmdbId') int? tmdbId,@JsonKey(name: 'tvdbId') int? tvdbId,@JsonKey(name: 'status') int? status,@JsonKey(name: 'status4k') int? status4k,@JsonKey(name: 'mediaAddedAt') String? mediaAddedAt,@JsonKey(name: 'seasons') List<SeerMediaInfoSeason>? seasons,@JsonKey(name: 'requests') List<SeerRequest>? requests,@JsonKey(name: 'title') String? title,@JsonKey(name: 'name') String? name,@JsonKey(name: 'posterPath') String? posterPath,@JsonKey(name: 'backdropPath') String? backdropPath,@JsonKey(name: 'releaseDate') String? releaseDate,@JsonKey(name: 'firstAirDate') String? firstAirDate,@JsonKey(name: 'jellyfinMediaId') String? jellyfinMediaId,@JsonKey(name: 'jellyfinMediaId4k') String? jellyfinMediaId4k
});




}
/// @nodoc
class _$SeerMediaInfoCopyWithImpl<$Res>
    implements $SeerMediaInfoCopyWith<$Res> {
  _$SeerMediaInfoCopyWithImpl(this._self, this._then);

  final SeerMediaInfo _self;
  final $Res Function(SeerMediaInfo) _then;

/// Create a copy of SeerMediaInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mediaType = freezed,Object? tmdbId = freezed,Object? tvdbId = freezed,Object? status = freezed,Object? status4k = freezed,Object? mediaAddedAt = freezed,Object? seasons = freezed,Object? requests = freezed,Object? title = freezed,Object? name = freezed,Object? posterPath = freezed,Object? backdropPath = freezed,Object? releaseDate = freezed,Object? firstAirDate = freezed,Object? jellyfinMediaId = freezed,Object? jellyfinMediaId4k = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,tmdbId: freezed == tmdbId ? _self.tmdbId : tmdbId // ignore: cast_nullable_to_non_nullable
as int?,tvdbId: freezed == tvdbId ? _self.tvdbId : tvdbId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,status4k: freezed == status4k ? _self.status4k : status4k // ignore: cast_nullable_to_non_nullable
as int?,mediaAddedAt: freezed == mediaAddedAt ? _self.mediaAddedAt : mediaAddedAt // ignore: cast_nullable_to_non_nullable
as String?,seasons: freezed == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeerMediaInfoSeason>?,requests: freezed == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<SeerRequest>?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as String?,jellyfinMediaId: freezed == jellyfinMediaId ? _self.jellyfinMediaId : jellyfinMediaId // ignore: cast_nullable_to_non_nullable
as String?,jellyfinMediaId4k: freezed == jellyfinMediaId4k ? _self.jellyfinMediaId4k : jellyfinMediaId4k // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerMediaInfo].
extension SeerMediaInfoPatterns on SeerMediaInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerMediaInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerMediaInfo() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerMediaInfo value)  $default,){
final _that = this;
switch (_that) {
case _SeerMediaInfo():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerMediaInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SeerMediaInfo() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'mediaType')  String? mediaType, @JsonKey(name: 'tmdbId')  int? tmdbId, @JsonKey(name: 'tvdbId')  int? tvdbId, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'status4k')  int? status4k, @JsonKey(name: 'mediaAddedAt')  String? mediaAddedAt, @JsonKey(name: 'seasons')  List<SeerMediaInfoSeason>? seasons, @JsonKey(name: 'requests')  List<SeerRequest>? requests, @JsonKey(name: 'title')  String? title, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'posterPath')  String? posterPath, @JsonKey(name: 'backdropPath')  String? backdropPath, @JsonKey(name: 'releaseDate')  String? releaseDate, @JsonKey(name: 'firstAirDate')  String? firstAirDate, @JsonKey(name: 'jellyfinMediaId')  String? jellyfinMediaId, @JsonKey(name: 'jellyfinMediaId4k')  String? jellyfinMediaId4k)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerMediaInfo() when $default != null:
return $default(_that.id,_that.mediaType,_that.tmdbId,_that.tvdbId,_that.status,_that.status4k,_that.mediaAddedAt,_that.seasons,_that.requests,_that.title,_that.name,_that.posterPath,_that.backdropPath,_that.releaseDate,_that.firstAirDate,_that.jellyfinMediaId,_that.jellyfinMediaId4k);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'mediaType')  String? mediaType, @JsonKey(name: 'tmdbId')  int? tmdbId, @JsonKey(name: 'tvdbId')  int? tvdbId, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'status4k')  int? status4k, @JsonKey(name: 'mediaAddedAt')  String? mediaAddedAt, @JsonKey(name: 'seasons')  List<SeerMediaInfoSeason>? seasons, @JsonKey(name: 'requests')  List<SeerRequest>? requests, @JsonKey(name: 'title')  String? title, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'posterPath')  String? posterPath, @JsonKey(name: 'backdropPath')  String? backdropPath, @JsonKey(name: 'releaseDate')  String? releaseDate, @JsonKey(name: 'firstAirDate')  String? firstAirDate, @JsonKey(name: 'jellyfinMediaId')  String? jellyfinMediaId, @JsonKey(name: 'jellyfinMediaId4k')  String? jellyfinMediaId4k)  $default,) {final _that = this;
switch (_that) {
case _SeerMediaInfo():
return $default(_that.id,_that.mediaType,_that.tmdbId,_that.tvdbId,_that.status,_that.status4k,_that.mediaAddedAt,_that.seasons,_that.requests,_that.title,_that.name,_that.posterPath,_that.backdropPath,_that.releaseDate,_that.firstAirDate,_that.jellyfinMediaId,_that.jellyfinMediaId4k);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'mediaType')  String? mediaType, @JsonKey(name: 'tmdbId')  int? tmdbId, @JsonKey(name: 'tvdbId')  int? tvdbId, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'status4k')  int? status4k, @JsonKey(name: 'mediaAddedAt')  String? mediaAddedAt, @JsonKey(name: 'seasons')  List<SeerMediaInfoSeason>? seasons, @JsonKey(name: 'requests')  List<SeerRequest>? requests, @JsonKey(name: 'title')  String? title, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'posterPath')  String? posterPath, @JsonKey(name: 'backdropPath')  String? backdropPath, @JsonKey(name: 'releaseDate')  String? releaseDate, @JsonKey(name: 'firstAirDate')  String? firstAirDate, @JsonKey(name: 'jellyfinMediaId')  String? jellyfinMediaId, @JsonKey(name: 'jellyfinMediaId4k')  String? jellyfinMediaId4k)?  $default,) {final _that = this;
switch (_that) {
case _SeerMediaInfo() when $default != null:
return $default(_that.id,_that.mediaType,_that.tmdbId,_that.tvdbId,_that.status,_that.status4k,_that.mediaAddedAt,_that.seasons,_that.requests,_that.title,_that.name,_that.posterPath,_that.backdropPath,_that.releaseDate,_that.firstAirDate,_that.jellyfinMediaId,_that.jellyfinMediaId4k);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerMediaInfo implements SeerMediaInfo {
  const _SeerMediaInfo({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'mediaType') this.mediaType, @JsonKey(name: 'tmdbId') this.tmdbId, @JsonKey(name: 'tvdbId') this.tvdbId, @JsonKey(name: 'status') this.status, @JsonKey(name: 'status4k') this.status4k, @JsonKey(name: 'mediaAddedAt') this.mediaAddedAt, @JsonKey(name: 'seasons') final  List<SeerMediaInfoSeason>? seasons, @JsonKey(name: 'requests') final  List<SeerRequest>? requests, @JsonKey(name: 'title') this.title, @JsonKey(name: 'name') this.name, @JsonKey(name: 'posterPath') this.posterPath, @JsonKey(name: 'backdropPath') this.backdropPath, @JsonKey(name: 'releaseDate') this.releaseDate, @JsonKey(name: 'firstAirDate') this.firstAirDate, @JsonKey(name: 'jellyfinMediaId') this.jellyfinMediaId, @JsonKey(name: 'jellyfinMediaId4k') this.jellyfinMediaId4k}): _seasons = seasons,_requests = requests;
  factory _SeerMediaInfo.fromJson(Map<String, dynamic> json) => _$SeerMediaInfoFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'mediaType') final  String? mediaType;
@override@JsonKey(name: 'tmdbId') final  int? tmdbId;
@override@JsonKey(name: 'tvdbId') final  int? tvdbId;
@override@JsonKey(name: 'status') final  int? status;
@override@JsonKey(name: 'status4k') final  int? status4k;
@override@JsonKey(name: 'mediaAddedAt') final  String? mediaAddedAt;
 final  List<SeerMediaInfoSeason>? _seasons;
@override@JsonKey(name: 'seasons') List<SeerMediaInfoSeason>? get seasons {
  final value = _seasons;
  if (value == null) return null;
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SeerRequest>? _requests;
@override@JsonKey(name: 'requests') List<SeerRequest>? get requests {
  final value = _requests;
  if (value == null) return null;
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'title') final  String? title;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'posterPath') final  String? posterPath;
@override@JsonKey(name: 'backdropPath') final  String? backdropPath;
@override@JsonKey(name: 'releaseDate') final  String? releaseDate;
@override@JsonKey(name: 'firstAirDate') final  String? firstAirDate;
@override@JsonKey(name: 'jellyfinMediaId') final  String? jellyfinMediaId;
@override@JsonKey(name: 'jellyfinMediaId4k') final  String? jellyfinMediaId4k;

/// Create a copy of SeerMediaInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerMediaInfoCopyWith<_SeerMediaInfo> get copyWith => __$SeerMediaInfoCopyWithImpl<_SeerMediaInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerMediaInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerMediaInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.tmdbId, tmdbId) || other.tmdbId == tmdbId)&&(identical(other.tvdbId, tvdbId) || other.tvdbId == tvdbId)&&(identical(other.status, status) || other.status == status)&&(identical(other.status4k, status4k) || other.status4k == status4k)&&(identical(other.mediaAddedAt, mediaAddedAt) || other.mediaAddedAt == mediaAddedAt)&&const DeepCollectionEquality().equals(other._seasons, _seasons)&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.title, title) || other.title == title)&&(identical(other.name, name) || other.name == name)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&(identical(other.jellyfinMediaId, jellyfinMediaId) || other.jellyfinMediaId == jellyfinMediaId)&&(identical(other.jellyfinMediaId4k, jellyfinMediaId4k) || other.jellyfinMediaId4k == jellyfinMediaId4k));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mediaType,tmdbId,tvdbId,status,status4k,mediaAddedAt,const DeepCollectionEquality().hash(_seasons),const DeepCollectionEquality().hash(_requests),title,name,posterPath,backdropPath,releaseDate,firstAirDate,jellyfinMediaId,jellyfinMediaId4k);

@override
String toString() {
  return 'SeerMediaInfo(id: $id, mediaType: $mediaType, tmdbId: $tmdbId, tvdbId: $tvdbId, status: $status, status4k: $status4k, mediaAddedAt: $mediaAddedAt, seasons: $seasons, requests: $requests, title: $title, name: $name, posterPath: $posterPath, backdropPath: $backdropPath, releaseDate: $releaseDate, firstAirDate: $firstAirDate, jellyfinMediaId: $jellyfinMediaId, jellyfinMediaId4k: $jellyfinMediaId4k)';
}


}

/// @nodoc
abstract mixin class _$SeerMediaInfoCopyWith<$Res> implements $SeerMediaInfoCopyWith<$Res> {
  factory _$SeerMediaInfoCopyWith(_SeerMediaInfo value, $Res Function(_SeerMediaInfo) _then) = __$SeerMediaInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'mediaType') String? mediaType,@JsonKey(name: 'tmdbId') int? tmdbId,@JsonKey(name: 'tvdbId') int? tvdbId,@JsonKey(name: 'status') int? status,@JsonKey(name: 'status4k') int? status4k,@JsonKey(name: 'mediaAddedAt') String? mediaAddedAt,@JsonKey(name: 'seasons') List<SeerMediaInfoSeason>? seasons,@JsonKey(name: 'requests') List<SeerRequest>? requests,@JsonKey(name: 'title') String? title,@JsonKey(name: 'name') String? name,@JsonKey(name: 'posterPath') String? posterPath,@JsonKey(name: 'backdropPath') String? backdropPath,@JsonKey(name: 'releaseDate') String? releaseDate,@JsonKey(name: 'firstAirDate') String? firstAirDate,@JsonKey(name: 'jellyfinMediaId') String? jellyfinMediaId,@JsonKey(name: 'jellyfinMediaId4k') String? jellyfinMediaId4k
});




}
/// @nodoc
class __$SeerMediaInfoCopyWithImpl<$Res>
    implements _$SeerMediaInfoCopyWith<$Res> {
  __$SeerMediaInfoCopyWithImpl(this._self, this._then);

  final _SeerMediaInfo _self;
  final $Res Function(_SeerMediaInfo) _then;

/// Create a copy of SeerMediaInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mediaType = freezed,Object? tmdbId = freezed,Object? tvdbId = freezed,Object? status = freezed,Object? status4k = freezed,Object? mediaAddedAt = freezed,Object? seasons = freezed,Object? requests = freezed,Object? title = freezed,Object? name = freezed,Object? posterPath = freezed,Object? backdropPath = freezed,Object? releaseDate = freezed,Object? firstAirDate = freezed,Object? jellyfinMediaId = freezed,Object? jellyfinMediaId4k = freezed,}) {
  return _then(_SeerMediaInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,tmdbId: freezed == tmdbId ? _self.tmdbId : tmdbId // ignore: cast_nullable_to_non_nullable
as int?,tvdbId: freezed == tvdbId ? _self.tvdbId : tvdbId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,status4k: freezed == status4k ? _self.status4k : status4k // ignore: cast_nullable_to_non_nullable
as int?,mediaAddedAt: freezed == mediaAddedAt ? _self.mediaAddedAt : mediaAddedAt // ignore: cast_nullable_to_non_nullable
as String?,seasons: freezed == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeerMediaInfoSeason>?,requests: freezed == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<SeerRequest>?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as String?,jellyfinMediaId: freezed == jellyfinMediaId ? _self.jellyfinMediaId : jellyfinMediaId // ignore: cast_nullable_to_non_nullable
as String?,jellyfinMediaId4k: freezed == jellyfinMediaId4k ? _self.jellyfinMediaId4k : jellyfinMediaId4k // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SeerRequest {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'status') int get status;@JsonKey(name: 'media') SeerMediaInfo? get media;@JsonKey(name: 'requestedBy') SeerRequestUser? get requestedBy;@JsonKey(name: 'modifiedBy') SeerRequestUser? get modifiedBy;@JsonKey(name: 'createdAt') String? get createdAt;@JsonKey(name: 'updatedAt') String? get updatedAt;@JsonKey(name: 'seasons') List<SeerSeasonRequest>? get seasons;@JsonKey(name: 'is4k') bool get is4k;@JsonKey(name: 'serverId') int? get serverId;@JsonKey(name: 'profileId') int? get profileId;@JsonKey(name: 'rootFolder') String? get rootFolder;
/// Create a copy of SeerRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerRequestCopyWith<SeerRequest> get copyWith => _$SeerRequestCopyWithImpl<SeerRequest>(this as SeerRequest, _$identity);

  /// Serializes this SeerRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.media, media) || other.media == media)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.seasons, seasons)&&(identical(other.is4k, is4k) || other.is4k == is4k)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.rootFolder, rootFolder) || other.rootFolder == rootFolder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,media,requestedBy,modifiedBy,createdAt,updatedAt,const DeepCollectionEquality().hash(seasons),is4k,serverId,profileId,rootFolder);

@override
String toString() {
  return 'SeerRequest(id: $id, status: $status, media: $media, requestedBy: $requestedBy, modifiedBy: $modifiedBy, createdAt: $createdAt, updatedAt: $updatedAt, seasons: $seasons, is4k: $is4k, serverId: $serverId, profileId: $profileId, rootFolder: $rootFolder)';
}


}

/// @nodoc
abstract mixin class $SeerRequestCopyWith<$Res>  {
  factory $SeerRequestCopyWith(SeerRequest value, $Res Function(SeerRequest) _then) = _$SeerRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'status') int status,@JsonKey(name: 'media') SeerMediaInfo? media,@JsonKey(name: 'requestedBy') SeerRequestUser? requestedBy,@JsonKey(name: 'modifiedBy') SeerRequestUser? modifiedBy,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'seasons') List<SeerSeasonRequest>? seasons,@JsonKey(name: 'is4k') bool is4k,@JsonKey(name: 'serverId') int? serverId,@JsonKey(name: 'profileId') int? profileId,@JsonKey(name: 'rootFolder') String? rootFolder
});


$SeerMediaInfoCopyWith<$Res>? get media;$SeerRequestUserCopyWith<$Res>? get requestedBy;$SeerRequestUserCopyWith<$Res>? get modifiedBy;

}
/// @nodoc
class _$SeerRequestCopyWithImpl<$Res>
    implements $SeerRequestCopyWith<$Res> {
  _$SeerRequestCopyWithImpl(this._self, this._then);

  final SeerRequest _self;
  final $Res Function(SeerRequest) _then;

/// Create a copy of SeerRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? media = freezed,Object? requestedBy = freezed,Object? modifiedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? seasons = freezed,Object? is4k = null,Object? serverId = freezed,Object? profileId = freezed,Object? rootFolder = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as SeerMediaInfo?,requestedBy: freezed == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as SeerRequestUser?,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as SeerRequestUser?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,seasons: freezed == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeerSeasonRequest>?,is4k: null == is4k ? _self.is4k : is4k // ignore: cast_nullable_to_non_nullable
as bool,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,profileId: freezed == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as int?,rootFolder: freezed == rootFolder ? _self.rootFolder : rootFolder // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SeerRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeerMediaInfoCopyWith<$Res>? get media {
    if (_self.media == null) {
    return null;
  }

  return $SeerMediaInfoCopyWith<$Res>(_self.media!, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of SeerRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeerRequestUserCopyWith<$Res>? get requestedBy {
    if (_self.requestedBy == null) {
    return null;
  }

  return $SeerRequestUserCopyWith<$Res>(_self.requestedBy!, (value) {
    return _then(_self.copyWith(requestedBy: value));
  });
}/// Create a copy of SeerRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeerRequestUserCopyWith<$Res>? get modifiedBy {
    if (_self.modifiedBy == null) {
    return null;
  }

  return $SeerRequestUserCopyWith<$Res>(_self.modifiedBy!, (value) {
    return _then(_self.copyWith(modifiedBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [SeerRequest].
extension SeerRequestPatterns on SeerRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerRequest value)  $default,){
final _that = this;
switch (_that) {
case _SeerRequest():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SeerRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'status')  int status, @JsonKey(name: 'media')  SeerMediaInfo? media, @JsonKey(name: 'requestedBy')  SeerRequestUser? requestedBy, @JsonKey(name: 'modifiedBy')  SeerRequestUser? modifiedBy, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'seasons')  List<SeerSeasonRequest>? seasons, @JsonKey(name: 'is4k')  bool is4k, @JsonKey(name: 'serverId')  int? serverId, @JsonKey(name: 'profileId')  int? profileId, @JsonKey(name: 'rootFolder')  String? rootFolder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerRequest() when $default != null:
return $default(_that.id,_that.status,_that.media,_that.requestedBy,_that.modifiedBy,_that.createdAt,_that.updatedAt,_that.seasons,_that.is4k,_that.serverId,_that.profileId,_that.rootFolder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'status')  int status, @JsonKey(name: 'media')  SeerMediaInfo? media, @JsonKey(name: 'requestedBy')  SeerRequestUser? requestedBy, @JsonKey(name: 'modifiedBy')  SeerRequestUser? modifiedBy, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'seasons')  List<SeerSeasonRequest>? seasons, @JsonKey(name: 'is4k')  bool is4k, @JsonKey(name: 'serverId')  int? serverId, @JsonKey(name: 'profileId')  int? profileId, @JsonKey(name: 'rootFolder')  String? rootFolder)  $default,) {final _that = this;
switch (_that) {
case _SeerRequest():
return $default(_that.id,_that.status,_that.media,_that.requestedBy,_that.modifiedBy,_that.createdAt,_that.updatedAt,_that.seasons,_that.is4k,_that.serverId,_that.profileId,_that.rootFolder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'status')  int status, @JsonKey(name: 'media')  SeerMediaInfo? media, @JsonKey(name: 'requestedBy')  SeerRequestUser? requestedBy, @JsonKey(name: 'modifiedBy')  SeerRequestUser? modifiedBy, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'seasons')  List<SeerSeasonRequest>? seasons, @JsonKey(name: 'is4k')  bool is4k, @JsonKey(name: 'serverId')  int? serverId, @JsonKey(name: 'profileId')  int? profileId, @JsonKey(name: 'rootFolder')  String? rootFolder)?  $default,) {final _that = this;
switch (_that) {
case _SeerRequest() when $default != null:
return $default(_that.id,_that.status,_that.media,_that.requestedBy,_that.modifiedBy,_that.createdAt,_that.updatedAt,_that.seasons,_that.is4k,_that.serverId,_that.profileId,_that.rootFolder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerRequest implements SeerRequest {
  const _SeerRequest({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'status') this.status = 1, @JsonKey(name: 'media') this.media, @JsonKey(name: 'requestedBy') this.requestedBy, @JsonKey(name: 'modifiedBy') this.modifiedBy, @JsonKey(name: 'createdAt') this.createdAt, @JsonKey(name: 'updatedAt') this.updatedAt, @JsonKey(name: 'seasons') final  List<SeerSeasonRequest>? seasons, @JsonKey(name: 'is4k') this.is4k = false, @JsonKey(name: 'serverId') this.serverId, @JsonKey(name: 'profileId') this.profileId, @JsonKey(name: 'rootFolder') this.rootFolder}): _seasons = seasons;
  factory _SeerRequest.fromJson(Map<String, dynamic> json) => _$SeerRequestFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'status') final  int status;
@override@JsonKey(name: 'media') final  SeerMediaInfo? media;
@override@JsonKey(name: 'requestedBy') final  SeerRequestUser? requestedBy;
@override@JsonKey(name: 'modifiedBy') final  SeerRequestUser? modifiedBy;
@override@JsonKey(name: 'createdAt') final  String? createdAt;
@override@JsonKey(name: 'updatedAt') final  String? updatedAt;
 final  List<SeerSeasonRequest>? _seasons;
@override@JsonKey(name: 'seasons') List<SeerSeasonRequest>? get seasons {
  final value = _seasons;
  if (value == null) return null;
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'is4k') final  bool is4k;
@override@JsonKey(name: 'serverId') final  int? serverId;
@override@JsonKey(name: 'profileId') final  int? profileId;
@override@JsonKey(name: 'rootFolder') final  String? rootFolder;

/// Create a copy of SeerRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerRequestCopyWith<_SeerRequest> get copyWith => __$SeerRequestCopyWithImpl<_SeerRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.media, media) || other.media == media)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._seasons, _seasons)&&(identical(other.is4k, is4k) || other.is4k == is4k)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.rootFolder, rootFolder) || other.rootFolder == rootFolder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,media,requestedBy,modifiedBy,createdAt,updatedAt,const DeepCollectionEquality().hash(_seasons),is4k,serverId,profileId,rootFolder);

@override
String toString() {
  return 'SeerRequest(id: $id, status: $status, media: $media, requestedBy: $requestedBy, modifiedBy: $modifiedBy, createdAt: $createdAt, updatedAt: $updatedAt, seasons: $seasons, is4k: $is4k, serverId: $serverId, profileId: $profileId, rootFolder: $rootFolder)';
}


}

/// @nodoc
abstract mixin class _$SeerRequestCopyWith<$Res> implements $SeerRequestCopyWith<$Res> {
  factory _$SeerRequestCopyWith(_SeerRequest value, $Res Function(_SeerRequest) _then) = __$SeerRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'status') int status,@JsonKey(name: 'media') SeerMediaInfo? media,@JsonKey(name: 'requestedBy') SeerRequestUser? requestedBy,@JsonKey(name: 'modifiedBy') SeerRequestUser? modifiedBy,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'seasons') List<SeerSeasonRequest>? seasons,@JsonKey(name: 'is4k') bool is4k,@JsonKey(name: 'serverId') int? serverId,@JsonKey(name: 'profileId') int? profileId,@JsonKey(name: 'rootFolder') String? rootFolder
});


@override $SeerMediaInfoCopyWith<$Res>? get media;@override $SeerRequestUserCopyWith<$Res>? get requestedBy;@override $SeerRequestUserCopyWith<$Res>? get modifiedBy;

}
/// @nodoc
class __$SeerRequestCopyWithImpl<$Res>
    implements _$SeerRequestCopyWith<$Res> {
  __$SeerRequestCopyWithImpl(this._self, this._then);

  final _SeerRequest _self;
  final $Res Function(_SeerRequest) _then;

/// Create a copy of SeerRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? media = freezed,Object? requestedBy = freezed,Object? modifiedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? seasons = freezed,Object? is4k = null,Object? serverId = freezed,Object? profileId = freezed,Object? rootFolder = freezed,}) {
  return _then(_SeerRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as SeerMediaInfo?,requestedBy: freezed == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as SeerRequestUser?,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as SeerRequestUser?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,seasons: freezed == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeerSeasonRequest>?,is4k: null == is4k ? _self.is4k : is4k // ignore: cast_nullable_to_non_nullable
as bool,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,profileId: freezed == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as int?,rootFolder: freezed == rootFolder ? _self.rootFolder : rootFolder // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SeerRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeerMediaInfoCopyWith<$Res>? get media {
    if (_self.media == null) {
    return null;
  }

  return $SeerMediaInfoCopyWith<$Res>(_self.media!, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of SeerRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeerRequestUserCopyWith<$Res>? get requestedBy {
    if (_self.requestedBy == null) {
    return null;
  }

  return $SeerRequestUserCopyWith<$Res>(_self.requestedBy!, (value) {
    return _then(_self.copyWith(requestedBy: value));
  });
}/// Create a copy of SeerRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeerRequestUserCopyWith<$Res>? get modifiedBy {
    if (_self.modifiedBy == null) {
    return null;
  }

  return $SeerRequestUserCopyWith<$Res>(_self.modifiedBy!, (value) {
    return _then(_self.copyWith(modifiedBy: value));
  });
}
}


/// @nodoc
mixin _$SeerSearchResultItem {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'mediaType') String? get mediaType;@JsonKey(name: 'title') String? get title;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'overview') String? get overview;@JsonKey(name: 'posterPath') String? get posterPath;@JsonKey(name: 'backdropPath') String? get backdropPath;@JsonKey(name: 'releaseDate') String? get releaseDate;@JsonKey(name: 'firstAirDate') String? get firstAirDate;@JsonKey(name: 'voteAverage') double? get voteAverage;@JsonKey(name: 'genreIds') List<int>? get genreIds;@JsonKey(name: 'mediaInfo') SeerMediaInfo? get mediaInfo;
/// Create a copy of SeerSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerSearchResultItemCopyWith<SeerSearchResultItem> get copyWith => _$SeerSearchResultItemCopyWithImpl<SeerSearchResultItem>(this as SeerSearchResultItem, _$identity);

  /// Serializes this SeerSearchResultItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerSearchResultItem&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.title, title) || other.title == title)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&const DeepCollectionEquality().equals(other.genreIds, genreIds)&&(identical(other.mediaInfo, mediaInfo) || other.mediaInfo == mediaInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mediaType,title,name,overview,posterPath,backdropPath,releaseDate,firstAirDate,voteAverage,const DeepCollectionEquality().hash(genreIds),mediaInfo);

@override
String toString() {
  return 'SeerSearchResultItem(id: $id, mediaType: $mediaType, title: $title, name: $name, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, releaseDate: $releaseDate, firstAirDate: $firstAirDate, voteAverage: $voteAverage, genreIds: $genreIds, mediaInfo: $mediaInfo)';
}


}

/// @nodoc
abstract mixin class $SeerSearchResultItemCopyWith<$Res>  {
  factory $SeerSearchResultItemCopyWith(SeerSearchResultItem value, $Res Function(SeerSearchResultItem) _then) = _$SeerSearchResultItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'mediaType') String? mediaType,@JsonKey(name: 'title') String? title,@JsonKey(name: 'name') String? name,@JsonKey(name: 'overview') String? overview,@JsonKey(name: 'posterPath') String? posterPath,@JsonKey(name: 'backdropPath') String? backdropPath,@JsonKey(name: 'releaseDate') String? releaseDate,@JsonKey(name: 'firstAirDate') String? firstAirDate,@JsonKey(name: 'voteAverage') double? voteAverage,@JsonKey(name: 'genreIds') List<int>? genreIds,@JsonKey(name: 'mediaInfo') SeerMediaInfo? mediaInfo
});


$SeerMediaInfoCopyWith<$Res>? get mediaInfo;

}
/// @nodoc
class _$SeerSearchResultItemCopyWithImpl<$Res>
    implements $SeerSearchResultItemCopyWith<$Res> {
  _$SeerSearchResultItemCopyWithImpl(this._self, this._then);

  final SeerSearchResultItem _self;
  final $Res Function(SeerSearchResultItem) _then;

/// Create a copy of SeerSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mediaType = freezed,Object? title = freezed,Object? name = freezed,Object? overview = freezed,Object? posterPath = freezed,Object? backdropPath = freezed,Object? releaseDate = freezed,Object? firstAirDate = freezed,Object? voteAverage = freezed,Object? genreIds = freezed,Object? mediaInfo = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,genreIds: freezed == genreIds ? _self.genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>?,mediaInfo: freezed == mediaInfo ? _self.mediaInfo : mediaInfo // ignore: cast_nullable_to_non_nullable
as SeerMediaInfo?,
  ));
}
/// Create a copy of SeerSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeerMediaInfoCopyWith<$Res>? get mediaInfo {
    if (_self.mediaInfo == null) {
    return null;
  }

  return $SeerMediaInfoCopyWith<$Res>(_self.mediaInfo!, (value) {
    return _then(_self.copyWith(mediaInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [SeerSearchResultItem].
extension SeerSearchResultItemPatterns on SeerSearchResultItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerSearchResultItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerSearchResultItem() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerSearchResultItem value)  $default,){
final _that = this;
switch (_that) {
case _SeerSearchResultItem():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerSearchResultItem value)?  $default,){
final _that = this;
switch (_that) {
case _SeerSearchResultItem() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'mediaType')  String? mediaType, @JsonKey(name: 'title')  String? title, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'overview')  String? overview, @JsonKey(name: 'posterPath')  String? posterPath, @JsonKey(name: 'backdropPath')  String? backdropPath, @JsonKey(name: 'releaseDate')  String? releaseDate, @JsonKey(name: 'firstAirDate')  String? firstAirDate, @JsonKey(name: 'voteAverage')  double? voteAverage, @JsonKey(name: 'genreIds')  List<int>? genreIds, @JsonKey(name: 'mediaInfo')  SeerMediaInfo? mediaInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerSearchResultItem() when $default != null:
return $default(_that.id,_that.mediaType,_that.title,_that.name,_that.overview,_that.posterPath,_that.backdropPath,_that.releaseDate,_that.firstAirDate,_that.voteAverage,_that.genreIds,_that.mediaInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'mediaType')  String? mediaType, @JsonKey(name: 'title')  String? title, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'overview')  String? overview, @JsonKey(name: 'posterPath')  String? posterPath, @JsonKey(name: 'backdropPath')  String? backdropPath, @JsonKey(name: 'releaseDate')  String? releaseDate, @JsonKey(name: 'firstAirDate')  String? firstAirDate, @JsonKey(name: 'voteAverage')  double? voteAverage, @JsonKey(name: 'genreIds')  List<int>? genreIds, @JsonKey(name: 'mediaInfo')  SeerMediaInfo? mediaInfo)  $default,) {final _that = this;
switch (_that) {
case _SeerSearchResultItem():
return $default(_that.id,_that.mediaType,_that.title,_that.name,_that.overview,_that.posterPath,_that.backdropPath,_that.releaseDate,_that.firstAirDate,_that.voteAverage,_that.genreIds,_that.mediaInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'mediaType')  String? mediaType, @JsonKey(name: 'title')  String? title, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'overview')  String? overview, @JsonKey(name: 'posterPath')  String? posterPath, @JsonKey(name: 'backdropPath')  String? backdropPath, @JsonKey(name: 'releaseDate')  String? releaseDate, @JsonKey(name: 'firstAirDate')  String? firstAirDate, @JsonKey(name: 'voteAverage')  double? voteAverage, @JsonKey(name: 'genreIds')  List<int>? genreIds, @JsonKey(name: 'mediaInfo')  SeerMediaInfo? mediaInfo)?  $default,) {final _that = this;
switch (_that) {
case _SeerSearchResultItem() when $default != null:
return $default(_that.id,_that.mediaType,_that.title,_that.name,_that.overview,_that.posterPath,_that.backdropPath,_that.releaseDate,_that.firstAirDate,_that.voteAverage,_that.genreIds,_that.mediaInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerSearchResultItem extends SeerSearchResultItem {
  const _SeerSearchResultItem({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'mediaType') this.mediaType, @JsonKey(name: 'title') this.title, @JsonKey(name: 'name') this.name, @JsonKey(name: 'overview') this.overview, @JsonKey(name: 'posterPath') this.posterPath, @JsonKey(name: 'backdropPath') this.backdropPath, @JsonKey(name: 'releaseDate') this.releaseDate, @JsonKey(name: 'firstAirDate') this.firstAirDate, @JsonKey(name: 'voteAverage') this.voteAverage, @JsonKey(name: 'genreIds') final  List<int>? genreIds, @JsonKey(name: 'mediaInfo') this.mediaInfo}): _genreIds = genreIds,super._();
  factory _SeerSearchResultItem.fromJson(Map<String, dynamic> json) => _$SeerSearchResultItemFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'mediaType') final  String? mediaType;
@override@JsonKey(name: 'title') final  String? title;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'overview') final  String? overview;
@override@JsonKey(name: 'posterPath') final  String? posterPath;
@override@JsonKey(name: 'backdropPath') final  String? backdropPath;
@override@JsonKey(name: 'releaseDate') final  String? releaseDate;
@override@JsonKey(name: 'firstAirDate') final  String? firstAirDate;
@override@JsonKey(name: 'voteAverage') final  double? voteAverage;
 final  List<int>? _genreIds;
@override@JsonKey(name: 'genreIds') List<int>? get genreIds {
  final value = _genreIds;
  if (value == null) return null;
  if (_genreIds is EqualUnmodifiableListView) return _genreIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'mediaInfo') final  SeerMediaInfo? mediaInfo;

/// Create a copy of SeerSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerSearchResultItemCopyWith<_SeerSearchResultItem> get copyWith => __$SeerSearchResultItemCopyWithImpl<_SeerSearchResultItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerSearchResultItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerSearchResultItem&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.title, title) || other.title == title)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&const DeepCollectionEquality().equals(other._genreIds, _genreIds)&&(identical(other.mediaInfo, mediaInfo) || other.mediaInfo == mediaInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mediaType,title,name,overview,posterPath,backdropPath,releaseDate,firstAirDate,voteAverage,const DeepCollectionEquality().hash(_genreIds),mediaInfo);

@override
String toString() {
  return 'SeerSearchResultItem(id: $id, mediaType: $mediaType, title: $title, name: $name, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, releaseDate: $releaseDate, firstAirDate: $firstAirDate, voteAverage: $voteAverage, genreIds: $genreIds, mediaInfo: $mediaInfo)';
}


}

/// @nodoc
abstract mixin class _$SeerSearchResultItemCopyWith<$Res> implements $SeerSearchResultItemCopyWith<$Res> {
  factory _$SeerSearchResultItemCopyWith(_SeerSearchResultItem value, $Res Function(_SeerSearchResultItem) _then) = __$SeerSearchResultItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'mediaType') String? mediaType,@JsonKey(name: 'title') String? title,@JsonKey(name: 'name') String? name,@JsonKey(name: 'overview') String? overview,@JsonKey(name: 'posterPath') String? posterPath,@JsonKey(name: 'backdropPath') String? backdropPath,@JsonKey(name: 'releaseDate') String? releaseDate,@JsonKey(name: 'firstAirDate') String? firstAirDate,@JsonKey(name: 'voteAverage') double? voteAverage,@JsonKey(name: 'genreIds') List<int>? genreIds,@JsonKey(name: 'mediaInfo') SeerMediaInfo? mediaInfo
});


@override $SeerMediaInfoCopyWith<$Res>? get mediaInfo;

}
/// @nodoc
class __$SeerSearchResultItemCopyWithImpl<$Res>
    implements _$SeerSearchResultItemCopyWith<$Res> {
  __$SeerSearchResultItemCopyWithImpl(this._self, this._then);

  final _SeerSearchResultItem _self;
  final $Res Function(_SeerSearchResultItem) _then;

/// Create a copy of SeerSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mediaType = freezed,Object? title = freezed,Object? name = freezed,Object? overview = freezed,Object? posterPath = freezed,Object? backdropPath = freezed,Object? releaseDate = freezed,Object? firstAirDate = freezed,Object? voteAverage = freezed,Object? genreIds = freezed,Object? mediaInfo = freezed,}) {
  return _then(_SeerSearchResultItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,genreIds: freezed == genreIds ? _self._genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>?,mediaInfo: freezed == mediaInfo ? _self.mediaInfo : mediaInfo // ignore: cast_nullable_to_non_nullable
as SeerMediaInfo?,
  ));
}

/// Create a copy of SeerSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeerMediaInfoCopyWith<$Res>? get mediaInfo {
    if (_self.mediaInfo == null) {
    return null;
  }

  return $SeerMediaInfoCopyWith<$Res>(_self.mediaInfo!, (value) {
    return _then(_self.copyWith(mediaInfo: value));
  });
}
}


/// @nodoc
mixin _$SeerSearchResponse {

@JsonKey(name: 'page') int get page;@JsonKey(name: 'totalPages') int get totalPages;@JsonKey(name: 'totalResults') int get totalResults;@JsonKey(name: 'results') List<SeerSearchResultItem> get results;
/// Create a copy of SeerSearchResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerSearchResponseCopyWith<SeerSearchResponse> get copyWith => _$SeerSearchResponseCopyWithImpl<SeerSearchResponse>(this as SeerSearchResponse, _$identity);

  /// Serializes this SeerSearchResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerSearchResponse&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalPages,totalResults,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'SeerSearchResponse(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
}


}

/// @nodoc
abstract mixin class $SeerSearchResponseCopyWith<$Res>  {
  factory $SeerSearchResponseCopyWith(SeerSearchResponse value, $Res Function(SeerSearchResponse) _then) = _$SeerSearchResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'page') int page,@JsonKey(name: 'totalPages') int totalPages,@JsonKey(name: 'totalResults') int totalResults,@JsonKey(name: 'results') List<SeerSearchResultItem> results
});




}
/// @nodoc
class _$SeerSearchResponseCopyWithImpl<$Res>
    implements $SeerSearchResponseCopyWith<$Res> {
  _$SeerSearchResponseCopyWithImpl(this._self, this._then);

  final SeerSearchResponse _self;
  final $Res Function(SeerSearchResponse) _then;

/// Create a copy of SeerSearchResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? totalPages = null,Object? totalResults = null,Object? results = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SeerSearchResultItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerSearchResponse].
extension SeerSearchResponsePatterns on SeerSearchResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerSearchResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerSearchResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerSearchResponse value)  $default,){
final _that = this;
switch (_that) {
case _SeerSearchResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerSearchResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SeerSearchResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'page')  int page, @JsonKey(name: 'totalPages')  int totalPages, @JsonKey(name: 'totalResults')  int totalResults, @JsonKey(name: 'results')  List<SeerSearchResultItem> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerSearchResponse() when $default != null:
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'page')  int page, @JsonKey(name: 'totalPages')  int totalPages, @JsonKey(name: 'totalResults')  int totalResults, @JsonKey(name: 'results')  List<SeerSearchResultItem> results)  $default,) {final _that = this;
switch (_that) {
case _SeerSearchResponse():
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'page')  int page, @JsonKey(name: 'totalPages')  int totalPages, @JsonKey(name: 'totalResults')  int totalResults, @JsonKey(name: 'results')  List<SeerSearchResultItem> results)?  $default,) {final _that = this;
switch (_that) {
case _SeerSearchResponse() when $default != null:
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerSearchResponse implements SeerSearchResponse {
  const _SeerSearchResponse({@JsonKey(name: 'page') this.page = 1, @JsonKey(name: 'totalPages') this.totalPages = 1, @JsonKey(name: 'totalResults') this.totalResults = 0, @JsonKey(name: 'results') final  List<SeerSearchResultItem> results = const []}): _results = results;
  factory _SeerSearchResponse.fromJson(Map<String, dynamic> json) => _$SeerSearchResponseFromJson(json);

@override@JsonKey(name: 'page') final  int page;
@override@JsonKey(name: 'totalPages') final  int totalPages;
@override@JsonKey(name: 'totalResults') final  int totalResults;
 final  List<SeerSearchResultItem> _results;
@override@JsonKey(name: 'results') List<SeerSearchResultItem> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of SeerSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerSearchResponseCopyWith<_SeerSearchResponse> get copyWith => __$SeerSearchResponseCopyWithImpl<_SeerSearchResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerSearchResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerSearchResponse&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalPages,totalResults,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'SeerSearchResponse(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
}


}

/// @nodoc
abstract mixin class _$SeerSearchResponseCopyWith<$Res> implements $SeerSearchResponseCopyWith<$Res> {
  factory _$SeerSearchResponseCopyWith(_SeerSearchResponse value, $Res Function(_SeerSearchResponse) _then) = __$SeerSearchResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'page') int page,@JsonKey(name: 'totalPages') int totalPages,@JsonKey(name: 'totalResults') int totalResults,@JsonKey(name: 'results') List<SeerSearchResultItem> results
});




}
/// @nodoc
class __$SeerSearchResponseCopyWithImpl<$Res>
    implements _$SeerSearchResponseCopyWith<$Res> {
  __$SeerSearchResponseCopyWithImpl(this._self, this._then);

  final _SeerSearchResponse _self;
  final $Res Function(_SeerSearchResponse) _then;

/// Create a copy of SeerSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? totalPages = null,Object? totalResults = null,Object? results = null,}) {
  return _then(_SeerSearchResponse(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SeerSearchResultItem>,
  ));
}


}


/// @nodoc
mixin _$SeerRequestsResponse {

@JsonKey(name: 'page') int get page;@JsonKey(name: 'totalPages') int get totalPages;@JsonKey(name: 'totalResults') int get totalResults;@JsonKey(name: 'results') List<SeerRequest> get results;
/// Create a copy of SeerRequestsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerRequestsResponseCopyWith<SeerRequestsResponse> get copyWith => _$SeerRequestsResponseCopyWithImpl<SeerRequestsResponse>(this as SeerRequestsResponse, _$identity);

  /// Serializes this SeerRequestsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerRequestsResponse&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalPages,totalResults,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'SeerRequestsResponse(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
}


}

/// @nodoc
abstract mixin class $SeerRequestsResponseCopyWith<$Res>  {
  factory $SeerRequestsResponseCopyWith(SeerRequestsResponse value, $Res Function(SeerRequestsResponse) _then) = _$SeerRequestsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'page') int page,@JsonKey(name: 'totalPages') int totalPages,@JsonKey(name: 'totalResults') int totalResults,@JsonKey(name: 'results') List<SeerRequest> results
});




}
/// @nodoc
class _$SeerRequestsResponseCopyWithImpl<$Res>
    implements $SeerRequestsResponseCopyWith<$Res> {
  _$SeerRequestsResponseCopyWithImpl(this._self, this._then);

  final SeerRequestsResponse _self;
  final $Res Function(SeerRequestsResponse) _then;

/// Create a copy of SeerRequestsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? totalPages = null,Object? totalResults = null,Object? results = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SeerRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerRequestsResponse].
extension SeerRequestsResponsePatterns on SeerRequestsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerRequestsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerRequestsResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerRequestsResponse value)  $default,){
final _that = this;
switch (_that) {
case _SeerRequestsResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerRequestsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SeerRequestsResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'page')  int page, @JsonKey(name: 'totalPages')  int totalPages, @JsonKey(name: 'totalResults')  int totalResults, @JsonKey(name: 'results')  List<SeerRequest> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerRequestsResponse() when $default != null:
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'page')  int page, @JsonKey(name: 'totalPages')  int totalPages, @JsonKey(name: 'totalResults')  int totalResults, @JsonKey(name: 'results')  List<SeerRequest> results)  $default,) {final _that = this;
switch (_that) {
case _SeerRequestsResponse():
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'page')  int page, @JsonKey(name: 'totalPages')  int totalPages, @JsonKey(name: 'totalResults')  int totalResults, @JsonKey(name: 'results')  List<SeerRequest> results)?  $default,) {final _that = this;
switch (_that) {
case _SeerRequestsResponse() when $default != null:
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerRequestsResponse implements SeerRequestsResponse {
  const _SeerRequestsResponse({@JsonKey(name: 'page') this.page = 1, @JsonKey(name: 'totalPages') this.totalPages = 1, @JsonKey(name: 'totalResults') this.totalResults = 0, @JsonKey(name: 'results') final  List<SeerRequest> results = const []}): _results = results;
  factory _SeerRequestsResponse.fromJson(Map<String, dynamic> json) => _$SeerRequestsResponseFromJson(json);

@override@JsonKey(name: 'page') final  int page;
@override@JsonKey(name: 'totalPages') final  int totalPages;
@override@JsonKey(name: 'totalResults') final  int totalResults;
 final  List<SeerRequest> _results;
@override@JsonKey(name: 'results') List<SeerRequest> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of SeerRequestsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerRequestsResponseCopyWith<_SeerRequestsResponse> get copyWith => __$SeerRequestsResponseCopyWithImpl<_SeerRequestsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerRequestsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerRequestsResponse&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalPages,totalResults,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'SeerRequestsResponse(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
}


}

/// @nodoc
abstract mixin class _$SeerRequestsResponseCopyWith<$Res> implements $SeerRequestsResponseCopyWith<$Res> {
  factory _$SeerRequestsResponseCopyWith(_SeerRequestsResponse value, $Res Function(_SeerRequestsResponse) _then) = __$SeerRequestsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'page') int page,@JsonKey(name: 'totalPages') int totalPages,@JsonKey(name: 'totalResults') int totalResults,@JsonKey(name: 'results') List<SeerRequest> results
});




}
/// @nodoc
class __$SeerRequestsResponseCopyWithImpl<$Res>
    implements _$SeerRequestsResponseCopyWith<$Res> {
  __$SeerRequestsResponseCopyWithImpl(this._self, this._then);

  final _SeerRequestsResponse _self;
  final $Res Function(_SeerRequestsResponse) _then;

/// Create a copy of SeerRequestsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? totalPages = null,Object? totalResults = null,Object? results = null,}) {
  return _then(_SeerRequestsResponse(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SeerRequest>,
  ));
}


}


/// @nodoc
mixin _$SeerSeason {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'seasonNumber') int get seasonNumber;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'overview') String? get overview;@JsonKey(name: 'episodeCount') int get episodeCount;@JsonKey(name: 'airDate') String? get airDate;@JsonKey(name: 'posterPath') String? get posterPath;
/// Create a copy of SeerSeason
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerSeasonCopyWith<SeerSeason> get copyWith => _$SeerSeasonCopyWithImpl<SeerSeason>(this as SeerSeason, _$identity);

  /// Serializes this SeerSeason to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerSeason&&(identical(other.id, id) || other.id == id)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,seasonNumber,name,overview,episodeCount,airDate,posterPath);

@override
String toString() {
  return 'SeerSeason(id: $id, seasonNumber: $seasonNumber, name: $name, overview: $overview, episodeCount: $episodeCount, airDate: $airDate, posterPath: $posterPath)';
}


}

/// @nodoc
abstract mixin class $SeerSeasonCopyWith<$Res>  {
  factory $SeerSeasonCopyWith(SeerSeason value, $Res Function(SeerSeason) _then) = _$SeerSeasonCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'seasonNumber') int seasonNumber,@JsonKey(name: 'name') String? name,@JsonKey(name: 'overview') String? overview,@JsonKey(name: 'episodeCount') int episodeCount,@JsonKey(name: 'airDate') String? airDate,@JsonKey(name: 'posterPath') String? posterPath
});




}
/// @nodoc
class _$SeerSeasonCopyWithImpl<$Res>
    implements $SeerSeasonCopyWith<$Res> {
  _$SeerSeasonCopyWithImpl(this._self, this._then);

  final SeerSeason _self;
  final $Res Function(SeerSeason) _then;

/// Create a copy of SeerSeason
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? seasonNumber = null,Object? name = freezed,Object? overview = freezed,Object? episodeCount = null,Object? airDate = freezed,Object? posterPath = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,seasonNumber: null == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,episodeCount: null == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerSeason].
extension SeerSeasonPatterns on SeerSeason {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerSeason value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerSeason() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerSeason value)  $default,){
final _that = this;
switch (_that) {
case _SeerSeason():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerSeason value)?  $default,){
final _that = this;
switch (_that) {
case _SeerSeason() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'seasonNumber')  int seasonNumber, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'overview')  String? overview, @JsonKey(name: 'episodeCount')  int episodeCount, @JsonKey(name: 'airDate')  String? airDate, @JsonKey(name: 'posterPath')  String? posterPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerSeason() when $default != null:
return $default(_that.id,_that.seasonNumber,_that.name,_that.overview,_that.episodeCount,_that.airDate,_that.posterPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'seasonNumber')  int seasonNumber, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'overview')  String? overview, @JsonKey(name: 'episodeCount')  int episodeCount, @JsonKey(name: 'airDate')  String? airDate, @JsonKey(name: 'posterPath')  String? posterPath)  $default,) {final _that = this;
switch (_that) {
case _SeerSeason():
return $default(_that.id,_that.seasonNumber,_that.name,_that.overview,_that.episodeCount,_that.airDate,_that.posterPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'seasonNumber')  int seasonNumber, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'overview')  String? overview, @JsonKey(name: 'episodeCount')  int episodeCount, @JsonKey(name: 'airDate')  String? airDate, @JsonKey(name: 'posterPath')  String? posterPath)?  $default,) {final _that = this;
switch (_that) {
case _SeerSeason() when $default != null:
return $default(_that.id,_that.seasonNumber,_that.name,_that.overview,_that.episodeCount,_that.airDate,_that.posterPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerSeason implements SeerSeason {
  const _SeerSeason({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'seasonNumber') required this.seasonNumber, @JsonKey(name: 'name') this.name, @JsonKey(name: 'overview') this.overview, @JsonKey(name: 'episodeCount') this.episodeCount = 0, @JsonKey(name: 'airDate') this.airDate, @JsonKey(name: 'posterPath') this.posterPath});
  factory _SeerSeason.fromJson(Map<String, dynamic> json) => _$SeerSeasonFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'seasonNumber') final  int seasonNumber;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'overview') final  String? overview;
@override@JsonKey(name: 'episodeCount') final  int episodeCount;
@override@JsonKey(name: 'airDate') final  String? airDate;
@override@JsonKey(name: 'posterPath') final  String? posterPath;

/// Create a copy of SeerSeason
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerSeasonCopyWith<_SeerSeason> get copyWith => __$SeerSeasonCopyWithImpl<_SeerSeason>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerSeasonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerSeason&&(identical(other.id, id) || other.id == id)&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,seasonNumber,name,overview,episodeCount,airDate,posterPath);

@override
String toString() {
  return 'SeerSeason(id: $id, seasonNumber: $seasonNumber, name: $name, overview: $overview, episodeCount: $episodeCount, airDate: $airDate, posterPath: $posterPath)';
}


}

/// @nodoc
abstract mixin class _$SeerSeasonCopyWith<$Res> implements $SeerSeasonCopyWith<$Res> {
  factory _$SeerSeasonCopyWith(_SeerSeason value, $Res Function(_SeerSeason) _then) = __$SeerSeasonCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'seasonNumber') int seasonNumber,@JsonKey(name: 'name') String? name,@JsonKey(name: 'overview') String? overview,@JsonKey(name: 'episodeCount') int episodeCount,@JsonKey(name: 'airDate') String? airDate,@JsonKey(name: 'posterPath') String? posterPath
});




}
/// @nodoc
class __$SeerSeasonCopyWithImpl<$Res>
    implements _$SeerSeasonCopyWith<$Res> {
  __$SeerSeasonCopyWithImpl(this._self, this._then);

  final _SeerSeason _self;
  final $Res Function(_SeerSeason) _then;

/// Create a copy of SeerSeason
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? seasonNumber = null,Object? name = freezed,Object? overview = freezed,Object? episodeCount = null,Object? airDate = freezed,Object? posterPath = freezed,}) {
  return _then(_SeerSeason(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,seasonNumber: null == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,episodeCount: null == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SeerMediaDetails {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'title') String? get title;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'overview') String? get overview;@JsonKey(name: 'posterPath') String? get posterPath;@JsonKey(name: 'backdropPath') String? get backdropPath;@JsonKey(name: 'numberOfSeasons') int? get numberOfSeasons;@JsonKey(name: 'numberOfEpisodes') int? get numberOfEpisodes;@JsonKey(name: 'seasons') List<SeerSeason>? get seasons;@JsonKey(name: 'status') String? get status;@JsonKey(name: 'voteAverage') double? get voteAverage;@JsonKey(name: 'mediaInfo') SeerMediaInfo? get mediaInfo;@JsonKey(name: 'tagline') String? get tagline;@JsonKey(name: 'runtime') int? get runtime;@JsonKey(name: 'originalLanguage') String? get originalLanguage;@JsonKey(name: 'genres') List<SeerGenre>? get genres;@JsonKey(name: 'releaseDate') String? get releaseDate;@JsonKey(name: 'firstAirDate') String? get firstAirDate;
/// Create a copy of SeerMediaDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerMediaDetailsCopyWith<SeerMediaDetails> get copyWith => _$SeerMediaDetailsCopyWithImpl<SeerMediaDetails>(this as SeerMediaDetails, _$identity);

  /// Serializes this SeerMediaDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerMediaDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.numberOfSeasons, numberOfSeasons) || other.numberOfSeasons == numberOfSeasons)&&(identical(other.numberOfEpisodes, numberOfEpisodes) || other.numberOfEpisodes == numberOfEpisodes)&&const DeepCollectionEquality().equals(other.seasons, seasons)&&(identical(other.status, status) || other.status == status)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.mediaInfo, mediaInfo) || other.mediaInfo == mediaInfo)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,name,overview,posterPath,backdropPath,numberOfSeasons,numberOfEpisodes,const DeepCollectionEquality().hash(seasons),status,voteAverage,mediaInfo,tagline,runtime,originalLanguage,const DeepCollectionEquality().hash(genres),releaseDate,firstAirDate);

@override
String toString() {
  return 'SeerMediaDetails(id: $id, title: $title, name: $name, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, numberOfSeasons: $numberOfSeasons, numberOfEpisodes: $numberOfEpisodes, seasons: $seasons, status: $status, voteAverage: $voteAverage, mediaInfo: $mediaInfo, tagline: $tagline, runtime: $runtime, originalLanguage: $originalLanguage, genres: $genres, releaseDate: $releaseDate, firstAirDate: $firstAirDate)';
}


}

/// @nodoc
abstract mixin class $SeerMediaDetailsCopyWith<$Res>  {
  factory $SeerMediaDetailsCopyWith(SeerMediaDetails value, $Res Function(SeerMediaDetails) _then) = _$SeerMediaDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'title') String? title,@JsonKey(name: 'name') String? name,@JsonKey(name: 'overview') String? overview,@JsonKey(name: 'posterPath') String? posterPath,@JsonKey(name: 'backdropPath') String? backdropPath,@JsonKey(name: 'numberOfSeasons') int? numberOfSeasons,@JsonKey(name: 'numberOfEpisodes') int? numberOfEpisodes,@JsonKey(name: 'seasons') List<SeerSeason>? seasons,@JsonKey(name: 'status') String? status,@JsonKey(name: 'voteAverage') double? voteAverage,@JsonKey(name: 'mediaInfo') SeerMediaInfo? mediaInfo,@JsonKey(name: 'tagline') String? tagline,@JsonKey(name: 'runtime') int? runtime,@JsonKey(name: 'originalLanguage') String? originalLanguage,@JsonKey(name: 'genres') List<SeerGenre>? genres,@JsonKey(name: 'releaseDate') String? releaseDate,@JsonKey(name: 'firstAirDate') String? firstAirDate
});


$SeerMediaInfoCopyWith<$Res>? get mediaInfo;

}
/// @nodoc
class _$SeerMediaDetailsCopyWithImpl<$Res>
    implements $SeerMediaDetailsCopyWith<$Res> {
  _$SeerMediaDetailsCopyWithImpl(this._self, this._then);

  final SeerMediaDetails _self;
  final $Res Function(SeerMediaDetails) _then;

/// Create a copy of SeerMediaDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = freezed,Object? name = freezed,Object? overview = freezed,Object? posterPath = freezed,Object? backdropPath = freezed,Object? numberOfSeasons = freezed,Object? numberOfEpisodes = freezed,Object? seasons = freezed,Object? status = freezed,Object? voteAverage = freezed,Object? mediaInfo = freezed,Object? tagline = freezed,Object? runtime = freezed,Object? originalLanguage = freezed,Object? genres = freezed,Object? releaseDate = freezed,Object? firstAirDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,numberOfSeasons: freezed == numberOfSeasons ? _self.numberOfSeasons : numberOfSeasons // ignore: cast_nullable_to_non_nullable
as int?,numberOfEpisodes: freezed == numberOfEpisodes ? _self.numberOfEpisodes : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
as int?,seasons: freezed == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeerSeason>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,mediaInfo: freezed == mediaInfo ? _self.mediaInfo : mediaInfo // ignore: cast_nullable_to_non_nullable
as SeerMediaInfo?,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,originalLanguage: freezed == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<SeerGenre>?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SeerMediaDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeerMediaInfoCopyWith<$Res>? get mediaInfo {
    if (_self.mediaInfo == null) {
    return null;
  }

  return $SeerMediaInfoCopyWith<$Res>(_self.mediaInfo!, (value) {
    return _then(_self.copyWith(mediaInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [SeerMediaDetails].
extension SeerMediaDetailsPatterns on SeerMediaDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerMediaDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerMediaDetails() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerMediaDetails value)  $default,){
final _that = this;
switch (_that) {
case _SeerMediaDetails():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerMediaDetails value)?  $default,){
final _that = this;
switch (_that) {
case _SeerMediaDetails() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'title')  String? title, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'overview')  String? overview, @JsonKey(name: 'posterPath')  String? posterPath, @JsonKey(name: 'backdropPath')  String? backdropPath, @JsonKey(name: 'numberOfSeasons')  int? numberOfSeasons, @JsonKey(name: 'numberOfEpisodes')  int? numberOfEpisodes, @JsonKey(name: 'seasons')  List<SeerSeason>? seasons, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'voteAverage')  double? voteAverage, @JsonKey(name: 'mediaInfo')  SeerMediaInfo? mediaInfo, @JsonKey(name: 'tagline')  String? tagline, @JsonKey(name: 'runtime')  int? runtime, @JsonKey(name: 'originalLanguage')  String? originalLanguage, @JsonKey(name: 'genres')  List<SeerGenre>? genres, @JsonKey(name: 'releaseDate')  String? releaseDate, @JsonKey(name: 'firstAirDate')  String? firstAirDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerMediaDetails() when $default != null:
return $default(_that.id,_that.title,_that.name,_that.overview,_that.posterPath,_that.backdropPath,_that.numberOfSeasons,_that.numberOfEpisodes,_that.seasons,_that.status,_that.voteAverage,_that.mediaInfo,_that.tagline,_that.runtime,_that.originalLanguage,_that.genres,_that.releaseDate,_that.firstAirDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'title')  String? title, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'overview')  String? overview, @JsonKey(name: 'posterPath')  String? posterPath, @JsonKey(name: 'backdropPath')  String? backdropPath, @JsonKey(name: 'numberOfSeasons')  int? numberOfSeasons, @JsonKey(name: 'numberOfEpisodes')  int? numberOfEpisodes, @JsonKey(name: 'seasons')  List<SeerSeason>? seasons, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'voteAverage')  double? voteAverage, @JsonKey(name: 'mediaInfo')  SeerMediaInfo? mediaInfo, @JsonKey(name: 'tagline')  String? tagline, @JsonKey(name: 'runtime')  int? runtime, @JsonKey(name: 'originalLanguage')  String? originalLanguage, @JsonKey(name: 'genres')  List<SeerGenre>? genres, @JsonKey(name: 'releaseDate')  String? releaseDate, @JsonKey(name: 'firstAirDate')  String? firstAirDate)  $default,) {final _that = this;
switch (_that) {
case _SeerMediaDetails():
return $default(_that.id,_that.title,_that.name,_that.overview,_that.posterPath,_that.backdropPath,_that.numberOfSeasons,_that.numberOfEpisodes,_that.seasons,_that.status,_that.voteAverage,_that.mediaInfo,_that.tagline,_that.runtime,_that.originalLanguage,_that.genres,_that.releaseDate,_that.firstAirDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'title')  String? title, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'overview')  String? overview, @JsonKey(name: 'posterPath')  String? posterPath, @JsonKey(name: 'backdropPath')  String? backdropPath, @JsonKey(name: 'numberOfSeasons')  int? numberOfSeasons, @JsonKey(name: 'numberOfEpisodes')  int? numberOfEpisodes, @JsonKey(name: 'seasons')  List<SeerSeason>? seasons, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'voteAverage')  double? voteAverage, @JsonKey(name: 'mediaInfo')  SeerMediaInfo? mediaInfo, @JsonKey(name: 'tagline')  String? tagline, @JsonKey(name: 'runtime')  int? runtime, @JsonKey(name: 'originalLanguage')  String? originalLanguage, @JsonKey(name: 'genres')  List<SeerGenre>? genres, @JsonKey(name: 'releaseDate')  String? releaseDate, @JsonKey(name: 'firstAirDate')  String? firstAirDate)?  $default,) {final _that = this;
switch (_that) {
case _SeerMediaDetails() when $default != null:
return $default(_that.id,_that.title,_that.name,_that.overview,_that.posterPath,_that.backdropPath,_that.numberOfSeasons,_that.numberOfEpisodes,_that.seasons,_that.status,_that.voteAverage,_that.mediaInfo,_that.tagline,_that.runtime,_that.originalLanguage,_that.genres,_that.releaseDate,_that.firstAirDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerMediaDetails extends SeerMediaDetails {
  const _SeerMediaDetails({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'title') this.title, @JsonKey(name: 'name') this.name, @JsonKey(name: 'overview') this.overview, @JsonKey(name: 'posterPath') this.posterPath, @JsonKey(name: 'backdropPath') this.backdropPath, @JsonKey(name: 'numberOfSeasons') this.numberOfSeasons, @JsonKey(name: 'numberOfEpisodes') this.numberOfEpisodes, @JsonKey(name: 'seasons') final  List<SeerSeason>? seasons, @JsonKey(name: 'status') this.status, @JsonKey(name: 'voteAverage') this.voteAverage, @JsonKey(name: 'mediaInfo') this.mediaInfo, @JsonKey(name: 'tagline') this.tagline, @JsonKey(name: 'runtime') this.runtime, @JsonKey(name: 'originalLanguage') this.originalLanguage, @JsonKey(name: 'genres') final  List<SeerGenre>? genres, @JsonKey(name: 'releaseDate') this.releaseDate, @JsonKey(name: 'firstAirDate') this.firstAirDate}): _seasons = seasons,_genres = genres,super._();
  factory _SeerMediaDetails.fromJson(Map<String, dynamic> json) => _$SeerMediaDetailsFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'title') final  String? title;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'overview') final  String? overview;
@override@JsonKey(name: 'posterPath') final  String? posterPath;
@override@JsonKey(name: 'backdropPath') final  String? backdropPath;
@override@JsonKey(name: 'numberOfSeasons') final  int? numberOfSeasons;
@override@JsonKey(name: 'numberOfEpisodes') final  int? numberOfEpisodes;
 final  List<SeerSeason>? _seasons;
@override@JsonKey(name: 'seasons') List<SeerSeason>? get seasons {
  final value = _seasons;
  if (value == null) return null;
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'status') final  String? status;
@override@JsonKey(name: 'voteAverage') final  double? voteAverage;
@override@JsonKey(name: 'mediaInfo') final  SeerMediaInfo? mediaInfo;
@override@JsonKey(name: 'tagline') final  String? tagline;
@override@JsonKey(name: 'runtime') final  int? runtime;
@override@JsonKey(name: 'originalLanguage') final  String? originalLanguage;
 final  List<SeerGenre>? _genres;
@override@JsonKey(name: 'genres') List<SeerGenre>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'releaseDate') final  String? releaseDate;
@override@JsonKey(name: 'firstAirDate') final  String? firstAirDate;

/// Create a copy of SeerMediaDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerMediaDetailsCopyWith<_SeerMediaDetails> get copyWith => __$SeerMediaDetailsCopyWithImpl<_SeerMediaDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerMediaDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerMediaDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.name, name) || other.name == name)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.numberOfSeasons, numberOfSeasons) || other.numberOfSeasons == numberOfSeasons)&&(identical(other.numberOfEpisodes, numberOfEpisodes) || other.numberOfEpisodes == numberOfEpisodes)&&const DeepCollectionEquality().equals(other._seasons, _seasons)&&(identical(other.status, status) || other.status == status)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.mediaInfo, mediaInfo) || other.mediaInfo == mediaInfo)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,name,overview,posterPath,backdropPath,numberOfSeasons,numberOfEpisodes,const DeepCollectionEquality().hash(_seasons),status,voteAverage,mediaInfo,tagline,runtime,originalLanguage,const DeepCollectionEquality().hash(_genres),releaseDate,firstAirDate);

@override
String toString() {
  return 'SeerMediaDetails(id: $id, title: $title, name: $name, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, numberOfSeasons: $numberOfSeasons, numberOfEpisodes: $numberOfEpisodes, seasons: $seasons, status: $status, voteAverage: $voteAverage, mediaInfo: $mediaInfo, tagline: $tagline, runtime: $runtime, originalLanguage: $originalLanguage, genres: $genres, releaseDate: $releaseDate, firstAirDate: $firstAirDate)';
}


}

/// @nodoc
abstract mixin class _$SeerMediaDetailsCopyWith<$Res> implements $SeerMediaDetailsCopyWith<$Res> {
  factory _$SeerMediaDetailsCopyWith(_SeerMediaDetails value, $Res Function(_SeerMediaDetails) _then) = __$SeerMediaDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'title') String? title,@JsonKey(name: 'name') String? name,@JsonKey(name: 'overview') String? overview,@JsonKey(name: 'posterPath') String? posterPath,@JsonKey(name: 'backdropPath') String? backdropPath,@JsonKey(name: 'numberOfSeasons') int? numberOfSeasons,@JsonKey(name: 'numberOfEpisodes') int? numberOfEpisodes,@JsonKey(name: 'seasons') List<SeerSeason>? seasons,@JsonKey(name: 'status') String? status,@JsonKey(name: 'voteAverage') double? voteAverage,@JsonKey(name: 'mediaInfo') SeerMediaInfo? mediaInfo,@JsonKey(name: 'tagline') String? tagline,@JsonKey(name: 'runtime') int? runtime,@JsonKey(name: 'originalLanguage') String? originalLanguage,@JsonKey(name: 'genres') List<SeerGenre>? genres,@JsonKey(name: 'releaseDate') String? releaseDate,@JsonKey(name: 'firstAirDate') String? firstAirDate
});


@override $SeerMediaInfoCopyWith<$Res>? get mediaInfo;

}
/// @nodoc
class __$SeerMediaDetailsCopyWithImpl<$Res>
    implements _$SeerMediaDetailsCopyWith<$Res> {
  __$SeerMediaDetailsCopyWithImpl(this._self, this._then);

  final _SeerMediaDetails _self;
  final $Res Function(_SeerMediaDetails) _then;

/// Create a copy of SeerMediaDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = freezed,Object? name = freezed,Object? overview = freezed,Object? posterPath = freezed,Object? backdropPath = freezed,Object? numberOfSeasons = freezed,Object? numberOfEpisodes = freezed,Object? seasons = freezed,Object? status = freezed,Object? voteAverage = freezed,Object? mediaInfo = freezed,Object? tagline = freezed,Object? runtime = freezed,Object? originalLanguage = freezed,Object? genres = freezed,Object? releaseDate = freezed,Object? firstAirDate = freezed,}) {
  return _then(_SeerMediaDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,numberOfSeasons: freezed == numberOfSeasons ? _self.numberOfSeasons : numberOfSeasons // ignore: cast_nullable_to_non_nullable
as int?,numberOfEpisodes: freezed == numberOfEpisodes ? _self.numberOfEpisodes : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
as int?,seasons: freezed == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeerSeason>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,mediaInfo: freezed == mediaInfo ? _self.mediaInfo : mediaInfo // ignore: cast_nullable_to_non_nullable
as SeerMediaInfo?,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,originalLanguage: freezed == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<SeerGenre>?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SeerMediaDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeerMediaInfoCopyWith<$Res>? get mediaInfo {
    if (_self.mediaInfo == null) {
    return null;
  }

  return $SeerMediaInfoCopyWith<$Res>(_self.mediaInfo!, (value) {
    return _then(_self.copyWith(mediaInfo: value));
  });
}
}


/// @nodoc
mixin _$SeerGenre {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String? get name;
/// Create a copy of SeerGenre
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerGenreCopyWith<SeerGenre> get copyWith => _$SeerGenreCopyWithImpl<SeerGenre>(this as SeerGenre, _$identity);

  /// Serializes this SeerGenre to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerGenre&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SeerGenre(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SeerGenreCopyWith<$Res>  {
  factory $SeerGenreCopyWith(SeerGenre value, $Res Function(SeerGenre) _then) = _$SeerGenreCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String? name
});




}
/// @nodoc
class _$SeerGenreCopyWithImpl<$Res>
    implements $SeerGenreCopyWith<$Res> {
  _$SeerGenreCopyWithImpl(this._self, this._then);

  final SeerGenre _self;
  final $Res Function(SeerGenre) _then;

/// Create a copy of SeerGenre
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerGenre].
extension SeerGenrePatterns on SeerGenre {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerGenre value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerGenre() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerGenre value)  $default,){
final _that = this;
switch (_that) {
case _SeerGenre():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerGenre value)?  $default,){
final _that = this;
switch (_that) {
case _SeerGenre() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerGenre() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String? name)  $default,) {final _that = this;
switch (_that) {
case _SeerGenre():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String? name)?  $default,) {final _that = this;
switch (_that) {
case _SeerGenre() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerGenre implements SeerGenre {
  const _SeerGenre({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') this.name});
  factory _SeerGenre.fromJson(Map<String, dynamic> json) => _$SeerGenreFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String? name;

/// Create a copy of SeerGenre
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerGenreCopyWith<_SeerGenre> get copyWith => __$SeerGenreCopyWithImpl<_SeerGenre>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerGenreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerGenre&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SeerGenre(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SeerGenreCopyWith<$Res> implements $SeerGenreCopyWith<$Res> {
  factory _$SeerGenreCopyWith(_SeerGenre value, $Res Function(_SeerGenre) _then) = __$SeerGenreCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String? name
});




}
/// @nodoc
class __$SeerGenreCopyWithImpl<$Res>
    implements _$SeerGenreCopyWith<$Res> {
  __$SeerGenreCopyWithImpl(this._self, this._then);

  final _SeerGenre _self;
  final $Res Function(_SeerGenre) _then;

/// Create a copy of SeerGenre
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,}) {
  return _then(_SeerGenre(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SeerTrendingResponse {

@JsonKey(name: 'page') int get page;@JsonKey(name: 'totalPages') int get totalPages;@JsonKey(name: 'totalResults') int get totalResults;@JsonKey(name: 'results') List<SeerSearchResultItem> get results;
/// Create a copy of SeerTrendingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerTrendingResponseCopyWith<SeerTrendingResponse> get copyWith => _$SeerTrendingResponseCopyWithImpl<SeerTrendingResponse>(this as SeerTrendingResponse, _$identity);

  /// Serializes this SeerTrendingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerTrendingResponse&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalPages,totalResults,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'SeerTrendingResponse(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
}


}

/// @nodoc
abstract mixin class $SeerTrendingResponseCopyWith<$Res>  {
  factory $SeerTrendingResponseCopyWith(SeerTrendingResponse value, $Res Function(SeerTrendingResponse) _then) = _$SeerTrendingResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'page') int page,@JsonKey(name: 'totalPages') int totalPages,@JsonKey(name: 'totalResults') int totalResults,@JsonKey(name: 'results') List<SeerSearchResultItem> results
});




}
/// @nodoc
class _$SeerTrendingResponseCopyWithImpl<$Res>
    implements $SeerTrendingResponseCopyWith<$Res> {
  _$SeerTrendingResponseCopyWithImpl(this._self, this._then);

  final SeerTrendingResponse _self;
  final $Res Function(SeerTrendingResponse) _then;

/// Create a copy of SeerTrendingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? totalPages = null,Object? totalResults = null,Object? results = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SeerSearchResultItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerTrendingResponse].
extension SeerTrendingResponsePatterns on SeerTrendingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerTrendingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerTrendingResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerTrendingResponse value)  $default,){
final _that = this;
switch (_that) {
case _SeerTrendingResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerTrendingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SeerTrendingResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'page')  int page, @JsonKey(name: 'totalPages')  int totalPages, @JsonKey(name: 'totalResults')  int totalResults, @JsonKey(name: 'results')  List<SeerSearchResultItem> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerTrendingResponse() when $default != null:
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'page')  int page, @JsonKey(name: 'totalPages')  int totalPages, @JsonKey(name: 'totalResults')  int totalResults, @JsonKey(name: 'results')  List<SeerSearchResultItem> results)  $default,) {final _that = this;
switch (_that) {
case _SeerTrendingResponse():
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'page')  int page, @JsonKey(name: 'totalPages')  int totalPages, @JsonKey(name: 'totalResults')  int totalResults, @JsonKey(name: 'results')  List<SeerSearchResultItem> results)?  $default,) {final _that = this;
switch (_that) {
case _SeerTrendingResponse() when $default != null:
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerTrendingResponse implements SeerTrendingResponse {
  const _SeerTrendingResponse({@JsonKey(name: 'page') this.page = 1, @JsonKey(name: 'totalPages') this.totalPages = 1, @JsonKey(name: 'totalResults') this.totalResults = 0, @JsonKey(name: 'results') final  List<SeerSearchResultItem> results = const []}): _results = results;
  factory _SeerTrendingResponse.fromJson(Map<String, dynamic> json) => _$SeerTrendingResponseFromJson(json);

@override@JsonKey(name: 'page') final  int page;
@override@JsonKey(name: 'totalPages') final  int totalPages;
@override@JsonKey(name: 'totalResults') final  int totalResults;
 final  List<SeerSearchResultItem> _results;
@override@JsonKey(name: 'results') List<SeerSearchResultItem> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of SeerTrendingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerTrendingResponseCopyWith<_SeerTrendingResponse> get copyWith => __$SeerTrendingResponseCopyWithImpl<_SeerTrendingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerTrendingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerTrendingResponse&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalPages,totalResults,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'SeerTrendingResponse(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
}


}

/// @nodoc
abstract mixin class _$SeerTrendingResponseCopyWith<$Res> implements $SeerTrendingResponseCopyWith<$Res> {
  factory _$SeerTrendingResponseCopyWith(_SeerTrendingResponse value, $Res Function(_SeerTrendingResponse) _then) = __$SeerTrendingResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'page') int page,@JsonKey(name: 'totalPages') int totalPages,@JsonKey(name: 'totalResults') int totalResults,@JsonKey(name: 'results') List<SeerSearchResultItem> results
});




}
/// @nodoc
class __$SeerTrendingResponseCopyWithImpl<$Res>
    implements _$SeerTrendingResponseCopyWith<$Res> {
  __$SeerTrendingResponseCopyWithImpl(this._self, this._then);

  final _SeerTrendingResponse _self;
  final $Res Function(_SeerTrendingResponse) _then;

/// Create a copy of SeerTrendingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? totalPages = null,Object? totalResults = null,Object? results = null,}) {
  return _then(_SeerTrendingResponse(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SeerSearchResultItem>,
  ));
}


}


/// @nodoc
mixin _$SeerServiceSettings {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'is4k') bool get is4k;@JsonKey(name: 'isDefault') bool get isDefault;
/// Create a copy of SeerServiceSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerServiceSettingsCopyWith<SeerServiceSettings> get copyWith => _$SeerServiceSettingsCopyWithImpl<SeerServiceSettings>(this as SeerServiceSettings, _$identity);

  /// Serializes this SeerServiceSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerServiceSettings&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.is4k, is4k) || other.is4k == is4k)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,is4k,isDefault);

@override
String toString() {
  return 'SeerServiceSettings(id: $id, name: $name, is4k: $is4k, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $SeerServiceSettingsCopyWith<$Res>  {
  factory $SeerServiceSettingsCopyWith(SeerServiceSettings value, $Res Function(SeerServiceSettings) _then) = _$SeerServiceSettingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'is4k') bool is4k,@JsonKey(name: 'isDefault') bool isDefault
});




}
/// @nodoc
class _$SeerServiceSettingsCopyWithImpl<$Res>
    implements $SeerServiceSettingsCopyWith<$Res> {
  _$SeerServiceSettingsCopyWithImpl(this._self, this._then);

  final SeerServiceSettings _self;
  final $Res Function(SeerServiceSettings) _then;

/// Create a copy of SeerServiceSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? is4k = null,Object? isDefault = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,is4k: null == is4k ? _self.is4k : is4k // ignore: cast_nullable_to_non_nullable
as bool,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerServiceSettings].
extension SeerServiceSettingsPatterns on SeerServiceSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerServiceSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerServiceSettings() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerServiceSettings value)  $default,){
final _that = this;
switch (_that) {
case _SeerServiceSettings():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerServiceSettings value)?  $default,){
final _that = this;
switch (_that) {
case _SeerServiceSettings() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'is4k')  bool is4k, @JsonKey(name: 'isDefault')  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerServiceSettings() when $default != null:
return $default(_that.id,_that.name,_that.is4k,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'is4k')  bool is4k, @JsonKey(name: 'isDefault')  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _SeerServiceSettings():
return $default(_that.id,_that.name,_that.is4k,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'is4k')  bool is4k, @JsonKey(name: 'isDefault')  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _SeerServiceSettings() when $default != null:
return $default(_that.id,_that.name,_that.is4k,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerServiceSettings implements SeerServiceSettings {
  const _SeerServiceSettings({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'is4k') this.is4k = false, @JsonKey(name: 'isDefault') this.isDefault = false});
  factory _SeerServiceSettings.fromJson(Map<String, dynamic> json) => _$SeerServiceSettingsFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'is4k') final  bool is4k;
@override@JsonKey(name: 'isDefault') final  bool isDefault;

/// Create a copy of SeerServiceSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerServiceSettingsCopyWith<_SeerServiceSettings> get copyWith => __$SeerServiceSettingsCopyWithImpl<_SeerServiceSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerServiceSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerServiceSettings&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.is4k, is4k) || other.is4k == is4k)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,is4k,isDefault);

@override
String toString() {
  return 'SeerServiceSettings(id: $id, name: $name, is4k: $is4k, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$SeerServiceSettingsCopyWith<$Res> implements $SeerServiceSettingsCopyWith<$Res> {
  factory _$SeerServiceSettingsCopyWith(_SeerServiceSettings value, $Res Function(_SeerServiceSettings) _then) = __$SeerServiceSettingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'is4k') bool is4k,@JsonKey(name: 'isDefault') bool isDefault
});




}
/// @nodoc
class __$SeerServiceSettingsCopyWithImpl<$Res>
    implements _$SeerServiceSettingsCopyWith<$Res> {
  __$SeerServiceSettingsCopyWithImpl(this._self, this._then);

  final _SeerServiceSettings _self;
  final $Res Function(_SeerServiceSettings) _then;

/// Create a copy of SeerServiceSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? is4k = null,Object? isDefault = null,}) {
  return _then(_SeerServiceSettings(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,is4k: null == is4k ? _self.is4k : is4k // ignore: cast_nullable_to_non_nullable
as bool,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SeerCreateRequestBody {

@JsonKey(name: 'mediaType') String get mediaType;@JsonKey(name: 'mediaId') int get mediaId;@JsonKey(name: 'seasons') List<int>? get seasons;@JsonKey(name: 'is4k') bool get is4k;@JsonKey(name: 'serverId') int? get serverId;@JsonKey(name: 'profileId') int? get profileId;@JsonKey(name: 'rootFolder') String? get rootFolder;
/// Create a copy of SeerCreateRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerCreateRequestBodyCopyWith<SeerCreateRequestBody> get copyWith => _$SeerCreateRequestBodyCopyWithImpl<SeerCreateRequestBody>(this as SeerCreateRequestBody, _$identity);

  /// Serializes this SeerCreateRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerCreateRequestBody&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&const DeepCollectionEquality().equals(other.seasons, seasons)&&(identical(other.is4k, is4k) || other.is4k == is4k)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.rootFolder, rootFolder) || other.rootFolder == rootFolder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mediaType,mediaId,const DeepCollectionEquality().hash(seasons),is4k,serverId,profileId,rootFolder);

@override
String toString() {
  return 'SeerCreateRequestBody(mediaType: $mediaType, mediaId: $mediaId, seasons: $seasons, is4k: $is4k, serverId: $serverId, profileId: $profileId, rootFolder: $rootFolder)';
}


}

/// @nodoc
abstract mixin class $SeerCreateRequestBodyCopyWith<$Res>  {
  factory $SeerCreateRequestBodyCopyWith(SeerCreateRequestBody value, $Res Function(SeerCreateRequestBody) _then) = _$SeerCreateRequestBodyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'mediaType') String mediaType,@JsonKey(name: 'mediaId') int mediaId,@JsonKey(name: 'seasons') List<int>? seasons,@JsonKey(name: 'is4k') bool is4k,@JsonKey(name: 'serverId') int? serverId,@JsonKey(name: 'profileId') int? profileId,@JsonKey(name: 'rootFolder') String? rootFolder
});




}
/// @nodoc
class _$SeerCreateRequestBodyCopyWithImpl<$Res>
    implements $SeerCreateRequestBodyCopyWith<$Res> {
  _$SeerCreateRequestBodyCopyWithImpl(this._self, this._then);

  final SeerCreateRequestBody _self;
  final $Res Function(SeerCreateRequestBody) _then;

/// Create a copy of SeerCreateRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mediaType = null,Object? mediaId = null,Object? seasons = freezed,Object? is4k = null,Object? serverId = freezed,Object? profileId = freezed,Object? rootFolder = freezed,}) {
  return _then(_self.copyWith(
mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mediaId: null == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as int,seasons: freezed == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<int>?,is4k: null == is4k ? _self.is4k : is4k // ignore: cast_nullable_to_non_nullable
as bool,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,profileId: freezed == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as int?,rootFolder: freezed == rootFolder ? _self.rootFolder : rootFolder // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerCreateRequestBody].
extension SeerCreateRequestBodyPatterns on SeerCreateRequestBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerCreateRequestBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerCreateRequestBody() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerCreateRequestBody value)  $default,){
final _that = this;
switch (_that) {
case _SeerCreateRequestBody():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerCreateRequestBody value)?  $default,){
final _that = this;
switch (_that) {
case _SeerCreateRequestBody() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'mediaType')  String mediaType, @JsonKey(name: 'mediaId')  int mediaId, @JsonKey(name: 'seasons')  List<int>? seasons, @JsonKey(name: 'is4k')  bool is4k, @JsonKey(name: 'serverId')  int? serverId, @JsonKey(name: 'profileId')  int? profileId, @JsonKey(name: 'rootFolder')  String? rootFolder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerCreateRequestBody() when $default != null:
return $default(_that.mediaType,_that.mediaId,_that.seasons,_that.is4k,_that.serverId,_that.profileId,_that.rootFolder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'mediaType')  String mediaType, @JsonKey(name: 'mediaId')  int mediaId, @JsonKey(name: 'seasons')  List<int>? seasons, @JsonKey(name: 'is4k')  bool is4k, @JsonKey(name: 'serverId')  int? serverId, @JsonKey(name: 'profileId')  int? profileId, @JsonKey(name: 'rootFolder')  String? rootFolder)  $default,) {final _that = this;
switch (_that) {
case _SeerCreateRequestBody():
return $default(_that.mediaType,_that.mediaId,_that.seasons,_that.is4k,_that.serverId,_that.profileId,_that.rootFolder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'mediaType')  String mediaType, @JsonKey(name: 'mediaId')  int mediaId, @JsonKey(name: 'seasons')  List<int>? seasons, @JsonKey(name: 'is4k')  bool is4k, @JsonKey(name: 'serverId')  int? serverId, @JsonKey(name: 'profileId')  int? profileId, @JsonKey(name: 'rootFolder')  String? rootFolder)?  $default,) {final _that = this;
switch (_that) {
case _SeerCreateRequestBody() when $default != null:
return $default(_that.mediaType,_that.mediaId,_that.seasons,_that.is4k,_that.serverId,_that.profileId,_that.rootFolder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerCreateRequestBody implements SeerCreateRequestBody {
  const _SeerCreateRequestBody({@JsonKey(name: 'mediaType') required this.mediaType, @JsonKey(name: 'mediaId') required this.mediaId, @JsonKey(name: 'seasons') final  List<int>? seasons, @JsonKey(name: 'is4k') this.is4k = false, @JsonKey(name: 'serverId') this.serverId, @JsonKey(name: 'profileId') this.profileId, @JsonKey(name: 'rootFolder') this.rootFolder}): _seasons = seasons;
  factory _SeerCreateRequestBody.fromJson(Map<String, dynamic> json) => _$SeerCreateRequestBodyFromJson(json);

@override@JsonKey(name: 'mediaType') final  String mediaType;
@override@JsonKey(name: 'mediaId') final  int mediaId;
 final  List<int>? _seasons;
@override@JsonKey(name: 'seasons') List<int>? get seasons {
  final value = _seasons;
  if (value == null) return null;
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'is4k') final  bool is4k;
@override@JsonKey(name: 'serverId') final  int? serverId;
@override@JsonKey(name: 'profileId') final  int? profileId;
@override@JsonKey(name: 'rootFolder') final  String? rootFolder;

/// Create a copy of SeerCreateRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerCreateRequestBodyCopyWith<_SeerCreateRequestBody> get copyWith => __$SeerCreateRequestBodyCopyWithImpl<_SeerCreateRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerCreateRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerCreateRequestBody&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&const DeepCollectionEquality().equals(other._seasons, _seasons)&&(identical(other.is4k, is4k) || other.is4k == is4k)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.rootFolder, rootFolder) || other.rootFolder == rootFolder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mediaType,mediaId,const DeepCollectionEquality().hash(_seasons),is4k,serverId,profileId,rootFolder);

@override
String toString() {
  return 'SeerCreateRequestBody(mediaType: $mediaType, mediaId: $mediaId, seasons: $seasons, is4k: $is4k, serverId: $serverId, profileId: $profileId, rootFolder: $rootFolder)';
}


}

/// @nodoc
abstract mixin class _$SeerCreateRequestBodyCopyWith<$Res> implements $SeerCreateRequestBodyCopyWith<$Res> {
  factory _$SeerCreateRequestBodyCopyWith(_SeerCreateRequestBody value, $Res Function(_SeerCreateRequestBody) _then) = __$SeerCreateRequestBodyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'mediaType') String mediaType,@JsonKey(name: 'mediaId') int mediaId,@JsonKey(name: 'seasons') List<int>? seasons,@JsonKey(name: 'is4k') bool is4k,@JsonKey(name: 'serverId') int? serverId,@JsonKey(name: 'profileId') int? profileId,@JsonKey(name: 'rootFolder') String? rootFolder
});




}
/// @nodoc
class __$SeerCreateRequestBodyCopyWithImpl<$Res>
    implements _$SeerCreateRequestBodyCopyWith<$Res> {
  __$SeerCreateRequestBodyCopyWithImpl(this._self, this._then);

  final _SeerCreateRequestBody _self;
  final $Res Function(_SeerCreateRequestBody) _then;

/// Create a copy of SeerCreateRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mediaType = null,Object? mediaId = null,Object? seasons = freezed,Object? is4k = null,Object? serverId = freezed,Object? profileId = freezed,Object? rootFolder = freezed,}) {
  return _then(_SeerCreateRequestBody(
mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mediaId: null == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as int,seasons: freezed == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<int>?,is4k: null == is4k ? _self.is4k : is4k // ignore: cast_nullable_to_non_nullable
as bool,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,profileId: freezed == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as int?,rootFolder: freezed == rootFolder ? _self.rootFolder : rootFolder // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SeerLoginRequest {

@JsonKey(name: 'username') String get username;@JsonKey(name: 'password') String get password;
/// Create a copy of SeerLoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerLoginRequestCopyWith<SeerLoginRequest> get copyWith => _$SeerLoginRequestCopyWithImpl<SeerLoginRequest>(this as SeerLoginRequest, _$identity);

  /// Serializes this SeerLoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerLoginRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'SeerLoginRequest(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $SeerLoginRequestCopyWith<$Res>  {
  factory $SeerLoginRequestCopyWith(SeerLoginRequest value, $Res Function(SeerLoginRequest) _then) = _$SeerLoginRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'username') String username,@JsonKey(name: 'password') String password
});




}
/// @nodoc
class _$SeerLoginRequestCopyWithImpl<$Res>
    implements $SeerLoginRequestCopyWith<$Res> {
  _$SeerLoginRequestCopyWithImpl(this._self, this._then);

  final SeerLoginRequest _self;
  final $Res Function(SeerLoginRequest) _then;

/// Create a copy of SeerLoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerLoginRequest].
extension SeerLoginRequestPatterns on SeerLoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerLoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerLoginRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerLoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _SeerLoginRequest():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerLoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SeerLoginRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'password')  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerLoginRequest() when $default != null:
return $default(_that.username,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'password')  String password)  $default,) {final _that = this;
switch (_that) {
case _SeerLoginRequest():
return $default(_that.username,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'password')  String password)?  $default,) {final _that = this;
switch (_that) {
case _SeerLoginRequest() when $default != null:
return $default(_that.username,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerLoginRequest implements SeerLoginRequest {
  const _SeerLoginRequest({@JsonKey(name: 'username') required this.username, @JsonKey(name: 'password') required this.password});
  factory _SeerLoginRequest.fromJson(Map<String, dynamic> json) => _$SeerLoginRequestFromJson(json);

@override@JsonKey(name: 'username') final  String username;
@override@JsonKey(name: 'password') final  String password;

/// Create a copy of SeerLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerLoginRequestCopyWith<_SeerLoginRequest> get copyWith => __$SeerLoginRequestCopyWithImpl<_SeerLoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerLoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerLoginRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'SeerLoginRequest(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SeerLoginRequestCopyWith<$Res> implements $SeerLoginRequestCopyWith<$Res> {
  factory _$SeerLoginRequestCopyWith(_SeerLoginRequest value, $Res Function(_SeerLoginRequest) _then) = __$SeerLoginRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'username') String username,@JsonKey(name: 'password') String password
});




}
/// @nodoc
class __$SeerLoginRequestCopyWithImpl<$Res>
    implements _$SeerLoginRequestCopyWith<$Res> {
  __$SeerLoginRequestCopyWithImpl(this._self, this._then);

  final _SeerLoginRequest _self;
  final $Res Function(_SeerLoginRequest) _then;

/// Create a copy of SeerLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,}) {
  return _then(_SeerLoginRequest(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SeerJellyfinLoginRequest {

@JsonKey(name: 'username') String get username;@JsonKey(name: 'password') String get password;
/// Create a copy of SeerJellyfinLoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerJellyfinLoginRequestCopyWith<SeerJellyfinLoginRequest> get copyWith => _$SeerJellyfinLoginRequestCopyWithImpl<SeerJellyfinLoginRequest>(this as SeerJellyfinLoginRequest, _$identity);

  /// Serializes this SeerJellyfinLoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerJellyfinLoginRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'SeerJellyfinLoginRequest(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $SeerJellyfinLoginRequestCopyWith<$Res>  {
  factory $SeerJellyfinLoginRequestCopyWith(SeerJellyfinLoginRequest value, $Res Function(SeerJellyfinLoginRequest) _then) = _$SeerJellyfinLoginRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'username') String username,@JsonKey(name: 'password') String password
});




}
/// @nodoc
class _$SeerJellyfinLoginRequestCopyWithImpl<$Res>
    implements $SeerJellyfinLoginRequestCopyWith<$Res> {
  _$SeerJellyfinLoginRequestCopyWithImpl(this._self, this._then);

  final SeerJellyfinLoginRequest _self;
  final $Res Function(SeerJellyfinLoginRequest) _then;

/// Create a copy of SeerJellyfinLoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerJellyfinLoginRequest].
extension SeerJellyfinLoginRequestPatterns on SeerJellyfinLoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerJellyfinLoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerJellyfinLoginRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerJellyfinLoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _SeerJellyfinLoginRequest():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerJellyfinLoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SeerJellyfinLoginRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'password')  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerJellyfinLoginRequest() when $default != null:
return $default(_that.username,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'password')  String password)  $default,) {final _that = this;
switch (_that) {
case _SeerJellyfinLoginRequest():
return $default(_that.username,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'password')  String password)?  $default,) {final _that = this;
switch (_that) {
case _SeerJellyfinLoginRequest() when $default != null:
return $default(_that.username,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerJellyfinLoginRequest implements SeerJellyfinLoginRequest {
  const _SeerJellyfinLoginRequest({@JsonKey(name: 'username') required this.username, @JsonKey(name: 'password') required this.password});
  factory _SeerJellyfinLoginRequest.fromJson(Map<String, dynamic> json) => _$SeerJellyfinLoginRequestFromJson(json);

@override@JsonKey(name: 'username') final  String username;
@override@JsonKey(name: 'password') final  String password;

/// Create a copy of SeerJellyfinLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerJellyfinLoginRequestCopyWith<_SeerJellyfinLoginRequest> get copyWith => __$SeerJellyfinLoginRequestCopyWithImpl<_SeerJellyfinLoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerJellyfinLoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerJellyfinLoginRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'SeerJellyfinLoginRequest(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SeerJellyfinLoginRequestCopyWith<$Res> implements $SeerJellyfinLoginRequestCopyWith<$Res> {
  factory _$SeerJellyfinLoginRequestCopyWith(_SeerJellyfinLoginRequest value, $Res Function(_SeerJellyfinLoginRequest) _then) = __$SeerJellyfinLoginRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'username') String username,@JsonKey(name: 'password') String password
});




}
/// @nodoc
class __$SeerJellyfinLoginRequestCopyWithImpl<$Res>
    implements _$SeerJellyfinLoginRequestCopyWith<$Res> {
  __$SeerJellyfinLoginRequestCopyWithImpl(this._self, this._then);

  final _SeerJellyfinLoginRequest _self;
  final $Res Function(_SeerJellyfinLoginRequest) _then;

/// Create a copy of SeerJellyfinLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,}) {
  return _then(_SeerJellyfinLoginRequest(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
