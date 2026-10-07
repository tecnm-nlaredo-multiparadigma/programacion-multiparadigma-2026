# Jueves 8 · Recursion. Prediccion antes de ejecutar.
#
# Como se corre, desde la carpeta 04-sin-mutacion:
#   iex fragmentos/jue-01.exs
# Eso carga los modulos sin imprimir nada. Despues escribe en iex la ultima
# linea de cada fragmento (por ejemplo F1.f1([:a, :b, :c])).
# Tambien puedes pegar en iex un fragmento completo, de defmodule hasta la llamada.

# --- Fragmento 1
defmodule F1 do
  def f1([]), do: 0
  def f1([_ | t]), do: 1 + f1(t)
end

F1.f1([:a, :b, :c])

# --- Fragmento 2
defmodule F2 do
  def f2([]), do: []
  def f2([h | t]), do: [h * 2 | f2(t)]
end

F2.f2([1, 2, 3])

# --- Fragmento 3
defmodule F3 do
  def f3([], acc), do: acc
  def f3([h | t], acc), do: f3(t, [h | acc])
end

F3.f3([1, 2, 3], [])

# --- Fragmento 4
defmodule F4 do
  def f4([]), do: []
  def f4([h | t]) when h > 1000, do: [h | f4(t)]
  def f4([_ | t]), do: f4(t)
end

F4.f4([800, 1200, 15_000, 999])

# --- Fragmento 5  (la que no termina bien; la llamada va comentada para que el archivo cargue)
defmodule F5 do
  def f5([h | t]), do: h + f5(t)
end

# F5.f5([1, 2, 3])
