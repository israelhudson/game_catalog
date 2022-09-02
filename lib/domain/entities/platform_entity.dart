import 'package:equatable/equatable.dart';

class PlatformEntity extends Equatable {
  final int id;
  late String name;

  PlatformEntity({required this.id, required this.name});

  setLogica() {
    if (name.toLowerCase() == "Xbox".toLowerCase()) {
      name = "microsoft";
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
