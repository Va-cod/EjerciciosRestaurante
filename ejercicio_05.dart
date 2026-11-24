void main() {
  int baseInicial = 200000;

  // Las dos listas van en el mismo orden.
  List<int> totales = [45000, 120000, 38000, 76000, 54000, 91000];
  List<String> medios = [
    'efectivo',
    'debito',
    'efectivo',
    'credito',
    'efectivo',
    'debito'
  ];

  Map<String, int> egresos = {
    'Compra de hielo': 15000,
    'Recarga de gas': 20000
  };

  int efectivoContado = 300000;

  // Acumular ventas por medio de pago.
  Map<String, int> porMedio = {
    'efectivo': 0,
    'debito': 0,
    'credito': 0
  };

  for (int i = 0; i < totales.length; i++) {
    porMedio[medios[i]] = porMedio[medios[i]]! + totales[i];
  }

  print(
      'Ventas en efectivo: ${porMedio['efectivo']} · '
          'débito: ${porMedio['debito']} · '
          'crédito: ${porMedio['credito']}'
  );

  // Calcular estadísticas de ventas.
  int totalVendido = 0;
  int ventaMayor = 0;
  int cantidadVentas = totales.length;

  for (int i = 0; i < totales.length; i++) {
    totalVendido += totales[i];

    if (totales[i] > ventaMayor) {
      ventaMayor = totales[i];
    }
  }

  double promedio = totalVendido / cantidadVentas;

  print(
      'Total vendido: $totalVendido ($cantidadVentas ventas) · '
          'Venta mayor: $ventaMayor · '
          'Promedio: ${promedio.toStringAsFixed(0)}'
  );

  // Sumar egresos.
  int totalEgresos = 0;

  for (var valor in egresos.values) {
    totalEgresos += valor;
  }

  print('Egresos: $totalEgresos');

  // Calcular efectivo esperado.
  int efectivoEsperado =
      baseInicial + porMedio['efectivo']! - totalEgresos;

  print(
      'Efectivo esperado: $efectivoEsperado · '
          'Efectivo contado: $efectivoContado'
  );

  // Comparar el efectivo.
  if (efectivoContado == efectivoEsperado) {
    print('La caja está cuadrada');
  } else if (efectivoContado > efectivoEsperado) {
    print('Sobrante de ${efectivoContado - efectivoEsperado}');
  } else {
    print('Faltante de ${efectivoEsperado - efectivoContado}');
  }
}