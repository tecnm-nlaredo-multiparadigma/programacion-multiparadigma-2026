%{
    tarifa_km: 3950,
    cuota_puente: %{comercio_mundial: 48500, colombia: 42000},
    descuento: %{umbral_kg: 8000, pct: 5, criterio: :a_partir_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 18, fija: 15000},
      peligrosa: %{pct: 20, fija: 75000},
      sobredimensionada: %{pct: 35, fija: 150_000}
    },
    base_recargo: :subtotal,
    minimo: 290_000,
    peso_maximo_kg: 32000
  }
