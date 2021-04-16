# Descripcion
Módulo para mostrar los valores en 4 display de 7 segmentos.

# Dependencias
Agregar los siguientes archivos al proyecto de VIVADO:
```bash
sweep4disp7seg/src/sweep4disp7seg.v
countCompare/src/countCompare.v
```

# Descripcion de entradas/salida
- **input clk** - señal de reloj del fpga, en la basys 3 es de 100 MHz
- **input rst** - señal de reset, activa en bajo
- **input [3:0] disp0** - valor en binario para desplegar en el display 0
- **input [3:0] disp1** - valor en binario para - desplegar en el display 1
- **input [3:0] disp2** - valor en binario para desplegar en el display 2
- **input [3:0] disp3** - valor en binario para desplegar en el display 3
- **output reg [7:0] seg** - valores de los segmentos de los display
- **output reg [3:0] dispTrans** - selección del display que le corresponden los valores enviados por la salida seg

# Observación
Para utilizar en la Basys 3, y con la asignacion de pines que se adjunta, utilizar el archivo `sweep4disp7seg/src/sweep4disp7segBasys3.v` como top, con el fin de utilizar un _push button_ para el reset
