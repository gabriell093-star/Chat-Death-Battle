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
- Formulir konsultasi dan halaman Death Battle memanggil Edge Function `chat-ai` menggunakan sesi Supabase pengguna. Konsultasi mendukung gaya jawaban mendalam/ringkas, menampilkan sumber dan menyediakan salin jawaban. Halaman battle hanya menyediakan autocomplete pencarian karakter VSB (untuk Karakter A dan B); kolom form/versi tetap bisa diisi manual dan tidak lagi mengirim permintaan pencarian form. Riwayat dan dashboard membaca sesi dari basis data akun.
- Halaman profil menyimpan nama tampilan dan spesialisasi ke `profiles`, menyelaraskan nama tampilan ke metadata akun Supabase, dan memperbarui nama/initial avatar yang terlihat. Pilihan tema terang/gelap/sistem diterapkan langsung, dipertahankan secara lokal, dan disinkronkan ke profil tanpa mengambil alih pilihan lokal dengan nilai tema lama dari database.
- Perubahan tersebut lolos pemeriksaan sintaks skrip inline dan struktur statis, tetapi pencarian API dan alur UI belum dites langsung pada browser production. Alur browser end-to-end (registrasi, email verifikasi, Groq, pencarian VSB, dan Clipboard Android) masih perlu tes manual.
- Kunci `sb_publishable_...` pada frontend memang ditujukan untuk penggunaan publik. Jangan pernah menaruh `service_role`, `GROQ_API_KEY`, atau secret server di HTML/JavaScript frontend atau repository.

## Konfigurasi Supabase Auth
1. Di Supabase Dashboard → **Authentication → Providers**, pastikan provider Email aktif dan **Confirm email** diaktifkan agar email pengguna wajib diverifikasi.
2. Di **Authentication → URL Configuration**, atur **Site URL** sesuai alamat deployment situs. Tambahkan alamat portal yang tepat ke **Redirect URLs**, misalnya `https://DOMAIN-DEPLOY/portal_autentikasi_epistemik_vsb_death_battle.html`. Untuk uji lokal, tambahkan URL localhost yang benar-benar digunakan. Jangan menebak URL produksi; gunakan alamat deployment aktual.
3. Tautan verifikasi dari template email Supabase didukung. Form kode 6 digit dapat dipakai jika template email yang aktif juga menyertakan token OTP. Tautan pemulihan kata sandi kembali ke halaman portal yang sama.
4. Halaman memakai URL Supabase dan publishable key publik yang sudah dipasang di proyek ini. Kunci privat tetap berada di Supabase Edge Function Secrets.

## Keamanan dan privasi
- Halaman workspace, konsultasi/battle yang membutuhkan sesi, riwayat, dan profil harus diakses dengan akun terverifikasi; data pengguna dibatasi oleh Row Level Security (RLS).
- Tabel `ai_usage` dan `wiki_cache` tidak dapat dibaca/ditulis oleh peran browser `anon` atau `authenticated`; Edge Function menggunakan secret hanya di server.
- Edge Function `chat-ai` mewajibkan JWT pengguna, memeriksa verifikasi email, memvalidasi JSON, membatasi body 16 KB, menerapkan kuota server, dan membatasi CORS ke origin produksi `https://chatdeathbattle.vercel.app`.
- `vercel.json` memasang header keamanan (CSP, HSTS, nosniff, frame protection, Referrer-Policy, dan Permissions-Policy). CSP masih mengizinkan inline script/eval karena halaman HTML saat ini menggunakan Tailwind CDN dan skrip inline; migrasi ke aset build yang terpisah akan meningkatkan keketatan CSP.
- Metadata Open Graph/Twitter dan gambar pratinjau `og-image.svg` ditambahkan untuk kartu berbagi. Gambar dibentuk ke PNG lewat layanan image proxy; hasil kartu WhatsApp masih perlu dites dengan URL produksi dan cache preview platform.
- Supabase Security Advisor saat audit masih memperingatkan **Leaked Password Protection Disabled**. Aktifkan pengaturan ini di Supabase Dashboard → Authentication → Password Security sebelum membuka pendaftaran publik.

## Audit akhir
- Status statis: tag skrip HTML seimbang; skrip inline diperiksa sintaksnya setelah perubahan utama.
- Belum terverifikasi: pengiriman email aktual, signup/login end-to-end, pemanggilan Groq dengan akun nyata, pembatasan CORS dari browser, salin clipboard Android, dan hasil preview WhatsApp. Jangan menganggap semuanya lolos sebelum pengujian tersebut selesai.

## Deploy
Situs menggunakan file statis. Untuk Vercel, konfigurasi `vercel.json` menetapkan framework `Other`, menonaktifkan langkah build/install, dan menyajikan file dari root repository. Untuk GitHub Pages, pastikan Pages menerbitkan branch `main` dari root repository.
