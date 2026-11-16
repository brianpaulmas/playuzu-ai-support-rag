-- Esquema de referencia para la demostración PlayUZU.
-- Debe verificarse contra el esquema existente de Supabase antes de aplicarlo.
-- No ejecutar sobre una tabla poblada sin respaldo.
create extension if not exists vector with schema extensions;

create table if not exists public.documents (
  id bigserial primary key,
  content text not null,
  metadata jsonb default '{}'::jsonb,
  embedding extensions.vector(3072)
);

-- La búsqueda se ejecuta desde un servicio backend mediante una clave secreta.
-- Activar RLS y no conceder lectura pública anónima.
alter table public.documents enable row level security;

create or replace function public.match_documents (
  query_embedding extensions.vector(3072),
  match_count int default 4,
  filter jsonb default '{}'::jsonb
)
returns table (id bigint, content text, metadata jsonb, similarity float)
language plpgsql
stable
as $$
begin
  return query
    select d.id, d.content, d.metadata,
           (1 - (d.embedding <=> query_embedding))::float as similarity
    from public.documents d
    where d.metadata @> filter
    order by d.embedding <=> query_embedding
    limit greatest(1, least(match_count, 40));
end;
$$;

-- Consultas de diagnóstico, solo lectura:
-- select count(*) from public.documents;
-- select routine_name from information_schema.routines
-- where routine_schema='public' and routine_name='match_documents';
