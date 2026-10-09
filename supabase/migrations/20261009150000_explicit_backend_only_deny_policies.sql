-- Explicitly deny browser roles access to backend-only data.
DROP POLICY IF EXISTS "backend only deny browser access" ON public.ai_usage;
CREATE POLICY "backend only deny browser access"
ON public.ai_usage
FOR ALL
TO anon, authenticated
USING (false)
WITH CHECK (false);

DROP POLICY IF EXISTS "backend only deny browser access" ON public.wiki_cache;
CREATE POLICY "backend only deny browser access"
ON public.wiki_cache
FOR ALL
TO anon, authenticated
USING (false)
WITH CHECK (false);
