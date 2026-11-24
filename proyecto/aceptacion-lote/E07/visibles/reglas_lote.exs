%{
    tarifa_km: 3700,
    cuota_puente: %{comercio_mundial: 38500, colombia: 33500},
    descuento: %{umbral_kg: 12000, pct: 8, criterio: :a_partir_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 10, fija: 0},
      peligrosa: %{pct: 30, fija: 75000},
      sobredimensionada: %{pct: 45, fija: 120_000}
    },
    base_recargo: :subtotal,
    minimo: 310_000,
    peso_maximo_kg: 34000
  }
