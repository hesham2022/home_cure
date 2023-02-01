import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_cure/l10n/l10n.dart';

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
    this.arTitle,
    this.arDescription,
    this.parent,
    this.hasDays,
    this.minDays,
  });
  List<ServiceEntity> children = <ServiceEntity>[];
  String getTitle(BuildContext context) {
    final isAr = context.l10n.localeName == 'ar';
    if (isAr) {
      if (arTitle != null) {
        return arTitle!;
      }
    }
    return title;
  }

  bool hasRangOfDays() {
    print(hasDays);
    return hasDays != null && hasDays == true;
  }

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
  final String? arDescription;

  final String photo;
  final bool numberOfSessions;
  final bool isTele;
  final int price;
  final String? arTitle;

  final int? priceDiscount;
  final String id;
  final int? days;
  final bool? hasDays;
  final int? minDays;
  final String? parent;
  final bool isVideo;

  ServiceEntity copyWith({
    List<String>? ancestors,
    String? role,
    List<int>? holidays,
    bool? isLeaf,
    String? arTitle,
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
    int? minDays,
    bool? hasDays,
    String? arDescription,
  }) {
    return ServiceEntity(
      ancestors: ancestors ?? this.ancestors,
      role: role ?? this.role,
      arDescription: arDescription ?? this.arDescription,
      isVideo: isVideo ?? this.isVideo,
      numberOfSessions: numberOfSessions ?? this.numberOfSessions,
      holidays: holidays ?? this.holidays,
      days: days ?? this.days,
      arTitle: arTitle ?? this.arTitle,
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
      minDays: minDays ?? this.minDays,
      hasDays: hasDays ?? this.hasDays,
    );
  }

  @override
  List<Object?> get props => [id, title, children, isVideo];
}
