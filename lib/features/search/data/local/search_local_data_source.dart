import 'package:hive/hive.dart';

class SearchLocalDataSource {
  final Box box;

  SearchLocalDataSource(this.box);

  List<String> getRecentSearches() {
    return box.get('recent', defaultValue: []).cast<String>();
  }

  Future<void> saveSearch(String query) async {
    final list = getRecentSearches();

    list.remove(query);
    list.insert(0, query);

    if (list.length > 10) list.removeLast();

    await box.put('recent', list);
  }

  Future<void> clear() async {
    await box.delete('recent');
  }
}