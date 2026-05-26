-- QUERY 
-- tipo de iniciativa = ai.nombreIniciativa ?
-- NOTA: ver UML N°2 para comprender mejor :)
SELECT 
    ap.postulacionNum AS "Postulación N°", 
    ap.fecha, 
    ai.nombreIniciativa AS "Tipo Iniciativa (nombre iniciativa)", 
    s.sede, 
    r1.region AS "Región ejecución", 
    r2.region AS "Región impacto", 
    e.nombre AS "Empresa (nombre)", 
    pi.presupuesto
FROM PostulacionIniciativaCT pi
JOIN AntecedentePostulacion ap ON pi.FKpostulacionNum=ap.postulacionNum -- para ap.fecha
JOIN AntecedenteIniciativa ai ON pi.FKiniciativa=ai.PKiniciativa
JOIN Sedes s ON ap.idSede=s.idSede
JOIN Regiones r1 ON ap.idRegionEjecucion=r1.idRegion
JOIN Regiones r2 ON ap.idRegionImpacto=r2.idRegion
JOIN Empresa e ON pi.FKrutEmpresa=e.rutEmpresa
ORDER BY ap.postulacionNum;

-- QUERY 2
SELECT
    e.nombre AS "Empresa nombre",
    s.sede,
    pi.presupuesto AS "Presupuesto [USD]"
FROM PostulacionIniciativaCT pi
JOIN AntecedentePostulacion ap ON pi.FKpostulacionNum=ap.postulacionNum
JOIN Empresa e ON pi.FKrutEmpresa=e.rutEmpresa
JOIN Sedes s ON ap.idSede=s.idSede
JOIN Regiones r ON ap.idRegionEjecucion=r.idRegion;

-- QUERY 3
SELECT 
    SUM(iniciativaEsNueva) AS "N° Postulaciones nuevas",
    COUNT(*) AS "N° Postulaciones existentes" 
FROM AntecedentePostulacion;

-- QUERY 4
SELECT
    pe.rut,
    pe.nombre,
    tp.tipoPersona,
    s.sede,
    pe.eMail,
    pe.rolQueCumple
FROM PostulacionIniciativaCT AS pi
JOIN EquipoTrabajo et ON pi.FKequipo=et.PKequipo
JOIN PersonaEquipo pe ON et.PKequipo=pe.FKequipo
JOIN TipoPersona tp ON pe.idTipoPersona=tp.idTipoPersona
JOIN Sedes s ON pe.idSede=s.idSede
WHERE pi.FKpostulacionNum=1 -- Cambiar el número de acuerdo a la postulación que se quiera mostrar (del 1 al 10)
ORDER BY tp.idTipoPersona;

-- QUERY 5
-- Se toma el supuesto de que el orden de mayor a menor es con respecto a la columna del n° de postulaciones asociadas
SELECT 
    e.nombre AS "(opcional) nombre",
    te.tamañoEmpresa,
    e.convenio,
    (SELECT COUNT(*) FROM PostulacionIniciativaCT pi WHERE pi.FKrutEmpresa=e.rutEmpresa) AS "N° Postulaciones asociadas"
FROM Empresa e
JOIN TamañoEmpresa te ON e.idTamañoEmpresa=te.idTamañoEmpresa
ORDER BY (SELECT COUNT(*) FROM PostulacionIniciativaCT pi WHERE pi.FKrutEmpresa=e.rutEmpresa) DESC, e.convenio DESC;

-- QUERY 6 (se deduce que el ordenado de mayor a menor es según presupuesto)
SELECT 
    ap.postulacionNum,
    e.nombre,
    pi.presupuesto
FROM PostulacionIniciativaCT pi
JOIN AntecedentePostulacion ap ON pi.FKpostulacionNum=ap.postulacionNum
JOIN Empresa e ON pi.FKrutEmpresa=e.rutEmpresa
WHERE pi.presupuesto > (SELECT AVG(presupuesto) FROM PostulacionIniciativaCT)
ORDER BY pi.presupuesto DESC;

-- QUERY 7
SELECT 
    pi.FKpostulacionNum AS "Postulación N°",
    tp.tipoPersona
FROM PostulacionIniciativaCT pi
JOIN EquipoTrabajo et ON et.PKequipo=pi.FKequipo
JOIN PersonaEquipo pe ON pe.FKequipo=et.PKequipo 
JOIN TipoPersona tp ON tp.idTipoPersona=pe.idTipoPersona
ORDER BY pi.FKpostulacionNum, tp.idTipoPersona DESC;

-- QUERY 8 (malo)
SELECT
    pi.FKpostulacionNum AS "Postulación N°",
    (SELECT COUNT(*) FROM TipoPersona tp WHERE tp.idTipoPersona=2) AS "Cantidad Profesores",
    (SELECT COUNT(*) FROM TipoPersona tp WHERE tp.idTipoPersona=1) AS "Cantidad Estudiantes"
FROM PostulacionIniciativaCT pi
JOIN EquipoTrabajo et ON et.PKequipo=pi.FKequipo
JOIN PersonaEquipo pe ON pe.FKequipo=et.PKequipo
JOIN TipoPersona tp ON tp.idTipoPersona=pe.idTipoPersona
GROUP BY pi.FKpostulacionNum
HAVING `Cantidad Profesores` < 2 OR `Cantidad Estudiantes` < 5
ORDER BY pi.FKpostulacionNum;

-- QUERY 9
SELECT 
    e.nombre, 
    e.rutEmpresa, 
    te.tamañoEmpresa
FROM Empresa e
LEFT JOIN postulacioniniciativact pi ON e.rutEmpresa=pi.FKrutEmpresa
JOIN TamañoEmpresa te ON e.idTamañoEmpresa=te.idTamañoEmpresa
WHERE pi.FKrutEmpresa IS NULL;

-- QUERY 10
SELECT 
    ap.postulacionNum AS "Postulación N°",
    ap.codigo AS "Código interno",
    (SELECT COUNT(*) FROM Etapa et WHERE et.FKcronograma=c.PKcronograma) AS "Total de etapas",
    (SELECT SUM(plazoSemanas) FROM Etapa et WHERE et.FKcronograma=c.PKcronograma) AS "Cantidad semanas"
FROM PostulacionIniciativaCT pi
JOIN AntecedentePostulacion ap ON pi.FKpostulacionNum=ap.postulacionNum
JOIN Cronograma c ON pi.FKcronograma=c.PKcronograma
HAVING `Cantidad semanas` > 36
ORDER BY `Cantidad semanas` DESC, `Total de etapas` DESC;
