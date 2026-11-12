-- 7. Média de Valor de Consultas por Convênio e Especialidade 

SELECT
    pacientes.convenio,
    medicos.especialidade,
    ROUND(AVG(consultas.valor_consulta), 2) AS media_consultas
FROM consultas
INNER JOIN pacientes
    ON consultas.id_paciente = pacientes.id_paciente
INNER JOIN medicos
    ON consultas.id_medico = medicos.id_medico
WHERE pacientes.convenio LIKE '%Unimed%'
GROUP BY
    pacientes.convenio,
    medicos.especialidade;