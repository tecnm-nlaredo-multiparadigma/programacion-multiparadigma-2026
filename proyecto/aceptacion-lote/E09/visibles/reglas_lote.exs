%{
    tarifa_km: 4000,
    cuota_puente: %{comercio_mundial: 43000, colombia: 31000},
    descuento: %{umbral_kg: 8000, pct: 10, criterio: :a_partir_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 10, fija: 0},
      peligrosa: %{pct: 30, fija: 90000},
      sobredimensionada: %{pct: 35, fija: 120_000}
    },
    base_recargo: :flete,
    minimo: 430_000,
    peso_maximo_kg: 34000
  }
