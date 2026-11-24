%{
    tarifa_km: 4150,
    cuota_puente: %{comercio_mundial: 46500, colombia: 35500},
    descuento: %{umbral_kg: 15000, pct: 6, criterio: :mas_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 18, fija: 15000},
      peligrosa: %{pct: 30, fija: 75000},
      sobredimensionada: %{pct: 40, fija: 120_000}
    },
    base_recargo: :subtotal,
    minimo: 350_000,
    peso_maximo_kg: 30000
  }
