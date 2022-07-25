SELECT 
    c.nome,
    COUNT(c.cancao_id) AS reproducoes
FROM
    SpotifyClone.historico_reproducoes AS h
        INNER JOIN
    SpotifyClone.cancoes AS c
    ON h.cancao_id = c.cancao_id
    INNER JOIN SpotifyClone.usuarios AS u
    ON h.usuario_id = u.usuario_id
    INNER JOIN SpotifyClone.planos AS p
    ON u.plano_id = p.plano_id
    WHERE p.plano IN ('gratuito','pessoal')
    GROUP BY c.nome;