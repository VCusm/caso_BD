-- Agregar a la BDD (vw al comienzo para indicar que es una vista)
CREATE OR REPLACE VIEW vw_postulaciones_detalle AS
SELECT 
	j.nombre            AS `Postulante`,
	co.nombre           AS `Evaluador`,
	ap.id 				AS `Postulación N°`, 
	ap.fecha 			AS `Fecha postulación`, 
	ai.nombreIniciativa AS `Nombre Iniciativa`, 
	s.descripcion 		AS `Sede`, 
	re.descripcion 		AS `Región ejecución`, 
	ri.descripcion 		AS `Región impacto`, 
	e.nombre 			AS `Nombre Empresa`, 
	pi.presupuesto 		AS `Presupuesto`,
	es.descripcion      AS `Estado`
FROM PostulacionIniciativaCT pi
JOIN AntecedentePostulacion ap ON pi.idAntecedentePostulacion=  ap.id
JOIN AntecedenteIniciativa  ai ON pi.idAntecedenteIniciativa=   ai.id
JOIN Jefes j                   ON ap.idJefes=                    j.id
JOIN Coordinadores co          ON ap.idCoordinadores=           co.id
JOIN Sedes s 				   ON ap.idSedes=                    s.id
JOIN Regiones re 			   ON ap.idRegionesEjecucion=       re.id
JOIN Regiones ri 			   ON ap.idRegionesImpacto=         ri.id
JOIN Empresa e 				   ON pi.idEmpresa=                  e.id
JOIN EstadoPostulacion es      ON pi.idEstadoPostulacion=       es.id
ORDER BY ap.id;
