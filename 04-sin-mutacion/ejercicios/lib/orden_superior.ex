defmodule OrdenSuperior do
  @moduledoc """
  map, filter y reduce desde cero.

  Regla del dia: nada de `Enum` ni de `List`. Las tres primeras se escriben con recursion
  (cabeza y cola). Las de la seccion 4 se escriben SOLO con las tres primeras, sin recursion nueva.

      mix test test/orden_superior_test.exs
  """

  def map(_lista, _f), do: raise("por implementar")
  def filter(_lista, _pred), do: raise("por implementar")
  def reduce(_lista, _acc, _f), do: raise("por implementar")

  def total_pesos(_embarques), do: raise("por implementar")
  def pesados(_embarques, _umbral), do: raise("por implementar")
  def ids(_embarques), do: raise("por implementar")

  def map_con_reduce(_lista, _f), do: raise("por implementar")
end
