-- 4. Total de Consultas Realizadas por Médico

SELECT
    medicos.nome_medico,
    SUM(consultas.valor_consulta) AS total_consultas
FROM medicos
INNER JOIN consultas
    ON medicos.id_medico = consultas.id_medico
WHERE consultas.status_consulta IN ('Realizada', 'Finalizada')
GROUP BY medicos.id_medico, medicos.nome_medico;