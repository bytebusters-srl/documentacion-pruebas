# Plantilla de Documentación de Pruebas (QA) - IEEE 1012-2024 & ISO 15289

## Logo
![Logo Byte Busters](assets/img/bytebusters/logo_horizontal.png)

## Insignias
[![LaTeX](https://img.shields.io/badge/LaTeX-Project-008080.svg?style=flat&logo=latex&logoColor=white)](https://www.latex-project.org/)
[![License: CC0-1.0](https://img.shields.io/badge/License-CC0_1.0-lightgrey.svg)](http://creativecommons.org/publicdomain/zero/1.0/)
[![Standard: IEEE 1012](https://img.shields.io/badge/Standard-IEEE_1012--2024-green)](https://standards.ieee.org/ieee/1012/10537/)

## Perfil de Github - Introducción
Este repositorio proporciona una infraestructura técnica en **LaTeX** diseñada para generar **Documentación de Verificación y Validación (V&V)** que cumpla estrictamente con el estándar **IEEE 1012-2024** para el ciclo de vida del software. Está optimizado para los equipos de Control de Calidad (QA) de la empresa **Byte Busters S.R.L.** en el marco de la Facultad de Ciencias y Tecnología de la UMSS.

## Características
* **Estructura V&V:** Cumple con la estructura obligatoria de pruebas: SVVP (Plan), RTM (Matriz de Trazabilidad), Casos de Prueba, Registros de Ejecución y SVVR (Resumen Final).
* **Identidad Visual para QA:** Tipografías optimizadas (Sans-serif 9pt) para alta densidad de datos en tablas y fondos condicionales semánticos (Verde para Pass, Rojo para Fail).
* **Diseño de Layout:** Márgenes de auditoría (3cm interno) con encabezados que controlan el ID del documento y el "Estado de Ejecución".
* **Componentes Especializados:** Macros visuales preconstruidas para Especificación de Casos de Prueba y Formatos de Reporte de Defectos (Bug Reports).
* **Gestión de Compilación:** Redirección automática de archivos auxiliares a la carpeta `/build` para mantener el directorio de QA limpio.

## Tecnología
* **Lenguaje de Marcado:** LaTeX.
* **Motor de Compilación:** `pdflatex` con integración del paquete `xcolor` en modo tabla.
* **Automatización:** `latexmk` para gestión de dependencias y `Makefile`.
* **Editor Sugerido:** Visual Studio Code con extensión *LaTeX Workshop*.

## Perfil de Github - Habilidades
* **Software Quality Assurance (SQA):** Verificación y Validación.
* **Testing Documentation:** IEEE 1012-2024 e ISO/IEC/IEEE 15289.
* **Typesetting:** LaTeX, Tipografía de datos masivos.
* **Project Management:** Estructura de pruebas para Taller de Ingeniería de Software (TIS).

## Instalación
Para utilizar esta plantilla localmente para redactar sus ciclos de pruebas, clona el repositorio:

```bash
git clone [https://github.com/dpardo23/manual-usuario.git](https://github.com/dpardo23/manual-usuario.git)
cd manual-usuario
```

## Corre Localmente
Utilice el `Makefile` incluido para gestionar el ciclo de vida del reporte de pruebas:

```bash
# Compilar el informe V&V completo
latexmk -pdf -outdir=build main.tex 

# Limpiar archivos temporales
make clean
```

## Ejecutando Pruebas
Para validar que el entorno soporta las tablas de colores y los iconos de fallos (`fontawesome5`), ejecute:
1. `make clean`
2. `make all`
3. Verifique la existencia del PDF generado con las celdas condicionales en `build/main.pdf`.

## Uso/Ejemplos
La plantilla incluye componentes paramétricos para facilitar la transcripción de casos de prueba de forma ágil y legible:

```latex
\begin{TablaCasoPrueba}
1 & Presionar 'Login' sin datos. & Muestra error de validación. & \estadoPass \\
\hline
\rowcolor{grisTecnico}
2 & Ingresar credenciales válidas. & Acceso al Dashboard principal. & \estadoFail \\
\hline
\end{TablaCasoPrueba}

\begin{BugReport}
ID de Defecto & BUG-2026-045 \\
\hline
\rowcolor{grisTecnico}
Severidad & Crítica \\
\hline
Evidencia & Ver captura anexa. \\
\hline
\end{BugReport}
```

## Variables de Entorno
La configuración del flujo de trabajo se define en `.latexmkrc`:
* `$out_dir = 'build'`: Todos los binarios se guardan aquí.
* `$pdf_mode = 1`: Fuerza salida en formato PDF.

## Capturas de Pantalla
El diseño final respeta la trazabilidad de control de calidad:
* **Encabezados:** Logo (Izq) y Código de Documento Único con Etiqueta de Estado (Der).
* **Pie de Página:** Espacio para la firma digital del *Experto en la Materia (SME)* y el *QA Lead*, junto a la versión del informe.
* **Estados Visuales:** Identificación inmediata de errores críticos mediante el uso intensivo de `\estadoFail` (Fondo rojo) y `\estadoPass` (Fondo verde) en tablas de ejecución.

## Documentación
El documento maestro (`main.tex`) refleja las exigencias del estándar IEEE 1012:
* **Plan (SVVP):** Metodología de pruebas y herramientas.
* **Matriz (RTM):** Trazabilidad bidireccional entre diseño y pruebas.
* **Casos de Prueba:** Especificación detallada (Pre-condiciones, Pasos, Criterios de Aceptación).
* **Logs y Bugs:** Diario cronológico de ejecución y reportes de defectos levantados.
* **Resumen (SVVR):** Dictamen final de calidad para liberación a producción.

## Hoja de Ruta
* [ ] Conexión de tablas de LaTeX con exportaciones en CSV desde Jira/Zephyr.
* [ ] Inclusión automática de métricas de cobertura de código.
* [ ] Soporte para firmas criptográficas en el pie de página.

## Optimizaciones
* **Celdas Condicionales:** Macros `\estadoPass`, `\estadoFail` y `\estadoBlocked` para automatizar el formato de tablas densas.
* **Lectura Alternada:** Implementación de fondos alternos (`\rowcolor{grisTecnico}`) para reducir fatiga visual del desarrollador al leer bugs.

## Relacionado
* Guía de Estilo IEEE 1012-2024 (Verification and Validation).

## FAQ

**¿Por qué las celdas Pass/Fail no se colorean?**
Asegúrese de que el archivo `01_packages.tex` esté cargando el paquete `xcolor` obligatoriamente con la opción de tabla: `\usepackage[table]{xcolor}`.

**¿Cómo cambio el código del documento en todas las páginas?**
Modifique el parámetro del encabezado en `config/02_layout.tex`.

## Lecciones
El desafío principal de esta iteración documental fue lograr un balance entre la densidad de datos requerida por un equipo de QA y la legibilidad visual, lo cual se resolvió migrando todo el contenido tabular a la tipografía sans-serif de 9pt.

## Autores
* **Razón Social:** Byte Busters S.R.L.
* **QA Lead / SQA:** Juan Diego Pardo Pozo
* **Consultor TIS:** Corina Justina Flores Villarroel

## Feedback y Apoyo
Para consultas sobre los casos de prueba o hallazgos reportados, contactar a: contacto.bytebusters@gmail.com.

## Licencia
Este proyecto se distribuye bajo la licencia CC0 1.0 Universal (Public Domain Dedication).
