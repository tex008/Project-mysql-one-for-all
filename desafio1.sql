DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plano VARCHAR(18) NOT NULL,
    valor_plano DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
	data_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
   artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
   album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(50) NOT NULL,
   artista_id INT NOT NULL,
   ano_lancamento INT NOT NULL,
   FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios_artistas(
   usuario_id INT NOT NULL,
   artista_id INT NOT NULL,
   PRIMARY KEY (usuario_id, artista_id),
   FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
   FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
	cancao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    duracao_segundos INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducoes(
    data_reproducao DATETIME NOT NULL,
    cancao_id INT NOT NULL,
    usuario_id INT NOT NULL,
    PRIMARY KEY (usuario_id,cancao_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
) engine = InnoDB;



INSERT INTO SpotifyClone.planos (plano, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.usuarios (usuario, idade, plano_id, data_assinatura)
VALUES
  ('Thati', 23, 1, '2019-10-20'),
  ('Cintia', 35, 2, '2017-12-30'),
  ('Bill', 20, 3, '2019-06-05'),
  ('Roger', 45, 4, '2020-05-13'),
  ('Norman', 58, 4, '2017-02-17'),
  ('Patrick', 33, 2, '2017-01-06'),
  ('Vivian', 26, 3, '2018-01-05'),
  ('Carol', 19, 3, '2018-02-14'),
  ('Angelina', 42, 2, '2018-04-29'),
  ('Paul', 46, 2, '2017-01-17');
  
INSERT INTO SpotifyClone.artistas (nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.albuns (nome, artista_id, ano_lancamento)
VALUES
  ('Envious', 1, 1990),
  ('Exuberant', 1, 1993),
  ('Hallowed Steam', 2, 1995),
  ('Incandescent', 3, 1998),
  ('Temporary Culture', 4, 2001),
  ('Library of liberty', 4, 2003),
  ('Chained Down', 5, 2007),
  ('Cabinet of fools', 5, 2012),
  ('No guarantees', 5, 2015),
  ('Apparatus', 6, 2015);
  
INSERT INTO SpotifyClone.usuarios_artistas (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 1),
  (6, 3),
  (6, 6),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 3),
  (9, 4),
  (9, 6),
  (10, 2),
  (10, 6);
  
INSERT INTO SpotifyClone.cancoes (nome, artista_id,album_id, duracao_segundos)
VALUES
  ('Baby', 6, 10, 136),
  ('Celebration Of More', 3, 4, 146),
  ('Dance With Her Own', 1,  1, 116),
  ('Diamond Power', 3, 4, 241),
  ('Fantasy For Me', 3, 4, 100),
  ('Finding My Traditions', 5, 7, 179),
  ('Hard And Time',	5, 7, 135),
  ("He Heard You're Bad For Me", 5, 8, 154),
  ("He Hopes We Can't Stay", 5, 8, 210),
  ("He's Trouble", 5, 9, 138),
  ("He's Walking Away", 5, 9, 159),
  ('History Of My Roses', 4, 6, 222),
  ('Home Forever', 3, 4, 231),
  ('Honey', 6, 10, 79),
  ("Honey, I'm A Lone Wolf", 5, 7, 150),
  ("Honey, So Do I", 2, 3, 207),
  ('I Heard I Want To Bo Alone', 5, 9, 120),
  ('I Know I Know', 5, 8, 117),
  ('I Ride Alone', 5, 9, 151),
  ("Let's Be Silly", 3, 4, 132),
  ('Magic Circus', 2, 3, 105),
  ('Need Of The Evening', 4, 6, 190),
  ('Reflections Of Magic', 1, 1, 163),
  ('Rock His Everything', 3, 4, 223),
  ('She Knows', 2, 3, 244),
  ("She Thinks I Won't Stay Tonight", 5, 8, 166),
  ('Soul For Us', 1, 1, 200),
  ("Sweetie, Let's Go Wild", 2, 3, 139),
  ('Thang Of Thunder', 4, 5, 240),
  ('Time Fireworks', 1, 2, 152),
  ('Troubles Of My Inner Fire', 1, 2, 203),
  ('Walking And Game', 4, 6, 123),
  ('Walking And Man', 5, 7, 229),
  ('Without My Love', 4, 6, 111),
  ('Without My Streets', 4, 5, 176),
  ('Words Of Her Life', 4, 5, 185),
  ("Wouldn't It Be Nice", 6, 10, 213),
  ('You Cheated On Me', 6, 10, 95),
  ('You Make Me Feel So..', 6, 10, 83),
  ('Young And Father', 4, 6, 197);

INSERT INTO SpotifyClone.historico_reproducoes (data_reproducao,  cancao_id, usuario_id)
VALUES
	('2020-02-28 10:45:55', 14, 1),
	('2020-05-02 05:30:35', 33, 1),
	('2020-03-06 11:22:33', 40, 1),
	('2020-08-05 08:05:17', 4, 1),
	('2020-09-14 16:32:22', 20, 1),
	('2020-01-02 07:40:33', 17, 2),
	('2020-05-16 06:16:22', 6, 2),
	('2020-10-09 12:27:48', 34, 2),
	('2020-09-21 13:14:46', 1, 2),
	('2020-11-13 16:55:13', 21, 3),
	('2020-12-05 18:38:30', 3, 3),
	('2020-07-30 10:00:00', 7, 3),
	('2021-08-15 17:10:10', 23, 4),
	('2021-07-10 15:20:30', 19, 4),
	('2021-01-09 01:44:33', 15, 4),
	('2020-07-03 19:33:28', 16, 5),
	('2017-02-24 21:14:22', 24, 5),
	('2020-08-06 15:23:43', 4, 5),
	('2020-11-10 13:52:27', 27, 5),
	('2019-02-07 20:33:48', 37, 6),
	('2017-01-24 00:31:17', 8, 6),
	('2017-10-12 12:35:20', 9,6),
	('2018-05-29 14:56:41', 32, 6),
	('2018-05-09 22:30:49', 30, 7),
	('2020-07-27 12:52:58', 31, 7),
	('2018-01-16 18:40:43', 2, 7),
	('2018-03-21 16:56:40', 1, 8),
	('2020-10-18 13:38:05', 39, 8),
	('2019-05-25 08:14:03', 11, 8),
	('2021-08-15 21:37:09', 10, 8),
	('2021-05-24 17:23:45', 29, 9),
	('2018-12-07 22:48:52' , 36, 9),
	('2021-03-14 06:14:26', 28, 9),
	('2020-04-01 03:36:00', 25, 9),
	('2017-02-06 08:21:34', 12, 10),
	('2017-12-04 05:33:43', 34, 10),
	('2017-07-27 05:24:49', 24, 10),
	('2017-12-25 01:03:57', 13, 10);

