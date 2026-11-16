# Evidencias, resultados y límites

## Resultados observados en pruebas manuales (16/11/2026)

| Caso | Evidencia observada | Resultado |
|---|---|---|
| Ingesta | 5 documentos insertados en `public.documents` | Correcto |
| Búsqueda RAG independiente | Consulta `retiros` → 4 resultados; `FAQ - Retiros` primero, score ~0,779 | Correcto |
| Respuesta informativa | Webhook → Sheets → Groq + Supabase/Gemini → validación → rama FAQ | Correcto |
| Derivación individual | Consulta sobre retiro individual → `decision=escalate`, `requires_human=true`, respuesta HTTP recibida | Correcto |
| Entrada inválida | `from=123` → rama de rechazo y HTTP 400; Groq y Supabase no ejecutados | Correcto |
| Segundo remitente | `session_id=wa_59899000002`, derivación sin mencionar retiro del primer remitente | Indicio compatible con aislamiento; no prueba exhaustiva de memoria |

**Limitaciones:** no se verificó exhaustivamente retención de memoria, concurrencia, idempotencia, alta disponibilidad ni seguridad para producción. La salida de Groq puede variar. Las decisiones `clarify` comparten la ruta HTTP FAQ; una futura versión podría incorporar un nodo de aclaración específico. La respuesta de rechazo mostró código HTTP 400; el cuerpo no quedó visible en la captura de PowerShell. Las capturas y los logs no forman parte del JSON exportado.

## Evidencias incluidas (archivos aportados por el autor)

| Archivo sugerido | Qué muestra |
|---|---|
| `03-rag-recuperacion-documental.png` | Búsqueda `retiros` y FAQ recuperada con score |
| `04-rag-workflow-exitoso.png` | Prueba independiente de vector store + Gemini |
| `05-workflow-principal-ejecucion-exitosa.png` | Ruta FAQ completa ejecutada |
| `06-respuesta-faq-json-exitoso.png` | JSON generado por Respond to Webhook |
| `07-ai-agent-recuperacion-rag.png` | Logs reales de Supabase en el AI Agent |
| `08-derivacion-soporte-workflow.png` | Ruta de derivación |
| `09-derivacion-soporte-respuesta-http.png` | Resultado de PowerShell con `escalate` |
| `10-validacion-error-400-workflow.png` | Ruta de entrada inválida |
| `11-validacion-error-400-http.png` | HTTP 400 en PowerShell |
| `12-memoria-aislamiento-remitentes.png` | Segundo remitente y sesión separada |

Las diez imágenes están incorporadas en `evidencias/`. El archivo `04-rag-workflow-exitoso.png` se renombró a partir de `Manual Trigger → Supabase Vector Store → Gemini Embeddings.png`, sin cambiar los píxeles. Consultar `evidencias/INDICE.md` y realizar revisión de privacidad antes de publicarlas.
