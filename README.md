# Chat Death Battle

Website statis **HTML, CSS, dan JavaScript** untuk konsultasi powerscaling berbasis VS Battles Wiki dan simulasi Death Battle.

## Halaman
- `index.html` — beranda/landing page.
- `beranda_workspace_user_dashboard.html` — workspace/dashboard.
- `konsultasi_ai_powerscaling_vsb_death_battle.html` — antarmuka konsultasi.
- `simulasi_chat_death_battle_1v1_vsb_matrix.html` — antarmuka Death Battle 1v1.
- `riwayat_arsip_audit_epistemik_vsb_death_battle.html` — riwayat dan audit.
- `profil_dan_pengaturan_vsb_death_battle.html` — profil/pengaturan.
- `portal_autentikasi_epistemik_vsb_death_battle.html` — antarmuka autentikasi.

## Status fungsional
- Halaman portal autentikasi telah dihubungkan ke Supabase Auth melalui `@supabase/supabase-js`: pendaftaran email/kata sandi, login, verifikasi melalui tautan email atau kode OTP 6 digit, kirim ulang email verifikasi, dan permintaan/pembaruan kata sandi.
- Edge Function Supabase `chat-ai` berisi alur backend untuk autentikasi terverifikasi, pencarian dan pengambilan wikitext dari API VS Battles Wiki, permintaan ke Groq, kuota harian, serta penyimpanan percakapan.
- **Formulir konsultasi dan halaman Death Battle belum terhubung ke Edge Function.** Alur autentikasi juga belum menjalani uji end-to-end melalui browser/deployment, jadi implementasi perlu diuji setelah URL redirect dikonfigurasi.
- Kunci `sb_publishable_...` pada frontend memang ditujukan untuk penggunaan publik. Jangan pernah menaruh `service_role`, `GROQ_API_KEY`, atau secret server di HTML/JavaScript frontend atau repository.

## Konfigurasi Supabase Auth
1. Di Supabase Dashboard → **Authentication → Providers**, pastikan provider Email aktif dan **Confirm email** diaktifkan agar email pengguna wajib diverifikasi.
2. Di **Authentication → URL Configuration**, atur **Site URL** sesuai alamat deployment situs. Tambahkan alamat portal yang tepat ke **Redirect URLs**, misalnya `https://DOMAIN-DEPLOY/portal_autentikasi_epistemik_vsb_death_battle.html`. Untuk uji lokal, tambahkan URL localhost yang benar-benar digunakan. Jangan menebak URL produksi; gunakan alamat deployment aktual.
3. Tautan verifikasi dari template email Supabase didukung. Form kode 6 digit dapat dipakai jika template email yang aktif juga menyertakan token OTP. Tautan pemulihan kata sandi kembali ke halaman portal yang sama.
4. Halaman memakai URL Supabase dan publishable key publik yang sudah dipasang di proyek ini. Kunci privat tetap berada di Supabase Edge Function Secrets.

## Deploy
Situs menggunakan file statis. Untuk Vercel, konfigurasi `vercel.json` menetapkan framework `Other`, menonaktifkan langkah build/install, dan menyajikan file dari root repository. Untuk GitHub Pages, pastikan Pages menerbitkan branch `main` dari root repository.
