defmodule EscondidaTest do
  use ExUnit.Case, async: true

  # En cada prueba, la última aserción revisa que el original sigue igual.
  # En TypeScript esa aserción fallaría. En Elixir no puede fallar:
  # en respuestas.md explica por qué.

  test "1 · ordenar_por_peso" do
    lote = [%{id: "A", peso_kg: 1200}, %{id: "B", peso_kg: 800}]
    ordenados = Escondida.ordenar_por_peso(lote)
    assert Enum.map(ordenados, & &1.id) == ["B", "A"]
    assert Enum.map(lote, & &1.id) == ["A", "B"]
  end

  test "2 · con_descuento" do
    base = %{descuento_pct: 5}
    promo = Escondida.con_descuento(base, 10)
    assert promo.descuento_pct == 10
    assert base.descuento_pct == 5
  end

  test "3 · registrar" do
    primera = Escondida.registrar([], "A")
    segunda = Escondida.registrar(primera, "B")
    assert segunda == ["A", "B"]
    assert primera == ["A"]
  end

  test "4 · con_permiso, dos niveles" do
    original = %{id: "C", peso_kg: 30_000, documentos: %{permiso: nil}}
    con_p = Escondida.con_permiso(original, "SCT-77")
    assert con_p.documentos.permiso == "SCT-77"
    assert con_p.id == "C"
    assert original.documentos.permiso == nil
  end

  test "5 · fecha_de_entrega" do
    salida = ~D[2026-10-12]
    entrega = Escondida.fecha_de_entrega(salida, 3)
    assert entrega == ~D[2026-10-15]
    assert salida == ~D[2026-10-12]
  end
end
