import 'package:home_cure/features/home/domain/entities/service.dart';

class ServiceModel extends ServiceEntity {
  ServiceModel({
    required super.ancestors,
    required super.role,
    required super.holidays,
    required super.isLeaf,
    required super.active,
    required super.ratingsAverage,
    required super.ratingsQuantity,
    required super.timeSlots,
    super.isPackage,
    super.features,
    required super.title,
    required super.description,
    required super.photo,
    required super.price,
    required super.priceDiscount,
    required super.id,
    required super.isVideo,
    required super.isTele,
    super.parent,
    super.days,
    super.numberOfSessions,
    super.minDays,
    super.hasDays,
    super.arDescription,
    super.arTitle,
  });
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['hasDays'] != null) {
      print('*' * 200);
      print(json);
    }
    if (json['name'] == 'shift 24 hours') {
      print('''








$json

''');
    }
    return ServiceModel(
      ancestors: List.from(
        (json['ancestors'] as List<dynamic>)
            .map<String>((dynamic e) => e as String),
      ),
      role: json['role'] as String,
      holidays: List<int>.from(
        (json['holidays'] as List<dynamic>).map<int>((dynamic x) => x as int),
      ),
      isLeaf: json['isLeaf'] as bool,
      arTitle: json['arTitle'] as String?,
      active: json['active'] as bool,
      isVideo: (json['isVideo'] as bool?) ?? false,
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      ratingsQuantity: json['ratingsQuantity'] as int,
      timeSlots: List.from(
        (json['timeSlots'] as List<dynamic>)
            .map<String>((dynamic e) => e as String),
      ),
      isPackage: json['isPackage'] as bool?,
      features: List<String>.from(
        (json['features'] as List<dynamic>)
            .map<String>((dynamic x) => x as String),
      ),
      title: json['title'] as String,
      description: json['description'] as String,
      arDescription: json['arDescription'] as String?,
      photo: (json['photo'] as String?) ?? '',
      price: json['price'] as int,
      priceDiscount: json['priceDiscount'] as int?,
      id: json['id'] as String,
      minDays: json['minDays'] as int?,
      hasDays: json['hasDays'] as bool?,
      isTele: (json['isTele'] as bool?) ?? false,
      days: json['days'] as int?,
      parent: json['parent'] as String?,
      numberOfSessions: (json['numberOfSessions'] as bool?) ?? false,
    );
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'ancestors': ancestors,
        'role': role,
        'holidays': holidays,
        'isLeaf': isLeaf,
        'active': active,
        'ratingsAverage': ratingsAverage,
        'ratingsQuantity': ratingsQuantity,
        'timeSlots': timeSlots,
        'isPackage': isPackage,
        'features': features,
        'title': title,
        'description': description,
        'photo': photo,
        'price': price,
        'priceDiscount': priceDiscount,
        'id': id,
        'isTele': isTele,
        'isVideo': isVideo,
        'parent': parent,
        'minDays': minDays,
        'hasDays': hasDays,
        'arTitle': arTitle,
        'arDescription': arDescription,
      };
}
