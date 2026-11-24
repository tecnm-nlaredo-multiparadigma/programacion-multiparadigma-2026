%{
    tarifa_km: 3900,
    cuota_puente: %{comercio_mundial: 39500, colombia: 41500},
    descuento: %{umbral_kg: 8000, pct: 9, criterio: :a_partir_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 12, fija: 0},
      peligrosa: %{pct: 25, fija: 90000},
      sobredimensionada: %{pct: 35, fija: 120_000}
    },
    base_recargo: :flete,
    minimo: 440_000,
    peso_maximo_kg: 34000
  }
