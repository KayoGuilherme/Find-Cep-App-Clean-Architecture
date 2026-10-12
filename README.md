<div align="center">

<img src="docs/screenshots/banner.png" alt="Cep App — descubra o endereço pelo CEP, ou o CEP pelo endereço" width="100%" />

<br/>

<img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
<img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
<img src="https://img.shields.io/badge/Riverpod-State-C026D3?style=for-the-badge" alt="Riverpod" />
<img src="https://img.shields.io/badge/Dio-HTTP-6A1B9A?style=for-the-badge" alt="Dio" />
<img src="https://img.shields.io/badge/API-ViaCEP-17141F?style=for-the-badge" alt="ViaCEP" />
<img src="https://img.shields.io/badge/testes-12%20passando-2EA043?style=for-the-badge" alt="Testes" />

<h3>Um app Flutter pra achar qualquer endereço do Brasil pelo CEP, ou o CEP pelo endereço.</h3>

<a href="#-em-ação">Em ação</a> •
<a href="#-telas">Telas</a> •
<a href="#-funcionalidades">Funcionalidades</a> •
<a href="#-arquitetura">Arquitetura</a> •
<a href="#-como-rodar">Como rodar</a>

</div>

---

## 🎬 Em ação

<div align="center">
<table>
  <tr>
    <td align="center" width="50%">
      <img src="docs/screenshots/gifs/carousel_busca_cep.gif" width="320" alt="Carrossel: busca por CEP" />
      <br/><sub><b>🔎 Busca por CEP</b></sub>
    </td>
    <td align="center" width="50%">
      <img src="docs/screenshots/gifs/carousel_busca_endereco.gif" width="320" alt="Carrossel: busca por endereço" />
      <br/><sub><b>🗺️ Busca por Endereço</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="docs/screenshots/gifs/carousel_temas.gif" width="320" alt="Carrossel: tema claro e escuro" />
      <br/><sub><b>🌗 Tema claro & escuro</b></sub>
    </td>
    <td align="center">
      <img src="docs/screenshots/gifs/carousel_erros.gif" width="320" alt="Carrossel: validações e mensagens de erro" />
      <br/><sub><b>🚨 Validações & erros</b></sub>
    </td>
  </tr>
</table>
</div>

---

## 📱 Telas

> Capturas feitas no app rodando, em viewport de **iPhone 14 (390 × 844 @3x)**.

### 🔎 Busca por CEP

Digite os 8 dígitos (a máscara `00000-000` é aplicada sozinha) e veja cidade, bairro e UF num card.

<div align="center">
<table>
  <tr>
    <td align="center"><img src="docs/screenshots/frames/dark_01_cep_empty.png" width="190" /><br/><sub><b>1.</b> Tela inicial</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_03_cep_typed.png" width="190" /><br/><sub><b>2.</b> CEP digitado</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_04_cep_loading.png" width="190" /><br/><sub><b>3.</b> Carregando</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_05_cep_result.png" width="190" /><br/><sub><b>4.</b> Resultado</sub></td>
  </tr>
</table>
</div>

### 🗺️ Busca por Endereço

Informe **UF**, **cidade** e **rua** e receba a lista com todos os CEPs encontrados.

<div align="center">
<table>
  <tr>
    <td align="center"><img src="docs/screenshots/frames/light_10_addr_empty.png" width="190" /><br/><sub><b>1.</b> Formulário vazio</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_12_addr_typed.png" width="190" /><br/><sub><b>2.</b> Campos preenchidos</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_13_addr_loading.png" width="190" /><br/><sub><b>3.</b> Carregando</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_14_addr_results.png" width="190" /><br/><sub><b>4.</b> 50 CEPs encontrados</sub></td>
  </tr>
</table>
</div>

### 🚨 Validações, erros e "sem resultados"

O formulário é validado antes de chamar a API, e cada falha mostra uma mensagem clara.

<div align="center">
<table>
  <tr>
    <td align="center"><img src="docs/screenshots/frames/dark_02_cep_validation.png" width="190" /><br/><sub>CEP obrigatório</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_11_addr_validation.png" width="190" /><br/><sub>Validação por campo</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_09_cep_error.png" width="190" /><br/><sub>Erro na busca</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_17_addr_noresult.png" width="190" /><br/><sub>Sem resultados</sub></td>
  </tr>
