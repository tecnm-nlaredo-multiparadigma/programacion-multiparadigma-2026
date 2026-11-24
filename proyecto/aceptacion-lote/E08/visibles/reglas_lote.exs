%{
    tarifa_km: 2700,
    cuota_puente: %{comercio_mundial: 50500, colombia: 39500},
    descuento: %{umbral_kg: 15000, pct: 6, criterio: :mas_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 15, fija: 25000},
      peligrosa: %{pct: 30, fija: 50000},
      sobredimensionada: %{pct: 35, fija: 120_000}
    },
    base_recargo: :flete,
    minimo: 450_000,
    peso_maximo_kg: 32000
  }
