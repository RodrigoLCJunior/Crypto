import 'package:flutter/material.dart';
import 'package:order_manager/ui/crypto/view_model/crypto_viewmodel.dart';

class RefreshButton extends StatelessWidget {
  final TextEditingController controller;
  final CryptoViewModel viewModel;

  const RefreshButton({
    super.key,
    required this.controller,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () {
        controller.clear();
        viewModel.buscarCriptos();
      },
    );
  }
}
