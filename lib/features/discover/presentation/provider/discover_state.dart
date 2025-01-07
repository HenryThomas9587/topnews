import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_state.freezed.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    @Default({}) Set<String> followedPublishers,
    @Default({}) Set<String> followedAuthors,
  }) = _DiscoverState;
}
