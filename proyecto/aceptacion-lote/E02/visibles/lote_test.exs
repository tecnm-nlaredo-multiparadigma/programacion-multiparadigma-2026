defmodule Cotizador.LoteAceptacionTest do
  use ExUnit.Case, async: true

  @reglas %{
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

  test "lote vacío conserva el resumen del motor" do
    assert Cotizador.Lote.resumen([], @reglas) == Cotizador.resumen([], @reglas)
  end

  test "mil embarques conservan totales, puentes y orden de los rechazos" do
    lote = for id <- 1..1000 do
      %{id: id, peso_kg: if(rem(id, 5) == 0, do: 0, else: 1000),
        distancia_km: id, tipo: :general,
        puente: if(rem(id, 2) == 0, do: :colombia, else: :comercio_mundial),
        numero_un: nil, permiso: nil}
    end
    assert Cotizador.Lote.resumen(lote, @reglas) == Cotizador.resumen(lote, @reglas)
  end
end