</table>
</div>

### 🌗 Claro vs. Escuro

O ícone no canto superior direito troca o tema, e a escolha fica salva no aparelho.

<div align="center">
<table>
  <tr>
    <th>🌙 Escuro</th>
    <th>☀️ Claro</th>
    <th>🌙 Escuro</th>
    <th>☀️ Claro</th>
  </tr>
  <tr>
    <td align="center"><img src="docs/screenshots/frames/dark_05_cep_result.png" width="190" /></td>
    <td align="center"><img src="docs/screenshots/frames/light_05_cep_result.png" width="190" /></td>
    <td align="center"><img src="docs/screenshots/frames/dark_15_addr_results_scroll.png" width="190" /></td>
    <td align="center"><img src="docs/screenshots/frames/light_15_addr_results_scroll.png" width="190" /></td>
  </tr>
</table>
</div>

<details>
<summary><b>🖼️ Galeria completa: todas as telas no tema escuro</b></summary>
<br/>
<div align="center">
<table>
  <tr>
    <td align="center"><img src="docs/screenshots/frames/dark_01_cep_empty.png" width="160" /><br/><sub>CEP · vazio</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_02_cep_validation.png" width="160" /><br/><sub>CEP · validação</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_03_cep_typed.png" width="160" /><br/><sub>CEP · digitado</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_04_cep_loading.png" width="160" /><br/><sub>CEP · carregando</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_05_cep_result.png" width="160" /><br/><sub>CEP · resultado</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/screenshots/frames/dark_09_cep_error.png" width="160" /><br/><sub>CEP · erro</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_10_addr_empty.png" width="160" /><br/><sub>Endereço · vazio</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_11_addr_validation.png" width="160" /><br/><sub>Endereço · validação</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_12_addr_typed.png" width="160" /><br/><sub>Endereço · digitado</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_13_addr_loading.png" width="160" /><br/><sub>Endereço · carregando</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/screenshots/frames/dark_14_addr_results.png" width="160" /><br/><sub>Endereço · resultados</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_15_addr_results_scroll.png" width="160" /><br/><sub>Endereço · lista</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_16_addr_error.png" width="160" /><br/><sub>Endereço · erro</sub></td>
    <td align="center"><img src="docs/screenshots/frames/dark_17_addr_noresult.png" width="160" /><br/><sub>Endereço · sem resultados</sub></td>
    <td></td>
  </tr>
</table>
</div>
</details>

<details>
<summary><b>🖼️ Galeria completa: todas as telas no tema claro</b></summary>
<br/>
<div align="center">
<table>
  <tr>
    <td align="center"><img src="docs/screenshots/frames/light_01_cep_empty.png" width="160" /><br/><sub>CEP · vazio</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_02_cep_validation.png" width="160" /><br/><sub>CEP · validação</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_03_cep_typed.png" width="160" /><br/><sub>CEP · digitado</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_04_cep_loading.png" width="160" /><br/><sub>CEP · carregando</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_05_cep_result.png" width="160" /><br/><sub>CEP · resultado</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/screenshots/frames/light_09_cep_error.png" width="160" /><br/><sub>CEP · erro</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_10_addr_empty.png" width="160" /><br/><sub>Endereço · vazio</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_11_addr_validation.png" width="160" /><br/><sub>Endereço · validação</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_12_addr_typed.png" width="160" /><br/><sub>Endereço · digitado</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_13_addr_loading.png" width="160" /><br/><sub>Endereço · carregando</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/screenshots/frames/light_14_addr_results.png" width="160" /><br/><sub>Endereço · resultados</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_15_addr_results_scroll.png" width="160" /><br/><sub>Endereço · lista</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_16_addr_error.png" width="160" /><br/><sub>Endereço · erro</sub></td>
    <td align="center"><img src="docs/screenshots/frames/light_17_addr_noresult.png" width="160" /><br/><sub>Endereço · sem resultados</sub></td>
    <td></td>
  </tr>
