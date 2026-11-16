# Índice de evidencias reales — PlayUZU RAG

Las imágenes provienen de pruebas manuales efectuadas en n8n y PowerShell y se conservan con sus contenidos originales. Los números 01 y 02 se reservaron para evidencias adicionales que no fueron suministradas; no se incluyen ni se afirma que existan.

| Archivo | Evidencia que aporta | Interpretación y alcance |
|---|---|---|
| `03-rag-recuperacion-documental.png` | `Get Many` con consulta `retiros`, cuatro resultados; FAQ de retiros en primer lugar (~0,779) | Valida recuperación semántica independiente; el score no es una tasa de precisión |
| `04-rag-workflow-exitoso.png` | Manual Trigger → Supabase Vector Store + Gemini Embeddings en verde | Valida ejecución independiente, no la respuesta al cliente |
| `05-workflow-principal-ejecucion-exitosa.png` | Ruta completa de respuesta FAQ con nodos de IA y RAG ejecutados | Prueba del recorrido principal |
| `06-respuesta-faq-json-exitoso.png` | JSON de respuesta `decision=answer`, `requires_human=false`, `source=both` | Confirma salida del nodo Respond to Webhook; recepción por cliente no incluida aquí |
| `07-ai-agent-recuperacion-rag.png` | Logs de la llamada a Supabase desde el AI Agent; FAQ Retiros devuelta | Confirma uso de RAG dentro del agente |
| `08-derivacion-soporte-workflow.png` | Rama de derivación ejecutada | Confirma enrutamiento de consulta individual |
| `09-derivacion-soporte-respuesta-http.png` | PowerShell recibe `decision=escalate`, `requires_human=true` | Confirma respuesta recibida por cliente |
| `10-validacion-error-400-workflow.png` | Entrada inválida en rama 400 sin ejecutar Groq/Supabase | Confirma validación previa al consumo de IA |
| `11-validacion-error-400-http.png` | PowerShell recibe HTTP 400 | Cuerpo de respuesta no visible en la captura |
| `12-memoria-aislamiento-remitentes.png` | Remitente de prueba diferente; nueva `session_id` y respuesta sin datos del otro | Indicio compatible con separación; no valida persistencia de memoria exhaustivamente |

## Protección de información

Las capturas **contienen una URL pública de prueba de n8n, identificadores ficticios de remitentes y marcas de tiempo**. No se observan claves API en las diez capturas revisadas, pero debe hacerse una revisión final antes de publicarlas en GitHub. El enlace de webhook puede ser un endpoint alcanzable cuando esté habilitado; desactivar o proteger rutas de prueba y no publicar secretos. Conservar los originales localmente y publicar únicamente las imágenes cuya información se autorice a compartir.

## Cobertura pendiente

No hay captura proporcionada del cuerpo HTTP de la respuesta FAQ recibida por PowerShell ni una prueba completa de continuidad de memoria. El SQL incluido es una referencia, no un volcado del esquema real. La evidencia de la ingesta de cinco documentos se basó en capturas de la conversación, pero no se adjuntó en este ZIP específico.
