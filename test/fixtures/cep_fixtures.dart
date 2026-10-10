import 'package:cep_app/feature/cep/data/models/cep_response_model.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_cep_body.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_local_body.dart';

const tCepObject = CepResponseModel(
  cep: '4782314',
  logradouro: 'Teste',
  complemento: 'Teste',
  bairro: 'Teste',
  localidade: 'Teste',
  uf: 'Teste',
);

const tGetCepDetailsByCepBodyRight = GetCepDetailsByCepBody(cep: '4782314');
const tGetDetailsByCepBodyLeft = GetCepDetailsByCepBody(cep: '4fewsf3');

const tGetCepDetailsByLocalBodyRight = GetCepDetailsByLocalBody(
  cidade: 'cidade_maroto',
  estado: 'Estado_maroto',
  rua: 'rua marota',
);

const Map<String, dynamic> tCepApiResponse = {
  "cep": '4782314',
  "logradouro": 'Teste',
  "complemento": 'Teste',
  "bairro": 'Teste',
  "localidade": 'Teste',
  "uf": 'Teste',
};

const String tCepLocalResponse =
    '{"cep":"4782314","logradouro":"Teste","complemento":"Teste","bairro":"Teste","localidade":"Teste","uf":"Teste"}';
