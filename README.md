# Crypto

Instruções de Execução do Aplicativo de Criptomoedas
Este documento contém as informações necessárias para configurar e executar o aplicativo de listagem de criptomoedas.

1. Visão Geral do Projeto
Este aplicativo Flutter permite visualizar uma lista das principais criptomoedas, seus símbolos, datas de adição e preços em USD e BRL. Ele oferece funcionalidades de atualização e busca por símbolos específicos.

2. Pré-requisitos
Para executar este projeto, você precisará ter o seguinte instalado em sua máquina:

Flutter SDK: Certifique-se de ter o Flutter instalado e configurado corretamente. Você pode verificar sua instalação executando flutter doctor no terminal.

IDE: Um ambiente de desenvolvimento integrado, como o Visual Studio Code (com a extensão Flutter) ou Android Studio (com o plugin Flutter).

Conexão com a Internet: O aplicativo busca dados de criptomoedas de uma API externa.

3. Configuração do Projeto
Siga os passos abaixo para configurar o projeto:

3.1. Clonar o Repositório (se aplicável)
Se o seu código estiver em um repositório Git, clone-o para sua máquina local:

git clone <URL_DO_SEU_REPOSITORIO>
cd <nome_da_pasta_do_projeto>

3.2. Instalar Dependências
Navegue até a pasta raiz do projeto no terminal e execute o comando para baixar todas as dependências:

flutter pub get

3.3. Configuração da API (CoinMarketCap)
Este aplicativo utiliza a API do CoinMarketCap para obter dados de criptomoedas. Você precisará de uma chave de API para que o aplicativo funcione corretamente.

Obtenha sua Chave de API:

Vá para o site oficial do CoinMarketCap API: https://coinmarketcap.com/api/

Crie uma conta e obtenha uma chave de API gratuita (plano "Basic" é geralmente suficiente para testes).

Configure a Chave de API no Projeto:

O HttpClient (localizado em lib/core/service/http_client.dart) é responsável por fazer as requisições HTTP. Você precisará configurar sua chave de API neste arquivo ou em um local acessível a ele.

Exemplo de como o HttpClient pode estar configurado (verifique seu arquivo http_client.dart):

Geralmente, há uma variável para a chave de API e para o cabeçalho. Por exemplo:

// lib/core/service/http_client.dart
import 'package:http/http.dart' as http;

class HttpClient {
  static const String _baseUrl = 'https://pro-api.coinmarketcap.com/v1';
  static const String _apiKey = 'SUA_CHAVE_DE_API_AQUI'; // Substitua pela sua chave!

  static Future<http.Response> get(String path, Map<String, String> queryParameters) async {
    final uri = Uri.parse('$_baseUrl$path').replace(queryParameters: queryParameters);
    final response = await http.get(
      uri,
      headers: {
        'X-CMC_PRO_API_KEY': _apiKey,
        'Accept': 'application/json',
      },
    );
    return response;
  }
}

Certifique-se de substituir SUA_CHAVE_DE_API_AQUI pela sua chave de API real do CoinMarketCap.

4. Execução do Aplicativo
Após configurar os pré-requisitos e o projeto, você pode executar o aplicativo em um emulador, simulador ou dispositivo físico conectado:

Inicie um Emulador/Simulador ou conecte um dispositivo físico.

No terminal, na raiz do projeto, execute:

flutter run

O aplicativo será compilado e iniciado no dispositivo ou emulador selecionado.

5. Funcionalidades Principais
Listagem de Criptomoedas: A tela principal exibe uma lista das principais criptomoedas com seus símbolos e preços em USD e BRL.

Detalhes da Criptomoeda: Toque em qualquer criptomoeda na lista para ver detalhes adicionais, como a data em que foi adicionada.

Atualização: O botão de atualização na barra superior (ou puxar para atualizar) recarrega a lista de criptomoedas.

Busca por Símbolo: Utilize a barra de pesquisa para filtrar as criptomoedas por seus símbolos (ex: BTC,ETH,SOL).
