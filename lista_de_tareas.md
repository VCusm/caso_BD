# Lista de tareas y notas para saber que falta en el trabajo UwU

## NOTAS

- cambie NOT NULL que estaba en la tabla personas equipo, por DEAFULT NULL, para que no tire error al poblar la BD
- hice una modificación en el poblamiento de 4 lineas para desactivar la verificacion de claves foraneas y se pueda cargar sin tirar error. (tira error los TRUNCATE)
- Listo el respaldo en la carpeta BD, lo hice con las mismas herramientas de phpMyAdmin. Funciona perfectamente.

---

## Tareas

- [X] poblacion de datos
- [X] conexion con power bi
- [ ] dashboar 1
- [ ] dashboard 2
- [X] respaldo BD

---

## Carpetas tareas

### BD

- [X] .sql con script de respaldo para restaurar la BD

  - [X] respaldo estructura
  - [X] respaldo datos
  - [X] refresca Power BI

---

### PBI

- de la recomendación de la tarea:

  - [ ] ~~Conectar con alguna vista~~ (no usé esto)

- [ ] .pbix con dashboard 1 (Control general de postulaciones y presupuesto)

  - Encabezado (sección A: Encabezado - Filtros (Slicers))

  - [X] Año/mes
  - [X] sede/campus
  - [X] region de ejecución
  - [X] tipo iniciativa
  - [X] convenio
  - [X] tamaño empresa

  - Tarjetas

  - [X] todas las tarjetas

  - Gráficos

  - [X] 1
  - [X] 2
  - [X] 3
  - [X] 4

  - Tabla Detalle

  - [X] codigo postulacion
  - [X] fecha
  - [X] iniciativa
  - [ ] empresa
  - [X] sede
  - [X] region de impacto
  - [X] region de ejecución
  - [X] tipo iniciativa
  - [ ] convenio
  - [X] presupuesto

---

- [ ] .pbix con dashboard 2

  - [X] seccion A
  - [X] Seccion B
  - [ ] Seccion C

    - [ ] Tabla
  - [ ] especificaciones mínimas
- [ ] abre sin errores
- [ ] permite refrescar

- requisitos obligatorios:

  - [ ] revisar/crear relaciones para el funcionamiento de los gráficos
  - [ ] filtros funcionando para las visualizaciones

---

### PDF

- [ ] pdf explicando el modelo de datos power BI
- [ ] capturas ambos dashboard con una explicación de qué deciciones permite tomar
