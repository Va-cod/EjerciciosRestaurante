void main() {
  Map<String, int> menu = {
    'Ajiaco': 28000,
    'Bandeja paisa': 32000,
    'Sancocho': 26000,
    'Limonada': 6000,
    'Jugo natural': 7000,
    'Gaseosa': 5000,
    'Postre del día': 9000,
  };

  Map<String, int> pedido = {
    'Ajiaco': 3,
    'Jugo natural': 4,
    'Postre del día': 2,
    'Bandeja paisa': 1,
  };

  String? cupon = 'CUMPLE';
  bool clienteFrecuente = true;
  const int descuentoMaximo = 20;

  int subtotal = 0;
  int porcentajeDescuento = 0;
  List<String> motivos = [];

  // Calcular el subtotal.
  for (var producto in pedido.keys) {
    subtotal += menu[producto]! * pedido[producto]!;
  }

  print('Subtotal: $subtotal');

  // Descuento por compra mayor a 150.000.
  if (subtotal > 150000) {
    porcentajeDescuento += 10;
    motivos.add('compra mayor a 150.000 (10 %)');
  }

  // Revisar el cupón si no es null.
  if (cupon != null) {
    switch (cupon.toUpperCase()) {
      case 'CUMPLE':
        porcentajeDescuento += 15;
        motivos.add('cupón CUMPLE (15 %)');
        break;

      default:
        print('Cupón no válido');
    }
  }

  // Descuento por cliente frecuente.
  if (clienteFrecuente) {
    porcentajeDescuento += 5;
    motivos.add('cliente frecuente (5 %)');
  }

  // Validar el descuento máximo.
  if (porcentajeDescuento > descuentoMaximo) {
    print(
      'El descuento de $porcentajeDescuento % supera el máximo; '
          'se aplica $descuentoMaximo %',
    );
    porcentajeDescuento = descuentoMaximo;
  }

  int valorDescuento = (subtotal * porcentajeDescuento / 100).toInt();
  int totalPagar = subtotal - valorDescuento;

  print('Descuento: $valorDescuento · TOTAL A PAGAR: $totalPagar');
  print('Motivos: ${motivos.join(', ')}');
}