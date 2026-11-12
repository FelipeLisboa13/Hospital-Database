-- 1. Faturamento Total de Consultas por Convênio

SELECT
    pacientes.nome_paciente,
    pacientes.convenio,
    COALESCE(SUM(consultas.valor_consulta), 0) AS faturamento_total
FROM pacientes
LEFT JOIN consultas
    ON pacientes.id_paciente = consultas.id_paciente
WHERE pacientes.convenio LIKE '%Saúde%'
GROUP BY pacientes.id_paciente, pacientes.nome_paciente, pacientes.convenio;

