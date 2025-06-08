import 'package:order_manager/data/datasources/crypto_datasource.dart';
import 'package:order_manager/domain/entities/crypto/crypto_entity.dart';

class RepositorioCripto {
  final FonteDadosCripto _fonteDados = FonteDadosCripto();

  Future<List<Crypto>> buscarCriptos({List<String>? simbolos}) {
    return _fonteDados.buscarCriptos(simbolos: simbolos);
  }
}
