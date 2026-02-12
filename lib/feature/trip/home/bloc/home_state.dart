import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playground_flutter_project/domain/entities/apientity/trip/trip_api_entity.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(1) int page,
    @Default([]) List<TripApiEntity> movies,
    @Default(false) bool isLastPage,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default('') String errorMessage,
  }) = _HomeState;
}
