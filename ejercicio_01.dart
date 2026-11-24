void main() {
  String usuario = 'Laura';
  String rol = 'cajero';
  bool cajaAbierta = false;
  int baseInicial = 200000;
  const int baseMaxima = 10000000;
  List<String> movimientos = [];

  if (cajaAbierta) {
    print('Error: ya hay una caja abierta');
  } else if (rol != 'cajero' && rol != 'admin') {
    print('Error: el usuario no tiene permisos para abrir la caja');
  } else if (baseInicial < 0 || baseInicial > baseMaxima) {
    print('Error: la base inicial no es válida');
  } else {
    cajaAbierta = true;
    movimientos.add('APERTURA por $usuario con base $baseInicial');
    print('Caja abierta por $usuario con una base de $baseInicial');
  }

  print('Estado de la caja: ${cajaAbierta ? 'ABIERTA' : 'CERRADA'}');
  print('Movimientos: $movimientos');
}