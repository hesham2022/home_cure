import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  ServiceEntity({
    required this.ancestors,
    required this.role,
    required this.holidays,
    required this.isLeaf,
    required this.active,
    required this.ratingsAverage,
    this.days,
    required this.ratingsQuantity,
    required this.timeSlots,
    this.isPackage,
    this.features,
    required this.title,
    required this.isVideo,
        required this.isTele,

    required this.description,
    required this.photo,
    this.numberOfSessions = false,
    required this.price,
    required this.priceDiscount,
    required this.id,

    this.parent,
  });
  List<ServiceEntity> children = <ServiceEntity>[];

  final List<String> ancestors;
  final String role;
  final List<int> holidays;
  final bool isLeaf;
  final bool active;
  final double ratingsAverage;
  final int ratingsQuantity;
  final List<String> timeSlots;
  final bool? isPackage;
  final List<dynamic>? features;
  final String title;
  final String description;
  final String photo;
  final bool numberOfSessions;
  final bool isTele;
  final int price;

  final int? priceDiscount;
  final String id;
  final int? days;
  final String? parent;
  final bool isVideo;

  ServiceEntity copyWith({
    List<String>? ancestors,
    String? role,
    List<int>? holidays,
    bool? isLeaf,
    bool? active,
    double? ratingsAverage,
    int? ratingsQuantity,
    List<String>? timeSlots,
    bool? isPackage,
    bool? isTele,
    List<dynamic>? features,
    String? title,
    String? description,
    bool? isVideo,
    String? photo,
    int? price,
    bool? numberOfSessions,
    int? priceDiscount,
    String? id,
    String? parent,
    int? days,
  }) {
    return ServiceEntity(
      ancestors: ancestors ?? this.ancestors,
      role: role ?? this.role,
      isVideo: isVideo ?? this.isVideo,
      numberOfSessions: numberOfSessions ?? this.numberOfSessions,
      holidays: holidays ?? this.holidays,
      days: days ?? this.days,
      isLeaf: isLeaf ?? this.isLeaf,
      active: active ?? this.active,
      ratingsAverage: ratingsAverage ?? this.ratingsAverage,
      ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
      timeSlots: timeSlots ?? this.timeSlots,
      isPackage: isPackage ?? this.isPackage,
      features: features ?? this.features,
      title: title ?? this.title,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      price: price ?? this.price,
      isTele: isTele ?? this.isTele,
      priceDiscount: priceDiscount ?? this.priceDiscount,
      id: id ?? this.id,
      parent: parent ?? this.parent,
    );
  }

  @override
  List<Object?> get props => [id, title, children, isVideo];
}
