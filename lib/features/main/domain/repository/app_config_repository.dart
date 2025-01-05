import 'package:topnews/features/main/domain/entity/tab_item.dart';

abstract class AppConfigRepository {
  Future<List<TabItem>> getTabItems();
}
