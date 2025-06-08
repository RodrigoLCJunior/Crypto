import 'package:flutter/material.dart';
import 'package:order_manager/ui/crypto/widgets/crypto_detail_bottom_sheet.dart';
import 'package:order_manager/ui/crypto/widgets/crypto_list_widget.dart';
import 'package:order_manager/ui/crypto/widgets/refresh_button.dart'
    show RefreshButton;
import 'package:order_manager/ui/crypto/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:order_manager/ui/crypto/view_model/crypto_viewmodel.dart'; // Mantido o nome do arquivo, pois é um caminho

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controlador para o campo de texto da barra de pesquisa.
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Função para exibir os detalhes de uma criptomoeda em uma janela pop-up na parte inferior.
  void _showDetails(BuildContext context, crypto) {
    showModalBottomSheet(
      context: context,
      builder: (_) => CryptoDetailBottomSheet(crypto: crypto),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Acessa o ViewModel para gerenciar o estado da página, agora com os nomes em português.
    final vm = Provider.of<CryptoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Criptomoedas'), // Título da AppBar
        actions: [
          // Botão de atualização na AppBar.
          RefreshButton(controller: _controller, viewModel: vm),
        ],
      ),
      body: Column(
        children: [
          // Widget da barra de pesquisa.
          SearchBarWidget(controller: _controller, viewModel: vm),
          Expanded(
            child: RefreshIndicator(
              // Lógica para recarregar as criptomoedas ao puxar para baixo.
              onRefresh: () async {
                // Chamada para a função traduzida no ViewModel
                await vm.buscarCriptos();
              },
              child:
                  // Mostra um indicador de progresso se estiver carregando e a lista estiver vazia,
                  // caso contrário, exibe a lista de criptomoedas.
                  // Usa as novas variáveis de estado traduzidas
                  vm.estaCarregando && vm.criptos.isEmpty
                      ? const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue,
                          ), // Cor azul para o indicador
                        ),
                      )
                      : CryptoListWidget(
                        // Passa a lista de criptomoedas traduzida
                        cryptos: vm.criptos,
                        // Define a ação ao tocar em um item da lista.
                        onTap: (crypto) => _showDetails(context, crypto),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
