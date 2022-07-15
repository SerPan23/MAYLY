import 'package:get/get.dart';
import 'package:mayly_client/controllers/SearchPageController.dart';
import 'package:mayly_client/models/FiltersModel.dart';

class SearchFiltersPageController extends GetxController {
  SearchFiltersPageController({this.data});
  final dynamic data;
  Filters filters = Filters();
  dynamic placetmp;

  void checkOldFilters() {
    filters = data['filters'];
    print('check');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkOldFilters();
  }

  void selectDate(dynamic picked) {
    dynamic t1 = picked.start.toString().split('-');
    dynamic t2 = picked.end.toString().split('-');
    filters.startDate = t1[2].split(' ')[0] + '.' + t1[1] + '.' + t1[0];
    filters.endDate = t2[2].split(' ')[0] + '.' + t2[1] + '.' + t2[0];
    update();
  }

  void updatePlace(dynamic placetmp) {
    filters.place = placetmp;
    print(filters.place);
    update();
  }

  Future<List<String>> fetchSuggestions(String searchValue) async {
    await Future.delayed(Duration(milliseconds: 250));
    List<String> _suggestions = [
      'Москва',
      'Анапа',
      'Сочи',
      'mos',
    ];
    List<String> _filteredSuggestions = _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
    return _filteredSuggestions;
  }
}
