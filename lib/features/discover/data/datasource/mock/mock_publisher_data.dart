import 'package:topnews/features/discover/data/model/base_result_model.dart';
import 'package:topnews/features/discover/data/model/publisher_model.dart';

final publisherList = [
  const PublisherModel(
    id: '1',
    name: 'BBC News',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: true,
  ),
  const PublisherModel(
    id: '2',
    name: 'CNN',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: false,
  ),
  const PublisherModel(
    id: '3',
    name: 'The Guardian',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: true,
  ),
  const PublisherModel(
    id: '4',
    name: 'Reuters',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: false,
  ),
  const PublisherModel(
    id: '5',
    name: 'Associated Press',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: true,
  ),
  const PublisherModel(
    id: '6',
    name: 'The New York Times',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: false,
  ),
  const PublisherModel(
    id: '7',
    name: 'Washington Post',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: true,
  ),
  const PublisherModel(
    id: '8',
    name: 'The Wall Street Journal',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: false,
  ),
  const PublisherModel(
    id: '9',
    name: 'Bloomberg',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: true,
  ),
  const PublisherModel(
    id: '10',
    name: 'CNBC',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: false,
  ),
  const PublisherModel(
    id: '11',
    name: 'Fox News',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: true,
  ),
  const PublisherModel(
    id: '12',
    name: 'NBC News',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: false,
  ),
  const PublisherModel(
    id: '13',
    name: 'ABC News',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: true,
  ),
  const PublisherModel(
    id: '14',
    name: 'CBS News',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: false,
  ),
  const PublisherModel(
    id: '15',
    name: 'Time',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: true,
  ),
  const PublisherModel(
    id: '16',
    name: 'The Economist',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: false,
  ),
  const PublisherModel(
    id: '17',
    name: 'Financial Times',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: true,
  ),
  const PublisherModel(
    id: '18',
    name: 'Forbes',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: false,
  ),
  const PublisherModel(
    id: '19',
    name: 'Business Insider',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: true,
  ),
  const PublisherModel(
    id: '20',
    name: 'The Atlantic',
    imageUrl: 'https://via.placeholder.com/150',
    isFollowing: false,
  ),
];

final followedPublishers =
    publisherList.where((publisher) => publisher.isFollowing).toList();

final recommendedPublishers =
    publisherList.where((publisher) => !publisher.isFollowing).toList();

List<PublisherModel> getSearchPublisherList(String keyword) {
  return publisherList
      .where((publisher) => publisher.name.contains(keyword))
      .toList();
}

BaseResultModel<PublisherModel?> getFollowedPublisherResult(
    String publisherId, bool isFollowing) {
  final publisher =
      publisherList.firstWhere((publisher) => publisher.id == publisherId);
  final newPublisher = publisher.copyWith(isFollowing: !isFollowing);
  // 更新集合 id 为 publisherId 的元素
  publisherList.map((publisher) {
    if (publisher.id == publisherId) {
      return newPublisher;
    }
    return publisher;
  }).toList();
  return successResult(newPublisher);
}
