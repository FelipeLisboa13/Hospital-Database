-- 2. Média do Valor de Consulta por Especialidade Médica


SELECT
    medicos.especialidade,
    ROUND(AVG(consultas.valor_consulta), 2) AS  media_consultas
FROM medicos
INNER JOIN consultas
    ON medicos.id_medico = consultas.id_medico
WHERE medicos.especialidade LIKE '%Cardiologia%'
GROUP BY medicos.especialidade;