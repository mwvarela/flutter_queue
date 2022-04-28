import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/queue_bloc.dart';
import '../models/queue_model.dart';

class QueuePage extends StatefulWidget {
  const QueuePage({Key? key}) : super(key: key);

  @override
  State<QueuePage> createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  @override
  void initState() {
    super.initState();
    context.read<QueueBloc>().add(FetchQueuesEvent());
  }

  Future<void> _addNewQueueDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          var queue = QueueModel.empty();

          return AlertDialog(
            title: const Text('Nova Fila'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Título',
                    ),
                    onChanged: (value) {
                      queue = queue.copyWith(title: value);
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Abreviação',
                    ),
                    onChanged: (value) {
                      queue = queue.copyWith(abbr: value);
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Prioridade',
                    ),
                    onChanged: (value) {
                      queue = queue.copyWith(priority: int.tryParse(value));
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    context.read<QueueBloc>().add(AddNewQueueEvent(queue));
                    Navigator.pop(context);
                  },
                  child: const Text('Salvar')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<QueueBloc>();
    final state = bloc.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filas'),
        centerTitle: true,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('FILAS'),
                  IconButton(
                    icon: const Icon(Icons.add_box_outlined),
                    color: Colors.green,
                    onPressed: _addNewQueueDialog,
                  ),
                ],
              ),
              if (state is QueueLoadingState)
                const Center(child: CircularProgressIndicator()),
              if (state is QueueLoadedState)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.queues.length,
                  itemBuilder: (context, index) {
                    final queue = state.queues[index];
                    return ListTile(
                      title: Text('${queue.title} - ${queue.abbr}'),
                      subtitle: Text('${queue.priority} de prioridade'),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        color: Colors.red,
                        onPressed: () {
                          bloc.add(RemoveQueueEvent(queue));
                        },
                      ),
                    );
                  },
                ),
              const SizedBox(height: 20.0),
              const Text('CONTROLE'),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                child: const Text('Reiniciar Filas'),
                onPressed: () {
                  bloc.add(RemoveAllOrdersEvent());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
