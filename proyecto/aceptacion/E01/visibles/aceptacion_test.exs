# PRUEBAS DE ACEPTACION · Segundo parcial · Programacion Multiparadigma
# Equipo E01. Generado por el docente: NO se edita. Si una prueba te parece mal, abre un issue.
defmodule AceptacionTest do
  use ExUnit.Case, async: true

  @reglas %{
    tarifa_km: 3950,
    cuota_puente: %{comercio_mundial: 48500, colombia: 42000},
    descuento: %{umbral_kg: 8000, pct: 5, criterio: :a_partir_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 18, fija: 15000},
      peligrosa: %{pct: 20, fija: 75000},
      sobredimensionada: %{pct: 35, fija: 150_000}
    },
    base_recargo: :subtotal,
    minimo: 290_000,
    peso_maximo_kg: 32000
  }

  describe "cotizar/2" do
    test "carga general por debajo del umbral: flete mas cuota, sin descuento" do
      assert {:ok, c} =
               Cotizador.cotizar(
                 %{
                   id: "V01",
                   peso_kg: 4000,
                   distancia_km: 220,
                   tipo: :general,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )

      assert c.flete_bruto == 869_000
      assert c.descuento == 0
      assert c.flete == 869_000
      assert c.cuota_puente == 48500
      assert c.recargo == 0
      assert c.ajuste_minimo == 0
      assert c.total == 917_500
    end

    test "peso EXACTAMENTE en el umbral (8000 kg): lee tu criterio" do
      assert {:ok, c} =
               Cotizador.cotizar(
                 %{
                   id: "V02",
                   peso_kg: 8000,
                   distancia_km: 220,
                   tipo: :general,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )

      assert c.flete_bruto == 869_000
      assert c.descuento == 43450
      assert c.flete == 825_550
      assert c.cuota_puente == 48500
      assert c.recargo == 0
      assert c.ajuste_minimo == 0
      assert c.total == 874_050
    end

    test "un kilo arriba del umbral siempre lleva descuento" do
      assert {:ok, c} =
               Cotizador.cotizar(
                 %{
                   id: "V03",
                   peso_kg: 8001,
                   distancia_km: 220,
                   tipo: :general,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )

      assert c.flete_bruto == 869_000
      assert c.descuento == 43450
      assert c.flete == 825_550
      assert c.cuota_puente == 48500
      assert c.recargo == 0
      assert c.ajuste_minimo == 0
      assert c.total == 874_050
    end

    test "refrigerada paga su recargo" do
      assert {:ok, c} =
               Cotizador.cotizar(
                 %{
                   id: "V04",
                   peso_kg: 5000,
                   distancia_km: 240,
                   tipo: :refrigerada,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )

      assert c.flete_bruto == 948_000
      assert c.descuento == 0
      assert c.flete == 948_000
      assert c.cuota_puente == 48500
      assert c.recargo == 194_370
      assert c.ajuste_minimo == 0
      assert c.total == 1_190_870
    end

    test "peligrosa con numero UN paga recargo y cuota fija" do
      assert {:ok, c} =
               Cotizador.cotizar(
                 %{
                   id: "V05",
                   peso_kg: 8500,
                   distancia_km: 260,
                   tipo: :peligrosa,
                   puente: :comercio_mundial,
                   numero_un: "UN1203",
                   permiso: nil
                 },
                 @reglas
               )

      assert c.flete_bruto == 1_027_000
      assert c.descuento == 51350
      assert c.flete == 975_650
      assert c.cuota_puente == 48500
      assert c.recargo == 279_830
      assert c.ajuste_minimo == 0
      assert c.total == 1_303_980
    end

    test "sobredimensionada con permiso puede pasar del peso maximo" do
      assert {:ok, c} =
               Cotizador.cotizar(
                 %{
                   id: "V06",
                   peso_kg: 36000,
                   distancia_km: 190,
                   tipo: :sobredimensionada,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: "SCT-4471"
                 },
                 @reglas
               )

      assert c.flete_bruto == 750_500
      assert c.descuento == 37525
      assert c.flete == 712_975
      assert c.cuota_puente == 48500
      assert c.recargo == 416_516
      assert c.ajuste_minimo == 0
      assert c.total == 1_177_991
    end

    test "el puente Colombia tiene su propia cuota" do
      assert {:ok, c} =
               Cotizador.cotizar(
                 %{
                   id: "V07",
                   peso_kg: 5000,
                   distancia_km: 200,
                   tipo: :general,
                   puente: :colombia,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )

      assert c.flete_bruto == 790_000
      assert c.descuento == 0
      assert c.flete == 790_000
      assert c.cuota_puente == 42000
      assert c.recargo == 0
      assert c.ajuste_minimo == 0
      assert c.total == 832_000
    end

    test "un viaje corto paga el minimo" do
      assert {:ok, c} =
               Cotizador.cotizar(
                 %{
                   id: "V08",
                   peso_kg: 900,
                   distancia_km: 15,
                   tipo: :general,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )

      assert c.flete_bruto == 59250
      assert c.descuento == 0
      assert c.flete == 59250
      assert c.cuota_puente == 48500
      assert c.recargo == 0
      assert c.ajuste_minimo == 182_250
      assert c.total == 290_000
    end

    test "rechaza peso cero" do
      assert {:error, :peso_invalido} =
               Cotizador.cotizar(
                 %{
                   id: "X01",
                   peso_kg: 0,
                   distancia_km: 220,
                   tipo: :general,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )
    end

    test "rechaza distancia negativa" do
      assert {:error, :distancia_invalida} =
               Cotizador.cotizar(
                 %{
                   id: "X02",
                   peso_kg: 5000,
                   distancia_km: -5,
                   tipo: :general,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )
    end

    test "rechaza carga general arriba del peso maximo" do
      assert {:error, :excede_peso_maximo} =
               Cotizador.cotizar(
                 %{
                   id: "X03",
                   peso_kg: 32001,
                   distancia_km: 220,
                   tipo: :general,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )
    end

    test "rechaza peligrosa sin numero UN" do
      assert {:error, :falta_numero_un} =
               Cotizador.cotizar(
                 %{
                   id: "X04",
                   peso_kg: 5000,
                   distancia_km: 220,
                   tipo: :peligrosa,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )
    end

    test "rechaza sobredimensionada sin permiso" do
      assert {:error, :falta_permiso} =
               Cotizador.cotizar(
                 %{
                   id: "X05",
                   peso_kg: 5000,
                   distancia_km: 220,
                   tipo: :sobredimensionada,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )
    end

    test "rechaza un tipo de carga que no existe" do
      assert {:error, :tipo_desconocido} =
               Cotizador.cotizar(
                 %{
                   id: "X06",
                   peso_kg: 5000,
                   distancia_km: 220,
                   tipo: :granel,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )
    end

    test "rechaza un puente que no existe" do
      assert {:error, :puente_desconocido} =
               Cotizador.cotizar(
                 %{
                   id: "X07",
                   peso_kg: 5000,
                   distancia_km: 220,
                   tipo: :general,
                   puente: :laredo_iv,
                   numero_un: nil,
                   permiso: nil
                 },
                 @reglas
               )
    end
  end

  describe "resumen/2" do
    test "lote mixto: cuenta, suma y separa los rechazados" do
      lote = [
        %{
          id: "L1",
          peso_kg: 8010,
          distancia_km: 220,
          tipo: :general,
          puente: :comercio_mundial,
          numero_un: nil,
          permiso: nil
        },
        %{
          id: "L2",
          peso_kg: 5000,
          distancia_km: 220,
          tipo: :refrigerada,
          puente: :colombia,
          numero_un: nil,
          permiso: nil
        },
        %{
          id: "L3",
          peso_kg: 0,
          distancia_km: 220,
          tipo: :general,
          puente: :comercio_mundial,
          numero_un: nil,
          permiso: nil
        },
        %{
          id: "L4",
          peso_kg: 5000,
          distancia_km: 220,
          tipo: :peligrosa,
          puente: :comercio_mundial,
          numero_un: nil,
          permiso: nil
        },
        %{
          id: "L5",
          peso_kg: 5000,
          distancia_km: 30,
          tipo: :general,
          puente: :colombia,
          numero_un: nil,
          permiso: nil
        },
        %{
          id: "L6",
          peso_kg: 32100,
          distancia_km: 220,
          tipo: :sobredimensionada,
          puente: :comercio_mundial,
          numero_un: nil,
          permiso: "SCT-4471"
        }
      ]

      r = Cotizador.resumen(lote, @reglas)
      assert r.cotizados == 4
      assert r.rechazados == [{"L3", :peso_invalido}, {"L4", :falta_numero_un}]
      assert r.total == 3_583_998
      assert r.por_puente == %{comercio_mundial: 2_204_018, colombia: 1_379_980}
    end
  end
end
