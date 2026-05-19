-- ============================================================
-- 贺01 AI 实战资源库 — 手动排序字段
-- 请在 Supabase SQL Editor 中执行本文件
-- ============================================================

-- 1. 为四张表增加 sort_order 字段
alter table public.tools add column if not exists sort_order integer default 999;
alter table public.resources add column if not exists sort_order integer default 999;
alter table public.tutorials add column if not exists sort_order integer default 999;
alter table public.cases add column if not exists sort_order integer default 999;

-- 2. 创建排序索引（sort_order asc + updated_at desc）
create index if not exists idx_tools_sort_order on public.tools(sort_order asc, updated_at desc);
create index if not exists idx_resources_sort_order on public.resources(sort_order asc, updated_at desc);
create index if not exists idx_tutorials_sort_order on public.tutorials(sort_order asc, updated_at desc);
create index if not exists idx_cases_sort_order on public.cases(sort_order asc, updated_at desc);

-- 3. 把已有数据的 sort_order 从 null 更新为 999
update public.tools set sort_order = 999 where sort_order is null;
update public.resources set sort_order = 999 where sort_order is null;
update public.tutorials set sort_order = 999 where sort_order is null;
update public.cases set sort_order = 999 where sort_order is null;
