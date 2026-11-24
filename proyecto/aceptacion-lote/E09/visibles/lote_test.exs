defmodule Cotizador.LoteAceptacionTest do
  use ExUnit.Case, async: true

  @reglas %{
    tarifa_km: 4000,
    cuota_puente: %{comercio_mundial: 43000, colombia: 31000},
    descuento: %{umbral_kg: 8000, pct: 10, criterio: :a_partir_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 10, fija: 0},
      peligrosa: %{pct: 30, fija: 90000},
      sobredimensionada: %{pct: 35, fija: 120_000}
    },
    base_recargo: :flete,
    minimo: 430_000,
    peso_maximo_kg: 34000
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
