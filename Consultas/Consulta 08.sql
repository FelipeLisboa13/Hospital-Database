-- 8. Média de Diária de Internação por Convênio em Quartos de UTI

SELECT
    pacientes.convenio,
    quartos.tipo_quarto,
    ROUND(AVG(internacoes.valor_diaria), 2) AS media_diaria
FROM internacoes
INNER JOIN pacientes
    ON internacoes.id_paciente = pacientes.id_paciente
INNER JOIN quartos
    ON internacoes.id_quarto = quartos.id_quarto
WHERE quartos.tipo_quarto = 'UTI'
GROUP BY
    pacientes.convenio,
    quartos.tipo_quarto;