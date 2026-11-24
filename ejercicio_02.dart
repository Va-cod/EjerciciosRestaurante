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
    'Bandeja paisa': 2,
    'Limonada': 3,
    'Postre del día': 1,
    'Cazuela': 1,
  };

  bool incluirPropina = false;
  String medioPago = 'debito';
  int valorRecibido = 90000;
  String? referencia = 'A-48213';

  int subtotal = 0;

  for (var producto in pedido.keys) {
    if (!menu.containsKey(producto)) {
      print('$producto: no existe en el menú, se omite');
      continue;
    }

    int cantidad = pedido[producto]!;
    int precio = menu[producto]!;
    int valor = precio * cantidad;

    print('$producto x$cantidad = $valor');
    subtotal += valor;
  }

  int propina = incluirPropina ? (subtotal * 0.10).toInt() : 0;
  int total = subtotal + propina;

  print('Subtotal: $subtotal · Propina: $propina · TOTAL: $total');

  switch (medioPago) {
    case 'efectivo':
      if (valorRecibido >= total) {
        print('Cambio: ${valorRecibido - total}');
      } else {
        print('Dinero insuficiente. Falta: ${total - valorRecibido}');
      }
      break;

    case 'debito':
      if (referencia == null) {
        print('Error: la referencia del pago es obligatoria');
      } else {
        print('Pago con débito confirmado. Referencia: $referencia');
      }
      break;

    default:
      print('Medio de pago no válido');
  }
}