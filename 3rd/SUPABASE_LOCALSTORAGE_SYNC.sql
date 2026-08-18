-- =========================================================
-- Miina Website
-- LocalStorage <-> Supabase synchronization table
-- Run this once in Supabase SQL Editor.
-- =========================================================

create table if not exists public.miina_user_storage (
    user_id uuid primary key references auth.users(id) on delete cascade,
    data jsonb not null default '{}'::jsonb,
    updated_at timestamptz not null default now()
);

alter table public.miina_user_storage enable row level security;

-- Existing policies with these names are removed so this script can be re-run.
drop policy if exists "Users can read their own storage" on public.miina_user_storage;
drop policy if exists "Users can insert their own storage" on public.miina_user_storage;
drop policy if exists "Users can update their own storage" on public.miina_user_storage;
drop policy if exists "Users can delete their own storage" on public.miina_user_storage;

create policy "Users can read their own storage"
on public.miina_user_storage
for select
to authenticated
using (auth.uid() = user_id);

create policy "Users can insert their own storage"
on public.miina_user_storage
for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Users can update their own storage"
on public.miina_user_storage
for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "Users can delete their own storage"
on public.miina_user_storage
for delete
to authenticated
using (auth.uid() = user_id);
