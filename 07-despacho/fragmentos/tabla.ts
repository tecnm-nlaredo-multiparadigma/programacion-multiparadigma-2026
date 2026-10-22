// Jueves 22 · fragmentos 1 a 3 · npm run fragmentos

// --- Fragmento 1
const precios = { cafe: 30, te: 25 };
console.log('F1', precios['cafe']);

// --- Fragmento 2
const pedido: 'cafe' | 'te' = 'te';
console.log('F2', precios[pedido]);

// --- Fragmento 3
const POLITICAS = {
  refrigerada: { pct: 18, fija: 15000 },
  peligrosa: { pct: 20, fija: 75000 },
};
const tipo: 'refrigerada' | 'peligrosa' = 'refrigerada';
console.log('F3', POLITICAS[tipo].pct, POLITICAS[tipo].fija);
