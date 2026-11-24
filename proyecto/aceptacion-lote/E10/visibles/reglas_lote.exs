%{
    tarifa_km: 3150,
    cuota_puente: %{comercio_mundial: 38000, colombia: 37500},
    descuento: %{umbral_kg: 10000, pct: 5, criterio: :mas_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 18, fija: 0},
      peligrosa: %{pct: 30, fija: 50000},
      sobredimensionada: %{pct: 35, fija: 150_000}
    },
    base_recargo: :subtotal,
    minimo: 270_000,
    peso_maximo_kg: 30000
  }
