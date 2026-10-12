# Guía 05 · |>, with y la frontera. Prediccion antes de ejecutar.
#
# Como se corre, desde la carpeta 05-pipe-y-with:
#   iex fragmentos/pipe-with.exs
# Eso no imprime nada. Despues escribe en iex cada fragmento de la guia
# (o pegalo completo). La respuesta esta en la guia, escondida: primero predice.

# --- Fragmento 1
Enum.sum(Enum.map(Enum.filter([800, 1200, 15_000], fn x -> x > 1000 end), fn x -> x * 2 end))

# --- Fragmento 2
[800, 1200, 15_000]
|> Enum.filter(fn x -> x > 1000 end)
|> Enum.map(fn x -> x * 2 end)
|> Enum.sum()

# --- Fragmento 3
"a,b,c" |> String.split(",")

# --- Fragmento 4
"," |> String.split("a,b,c")

# --- Fragmento 5
with {:ok, peso} <- {:ok, 9000},
     {:ok, distancia} <- {:ok, 200} do
  peso + distancia
end

# --- Fragmento 6
with {:ok, peso} <- {:ok, 9000},
     {:ok, distancia} <- {:error, :distancia_invalida} do
  peso + distancia
end

# --- Fragmento 7
with {n, ""} <- Integer.parse("12x") do
  n
end

# --- Fragmento 8
with {n, ""} <- Integer.parse("12x") do
  n
else
  _ -> :no_es_numero
end

# --- Fragmento 9
File.read("no-existe.txt")
