defmodule CaminoTest do
  use ExUnit.Case, async: true

  @lote [
    %{id: "a-1", peso_kg: 800, distancia_km: 120},
    %{id: "b-2", peso_kg: 1200, distancia_km: 300},
    %{id: "c-3", peso_kg: 15_000, distancia_km: 50}
  ]

  describe "parte 1 · |>" do
    test "1 · total_pesados suma solo los de más del umbral" do
      assert Camino.total_pesados(@lote, 1000) == 16_200
      assert Camino.total_pesados(@lote, 1200) == 15_000
      assert Camino.total_pesados([], 1000) == 0
    end

    test "2 · lista_de_ids en mayúsculas, separados por coma" do
      assert Camino.lista_de_ids(@lote) == "A-1, B-2, C-3"
      assert Camino.lista_de_ids([]) == ""
    end
  end

  describe "parte 2 · with" do
    test "3 · validar_peso y validar_distancia" do
      assert Camino.validar_peso(%{peso_kg: 900}) == {:ok, 900}
      assert Camino.validar_peso(%{peso_kg: 0}) == {:error, :peso_invalido}
      assert Camino.validar_distancia(%{distancia_km: 10}) == {:ok, 10}
      assert Camino.validar_distancia(%{distancia_km: -5}) == {:error, :distancia_invalida}
    end

    test "4 · cotizar_simple: el camino feliz" do
      assert Camino.cotizar_simple(%{peso_kg: 900, distancia_km: 200}, 3950) == {:ok, 790_000}
    end

    test "5 · cotizar_simple: el primer error sale tal cual, en orden" do
      assert Camino.cotizar_simple(%{peso_kg: 0, distancia_km: 200}, 3950) ==
               {:error, :peso_invalido}

      assert Camino.cotizar_simple(%{peso_kg: 900, distancia_km: 0}, 3950) ==
               {:error, :distancia_invalida}

      # los dos están mal: gana el primero que se revisa
      assert Camino.cotizar_simple(%{peso_kg: 0, distancia_km: 0}, 3950) ==
               {:error, :peso_invalido}
    end
  end

  describe "parte 3 · la frontera" do
    @describetag :tmp_dir

    test "6 · leer_tarifa: archivo bueno, archivo que no existe, archivo con basura",
         %{tmp_dir: dir} do
      buena = Path.join(dir, "tarifa.txt")
      File.write!(buena, "3950\n")
      basura = Path.join(dir, "basura.txt")
      File.write!(basura, "39.50 pesos")

      assert Camino.leer_tarifa(buena) == {:ok, 3950}
      assert Camino.leer_tarifa(Path.join(dir, "no-existe.txt")) == {:error, :no_existe}
      assert Camino.leer_tarifa(basura) == {:error, :no_es_numero}
    end

    test "7 · cotizar_desde_archivo junta las dos cosas", %{tmp_dir: dir} do
      ruta = Path.join(dir, "tarifa.txt")
      File.write!(ruta, "2750")

      assert Camino.cotizar_desde_archivo(%{peso_kg: 900, distancia_km: 100}, ruta) ==
               {:ok, 275_000}

      assert Camino.cotizar_desde_archivo(%{peso_kg: 0, distancia_km: 100}, ruta) ==
               {:error, :peso_invalido}

      assert Camino.cotizar_desde_archivo(%{peso_kg: 900, distancia_km: 100}, "/no/hay/nada") ==
               {:error, :no_existe}
    end
  end
end
