# Proyecto 5 - Monitoreo de Usuarios Activos

## 🎯 Objetivo
Crear un script que supervise la cantidad de usuarios conectados al sistema y registre la actividad. El script debe validar si el número de sesiones activas supera un umbral definido y escribir un log con el resultado.

## 📌 Requisitos mínimos
- El script recibe **1 parámetro obligatorio**: umbral de usuarios conectados (entero).  
  - Si falta, mostrar uso y salir con `exit 1`.
- Contar cuántos usuarios hay conectados (por ejemplo, con `who` o `users` + `wc -l`).
- Si el número de usuarios es **mayor** al umbral, registrar en `/var/log/user_monitor.log` la línea:  
  `fecha | usuarios_conectados | ESTADO: ALERTADO`  
  y salir con `exit 2`.
- Si el número de usuarios es **menor o igual** al umbral, registrar:  
  `fecha | usuarios_conectados | ESTADO: OK`  
  y salir con `exit 0`.

## 🔧 Extra
- Incluir en el log el detalle de los usuarios conectados (nombre, TTY, hora de login).
- Aceptar un **segundo parámetro opcional**: nombre de usuario.  
  - Si se pasa, verificar si ese usuario está conectado y registrar:  
    `USUARIO <nombre> CONECTADO` o `USUARIO <nombre> NO CONECTADO`.
- Registrar igualmente cuando **no haya usuarios conectados**.

## 📦 Entregables
- Script: `monitor_usuarios.sh`.
- Log de ejecución: `/var/log/user_monitor.log`.
- Ejemplos de ejecución:
  - `./monitor_usuarios.sh 2`
  - `./monitor_usuarios.sh 3 root`
