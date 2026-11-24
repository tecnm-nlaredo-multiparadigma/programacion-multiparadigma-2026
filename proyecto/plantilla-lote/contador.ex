defmodule Cotizador.Contador do
  @moduledoc "Contador de práctica con una actualización perdida."
  def nuevo do
    tabla = :ets.new(__MODULE__, [:set, :public])
    :ets.insert(tabla, {:total, 0})
    tabla
  end

  def total(tabla), do: :ets.lookup_element(tabla, :total, 2)

  def incrementar(tabla, despues_de_leer \\ fn -> :ok end) do
    actual = total(tabla)
    despues_de_leer.()
    :ets.insert(tabla, {:total, actual + 1})
    :ok
  end
end
