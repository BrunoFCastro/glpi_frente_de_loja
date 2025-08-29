// lib/form_page.dart

import 'package:flutter/material.dart';

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
      // Se o formulário for válido, execute a ação de envio
      // Você pode coletar os dados aqui:
      // String topic = _topicController.text;
      // String text = _textController.text;

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