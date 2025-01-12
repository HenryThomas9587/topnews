import 'dart:async';

import 'package:topnews/features/discover/data/model/base_result_model.dart';
import 'package:topnews/features/discover/data/model/tag_model.dart';

class MockTagDataSource {
  final tagList = [
    const TagModel(
      id: '1',
      name: 'technology',
      label: '科技',
      isFollowed: true,
      newsCount: 1245,
    ),
    const TagModel(
      id: '2',
      name: 'finance',
      label: '财经',
      isFollowed: false,
      newsCount: 892,
    ),
    const TagModel(
      id: '3',
      name: 'sports',
      label: '体育',
      isFollowed: true,
      newsCount: 2134,
    ),
    const TagModel(
      id: '4',
      name: 'entertainment',
      label: '娱乐',
      isFollowed: false,
      newsCount: 1567,
    ),
    const TagModel(
      id: '5',
      name: 'education',
      label: '教育',
      isFollowed: true,
      newsCount: 765,
    ),
    const TagModel(
      id: '6',
      name: 'health',
      label: '健康',
      isFollowed: false,
      newsCount: 943,
    ),
    const TagModel(
      id: '7',
      name: 'politics',
      label: '政治',
      isFollowed: true,
      newsCount: 1876,
    ),
    const TagModel(
      id: '8',
      name: 'travel',
      label: '旅游',
      isFollowed: false,
      newsCount: 654,
    ),
    const TagModel(
      id: '9',
      name: 'food',
      label: '美食',
      isFollowed: true,
      newsCount: 1432,
    ),
    const TagModel(
      id: '10',
      name: 'fashion',
      label: '时尚',
      isFollowed: false,
      newsCount: 987,
    ),
    const TagModel(
      id: '11',
      name: 'science',
      label: '科学',
      isFollowed: true,
      newsCount: 876,
    ),
    const TagModel(
      id: '12',
      name: 'environment',
      label: '环境',
      isFollowed: false,
      newsCount: 543,
    ),
    const TagModel(
      id: '13',
      name: 'culture',
      label: '文化',
      isFollowed: true,
      newsCount: 1234,
    ),
    const TagModel(
      id: '14',
      name: 'automotive',
      label: '汽车',
      isFollowed: false,
      newsCount: 765,
    ),
    const TagModel(
      id: '15',
      name: 'realestate',
      label: '房产',
      isFollowed: true,
      newsCount: 987,
    ),
    const TagModel(
      id: '16',
      name: 'pets',
      label: '宠物',
      isFollowed: false,
      newsCount: 432,
    ),
    const TagModel(
      id: '17',
      name: 'gaming',
      label: '游戏',
      isFollowed: true,
      newsCount: 2345,
    ),
    const TagModel(
      id: '18',
      name: 'music',
      label: '音乐',
      isFollowed: false,
      newsCount: 1654,
    ),
    const TagModel(
      id: '19',
      name: 'movie',
      label: '电影',
      isFollowed: true,
      newsCount: 1876,
    ),
    const TagModel(
      id: '20',
      name: 'art',
      label: '艺术',
      isFollowed: false,
      newsCount: 765,
    ),
  ];

  List<TagModel> getFollowedTagList() {
    return tagList.where((tag) => tag.isFollowed).toList();
  }

  List<TagModel> getRecommendedTagList() {
    return tagList.where((tag) => !tag.isFollowed).toList();
  }

  List<TagModel> getCategoryTagList(String keyword) {
    return tagList.where((tag) => tag.name.contains(keyword)).toList();
  }

  List<TagModel> getLatestTagList() {
    return tagList.where((tag) => tag.name.contains('latest')).toList();
  }

  List<TagModel> getTrendingTagList() {
    return tagList.where((tag) => tag.name.contains('trending')).toList();
  }

  List<TagModel> getSearchTagList(String keyword) {
    return tagList.where((tag) => tag.name.contains(keyword)).toList();
  }

  BaseResultModel<TagModel?> getFollowedTagResult(
      String tagId, bool isFollowed) {
    final tag = tagList.firstWhere((tag) => tag.id == tagId);
    final newTag = tag.copyWith(isFollowed: !isFollowed);
    // 更新集合 id 为 tagId 的元素
    tagList.map((tag) {
      if (tag.id == tagId) {
        return newTag;
      }
      return tag;
    }).toList();
    return successResult(newTag);
  }
}
