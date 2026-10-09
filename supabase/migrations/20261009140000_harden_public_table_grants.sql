-- Keep exposed-schema API privileges least-privilege.
-- RLS policies remain the row-level boundary; these grants add defense in depth.
REVOKE ALL PRIVILEGES ON TABLE public.profiles, public.chat_sessions, public.chat_messages, public.ai_usage, public.wiki_cache FROM anon;
REVOKE ALL PRIVILEGES ON TABLE public.profiles, public.chat_sessions, public.chat_messages, public.ai_usage, public.wiki_cache FROM authenticated;

GRANT SELECT, INSERT, UPDATE ON TABLE public.profiles TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.chat_sessions TO authenticated;
GRANT SELECT, INSERT, DELETE ON TABLE public.chat_messages TO authenticated;

-- Quota counters and fetched wiki cache must only be manipulated by backend service code.
REVOKE ALL PRIVILEGES ON TABLE public.ai_usage, public.wiki_cache FROM anon, authenticated;
