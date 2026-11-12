-- 5. Soma de Diárias por Paciente com Sobrenome "Silva"

SELECT
    pacientes.nome_paciente,
    SUM(internacoes.valor_diaria) AS total_diarias
FROM pacientes
INNER JOIN internacoes
    ON pacientes.id_paciente = internacoes.id_paciente
WHERE pacientes.nome_paciente LIKE '%Silva'
GROUP BY pacientes.id_paciente, pacientes.nome_paciente;