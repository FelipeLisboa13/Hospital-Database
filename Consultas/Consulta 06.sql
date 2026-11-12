-- 6. Contagem de Prescrições por Status da Consulta 

SELECT
    pacientes.nome_paciente,
    medicos.nome_medico,
    consultas.status_consulta,
    COUNT(prescricoes.id_prescricao) AS total_prescricoes
FROM prescricoes
INNER JOIN consultas
    ON prescricoes.id_consulta = consultas.id_consulta
INNER JOIN pacientes
    ON consultas.id_paciente = pacientes.id_paciente
INNER JOIN medicos
    ON consultas.id_medico = medicos.id_medico
WHERE prescricoes.medicamento LIKE '%Dipirona%'
   OR prescricoes.medicamento LIKE '%Paracetamol%'
GROUP BY
    pacientes.id_paciente,
    pacientes.nome_paciente,
    medicos.id_medico,
    medicos.nome_medico,
    consultas.status_consulta;