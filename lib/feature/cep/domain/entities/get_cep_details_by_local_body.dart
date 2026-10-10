import 'package:equatable/equatable.dart';

class GetCepDetailsByLocalBody extends Equatable {
  final String estado;
  final String cidade;
  final String rua;

  const GetCepDetailsByLocalBody({
    required this.estado,
    required this.cidade,
    required this.rua,
  });

  @override
  List<Object?> get props => [estado, cidade, rua];
}
