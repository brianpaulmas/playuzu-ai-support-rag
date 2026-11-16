# Estimación de ROI — escenario ilustrativo

El ROI no se ha medido en operación real. El siguiente es un **modelo académico basado en supuestos**, editable y deliberadamente conservador.

| Supuesto | Valor de ejemplo |
|---|---:|
| Consultas FAQ mensuales | 1.000 |
| Porcentaje automatizado sin intervención | 40 % |
| Minutos humanos ahorrados por consulta | 4 min |
| Costo laboral por hora | €12 |
| Costo variable de servicios/infraestructura al mes | €25 |
| Mantenimiento mensual | 3 h × €12 = €36 |
| Implementación inicial | 30 h × €12 = €360 |

- Consultas resueltas sin humano: 1.000 × 40 % = **400/mes**.
- Horas evitadas: 400 × 4 / 60 = **26,67 h/mes**.
- Ahorro laboral bruto: 26,67 × €12 = **€320/mes**.
- Beneficio operativo neto mensual: €320 − €25 − €36 = **€259/mes**.
- Recuperación teórica de implementación: €360 / €259 = **1,39 meses**.
- ROI simple del primer año: ((€259 × 12 − €360) / €360) × 100 = **~763 %**, bajo estos supuestos.

**Advertencias:** la tasa de automatización, costo laboral, latencia, mantenimiento y uso de APIs no son datos observados de PlayUZU. No se incluyen tasas de error, recontacto, seguridad, licencias empresariales ni gestión de excepciones. Validar con una prueba piloto y métricas reales antes de convertir el escenario en caso financiero.
