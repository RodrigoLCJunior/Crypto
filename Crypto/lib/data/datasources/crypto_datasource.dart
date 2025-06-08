// lib/data/datasources/crypto_datasource.dart

import 'dart:convert';
import 'package:order_manager/core/service/http_client.dart';
import 'package:order_manager/domain/entities/crypto/crypto_entity.dart';

class FonteDadosCripto {
  Future<List<Crypto>> buscarCriptos({List<String>? simbolos}) async {
    final respostaBrl = await HttpClient.get(
      '/cryptocurrency/listings/latest',
      {'limit': '100', 'convert': 'BRL'},
    );

    final respostaUsd = await HttpClient.get(
      '/cryptocurrency/listings/latest',
      {'limit': '100', 'convert': 'USD'},
    );

    if (respostaBrl.statusCode == 200 && respostaUsd.statusCode == 200) {
      final dadosBrl = jsonDecode(respostaBrl.body);
      final dadosUsd = jsonDecode(respostaUsd.body);

      final List listaBrl = dadosBrl['data'];
      final List listaUsd = dadosUsd['data'];

      final Map<String, Map<String, dynamic>> mapaBrl = {
        for (var item in listaBrl) item['symbol']: item,
      };
      final Map<String, Map<String, dynamic>> mapaUsd = {
        for (var item in listaUsd) item['symbol']: item,
      };

      final List<Crypto> combinadas = [];

      for (final simbolo in mapaBrl.keys) {
        final dadosBrlCripto = mapaBrl[simbolo];
        final dadosUsdCripto = mapaUsd[simbolo];

        if (dadosBrlCripto != null && dadosUsdCripto != null) {
          dadosBrlCripto['quote']['USD'] = dadosUsdCripto['quote']['USD'];
          combinadas.add(Crypto.fromMap(dadosBrlCripto));
        }
      }

      if (simbolos != null && simbolos.isNotEmpty) {
        return combinadas
            .where((cripto) => simbolos.contains(cripto.symbol))
            .toList();
      } else {
        return combinadas.take(10).toList();
      }
    } else {
      throw Exception(
        'Erro ao buscar criptomoedas: BRL(${respostaBrl.statusCode}), USD(${respostaUsd.statusCode})',
      );
    }
  }
}
