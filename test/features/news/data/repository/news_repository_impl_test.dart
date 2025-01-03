import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:topnews/core/error/app_error.dart';
import 'package:topnews/features/news/data/datasource/news_local_data_source.dart';
import 'package:topnews/features/news/data/datasource/news_remote_data_source.dart';
import 'package:topnews/features/news/data/model/news_model.dart';
import 'package:topnews/features/news/data/repository/news_repository_impl.dart';
import 'news_repository_impl_test.mocks.dart';

@GenerateMocks([NewsRemoteDataSource, NewsLocalDataSource])
void main() {
  late NewsRepositoryImpl repository;
  late MockNewsRemoteDataSource mockRemoteDataSource;
  late MockNewsLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockNewsRemoteDataSource();
    mockLocalDataSource = MockNewsLocalDataSource();
    repository = NewsRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
  });

  group('NewsRepository Tests', () {
    final testNews = [
      const NewsModel(
        id: '1',
        title: 'Test Title',
        content: 'Test Content',
        userId: 1,
      ),
    ];

    test('getNewsList should return news from remote when successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getNewsList())
          .thenAnswer((_) async => testNews);
      when(mockLocalDataSource.cacheNewsList(testNews))
          .thenAnswer((_) async {});

      // act
      final result = await repository.getNewsList();

      // assert
      expect(result.first.id, testNews.first.id);
      verify(mockRemoteDataSource.getNewsList()).called(1);
      verify(mockLocalDataSource.cacheNewsList(testNews)).called(1);
    });

    test('getNewsList should return cached news when remote fails', () async {
      // arrange
      when(mockRemoteDataSource.getNewsList()).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Network Error',
        ),
      );
      when(mockLocalDataSource.getCachedNewsList())
          .thenAnswer((_) async => testNews);

      // act
      final result = await repository.getNewsList();

      // assert
      expect(result.first.id, testNews.first.id);
      verify(mockRemoteDataSource.getNewsList()).called(1);
      verify(mockLocalDataSource.getCachedNewsList()).called(1);
    });

    test('getNewsList should throw AppError when both remote and cache fail',
        () async {
      // arrange
      when(mockRemoteDataSource.getNewsList()).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Network Error',
        ),
      );
      when(mockLocalDataSource.getCachedNewsList()).thenAnswer((_) async => []);

      // act & assert
      expect(() => repository.getNewsList(), throwsA(isA<AppError>()));
    });

    test('getNewsDetail should return news detail when successful', () async {
      // arrange
      final testNewsDetail = testNews.first;
      when(mockRemoteDataSource.getNewsDetail('1'))
          .thenAnswer((_) async => testNewsDetail);

      // act
      final result = await repository.getNewsDetail('1');

      // assert
      expect(result.id, testNewsDetail.id);
      verify(mockRemoteDataSource.getNewsDetail('1')).called(1);
    });

    test('getNewsDetail should throw AppError when remote fails', () async {
      // arrange
      when(mockRemoteDataSource.getNewsDetail('1')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Network Error',
        ),
      );

      // act & assert
      expect(() => repository.getNewsDetail('1'), throwsA(isA<AppError>()));
    });
  });
}
