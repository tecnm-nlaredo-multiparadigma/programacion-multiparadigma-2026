%{
    tarifa_km: 3750,
    cuota_puente: %{comercio_mundial: 42000, colombia: 30000},
    descuento: %{umbral_kg: 15000, pct: 8, criterio: :mas_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 12, fija: 25000},
      peligrosa: %{pct: 25, fija: 75000},
      sobredimensionada: %{pct: 45, fija: 150_000}
    },
    base_recargo: :flete,
    minimo: 410_000,
    peso_maximo_kg: 34000
  }
