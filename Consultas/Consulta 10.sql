-- 10. Valor Total e Média de Consultas por Paciente

SELECT
    pacientes.nome_paciente,
    SUM(consultas.valor_consulta) AS total_gasto,
    ROUND(AVG(consultas.valor_consulta), 2) AS media_gasto
FROM pacientes
INNER JOIN consultas
    ON pacientes.id_paciente = consultas.id_paciente
WHERE pacientes.nome_paciente LIKE 'M%'
GROUP BY
    pacientes.id_paciente,
    pacientes.nome_paciente;