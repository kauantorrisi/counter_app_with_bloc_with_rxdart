import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends BlocBase {
  // CONTROLA TODO O FLUXO DE DADOS, PERMITINDO ADICIONAR, LER, EXCLUIR, ETC.
  final controlador = BehaviorSubject<int>.seeded(0);

  // POR ONDE OS DADOS SÃO OBSERVADOS / SAIDA DOS DADOS
  Stream<int> get saida => controlador.stream;

  // ENTRADA DOS DADOS
  Sink<int> get entrada => controlador.sink;

  // GETTER QUE RETORNA O DADO MAIS RECENTE DO MEU FLUXO/CONTROLADOR
  int get valor => controlador.value;

  aumentar() {
    entrada.add(valor + 1);
  }

  @override
  void dispose() {
    controlador.close();
    super.dispose();
  }
}
