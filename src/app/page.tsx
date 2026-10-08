export default function Home() {
  return (
    <main className="page-shell">
      <section className="hero-card" aria-labelledby="project-title">
        <span className="eyebrow">PROJECT FOUNDATION</span>
        <h1 id="project-title">Chat Death Battle</h1>
        <p>
          Fondasi Next.js + TypeScript sudah disiapkan. Integrasi Supabase,
          MediaWiki VSB, dan Groq akan ditambahkan bertahap setelah fondasi
          diverifikasi.
        </p>
        <div className="status-row">
          <span className="status-chip">Next.js 16</span>
          <span className="status-chip">TypeScript</span>
          <span className="status-chip">Foundation only</span>
        </div>
      </section>

      <footer>Creator: Ellias</footer>
    </main>
  );
}
