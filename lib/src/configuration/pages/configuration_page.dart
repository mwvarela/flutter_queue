import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/configuration_bloc.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  void initState() {
    super.initState();
    context.read<ConfigurationBloc>().add(FetchQueues());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ConfigurationBloc>();
    final state = bloc.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuração'),
        centerTitle: true,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('FILAS'),
                Icon(
                  Icons.add_box_outlined,
                  color: Colors.green,
                ),
              ],
            ),
            if (state is ConfigurationLoading)
              const Center(child: CircularProgressIndicator()),
            if (state is ConfigurationLoaded)
              ListView.builder(
                shrinkWrap: true,
                itemCount: state.queues.length,
                itemBuilder: (context, index) {
                  final queue = state.queues[index];
                  return ListTile(
                    title: Text('${queue.title} - ${queue.abbr}'),
                    subtitle: Text('${queue.priority} de prioridade'),
                    trailing: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
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
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
