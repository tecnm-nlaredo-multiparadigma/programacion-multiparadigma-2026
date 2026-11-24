CREATE TABLE embarques (
  orden INTEGER PRIMARY KEY,
  id TEXT NOT NULL UNIQUE,
  puente TEXT NOT NULL,
  tipo TEXT NOT NULL,
  numero_un TEXT,
  total_centavos INTEGER,
  motivo TEXT,
  CHECK ((total_centavos IS NULL) <> (motivo IS NULL))
);

INSERT INTO embarques VALUES
  (1, 'A01', 'comercio_mundial', 'general', NULL, 180500, NULL),
  (2, 'A02', 'colombia', 'peligrosa', NULL, NULL, 'falta_numero_un'),
  (3, 'A03', 'colombia', 'refrigerada', NULL, 250000, NULL),
  (4, 'A04', 'comercio_mundial', 'peligrosa', '1203', 325000, NULL),
  (5, 'A05', 'comercio_mundial', 'sobredimensionada', NULL, NULL, 'falta_permiso'),
  (6, 'A06', 'colombia', 'general', NULL, 115000, NULL),
  (7, 'A07', 'comercio_mundial', 'peligrosa', NULL, NULL, 'falta_numero_un'),
  (8, 'A08', 'colombia', 'general', NULL, NULL, 'peso_invalido');
