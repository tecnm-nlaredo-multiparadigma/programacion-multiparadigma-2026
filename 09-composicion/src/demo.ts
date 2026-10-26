// npm run demo · las mismas cotizaciones que herencia.ts, ahora con composición
import { cotizar, frio, seguro, express } from './composicion.js';

const km = 100;
const tarifa = 3950;
console.log('sin extras             ', cotizar(km, tarifa, []));
console.log('refrigerada            ', cotizar(km, tarifa, [frio]));
console.log('con seguro             ', cotizar(km, tarifa, [seguro]));
console.log('refrigerada con seguro ', cotizar(km, tarifa, [frio, seguro]));
console.log('los tres               ', cotizar(km, tarifa, [frio, seguro, express]));
