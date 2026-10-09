-- Restrict browser roles to reading and deleting their own chat history.
-- Creating sessions and inserting chat messages must go through the authenticated
-- chat-ai Edge Function, which verifies email and reserves the server-side quota.
REVOKE INSERT, UPDATE ON TABLE public.chat_sessions FROM anon, authenticated;
REVOKE INSERT ON TABLE public.chat_messages FROM anon, authenticated;

GRANT SELECT, DELETE ON TABLE public.chat_sessions TO authenticated;
GRANT SELECT, DELETE ON TABLE public.chat_messages TO authenticated;
