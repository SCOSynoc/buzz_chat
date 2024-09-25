import 'package:buzz_chat/utils/utils.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:http/http.dart' as http;

abstract class LocalDataService {

  Future<void> initLocalService();

  bool addData({ required String key, required String value});

  dynamic getData({required String key});

  bool removeData({required String key});

/*void addPhotoWithMultipartRequest(Uint8List? fromBytes);*/

}


class HiveService extends LocalDataService {

  var box = Hive.box(localStorageBox);

  @override
  Future<void> initLocalService() async {
    await Hive.initFlutter();
    await Hive.openBox(localStorageBox);
  }

  @override
  bool removeData({required String key}) {
    box.delete(key);
    return true;
  }

  @override
  bool addData({required String key, required String value}) {
    box.put(key, value);
    return box.containsKey(key);
  }

  @override
  getData({required String key}) {
    dynamic data = box.get(key);
    return data;
  }

}