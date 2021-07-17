import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
  final String? name;
  final String? catchPhrase;
  final String? bs;
  @override
  List get props => [
        name,
        catchPhrase,
        bs,
      ];

  const CompanyEntity(
    this.name,
    this.catchPhrase,
    this.bs,
  );
}
