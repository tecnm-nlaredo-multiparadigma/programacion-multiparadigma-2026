defmodule OrdenSuperiorTest do
  use ExUnit.Case, async: true
  # Regla del dia: nada de Enum ni de List. Solo cabeza, cola y la funcion que les pasan.

  @embarques [
    %{id: "A", peso_kg: 1200},
    %{id: "B", peso_kg: 800},
    %{id: "C", peso_kg: 15_000}
  ]

  test "1 · map aplica la funcion a cada elemento" do
    assert OrdenSuperior.map([1, 2, 3], fn x -> x * 10 end) == [10, 20, 30]
    assert OrdenSuperior.map([], fn x -> x end) == []
  end

  test "2 · filter se queda con los que cumplen" do
    assert OrdenSuperior.filter([800, 1200, 15_000], fn kg -> kg > 1000 end) == [1200, 15_000]
    assert OrdenSuperior.filter([1, 2], fn _ -> false end) == []
  end

  test "3 · reduce junta todo en un solo valor" do
    assert OrdenSuperior.reduce([1, 2, 3], 0, fn x, acc -> acc + x end) == 6
    assert OrdenSuperior.reduce([], 99, fn x, acc -> acc + x end) == 99
    assert OrdenSuperior.reduce([1, 2, 3], [], fn x, acc -> [x | acc] end) == [3, 2, 1]
  end

  test "4 · con las tres, sin escribir recursion nueva" do
    assert OrdenSuperior.total_pesos(@embarques) == 17_000
    assert OrdenSuperior.pesados(@embarques, 1000) |> OrdenSuperior.ids() == ["A", "C"]
    assert OrdenSuperior.ids(@embarques) == ["A", "B", "C"]
  end

  test "5 · reto: map escrito solo con reduce, y en el mismo orden" do
    assert OrdenSuperior.map_con_reduce([1, 2, 3], fn x -> x * 2 end) == [2, 4, 6]
  end
end
