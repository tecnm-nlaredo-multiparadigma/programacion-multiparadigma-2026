# Viernes 9 · map, filter y reduce. Prediccion antes de ejecutar.
#
# Como se corre, desde la carpeta 04-sin-mutacion:
#   iex fragmentos/vie-09.exs
# Eso carga el modulo O sin imprimir nada. Despues escribe en iex cada fragmento
# tal como aparece en la diapositiva (por ejemplo O.map([1, 2, 3], fn x -> x * 10 end)).
# El fragmento 6 se pega completo: trae su propia lista de embarques.

defmodule O do
  def map([], _f), do: []
  def map([h | t], f), do: [f.(h) | map(t, f)]

  def filter([], _pred), do: []

  def filter([h | t], pred) do
    if pred.(h), do: [h | filter(t, pred)], else: filter(t, pred)
  end

  def reduce([], acc, _f), do: acc
  def reduce([h | t], acc, f), do: reduce(t, f.(h, acc), f)
end

# --- Fragmento 1
O.map([1, 2, 3], fn x -> x * 10 end)

# --- Fragmento 2
O.filter([1200, 800, 15_000], fn x -> x > 1000 end)

# --- Fragmento 3
O.reduce([1, 2, 3], 0, fn x, acc -> x + acc end)

# --- Fragmento 4
O.reduce([1, 2, 3], [], fn x, acc -> [x | acc] end)

# --- Fragmento 5
Enum.map([1, 2, 3], &(&1 * 2))

# --- Fragmento 6
embarques = [
  %{id: "A", peso_kg: 1200},
  %{id: "B", peso_kg: 800},
  %{id: "C", peso_kg: 15_000}
]

embarques
|> Enum.filter(fn e -> e.peso_kg > 1000 end)
|> Enum.map(fn e -> e.peso_kg end)
|> Enum.sum()

# --- Fragmento 7  (la que sale al reves)
O.reduce([1, 2, 3], [], fn x, acc -> [x * 10 | acc] end)
