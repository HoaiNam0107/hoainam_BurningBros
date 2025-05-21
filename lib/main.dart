import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'data/models/product_model.dart';
import 'data/sources/local/hive_local_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());

  final localDataSource = HiveLocalDataSource();
  await localDataSource.init();

  runApp(MyApp(localDataSource: localDataSource));
}
