import 'package:counter_app_with_bloc/controllers/bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Bloc _bloc;

  @override
  void initState() {
    _bloc = Bloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você apertou o botão'),
            StreamBuilder<int>(
                stream: _bloc.saida,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data} vezes',
                    style: Theme.of(context).textTheme.displayMedium,
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.aumentar(),
        tooltip: 'Aumente',
        child: const Icon(Icons.add),
      ),
    );
  }
}
