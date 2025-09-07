import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.sessionToken, required this.caso});

  final dynamic sessionToken;
  final dynamic caso;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final _caixaController = TextEditingController();
  final _descricaoController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Identificar atributos para abertura do chamado
      // Número do caixa = _caixaController.text;
      // Descrição do problema = _descricaoController.text;
      Future<http.Response> formulario() {
        return http.post(
          Uri.parse('${dotenv.env['API_URL']}Ticket'),
          headers: 
            <String, String>{'Content-Type': 'application/json', 
            'Session-Token': widget.sessionToken,
            'App-Token': dotenv.env['APP_TOKEN']!},
          body: '{"input": {"name": "Meu único computador", "serial": "12345"}}',
        );
      }
      final resposta = formulario();
      if (resposta.statusCode == 200) {
        // Chamado criado com sucesso
      } else {
        // Falha ao criar chamado
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulário enviado com sucesso!')),
      );

      _caixaController.clear();
      _descricaoController.clear();
      Navigator.pop(context, widget.sessionToken);
    }
  }

  @override
  void dispose() {
    _caixaController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Chamado - ${widget.caso}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _caixaController,
                decoration: const InputDecoration(
                  labelText: 'Caixa*',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.subject),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o caixa';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _descricaoController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Observação',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
              const SizedBox(height: 16),

              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Lógica para selecionar anexos
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Funcionalidade de anexo em desenvolvimento')),
                  );
                },
                icon: const Icon(Icons.attach_file),
                label: const Text('Adicionar Anexos'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Future<http.Response> {
  get statusCode => null;
}