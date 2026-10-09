ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS specialty text NOT NULL DEFAULT 'tier-1a'
  CHECK (specialty IN ('tier-1a','dimensional','canonical','cosmology'));
