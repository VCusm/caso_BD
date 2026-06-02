# Lista de tareas y notas para saber que falta en el trabajo UwU

## NOTAS
- cambie NOT NULL que estaba en la tabla personas equipo, por DEAFULT NULL, para que no tire error al poblar la BD
- hice una modificación en el poblamiento de 4 lineas para desactivar la verificacion de claves foraneas y se pueda cargar sin tirar error. (tira error los TRUNCATE)

---

## Tareas
- [x] poblacion de datos
- [x] conexion con power bi
- [] dashboar 1
- [] dashboard 2
- [] respaldo BD

---

## Carpetas tareas

### BD
- [] .sql con script de respaldo para restaurar la BD
    - [] respaldo estructura
    - [] respaldo datos
    - [] refresca Power BI

---

### PBI
- de la recomendación de la tarea:
    - [] concetar alguna vista vista

- [] .pbix con dashboard 1 (Control general de postulaciones y presupuesto)
    - Encabezado (sección A: Encabezado - Filtros (Slicers))
    - [x] Año/mes
    - [x] sede/campus
    - [x] region de ejecución
    - [x] tipo iniciativa
    - [x] convenio
    - [x] tamaño empresa

    - Tarjetas
    - [x] todas las tarjetas

    - Gráficos
    - [x] 1
    - [x] 2
    - [x] 3
    - [x] 4

    - Tabla Detalle
    - [x] codigo postulacion
    - [x] fecha
    - [x] iniciativa
    - [] empresa
    - [x] sede
    - [x] region de impacto
    - [x] region de ejecución
    - [x] tipo iniciativa
    - [] convenio
    - [x] presupuesto

--- 

- [] .pbix con dashboard 2
    - [x] seccion A
    - [x] Seccion B
    - [] Seccion C
        - [] Tabla
    - [] especificaciones mínimas
- [] abre sin errores
- [] permite refrescar
- requisitos obligatorios:
    - [] revisar/crear relaciones para el funcionamiento de los gráficos
    - [] filtros funcionando para las visualizaciones

---

### PDF
- [] pdf explicando el modelo de datos power BI
- [] capturas ambos dashboard con una explicación de qué deciciones permite tomar 