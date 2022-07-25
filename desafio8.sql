SELECT 
    art.nome AS artista,
    alb.nome AS album
FROM
    SpotifyClone.albuns AS alb
    INNER JOIN SpotifyClone.artistas AS art
    ON alb.artista_id = art.artista_id
    WHERE art.nome = 'Walter Phoenix';
