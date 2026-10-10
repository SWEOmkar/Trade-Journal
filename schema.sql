-- Run this once in Supabase: SQL Editor -> New query -> paste -> Run

create table if not exists public.settings (
  user_id uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  start_balance numeric not null default 10000
);

create table if not exists public.trades (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  trade_date date not null,
  ticker text not null,
  side text not null check (side in ('Long','Short')),
  strategy text,
  entry_price numeric not null,
  exit_price numeric not null,
  stop_loss numeric not null,
  shares numeric not null,
  fees numeric default 0,
  pnl_override numeric,
  created_at timestamptz default now()
);
create index if not exists trades_user_date on public.trades(user_id, trade_date);

-- Row Level Security: each user can only see and change their own rows
alter table public.settings enable row level security;
alter table public.trades   enable row level security;

create policy "own settings" on public.settings for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own trades" on public.trades for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
