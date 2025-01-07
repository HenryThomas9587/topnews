import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/features/discover/data/repository/discover_repository_impl.dart';
import 'package:topnews/features/discover/domain/entity/publisher_entity.dart';

part 'publisher_provider.g.dart';

@riverpod
class PublisherNotifier extends _$PublisherNotifier {
  @override
  Future<List<PublisherEntity>> build() => _fetchPublishers();

  Future<List<PublisherEntity>> _fetchPublishers() async {
    logDebug('PublisherNotifier _fetchPublishers');
    final repository = ref.read(discoverRepositoryProvider);
    return repository.getPublishers();
  }

  Future<void> toggleFollow(String publisherId) async {
    final repository = ref.read(discoverRepositoryProvider);
    final publishers = state.valueOrNull;
    if (publishers == null) return;

    final publisherIndex = publishers.indexWhere((p) => p.id == publisherId);
    if (publisherIndex == -1) return;

    final publisher = publishers[publisherIndex];
    try {
      if (publisher.isFollowing) {
        await repository.unfollowPublisher(publisherId);
      } else {
        await repository.followPublisher(publisherId);
      }

      // 只更新被修改的发布者的状态
      final updatedPublishers = List<PublisherEntity>.from(publishers);
      updatedPublishers[publisherIndex] = publisher.copyWith(
        isFollowing: !publisher.isFollowing,
      );

      state = AsyncValue.data(updatedPublishers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_fetchPublishers);
  }
}
