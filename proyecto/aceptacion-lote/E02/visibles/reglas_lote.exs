%{
    tarifa_km: 2750,
    cuota_puente: %{comercio_mundial: 50000, colombia: 42000},
    descuento: %{umbral_kg: 10000, pct: 6, criterio: :mas_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 10, fija: 25000},
      peligrosa: %{pct: 25, fija: 50000},
      sobredimensionada: %{pct: 40, fija: 150_000}
    },
    base_recargo: :flete,
    minimo: 430_000,
    peso_maximo_kg: 36000
  }
