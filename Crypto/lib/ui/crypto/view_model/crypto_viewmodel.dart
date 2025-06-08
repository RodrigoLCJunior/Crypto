// lib/ui/viewmodels/crypto_view_model.dart

import 'package:flutter/foundation.dart';
import 'package:order_manager/data/repositories/crypto/crypto_repository.dart';
import 'package:order_manager/domain/entities/crypto/crypto_entity.dart';

class CryptoViewModel extends ChangeNotifier {
  final RepositorioCripto _repositorio = RepositorioCripto();

  List<Crypto> criptos = [];
  bool estaCarregando = false;
  String? mensagemErro;

  Future<void> buscarCriptos({List<String>? simbolos}) async {
    estaCarregando = true;
    mensagemErro = null;
    notifyListeners();

    try {
      final simbolosPadrao = [
        'BTC',
        'ETH',
        'SOL',
        'BNB',
        'BCH',
        'MKR',
        'AAVE',
        'DOT',
        'SUI',
        'ADA',
        'XRP',
        'TIA',
        'NEO',
        'NEAR',
        'PENDLE',
        'RENDER',
        'LINK',
        'TON',
        'XAI',
        'SEI',
        'IMX',
        'ETHFI',
        'UMA',
        'SUPER',
        'FET',
        'USUAL',
        'GALA',
        'PAAL',
        'AERO',
      ];

      criptos = await _repositorio.buscarCriptos(
        simbolos: simbolos ?? simbolosPadrao,
      );
    } catch (e) {
      mensagemErro = e.toString();
      criptos = [];
      print('Erro: $mensagemErro');
    } finally {
      estaCarregando = false;
      notifyListeners();
    }
  }
}
