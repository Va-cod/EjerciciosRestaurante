# 🍽️ Ejercicios Restaurante - Dart

Colección de ejercicios prácticos desarrollados en el lenguaje de programación **Dart**, diseñados para simular los flujos de negocio fundamentales en el sistema operativo de un restaurante: apertura de caja, facturación de pedidos, cálculo y reglas de descuentos, procesamiento de devoluciones y cierre/arqueo de caja.

---

## 📋 Tabla de Contenidos

1. [Estructura del Proyecto](#-estructura-del-proyecto)
2. [Requisitos Previos](#-requisitos-previos)
3. [Descripción de los Ejercicios](#-descripción-de-los-ejercicios)
   - [Ejercicio 01: Apertura de Caja y Control de Acceso](#ejercicio-01-apertura-de-caja-y-control-de-acceso)
   - [Ejercicio 02: Pedidos, Facturación y Medios de Pago](#ejercicio-02-pedidos-facturación-y-medios-de-pago)
   - [Ejercicio 03: Motor de Descuentos y Promociones](#ejercicio-03-motor-de-descuentos-y-promociones)
   - [Ejercicio 04: Gestión de Devoluciones y Ajuste de Venta](#ejercicio-04-gestión-de-devoluciones-y-ajuste-de-venta)
   - [Ejercicio 05: Cierre y Arqueo de Caja](#ejercicio-05-cierre-y-arqueo-de-caja)
4. [Cómo Ejecutar los Ejercicios](#-cómo-ejecutar-los-ejercicios)

---

## 📁 Estructura del Proyecto

```text
EjerciciosRestaurante/
├── ejercicio_01.dart   # Apertura de caja y validación de roles/montos
├── ejercicio_02.dart   # Facturación, propina y cobro por medios de pago
├── ejercicio_03.dart   # Cálculo acumulativo de descuentos con tope máximo
├── ejercicio_04.dart   # Devoluciones con autorización y recalculo de venta
├── ejercicio_05.dart   # Cierre de turno, estadísticas y arqueo de caja
└── README.md           # Documentación general del proyecto
```

---

## ⚙️ Requisitos Previos

- **Dart SDK** (versión 2.12 o superior, con soporte para *Null Safety*).
- Terminal o consola de comandos (PowerShell, Bash, CMD) o un IDE compatible como IntelliJ IDEA o Visual Studio Code.

---

## 📖 Descripción de los Ejercicios

### Ejercicio 01: Apertura de Caja y Control de Acceso
📂 Archivo: [`ejercicio_01.dart`](file:///C:/Users/Cohorte%205/IdeaProjects/EjerciciosRestaurante/ejercicio_01.dart)

Simula el protocolo de inicio de turno y apertura de caja registradora en el restaurante.

- **Conceptos aplicados:** Condicionales anidados (`if-else if-else`), operadores lógicos (`&&`, `||`), listas dinámicas (`List<String>`), interpolación de cadenas y operador ternario.
- **Validaciones implementadas:**
  - Verifica si la caja ya está abierta para evitar aperturas duplicadas.
  - Comprueba que el usuario cuente con los roles autorizados (`cajero` o `admin`).
  - Valida que la base inicial sea mayor o igual a 0 y no supere la base máxima permitida ($10.000.000).
- **Salida esperada:**
  ```text
  Caja abierta por Laura con una base de 200000
  Estado de la caja: ABIERTA
  Movimientos: [APERTURA por Laura con base 200000]
  ```

---

### Ejercicio 02: Pedidos, Facturación y Medios de Pago
📂 Archivo: [`ejercicio_02.dart`](file:///C:/Users/Cohorte%205/IdeaProjects/EjerciciosRestaurante/ejercicio_02.dart)

Maneja el menú del restaurante, el procesamiento de pedidos de mesas y el cobro según el método de pago seleccionado.

- **Conceptos aplicados:** Diccionarios/Mapas (`Map<String, int>`), iteración de claves (`for..in`), operador de verificación de nulos (`!`), variables anulables (`String?`), estructura de control `switch-case`.
- **Reglas de negocio:**
  - Compara el pedido contra el menú: si un ítem no existe en el catálogo, se notifica y se omite.
  - Calcula el subtotal multiplicando cantidad por precio unitario.
  - Opción de propina voluntaria sugerida (10% del subtotal).
  - Manejo de medios de pago:
    - **Efectivo:** Calcula el cambio o advierte si el dinero es insuficiente.
    - **Débito:** Exige una referencia de transacción obligatoria.
- **Salida esperada:**
  ```text
  Bandeja paisa x2 = 64000
  Limonada x3 = 18000
  Postre del día x1 = 9000
  Cazuela: no existe en el menú, se omite
  Subtotal: 91000 · Propina: 0 · TOTAL: 91000
  Pago con débito confirmado. Referencia: A-48213
  ```

---

### Ejercicio 03: Motor de Descuentos y Promociones
📂 Archivo: [`ejercicio_03.dart`](file:///C:/Users/Cohorte%205/IdeaProjects/EjerciciosRestaurante/ejercicio_03.dart)

Aplica políticas de fidelización y promociones comerciales acumulativas sobre el consumo del cliente.

- **Conceptos aplicados:** Acumulación porcentual, validación de constantes (`const`), métodos de cadenas (`toUpperCase()`), métodos de listas (`join()`), redondeo entero con `.toInt()`.
- **Reglas de negocio y beneficios acumulables:**
  - **Volumen de compra:** 10% adicional si el subtotal supera los $150.000.
  - **Cupón promocional:** 15% adicional si se ingresa el cupón `CUMPLE`.
  - **Cliente frecuente:** 5% adicional de descuento.
  - **Tope de seguridad:** El descuento total acumulado no puede exceder el 20% (`descuentoMaximo`).
- **Salida esperada:**
  ```text
  Subtotal: 162000
  El descuento de 30 % supera el máximo; se aplica 20 %
  Descuento: 32400 · TOTAL A PAGAR: 129600
  Motivos: compra mayor a 150.000 (10 %), cupón CUMPLE (15 %), cliente frecuente (5 %)
  ```

---

### Ejercicio 04: Gestión de Devoluciones y Ajuste de Venta
📂 Archivo: [`ejercicio_04.dart`](file:///C:/Users/Cohorte%205/IdeaProjects/EjerciciosRestaurante/ejercicio_04.dart)

Gestiona la cancelación o devolución parcial/total de productos de una comanda ya registrada, garantizando control administrativo.

- **Conceptos aplicados:** Modificación de mapas en caliente (`remove`, actualización de valores por clave), validaciones lógicas compuestas, bitácora de auditoría en listas.
- **Reglas de negocio:**
  - Valida que el producto exista en la venta original.
  - Valida que la cantidad a devolver sea mayor a 0 y no supere la cantidad previamente facturada.
  - Control de seguridad: devoluciones con importe superior a $30.000 requieren obligatoriamente `autorizadoPorAdmin = true`.
  - Descuenta las unidades devueltas de la venta y recalcula el nuevo total neto a cobrar.
- **Salida esperada:**
  ```text
  Total original: 85000
  Devolución registrada: 5000
  Venta actualizada: {Sancocho: 2, Gaseosa: 2, Postre del día: 2}
  Nuevo total: 80000
  Devoluciones: [1 x Gaseosa (Producto en mal estado): 5000]
  ```

---

### Ejercicio 05: Cierre y Arqueo de Caja
📂 Archivo: [`ejercicio_05.dart`](file:///C:/Users/Cohorte%205/IdeaProjects/EjerciciosRestaurante/ejercicio_05.dart)

Consolida todas las transacciones del turno, realiza el cálculo de métricas financieras y efectúa el arqueo de caja física.

- **Conceptos aplicados:** Listas paralelas sincronizadas por índice, agregación en mapas (`porMedio`), bucles `for`, estadísticas descriptivas (suma, máximo, promedio con `.toStringAsFixed()`), cálculo de fórmulas contables.
- **Reglas de negocio:**
  - Acumula las ventas individuales clasificadas por medio de pago (`efectivo`, `debito`, `credito`).
  - Obtiene el total facturado, número de órdenes, ticket máximo y ticket promedio.
  - Consolida los egresos o gastos menores pagados con dinero de la caja.
  - Calcula el efectivo esperado en caja:
    $$\text{Efectivo Esperado} = \text{Base Inicial} + \text{Ventas en Efectivo} - \text{Total Egresos}$$
  - Compara el efectivo esperado con el conteo físico (`efectivoContado`) para determinar si la caja está cuadrada, o si presenta faltante o sobrante.
- **Salida esperada:**
  ```text
  Ventas en efectivo: 137000 · débito: 211000 · crédito: 76000
  Total vendido: 424000 (6 ventas) · Venta mayor: 120000 · Promedio: 70667
  Egresos: 35000
  Efectivo esperado: 302000 · Efectivo contado: 300000
  Faltante de 2000
  ```

---

## 🚀 Cómo Ejecutar los Ejercicios

Puedes ejecutar cualquiera de los scripts individualmente abriendo la terminal en la raíz del proyecto:

```bash
# Ejercicio 01
dart ejercicio_01.dart

# Ejercicio 02
dart ejercicio_02.dart

# Ejercicio 03
dart ejercicio_03.dart

# Ejercicio 04
dart ejercicio_04.dart

# Ejercicio 05
dart ejercicio_05.dart
```

O ejecutar todos consecutivamente en PowerShell:

```powershell
dart ejercicio_01.dart ; dart ejercicio_02.dart ; dart ejercicio_03.dart ; dart ejercicio_04.dart ; dart ejercicio_05.dart
```
