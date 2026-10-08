# PRUEBAS DE ACEPTACION · Segundo parcial · Programacion Multiparadigma
# Equipo E05. Generado por el docente: NO se edita. Si una prueba te parece mal, abre un issue.
defmodule AceptacionTest do
  use ExUnit.Case, async: true

  @reglas %{
    tarifa_km: 3900,
    cuota_puente: %{comercio_mundial: 39500, colombia: 41500},
    descuento: %{umbral_kg: 8000, pct: 9, criterio: :a_partir_de},
    recargo: %{
      general: %{pct: 0, fija: 0},
      refrigerada: %{pct: 12, fija: 0},
      peligrosa: %{pct: 25, fija: 90000},
      sobredimensionada: %{pct: 35, fija: 120_000}
    },
    base_recargo: :flete,
    minimo: 440_000,
    peso_maximo_kg: 34000
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

      assert c.flete_bruto == 858_000
      assert c.descuento == 0
      assert c.flete == 858_000
      assert c.cuota_puente == 39500
      assert c.recargo == 0
      assert c.ajuste_minimo == 0
      assert c.total == 897_500
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

      assert c.flete_bruto == 858_000
      assert c.descuento == 77220
      assert c.flete == 780_780
      assert c.cuota_puente == 39500
      assert c.recargo == 0
      assert c.ajuste_minimo == 0
      assert c.total == 820_280
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

      assert c.flete_bruto == 858_000
      assert c.descuento == 77220
      assert c.flete == 780_780
      assert c.cuota_puente == 39500
      assert c.recargo == 0
      assert c.ajuste_minimo == 0
      assert c.total == 820_280
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

      assert c.flete_bruto == 936_000
      assert c.descuento == 0
      assert c.flete == 936_000
      assert c.cuota_puente == 39500
      assert c.recargo == 112_320
      assert c.ajuste_minimo == 0
      assert c.total == 1_087_820
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

      assert c.flete_bruto == 1_014_000
      assert c.descuento == 91260
      assert c.flete == 922_740
      assert c.cuota_puente == 39500
      assert c.recargo == 320_685
      assert c.ajuste_minimo == 0
      assert c.total == 1_282_925
    end

    test "sobredimensionada con permiso puede pasar del peso maximo" do
      assert {:ok, c} =
               Cotizador.cotizar(
                 %{
                   id: "V06",
                   peso_kg: 38000,
                   distancia_km: 190,
                   tipo: :sobredimensionada,
                   puente: :comercio_mundial,
                   numero_un: nil,
                   permiso: "SCT-4471"
                 },
                 @reglas
               )

      assert c.flete_bruto == 741_000
      assert c.descuento == 66690
      assert c.flete == 674_310
      assert c.cuota_puente == 39500
      assert c.recargo == 356_009
      assert c.ajuste_minimo == 0
      assert c.total == 1_069_819
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

      assert c.flete_bruto == 780_000
      assert c.descuento == 0
      assert c.flete == 780_000
      assert c.cuota_puente == 41500
      assert c.recargo == 0
      assert c.ajuste_minimo == 0
      assert c.total == 821_500
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

      assert c.flete_bruto == 58500
      assert c.descuento == 0
      assert c.flete == 58500
      assert c.cuota_puente == 39500
      assert c.recargo == 0
      assert c.ajuste_minimo == 342_000
      assert c.total == 440_000
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
                   peso_kg: 34001,
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
          peso_kg: 34100,
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
      assert r.total == 3_476_293
      assert r.por_puente == %{comercio_mundial: 2_033_833, colombia: 1_442_460}
    end
  end
end
