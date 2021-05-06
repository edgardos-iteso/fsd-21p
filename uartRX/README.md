# Descripcion
Módulo para recibir datos a través de un puerto serie (UART 9600 8n1)

# Dependencias
Agregar los siguientes archivos al proyecto de VIVADO:
```bash
bin7seg/src/bin7segLUT.v
countCompare/src/countCompare.v
uartRX/src/uartRX.v
uartRX/src/uartRXBasys3.v
```

# Descripcion de entradas/salida
- **input clk** - señal de reloj del fpga, en la basys 3 es de 100 MHz
- **input btnD** - señal de reset
- **input RsRx** - recepcion de dato serial
- **ouput seg** - valores de los 7 segmentos del display
- **output dp** - valor del punto en los display
- **output an** - selector de display
- **output led** - señal de estatus del receptor de uart, 0 - done y 1 - busy

# Observación
Para utilizar en la Basys 3, y con la asignacion de pines que se adjunta, utilizar el archivo `suartRX/src/uartRXBasys3.v` como top
