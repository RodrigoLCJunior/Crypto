import 'package:flutter/material.dart';
import 'package:order_manager/domain/entities/crypto/crypto_entity.dart';
import 'crypto_tile.dart';

class CryptoListWidget extends StatelessWidget {
  final List<Crypto> cryptos;
  final void Function(Crypto crypto) onTap;

  const CryptoListWidget({Key? key, required this.cryptos, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: cryptos.length,
      itemBuilder: (context, index) {
        final crypto = cryptos[index];
        return BlocoCripto(cripto: crypto, aoTocar: () => onTap(crypto));
      },
    );
  }
}
