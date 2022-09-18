import 'package:home_cure/features/home/domain/entities/service.dart';

List<ServiceEntity> toTreeHierarchy(List<ServiceEntity> services) {
  final r = services;
  final arr = <ServiceEntity>[];
  for (final element in r) {
    element.children = r.where((e) => e.parent == element.id).toList();
    arr.add(element);
  }
  return (arr.where((element) => element.parent == null)).toList();
}
