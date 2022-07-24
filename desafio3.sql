SELECT 
    usr.usuario,
    COUNT(hist.usuario_id) AS qtde_musicas_ouvidas,
    ROUND((SUM(duracao_segundos) / 60),2) AS total_minutos
FROM
    SpotifyClone.usuarios AS usr
        INNER JOIN
    SpotifyClone.historico_reproducoes AS hist ON usr.usuario_id = hist.usuario_id
        INNER JOIN
    SpotifyClone.cancoes AS song ON hist.cancao_id = song.cancao_id
GROUP BY usr.usuario
ORDER BY usr.usuario ASC;