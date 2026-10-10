-- Allow users to enter their own display title/specialization (up to 80 characters).
-- This replaces the earlier enum-like restriction while preserving a non-empty value.
ALTER TABLE public.profiles
  ALTER COLUMN specialty SET DEFAULT 'Tier 1-A Auditor';

ALTER TABLE public.profiles
  DROP CONSTRAINT IF EXISTS profiles_specialty_check;

ALTER TABLE public.profiles
  ADD CONSTRAINT profiles_specialty_check
  CHECK (
    specialty IS NULL
    OR (
      char_length(btrim(specialty)) >= 1
      AND char_length(btrim(specialty)) <= 80
    )
  );
