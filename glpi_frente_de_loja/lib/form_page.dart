import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // Chave global para identificar e validar o formulário
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos de texto
  final _topicController = TextEditingController();
  final _textController = TextEditingController();

  // Método para lidar com o envio do formulário
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Adicionar lógica de envio do formulário
      // Se o formulário for válido, execute a ação de envio
      // Você pode coletar os dados aqui:
      // String topic = _topicController.text;
      // String text = _textController.text;
      // Future<http.Response> formulario() {
      //   return http.post(
      //     Uri.parse('http://seu-servidor-glpi/apirest.php/Ticket'),
      //     headers: 
      //       <String, String>{'Content-Type': 'application/json'},
      //       <String, String>{'Session-Token': "83af7e620c83a50a18d3eac2f6ed05a3ca0bea62"},
      //       <String, String> {"App-Token: f7g3csp8mgatg5ebc5elnazakw20i9fyev1qopya7"},
      //       -d '{"input": {"name": "My single computer", "serial": "12345"}}' \
      //   );
      // }

      // Exemplo de como mostrar uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulário enviado com sucesso!')),
      );

      // Limpar os campos após o envio
      _topicController.clear();
      _textController.clear();
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _topicController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Chamado'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campo para o Tópico
              TextFormField(
                controller: _topicController,
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

              // Campo para o Texto
              TextFormField(
                controller: _textController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Observação',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
              const SizedBox(height: 16),

              // Botão de Anexos
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

              // Botão de Envio
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