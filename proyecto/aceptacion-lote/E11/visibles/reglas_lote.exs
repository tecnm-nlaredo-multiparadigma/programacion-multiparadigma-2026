%{
    tarifa_km: 3350,
    cuota_puente: %{comercio_mundial: 46500, colombia: 31000},
    descuento: %{umbral_kg: 12000, pct: 8, criterio: :a_partir_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 18, fija: 15000},
      peligrosa: %{pct: 20, fija: 50000},
      sobredimensionada: %{pct: 40, fija: 120_000}
    },
    base_recargo: :flete,
    minimo: 280_000,
    peso_maximo_kg: 34000
  }
