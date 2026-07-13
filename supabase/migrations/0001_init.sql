-- SMBBMU website schema

create type announcement_category as enum (
  'examination',
  'admission',
  'circular',
  'job',
  'tender',
  'news',
  'event'
);

create table institutes (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  code text not null,
  slug text not null unique,
  city text not null,
  description text not null default '',
  logo_url text,
  hero_photo_url text,
  is_constituent boolean not null default true,
  established_year int,
  programmes jsonb not null default '[]'::jsonb,
  principal_name text,
  principal_email text,
  vice_principal_name text,
  vice_principal_email text,
  student_affairs_office text,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

create table faculty (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  designation text not null,
  department text not null,
  institute_id uuid references institutes (id) on delete set null,
  photo_url text,
  email text,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

create table announcements (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  slug text not null unique,
  category announcement_category not null,
  ref_number text,
  body text not null default '',
  excerpt text,
  kicker text,
  photo_url text,
  attachments jsonb not null default '[]'::jsonb,
  published_at timestamptz,
  created_at timestamptz not null default now()
);

create table pages (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  title text not null,
  standfirst text,
  body text not null default '',
  meta jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

create table downloads (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  file_url text not null,
  category text not null,
  file_size_kb int,
  page_slug text,
  uploaded_at timestamptz not null default now()
);

create index announcements_category_idx on announcements (category);
create index announcements_published_at_idx on announcements (published_at desc);
create index faculty_institute_id_idx on faculty (institute_id);
create index faculty_department_idx on faculty (department);
create index downloads_page_slug_idx on downloads (page_slug);

alter table institutes enable row level security;
alter table faculty enable row level security;
alter table announcements enable row level security;
alter table pages enable row level security;
alter table downloads enable row level security;

create policy "Public read institutes" on institutes for select using (true);
create policy "Public read faculty" on faculty for select using (true);
create policy "Public read pages" on pages for select using (true);
create policy "Public read downloads" on downloads for select using (true);
create policy "Public read published announcements" on announcements
  for select using (published_at is not null and published_at <= now());

create policy "Admin write institutes" on institutes for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "Admin write faculty" on faculty for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "Admin write announcements" on announcements for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "Admin write pages" on pages for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "Admin write downloads" on downloads for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
