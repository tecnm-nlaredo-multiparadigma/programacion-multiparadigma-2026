defmodule Camino do
  # Guía 05 · |>, with y la frontera de efectos.
  # Reemplaza cada raise("por implementar") por tu versión.
  # Regla del día: en la parte 1, cada función es UNA tubería con |>.
  #                en la parte 2 y 3, nada de if ni case anidados: usa with.

  # --- Parte 1 · |> ---------------------------------------------------------------

  # Suma el peso de los embarques que pesan MÁS que el umbral.
  # total_pesados([%{peso_kg: 800}, %{peso_kg: 1200}], 1000) == 1200
  def total_pesados(_embarques, _umbral), do: raise("por implementar")

  # Los ids, en mayúsculas, separados por coma y espacio.
  # lista_de_ids([%{id: "a-1"}, %{id: "b-2"}]) == "A-1, B-2"
  # Pistas: String.upcase/1 y Enum.join/2.
  def lista_de_ids(_embarques), do: raise("por implementar")

  # --- Parte 2 · with --------------------------------------------------------------

  # {:ok, peso} si peso_kg > 0; si no, {:error, :peso_invalido}
  def validar_peso(_embarque), do: raise("por implementar")

  # {:ok, distancia} si distancia_km > 0; si no, {:error, :distancia_invalida}
  def validar_distancia(_embarque), do: raise("por implementar")

  # Valida el peso, luego la distancia, y si las dos pasan: {:ok, distancia * tarifa_km}.
  # Si algo falla, regresa ESE error tal cual. Un solo with.
  def cotizar_simple(_embarque, _tarifa_km), do: raise("por implementar")

  # --- Parte 3 · la frontera -------------------------------------------------------

  # Lee un archivo que trae un número (la tarifa) y regresa {:ok, numero}.
  # Si el archivo no existe:          {:error, :no_existe}
  # Si el archivo no trae un entero:  {:error, :no_es_numero}
  # Pistas: File.read/1, String.trim/1, Integer.parse/1 y un else en el with.
  def leer_tarifa(_ruta), do: raise("por implementar")

  # Lee la tarifa del archivo y cotiza con ella. Si leer falla, regresa ese error.
  def cotizar_desde_archivo(_embarque, _ruta), do: raise("por implementar")
end
