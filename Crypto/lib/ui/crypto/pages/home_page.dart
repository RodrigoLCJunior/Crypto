import 'package:flutter/material.dart';
import 'package:order_manager/ui/crypto/widgets/crypto_detail_bottom_sheet.dart';
import 'package:order_manager/ui/crypto/widgets/crypto_list_widget.dart';
import 'package:order_manager/ui/crypto/widgets/refresh_button.dart'
    show RefreshButton;
import 'package:order_manager/ui/crypto/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:order_manager/ui/crypto/view_model/crypto_viewmodel.dart'; 

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    void _showDetails(BuildContext context, crypto) {
    showModalBottomSheet(
      context: context,
      builder: (_) => CryptoDetailBottomSheet(crypto: crypto),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CryptoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Criptomoedas'), 
        actions: [
          RefreshButton(controller: _controller, viewModel: vm),
        ],
      ),
      body: Column(
        children: [
          SearchBarWidget(controller: _controller, viewModel: vm),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await vm.buscarCriptos();
              },
              child:
                  vm.estaCarregando && vm.criptos.isEmpty
                      ? const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue,
                          ), 
                        ),
                      )
                      : CryptoListWidget(
                        cryptos: vm.criptos,
                        onTap: (crypto) => _showDetails(context, crypto),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
