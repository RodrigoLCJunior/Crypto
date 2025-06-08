import 'package:flutter/material.dart';
import 'package:order_manager/domain/entities/crypto/crypto_entity.dart';

class CryptoDetailBottomSheet extends StatelessWidget {
  final Crypto crypto;

  const CryptoDetailBottomSheet({Key? key, required this.crypto})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            crypto.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Símbolo: ${crypto.symbol}'),
          Text(
            'Data adicionada: ${crypto.dateAdded.toLocal().toString().split(' ')[0]}',
          ),
          Text('Preço USD: \$${crypto.priceUsd.toStringAsFixed(2)}'),
          Text('Preço BRL: R\$${crypto.priceBrl.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
