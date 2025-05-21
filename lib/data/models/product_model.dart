import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class ProductModel extends Product {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  }) : super(id: id, title: title, price: price, thumbnail: thumbnail);

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  factory ProductModel.fromEntity(Product entity) => ProductModel(
    id: entity.id,
    title: entity.title,
    price: entity.price,
    thumbnail: entity.thumbnail,
  );
}