-- Mes séances : table des séances de sport.
-- À coller dans Supabase → SQL Editor → New query, puis « Run ».

create table if not exists public.seances (
  id         text primary key,
  user_id    uuid not null default auth.uid() references auth.users(id) on delete cascade,
  date       date not null,
  theme      text not null default '',
  note       text not null default '',
  ex         jsonb not null default '[]'::jsonb,  -- [{n, note, sets:[{r, p}]}]
  t          bigint not null default 0,           -- moment de l'enregistrement (ms)
  updated_at timestamptz not null default now()
);

create index if not exists seances_user_date on public.seances (user_id, date desc);

-- L'appli passe par l'API Supabase : seuls les comptes connectés y ont accès.
revoke all on public.seances from anon;
grant select, insert, update, delete on public.seances to authenticated;

-- Chaque compte ne voit et ne modifie que ses propres séances.
alter table public.seances enable row level security;

drop policy if exists "lire ses seances" on public.seances;
drop policy if exists "ajouter ses seances" on public.seances;
drop policy if exists "modifier ses seances" on public.seances;
drop policy if exists "supprimer ses seances" on public.seances;

create policy "lire ses seances" on public.seances
  for select to authenticated using ((select auth.uid()) = user_id);
create policy "ajouter ses seances" on public.seances
  for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "modifier ses seances" on public.seances
  for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "supprimer ses seances" on public.seances
  for delete to authenticated using ((select auth.uid()) = user_id);

-- Met à jour updated_at à chaque modification.
create or replace function public.seances_touch() returns trigger
language plpgsql set search_path = '' as $$
begin new.updated_at = now(); return new; end $$;

drop trigger if exists seances_touch on public.seances;
create trigger seances_touch before update on public.seances
  for each row execute function public.seances_touch();
