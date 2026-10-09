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
Ini masih frontend/prototipe. Login, pendaftaran, verifikasi email, pengaturan akun, dan penyimpanan riwayat belum terhubung ke backend; UI tidak boleh dianggap menyimpan data sungguhan. Integrasi Supabase dan Groq dilakukan pada tahap berikutnya, dengan API key hanya disimpan di server/secret store.

## Deploy
Situs menggunakan file statis. Untuk Vercel, konfigurasi `vercel.json` menetapkan framework `Other`, menonaktifkan langkah build/install, dan menyajikan file dari root repository. Untuk GitHub Pages, pastikan Pages menerbitkan branch `main` dari root repository.
