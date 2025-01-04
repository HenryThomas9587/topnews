# TopNews 项目问题记录

## 1. 代码生成问题

### 问题描述

使用freezed、riverpod等代码生成工具时，需要生成相应的 `.g.dart` 文件。

### 解决方案

运行代码生成命令：

```dart
dart  run build_runner build --delete-conflicting-outputs
```

### 注意事项

- 修改 `@freezed` 注解的类后需要重新生成
- 修改 `@riverpod` 注解的类后需要重新生成
- 修改 Retrofit API 客户端后需要重新生成

## 2. Web平台兼容性问题

### 权限处理

**问题描述**
Web平台不支持原生的权限请求机制。

**解决方案**
添加平台判断，Web平台直接返回 `true` 跳过权限检查：

```dart
if (kIsWeb) {
  return true;
}
```

### 本地存储

**问题描述**
Web平台不支持原生文件系统操作。

**解决方案**
Web平台使用 IndexedDB 存储：

```dart
if (kIsWeb) {
  await Hive.initFlutter();
} else {
  final appDocPath = await AppDirectory.getFilePath('');
  await Hive.initFlutter(appDocPath);
}
```

### 图片加载 CORS

**问题描述**
Web平台加载图片时遇到跨域问题。

**解决方案1**
使用图片代理：

```dart
static const imageProxyUrl = 'https://cors-anywhere.herokuapp.com/';
```

**解决方案2**
优化 `CachedNetworkImage` 配置：

```dart
CachedNetworkImage(
  imageUrl: url,
  fadeInDuration: const Duration(milliseconds: 300),
)
```

## 3. 状态管理问题

### 页面切换数据保持

**问题描述**
Web 端页面切换后数据会重新加载。

**解决方案1：使用 Provider 缓存**
使用 `keepAlive` 和初始化标记：

```dart
@Riverpod(keepAlive: true)
class NewsNotifier extends _$NewsNotifier {
  bool _isInitialized = false;

  @override
  Future<List<NewsEntity>> build() async {
    if (!_isInitialized) {
      _isInitialized = true;
      return _fetchNews();
    }
    return state.valueOrNull ?? [];
  }
}
```

**解决方案2：添加缓存时间控制**

```dart
@riverpod
class NewsDetailNotifier extends _$NewsDetailNotifier {
  static const _cacheTime = Duration(minutes: 5);
  DateTime? _lastFetchTime;
}
```

## 4. 性能优化问题

### 列表性能

**问题描述**
长列表滚动性能和内存占用需要优化。

**解决方案**

- 使用 `PageStorageKey` 保存滚动位置
- 设置 `cacheExtent` 预加载
- 实现分页加载

```dart
ListView.builder(
  key: const PageStorageKey('news_list'),
  cacheExtent: 1000,
)
```

### 分页加载

**问题描述**
需要实现列表分页加载功能。

**解决方案**

1. 实现分页逻辑：

```dart
final start = (page - 1) * pageSize;
final end = start + pageSize;
final paginatedPosts = posts.sublist(start, end.clamp(0, posts.length));
```

2. Provider 中实现加载更多：

```dart
Future<void> loadMore() async {
  if (!_hasMore) return;
  _page++;
  final more = await _fetchNews();
  state = AsyncValue.data([...state.value ?? [], ...more]);
}
```

### 并行请求优化

**问题描述**
多个数据请求需要优化加载时间。

**解决方案**
使用 `Future.wait` 并行请求：

```dart
final results = await Future.wait([
  _apiClient.getPosts(),
  _apiClient.getPhotos(),
]);
```

## 5. 错误处理

### 网络错误处理

**问题描述**
需要处理网络请求失败的情况。

**解决方案**

1. 使用 `try-catch` 捕获错误
2. 实现本地缓存作为后备方案

```dart
try {
  final news = await _remoteDataSource.getNewsList();
  await _localDataSource.cacheNewsList(news);
  return news.map((e) => e.toEntity()).toList();
} catch (e) {
  final cached = await _localDataSource.getCachedNewsList();
  if (cached.isEmpty) {
    throw const AppError.unknown('获取失败');
  }
  return cached.map((e) => e.toEntity()).toList();
}
```

## 6. 项目架构

### 代码组织

- 使用 Clean Architecture 分层
  - data: 数据层
  - domain: 领域层
  - presentation: 表现层
- 实现 Repository 模式
- 使用 Provider 进行依赖注入
- 分离 UI 和业务逻辑

### 测试策略

- 单元测试
  - Repository 测试
  - 数据转换测试
  - 业务逻辑测试
- Mock 测试
  - 网络请求 Mock
  - 本地存储 Mock
