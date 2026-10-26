// Taller 5 · Composición o herencia
// La versión con herencia: una clase por cada combinación de extras.
// npm run herencia

const pct = (monto: number, p: number): number => Math.floor((monto * p + 50) / 100);

export class Cotizacion {
  constructor(
    readonly km: number,
    readonly tarifaKm: number,
  ) {}

  total(): number {
    return this.km * this.tarifaKm;
  }
}

// Frío: 18 % sobre lo que lleva.
export class Refrigerada extends Cotizacion {
  override total(): number {
    const base = super.total();
    return base + pct(base, 18);
  }
}

// Seguro: 2 % sobre lo que lleva.
export class ConSeguro extends Cotizacion {
  override total(): number {
    const base = super.total();
    return base + pct(base, 2);
  }
}

// Frío y seguro: hereda el frío... y el seguro se vuelve a escribir.
export class RefrigeradaConSeguro extends Refrigerada {
  override total(): number {
    const base = super.total();
    return base + pct(base, 2);
  }
}

// ------------------------------------------------------------------ demostración
if (import.meta.url === `file://${process.argv[1]}`) {
  const km = 100;
  const tarifa = 3950;
  console.log('sin extras            ', new Cotizacion(km, tarifa).total());
  console.log('refrigerada           ', new Refrigerada(km, tarifa).total());
  console.log('con seguro            ', new ConSeguro(km, tarifa).total());
  console.log('refrigerada con seguro', new RefrigeradaConSeguro(km, tarifa).total());
}
