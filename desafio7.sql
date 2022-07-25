SELECT 
    art.nome AS artista,
    alb.nome AS album,
    COUNT(usr_art.usuario_id) AS seguidores
FROM
    SpotifyClone.albuns AS alb
    INNER JOIN SpotifyClone.artistas as art
    ON alb.artista_id = art.artista_id
    INNER JOIN SpotifyClone.usuarios_artistas AS usr_art
    ON art.artista_id = usr_art.artista_id
    GROUP BY alb.nome, art.nome
    ORDER BY seguidores DESC, artista ASC, album ASC;
    