-- 9. Medicamentos Prescritos por Médico em Consultas Realizadas 

SELECT
    medicos.nome_medico,
    consultas.status_consulta,
    COUNT(prescricoes.id_prescricao) AS total_prescricoes
FROM prescricoes
INNER JOIN consultas
    ON prescricoes.id_consulta = consultas.id_consulta
INNER JOIN medicos
    ON consultas.id_medico = medicos.id_medico
WHERE consultas.status_consulta = 'Realizada'
GROUP BY
    medicos.id_medico,
    medicos.nome_medico,
    consultas.status_consulta;