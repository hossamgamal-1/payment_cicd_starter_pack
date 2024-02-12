// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_presentation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckoutPresentationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int activeIndex) paymentMethodChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int activeIndex)? paymentMethodChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int activeIndex)? paymentMethodChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PaymentMethodChanged value) paymentMethodChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PaymentMethodChanged value)? paymentMethodChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PaymentMethodChanged value)? paymentMethodChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutPresentationStateCopyWith<$Res> {
  factory $CheckoutPresentationStateCopyWith(CheckoutPresentationState value,
          $Res Function(CheckoutPresentationState) then) =
      _$CheckoutPresentationStateCopyWithImpl<$Res, CheckoutPresentationState>;
}

/// @nodoc
class _$CheckoutPresentationStateCopyWithImpl<$Res,
        $Val extends CheckoutPresentationState>
    implements $CheckoutPresentationStateCopyWith<$Res> {
  _$CheckoutPresentationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CheckoutPresentationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CheckoutPresentationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int activeIndex) paymentMethodChanged,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int activeIndex)? paymentMethodChanged,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int activeIndex)? paymentMethodChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PaymentMethodChanged value) paymentMethodChanged,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PaymentMethodChanged value)? paymentMethodChanged,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PaymentMethodChanged value)? paymentMethodChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CheckoutPresentationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$PaymentMethodChangedImplCopyWith<$Res> {
  factory _$$PaymentMethodChangedImplCopyWith(_$PaymentMethodChangedImpl value,
          $Res Function(_$PaymentMethodChangedImpl) then) =
      __$$PaymentMethodChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int activeIndex});
}

/// @nodoc
class __$$PaymentMethodChangedImplCopyWithImpl<$Res>
    extends _$CheckoutPresentationStateCopyWithImpl<$Res,
        _$PaymentMethodChangedImpl>
    implements _$$PaymentMethodChangedImplCopyWith<$Res> {
  __$$PaymentMethodChangedImplCopyWithImpl(_$PaymentMethodChangedImpl _value,
      $Res Function(_$PaymentMethodChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeIndex = null,
  }) {
    return _then(_$PaymentMethodChangedImpl(
      null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PaymentMethodChangedImpl implements PaymentMethodChanged {
  _$PaymentMethodChangedImpl(this.activeIndex);

  @override
  final int activeIndex;

  @override
  String toString() {
    return 'CheckoutPresentationState.paymentMethodChanged(activeIndex: $activeIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodChangedImpl &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodChangedImplCopyWith<_$PaymentMethodChangedImpl>
      get copyWith =>
          __$$PaymentMethodChangedImplCopyWithImpl<_$PaymentMethodChangedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int activeIndex) paymentMethodChanged,
  }) {
    return paymentMethodChanged(activeIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int activeIndex)? paymentMethodChanged,
  }) {
    return paymentMethodChanged?.call(activeIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int activeIndex)? paymentMethodChanged,
    required TResult orElse(),
  }) {
    if (paymentMethodChanged != null) {
      return paymentMethodChanged(activeIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PaymentMethodChanged value) paymentMethodChanged,
  }) {
    return paymentMethodChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PaymentMethodChanged value)? paymentMethodChanged,
  }) {
    return paymentMethodChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PaymentMethodChanged value)? paymentMethodChanged,
    required TResult orElse(),
  }) {
    if (paymentMethodChanged != null) {
      return paymentMethodChanged(this);
    }
    return orElse();
  }
}

abstract class PaymentMethodChanged implements CheckoutPresentationState {
  factory PaymentMethodChanged(final int activeIndex) =
      _$PaymentMethodChangedImpl;

  int get activeIndex;
  @JsonKey(ignore: true)
  _$$PaymentMethodChangedImplCopyWith<_$PaymentMethodChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
