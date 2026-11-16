# Configuración y reproducción

1. Importar `workflows/02-ingesta-faq.json` y `workflows/01-soporte-rag.json` en n8n. No activar todavía el flujo principal.
2. Crear credenciales de Supabase (URL del proyecto + clave secreta de backend), Google Gemini API, Groq y Google Sheets OAuth. No usar claves en código ni en commits.
3. Revisar/crear `public.documents` y `public.match_documents` usando `sql/schema_referencia.sql` como **referencia**. Verificar que el esquema real y la dimensión vectorial coincidan; la tabla de la demostración ya contenía cinco FAQ y fue consultada con éxito.
4. En **ambos workflows**, asignar a `Embeddings Google Gemini` la credencial propia de Google AI Studio y confirmar el modelo `models/gemini-embedding-001`. El JSON original de ingesta exportado conservaba una referencia a `Gateway credits`, por eso fue limpiado.
5. En el workflow de ingesta, revisar `Default Data Loader` (campo `$json.text`), `Recursive Text Splitter` (500/80) y tabla `documents`. Ejecutarlo manualmente **solo si faltan documentos**; repetir sin limpieza crea duplicados.
6. En el workflow principal, configurar la URL de Google Sheets en `Google Sheets - Estado operativo`; hoja `FAQ_ESTADO`, columnas `categoria`, `servicio`, `estado`, `tiempo_estimado`, `mensaje_cliente`.
7. Confirmar conexiones del agente con Groq, memoria y herramienta Supabase `consultar_faq_playuzu`; tabla `documents`.
8. Desde el **Editor**, pulsar `Execute workflow` (no solo `Listen for test event`) y enviar un POST al **Test URL**. El endpoint acepta `message` y `from`.
9. Revisar Logs de Supabase para comprobar documentos recuperados, y la respuesta HTTP para verificar `decision`, `requires_human` y `answer`.
10. Para una publicación real, aplicar autenticación al Webhook, permisos mínimos, rate limiting, protección de datos y monitoreo de costos; no se cubrieron en esta demostración.

## Ejemplo de solicitud (PowerShell)

```powershell
$url = 'https://TU_INSTANCIA.n8n.cloud/webhook-test/playuzu-rag-demo'
$body = @{message='¿Cómo funcionan los retiros?'; from='59899000001'} | ConvertTo-Json
Invoke-RestMethod -Uri $url -Method Post -ContentType 'application/json' -Body ([Text.Encoding]::UTF8.GetBytes($body))
```

Usar identificadores **ficticios** en las demostraciones.