</table>
</div>
</details>

---

## ✨ Funcionalidades

| | Recurso | Detalhes |
|:-:|---|---|
| 🔎 | **Busca por CEP** | Máscara `00000-000`, validação de campo obrigatório e card com cidade, bairro e UF |
| 🗺️ | **Busca por Endereço** | UF (2 letras, maiúsculas automáticas), cidade e rua, com lista de todos os CEPs encontrados |
| ⏳ | **Estados de carregamento** | Indicador de progresso e botão desabilitado durante a requisição |
| 🚨 | **Tratamento de erros** | Validação de formulário, mensagens de erro amigáveis e estado "sem resultados" |
| 🌗 | **Tema claro e escuro** | Alternância com um toque, com a preferência salva via `SharedPreferences` |
| 💾 | **Cache local** | O último resultado de cada busca é salvo no aparelho via `SharedPreferences` |
| 🧪 | **Testes** | Data sources, models, repository e use cases cobertos com `mocktail` |

---

## 🏛️ Arquitetura

O projeto segue **Clean Architecture** por feature, com três camadas bem separadas e injeção de dependências via **Riverpod**.

```mermaid
flowchart LR
    subgraph P["🎨 Presentation"]
        UI["Tabs / Widgets"] --> N["StateNotifier<br/>(Riverpod)"]
    end
    subgraph D["🧠 Domain"]
        UC["Use Cases"] --> RI["CepRepository<br/>(contrato)"]
    end
    subgraph DA["📦 Data"]
        R["CepRepositoryImpl"] --> RDS["Remote DataSource<br/>(Dio → ViaCEP)"]
        R --> LDS["Local DataSource<br/>(SharedPreferences)"]
    end
    N --> UC
    RI -.implementa.-> R
```

O fluxo de erros usa um `Either<L, R>` próprio, de modo que falhas de rede, de cache e de API viram exceções tipadas (`CepRemoteException`, `CepLocalException`, `CepInternetConnectionException`…) que a UI converte em mensagens.

<details>
<summary><b>📂 Estrutura de pastas</b></summary>

```text
lib/
├── core/
│   ├── const/            # strings e mensagens de validação
│   ├── data/
│   │   ├── async/        # Either<L, R>
│   │   ├── local/        # LocalService → SharedPreferences
│   │   └── remote/       # ApiService → DioService
│   ├── domain/providers/ # providers de API e storage
│   ├── extensions/       # SnackBar, Theme
│   └── ui/
│       ├── theme/        # tema claro/escuro (com data + domain próprios)
│       └── widgets/      # app bar, inputs, botões, tabs, cards
└── feature/cep/
    ├── data/             # datasources (local/remote), models, repository impl
    ├── domain/           # entities, use cases, contratos, providers
    └── presentation/     # screen + notifiers/states (Riverpod)
```

</details>

---

## 🧰 Stack

| Camada | Tecnologia |
|---|---|
| UI | Flutter · Material · fonte Poppins |
| Estado & DI | `flutter_riverpod` (StateNotifier) |
| Rede | `dio` + [ViaCEP](https://viacep.com.br) |
| Persistência | `shared_preferences` |
| Inputs | `mask_text_input_formatter` |
| Testes | `flutter_test` · `mocktail` · `state_notifier_test` |

### 🌐 Endpoints usados

```http
GET https://viacep.com.br/ws/{cep}/json/              # busca por CEP
GET https://viacep.com.br/ws/{uf}/{cidade}/{rua}/json/ # busca por endereço
```

---

## 🚀 Como rodar

```bash
# 1. Clone o repositório
git clone https://github.com/KayoGuilherme/Find-Cep-App.git
cd Find-Cep-App

# 2. Instale as dependências
flutter pub get

# 3. Rode no dispositivo/emulador
flutter run

#    ...ou direto no navegador
flutter run -d chrome
```

### 🧪 Testes

```bash
flutter test
```

```text
00:00 +12: All tests passed!
```

---

<div align="center">

Feito com 💜 e Flutter por **[Kayo Guilherme](https://github.com/KayoGuilherme)**

</div>
