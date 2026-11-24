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

  Map<String, int> venta = {
    'Sancocho': 2,
    'Gaseosa': 3,
    'Postre del día': 2
  };

  String productoDevuelto = 'Gaseosa';
  int cantidadDevuelta = 1;
  String motivo = 'Producto en mal estado';
  bool autorizadoPorAdmin = false;
  const int limiteSinAutorizacion = 30000;
  List<String> devoluciones = [];

  // Calcular el total original.
  int totalOriginal = 0;

  for (var producto in venta.keys) {
    totalOriginal += menu[producto]! * venta[producto]!;
  }

  print('Total original: $totalOriginal');

  // Validar la devolución.
  if (!venta.containsKey(productoDevuelto)) {
    print('Error: el producto no hace parte de la venta');
  } else if (cantidadDevuelta <= 0) {
    print('Error: la cantidad a devolver debe ser mayor que 0');
  } else if (cantidadDevuelta > venta[productoDevuelto]!) {
    print('Error: la cantidad devuelta supera la cantidad vendida');
  } else {
    int valorDevolucion = menu[productoDevuelto]! * cantidadDevuelta;

    if (valorDevolucion > limiteSinAutorizacion && autorizadoPorAdmin == false) {
      print('Error: la devolución requiere autorización del administrador');
    } else {
      int cantidadRestante = venta[productoDevuelto]! - cantidadDevuelta;

      if (cantidadRestante == 0) {
        venta.remove(productoDevuelto);
      } else {
        venta[productoDevuelto] = cantidadRestante;
      }

      devoluciones.add(
        '$cantidadDevuelta x $productoDevuelto ($motivo): $valorDevolucion',
      );

      print('Devolución registrada: $valorDevolucion');

      int nuevoTotal = 0;

      for (var producto in venta.keys) {
        nuevoTotal += menu[producto]! * venta[producto]!;
      }

      print('Venta actualizada: $venta');
      print('Nuevo total: $nuevoTotal');
      print('Devoluciones: $devoluciones');
    }
  }
}