
import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
abstract class HomeState with _$HomeState{
  const factory HomeState(
      List<StoryModel> storyModels, List<PostModel> PostModels) = HomeStateData;

  const factory HomeState.loading() = HomeStateLoading;

  const factory HomeState.error(dynamic error) = HomeStateError;
}