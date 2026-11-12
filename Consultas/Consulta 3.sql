-- 3. Valor Médio das Diárias por Tipo de Quarto 

SELECT
    quartos.tipo_quarto,
    ROUND(AVG(internacoes.valor_diaria), 2) AS media_diaria
FROM quartos
INNER JOIN internacoes
    ON quartos.id_quarto = internacoes.id_quarto
WHERE quartos.tipo_quarto IN ('Apartamento', 'UTI')
GROUP BY quartos.tipo_quarto;