### CAZUELA

![CAZUELA](https://user-images.githubusercontent.com/59061779/94367297-0d407580-00de-11eb-94ae-a6b6ce39545b.png)

Un Script sencillito para trabajar sin necesidad de abrir o ejecutar tantas herramientas. Incluye 3 formas de pentesting, completamente amigable para todo aquel que quiera realizar un pequeño reconocimiento a nivel web o directamente para red interna.

- ### **MODULO 1** 
En la primera opción tenemos la función de realizar un "escuchador" para diferentes plataformas, ya sea para payloads Windows, Linux y PHP con el framework metasploit todo completamente automatizado, solo es necesario el "**PUERTO**" por el cual se realizara la escucha. También tenemos la función de realizarlo completamente con Netcat. 

![escuchador](https://user-images.githubusercontent.com/59061779/94367996-2519f880-00e2-11eb-9211-16f025a9f3ba.png)

- ### **MODULO 2** 
En la segunda opción nos encontramos con la función de "reconocimiento" donde solo ingresando el objetivo (dominio,subdominio,ip,etc) obtendremos un reporte de vulnerabilidades a nivel de validaciones y malas practicas. Obtendrás resultados de:

`1. `**Información del servidor** (versiones, frameworks, whois, ip, etc).
`2. `**Detección de Balanceador de carga** (para la verificación de consultas masivas).
`3. `**Estado de TLS Activados** (para verificar los TLS activados para su posterior sniffing).
`4. `**Detección de WAF** (Conocer si existe un Firewall de Aplicaciones).
`5. `**Validación de Cabeceras de seguridad** (Con esto nos hacemos una idea del estado de seguridad del objetivo).
`6. `**Estado de Puertos** (realizaremos la verificación de los puertos abiertos para verificar posibles puntos de entrada).
`7. `**Directorios Activos** (conoceremos que directorios se encuentran expuestos para obtener mas información).


- ### **MODULO 3**
En la tercera opción nos encontramos con la función de "escanner de exploit LAN" donde su función es conocer que "IP,HOST o SERVIDOR" son vulnerables a los exploit mas comunes en las empresas, tales como son: 

`1. `**MS17-010 EternalBlue SMB Remote Windows Kernel Pool Corruption**
`2. `**Microsoft IIS WebDav ScStoragePathFromUrl Overflow**
`3. `**MS08-067 Microsoft Server Service Relative Path Stack Corruption** 
