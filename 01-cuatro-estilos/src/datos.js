// Lote de embarques de cruce fronterizo. Los cuatro estilos usan EXACTAMENTE estos datos.
export const embarques = [
  { id: 'E1', distanciaKm: 320, pesoKg:  850, tipoCarga: 'general'     },
  { id: 'E2', distanciaKm: 145, pesoKg: 1400, tipoCarga: 'refrigerada' },
  { id: 'E3', distanciaKm: 610, pesoKg:  500, tipoCarga: 'peligrosa'   },
  { id: 'E4', distanciaKm: 220, pesoKg: 1000, tipoCarga: 'general'     },
];
export const REGLAS = {
  cuotaPuenteUsd: 40, tarifaBaseUsdKm: 1.5,
  umbralPesoKg: 1000, recargoSobrepesoPct: 0.2,
  tipoCargaRecargado: 'refrigerada', recargoCargaPct: 0.15,
};
