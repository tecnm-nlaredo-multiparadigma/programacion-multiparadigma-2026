case System.argv() do
  [ruta] ->
    {reglas, _} = Code.eval_file(ruta)
    lote = for n <- 1..10_000 do
      %{id: n, peso_kg: 1000, distancia_km: 100, tipo: :general,
        puente: :colombia, numero_un: nil, permiso: nil}
    end
    Cotizador.resumen(lote, reglas)
    Cotizador.Lote.resumen(lote, reglas)

    muestras = for _ <- 1..5 do
      {secuencial, esperado} = :timer.tc(fn -> Cotizador.resumen(lote, reglas) end)
      {concurrente, obtenido} = :timer.tc(fn -> Cotizador.Lote.resumen(lote, reglas) end)
      unless esperado == obtenido, do: raise("Los resúmenes difieren")
      {secuencial / 1000, concurrente / 1000}
    end
    mediana = fn columna ->
      muestras |> Enum.map(&elem(&1, columna)) |> Enum.sort() |> Enum.at(2)
    end
    IO.puts("| Motor secuencial | #{Float.round(mediana.(0), 3)} ms |")
    IO.puts("| Lote concurrente | #{Float.round(mediana.(1), 3)} ms |")

  _ ->
    raise "Uso: mix run comparar.exs reglas_lote.exs"
end
