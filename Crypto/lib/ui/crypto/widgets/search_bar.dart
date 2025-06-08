import 'package:flutter/material.dart';
import 'package:order_manager/ui/crypto/view_model/crypto_viewmodel.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final CryptoViewModel viewModel; // O ViewModel já tem os nomes atualizados

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Digite símbolos separados por vírgula (ex: BTC,ETH)',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              final input = controller.text.trim();
              final symbols =
                  input.isNotEmpty
                      ? input
                          .split(',')
                          .map((e) => e.trim().toUpperCase())
                          .toList()
                      : null;
              viewModel.buscarCriptos(simbolos: symbols);
            },
            child: const Text('Buscar'),
          ),
        ],
      ),
    );
  }
}
