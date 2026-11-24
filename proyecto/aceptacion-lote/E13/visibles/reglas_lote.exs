%{
    tarifa_km: 3650,
    cuota_puente: %{comercio_mundial: 40500, colombia: 32000},
    descuento: %{umbral_kg: 8000, pct: 8, criterio: :a_partir_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 12, fija: 25000},
      peligrosa: %{pct: 20, fija: 75000},
      sobredimensionada: %{pct: 40, fija: 150_000}
    },
    base_recargo: :subtotal,
    minimo: 420_000,
    peso_maximo_kg: 32000
  }
