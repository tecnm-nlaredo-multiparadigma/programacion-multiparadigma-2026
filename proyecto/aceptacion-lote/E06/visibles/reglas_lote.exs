%{
    tarifa_km: 4100,
    cuota_puente: %{comercio_mundial: 50500, colombia: 36000},
    descuento: %{umbral_kg: 10000, pct: 9, criterio: :mas_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 18, fija: 25000},
      peligrosa: %{pct: 30, fija: 75000},
      sobredimensionada: %{pct: 40, fija: 120_000}
    },
    base_recargo: :flete,
    minimo: 400_000,
    peso_maximo_kg: 30000
  }
