import 'package:topnews/features/discover/data/model/author_model.dart';
import 'package:topnews/features/discover/data/model/publisher_model.dart';

class MockDiscoverData {
  static const List<PublisherModel> publishers = [
    PublisherModel(
      id: 'cnn',
      name: 'CNN News',
      imageUrl: 'https://picsum.photos/48/48?random=1',
      isFollowing: true,
    ),
    PublisherModel(
      id: 'nbc',
      name: 'NBC News',
      imageUrl: 'https://picsum.photos/48/48?random=2',
      isFollowing: false,
    ),
    PublisherModel(
      id: 'usa_today',
      name: 'USA Today',
      imageUrl: 'https://picsum.photos/48/48?random=3',
      isFollowing: false,
    ),
    PublisherModel(
      id: 'fox',
      name: 'Fox News',
      imageUrl: 'https://picsum.photos/48/48?random=4',
      isFollowing: false,
    ),
    PublisherModel(
      id: 'bbc',
      name: 'BBC News',
      imageUrl: 'https://picsum.photos/48/48?random=5',
      isFollowing: true,
    ),
    PublisherModel(
      id: 'reuters',
      name: 'Reuters',
      imageUrl: 'https://picsum.photos/48/48?random=6',
      isFollowing: false,
    ),
    PublisherModel(
      id: 'bloomberg',
      name: 'Bloomberg',
      imageUrl: 'https://picsum.photos/48/48?random=7',
      isFollowing: true,
    ),
    PublisherModel(
      id: 'wsj',
      name: 'Wall Street Journal',
      imageUrl: 'https://picsum.photos/48/48?random=8',
      isFollowing: false,
    ),
    PublisherModel(
      id: 'guardian',
      name: 'The Guardian',
      imageUrl: 'https://picsum.photos/48/48?random=9',
      isFollowing: false,
    ),
    PublisherModel(
      id: 'nyt',
      name: 'New York Times',
      imageUrl: 'https://picsum.photos/48/48?random=10',
      isFollowing: false,
    ),
  ];

  static const List<AuthorModel> authors = [
    AuthorModel(
      id: 'jenny',
      name: 'Jenny Wilson',
      imageUrl: 'https://i.pravatar.cc/100?img=1',
      isFollowing: false,
    ),
    AuthorModel(
      id: 'edgar',
      name: 'Edgar Thompson',
      imageUrl: 'https://i.pravatar.cc/100?img=2',
      isFollowing: false,
    ),
    AuthorModel(
      id: 'kristina',
      name: 'Kristina Brown',
      imageUrl: 'https://i.pravatar.cc/100?img=3',
      isFollowing: false,
    ),
    AuthorModel(
      id: 'chris',
      name: 'Chris Martin',
      imageUrl: 'https://i.pravatar.cc/100?img=4',
      isFollowing: false,
    ),
    AuthorModel(
      id: 'sarah',
      name: 'Sarah Parker',
      imageUrl: 'https://i.pravatar.cc/100?img=5',
      isFollowing: false,
    ),
    AuthorModel(
      id: 'michael',
      name: 'Michael Johnson',
      imageUrl: 'https://i.pravatar.cc/100?img=6',
      isFollowing: true,
    ),
    AuthorModel(
      id: 'emma',
      name: 'Emma Davis',
      imageUrl: 'https://i.pravatar.cc/100?img=7',
      isFollowing: false,
    ),
    AuthorModel(
      id: 'david',
      name: 'David Miller',
      imageUrl: 'https://i.pravatar.cc/100?img=8',
      isFollowing: false,
    ),
    AuthorModel(
      id: 'sophia',
      name: 'Sophia Lee',
      imageUrl: 'https://i.pravatar.cc/100?img=9',
      isFollowing: false,
    ),
    AuthorModel(
      id: 'james',
      name: 'James Anderson',
      imageUrl: 'https://i.pravatar.cc/100?img=10',
      isFollowing: true,
    ),
  ];

  static List<PublisherModel> getPublishers() {
    return publishers;
  }

  static List<AuthorModel> getAuthors() {
    return authors;
  }
}
