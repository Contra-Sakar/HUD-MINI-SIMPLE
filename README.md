# HUD MINI SIMPLE
El **HUD MINI SIMPLE** es algo que cree para mi.
Lo cree para mi contenido de YouTube.
Pero estare escuchando y leyendo si quieren que agregue algo al HUD.

# Configuración del Script

Este documento explica de manera simple qué hace cada configuración y opción dentro del script, utilizando descripciones claras para facilitar su comprensión.

---

## **Ajustes de Personalización**
### Opciones generales para personalizar el HUD y otras funcionalidades:

- **`IconAnim`**  
  Controla si los iconos tienen animación.  
  *Por defecto*: `false`.

- **`IconAnimExtra`**  
  Añade animaciones adicionales a los iconos.  
  *Por defecto*: `true`.

- **`MiddlescrollON`**  
  Habilita un HUD personalizado para el modo middlescroll.  
  *Por defecto*: `true`.

- **`MiddleScrollToggle`**  
  Permite desactivar el modo middlescroll.  
  *Por defecto*: `false`.

- **`HideBotplayTxt`**  
  Oculta el texto que indica que el modo botplay está activo.  
  *Por defecto*: `true`.

- **`CoverMode`**  
  Activa un modo "Cover" que reduce la opacidad del HUD y activa automáticamente el botplay.  
  *Por defecto*: `false`.

---

## **ScoreMini**
### Configuración del marcador reducido:

- **`ScoreTxtMini`**  
  Activa el marcador reducido para mostrar puntuación y fallos.  
  *Por defecto*: `true`.

- **`TimeScoreMini`**  
  Establece el tiempo que tarda en actualizarse el marcador reducido.  
  *Por defecto*: `0.4`.

- **`ColorScoreMini`**  
  Define el color del marcador reducido al ganar puntos.  
  *Por defecto*: `00FF00` *(Verde, formato HEX)*.

---

## **Ayuda de Eventos**
### Información sobre eventos en tiempo real:

- **`InfoEvent`**  
  Muestra qué evento se está usando junto con sus valores de configuración (`Value1`, `Value2`).  
  *Por defecto*: `false`.

- **`TextoFont`**  
  Fuente utilizada para el texto de los eventos (`InfoEvent`).  
  *Por defecto*: `MAHAWA__.TTF`.

---

## **Escala de Cámaras**
### Configuración para modificar la escala de las cámaras:

- **`CamScale`**  
  Activa o desactiva el aumento de escala en las cámaras.  
  *Por defecto*: `false`.

- **`CamerasScale`**  
  Lista de cámaras que se verán afectadas por los cambios de escala.  
  *Por defecto*: `{'camGame','camHUD','camOther'}`.

- **`CamScaleX`**  
  Escala horizontal de las cámaras.  
  *Por defecto*: `1.05`.

- **`CamScaleY`**  
  Escala vertical de las cámaras.  
  *Por defecto*: `1.03`.

---

## **Reducción de Salud del Oponente**
### Configuración para ajustar la reducción de salud del oponente:

- **`healthOp`**  
  Activa o desactiva la reducción de salud del oponente.  
  *Por defecto*: `true`.

- **`QuitaV`**  
  Cantidad de vida que pierde el oponente por nota fallada.  
  *Por defecto*: `0.012`.

- **`LimiteDeVida`**  
  Reducción máxima de salud permitida.  
  *Por defecto*: `0.4`.

- **`PocaVida`**  
  Hace que el icono del jugador parpadee si la salud está por debajo de `0.4`.  
  *Por defecto*: `true`.

---

## **CamFollow**
### Configuración para personalizar el seguimiento de la cámara:

- **`CustomCam`**  
  Activa una posición personalizada para la cámara. Si está desactivado, utiliza la posición predeterminada de los personajes.  
  *Por defecto*: `false` *(Beta)*.

- **`FlipDadX`**  
  Cambia cómo se mueve la cámara horizontalmente al presionar izquierda o derecha.  
  *Por defecto*: `false`.

- **`IndividualOffsets`**  
  Permite usar offsets individuales para cada personaje.  
  *Por defecto*: `false`.

- **`GeneralOffset`**  
  Offset general aplicado a todos los personajes si `IndividualOffsets` está desactivado.  
  *Por defecto*: `20`.

- **`AngleSwitch`**  
  Activa la inclinación de la cámara.  
  *Por defecto*: `false`.

- **`angleTime`**  
  Velocidad de inclinación de la cámara.  
  *Por defecto*: `1`.

- **`followCharacters`**  
  Activa el seguimiento de los personajes con la cámara.  
  *Por defecto*: `true`.

- **`cameraSpeed`**  
  Velocidad de movimiento de la cámara al seguir personajes.  
  *Por defecto*: `1`.

---

## **Posiciones de las Cámaras**
### Configuración para posicionar cámaras (requiere `CustomCam` activado):

- **Oponente (`camX_opponent`, `camY_opponent`)**  
  Posición: `600`, `600`.

- **Jugador (`camX_player`, `camY_player`)**  
  Posición: `700`, `600`.

- **Novia (`camX_gf`, `camY_gf`)**  
  Posición: `650`, `450`. *(Puede fallar en Psych Engine 0.7.3)*.

---

## **Offsets de las Cámaras**
### Límites de desplazamiento de las cámaras al seguir personajes:

- **Oponente (`offset_opponent`)**  
  *Por defecto*: `25`.

- **Jugador (`offset_player`)**  
  *Por defecto*: `20`.

- **Novia (`offset_gf`)**  
  *Por defecto*: `25`.

---

## **Ángulos Generales**
### Configuración de inclinación de la cámara:

- **`angle_left`**  
  Inclinación al presionar izquierda.  
  *Por defecto*: `5`.

- **`angle_right`**  
  Inclinación al presionar derecha.  
  *Por defecto*: `-5`.

- **`angle_up`**  
  Inclinación al presionar arriba.  
  *Por defecto*: `0`.

- **`angle_down`**  
  Inclinación al presionar abajo.  
  *Por defecto*: `0`.
