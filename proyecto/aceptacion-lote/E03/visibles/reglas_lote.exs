%{
    tarifa_km: 3900,
    cuota_puente: %{comercio_mundial: 52000, colombia: 33500},
    descuento: %{umbral_kg: 12000, pct: 6, criterio: :a_partir_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 12, fija: 15000},
      peligrosa: %{pct: 25, fija: 50000},
      sobredimensionada: %{pct: 45, fija: 120_000}
    },
    base_recargo: :flete,
    minimo: 380_000,
    peso_maximo_kg: 30000
  }
