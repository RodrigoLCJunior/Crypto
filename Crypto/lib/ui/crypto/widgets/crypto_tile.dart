import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_manager/domain/entities/crypto/crypto_entity.dart';

class BlocoCripto extends StatelessWidget {
  final Crypto cripto;
  final VoidCallback aoTocar;

  BlocoCripto({required this.cripto, required this.aoTocar});

  final formatadorUsd = NumberFormat.currency(locale: 'en_US', symbol: '\$');
  final formatadorBrl = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${cripto.name} (${cripto.symbol})'),
      subtitle: Text(
        'USD: ${formatadorUsd.format(cripto.priceUsd)} | BRL: ${formatadorBrl.format(cripto.priceBrl)}',
      ),
      onTap: aoTocar,
    );
  }
}
