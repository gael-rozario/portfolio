<script>
  import ParticleCanvas from './lib/ParticleCanvas.svelte';

  // ── Edit your details here ──────────────────────────────────────────
  const name    = 'Gael Rozario';
  const title   = 'DevOps Engineer';
  const tagline = 'Building reliable infrastructure, one pipeline at a time.';

  const links = [
    {
      label: 'Email',
      value: 'hi@gaelrozario.com',
      href:  'mailto:hi@gaelrozario.com',
      icon:  '✉',
    },
    {
      label: 'Phone',
      value: '+91 98955 81044',
      href:  'tel:+919895581044',
      icon:  '☎',
    },
    {
      label: 'GitHub',
      value: 'github.com/gael-rozario',
      href:  'https://github.com/gael-rozario',
      icon:  '',
    },
    {
      label: 'LinkedIn',
      value: 'linkedin.com/in/gael-rozario',
      href:  'https://www.linkedin.com/in/gael-rozario-834171181/',
      icon:  '',
    },
    {
      label: 'Website',
      value: 'gaelrozario.com',
      href:  'https://gaelrozario.com',
      icon:  '🌐',
    },
  ];
  // ────────────────────────────────────────────────────────────────────
</script>

<ParticleCanvas />

<main>
  <!-- gradient orbs -->
  <div class="orb orb1" aria-hidden="true"></div>
  <div class="orb orb2" aria-hidden="true"></div>

  <section class="hero">
<h1>
      {#each name.split('') as char, i}
        <span class="char" style="animation-delay:{i * 40}ms">{char === ' ' ? '\u00a0' : char}</span>
      {/each}
    </h1>
    <p class="role">{title}</p>
    <p class="tagline">{tagline}</p>

    <div class="divider"></div>

    <div class="cards">
      {#each links as link, i}
        <a
          class="card"
          href={link.href}
          target={link.href.startsWith('http') ? '_blank' : undefined}
          rel={link.href.startsWith('http') ? 'noopener noreferrer' : undefined}
          style="animation-delay:{300 + i * 80}ms"
        >
          <span class="card-icon">{link.icon}</span>
          <span class="card-label">{link.label}</span>
          <span class="card-value">{link.value}</span>
          <span class="card-arrow">↗</span>
        </a>
      {/each}
    </div>
  </section>

  <footer>
    <p>© {new Date().getFullYear()} {name} · Built with Svelte</p>
  </footer>
</main>

<style>
  /* ── Layout ────────────────────────────────────────────────────── */
  main {
    position: relative;
    z-index: 1;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 2rem 1.5rem 4rem;
    overflow: hidden;
  }

  /* ── Gradient orbs ─────────────────────────────────────────────── */
  .orb {
    position: fixed;
    border-radius: 50%;
    filter: blur(120px);
    opacity: 0.18;
    pointer-events: none;
    animation: drift 14s ease-in-out infinite alternate;
  }
  .orb1 {
    width: 500px; height: 500px;
    background: #7b2ff7;
    top: -120px; left: -100px;
    animation-duration: 16s;
  }
  .orb2 {
    width: 420px; height: 420px;
    background: #00d4ff;
    bottom: -100px; right: -80px;
    animation-duration: 20s;
    animation-direction: alternate-reverse;
  }
  @keyframes drift {
    from { transform: translate(0, 0) scale(1); }
    to   { transform: translate(60px, 40px) scale(1.08); }
  }

  /* ── Hero ──────────────────────────────────────────────────────── */
  .hero {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    gap: 1rem;
    max-width: 720px;
    width: 100%;
  }

h1 {
    font-size: clamp(2.8rem, 8vw, 5.5rem);
    font-weight: 800;
    line-height: 1.05;
    letter-spacing: -0.02em;
    background: linear-gradient(135deg, #e8eaf6 30%, #00d4ff 70%, #7b2ff7 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }

  .char {
    display: inline-block;
    animation: charPop 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) both;
  }
  @keyframes charPop {
    from { opacity: 0; transform: translateY(24px) scale(0.8); }
    to   { opacity: 1; transform: translateY(0)    scale(1); }
  }

  .role {
    font-size: clamp(1rem, 3vw, 1.35rem);
    font-weight: 500;
    color: #00d4ff;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    animation: fadeUp 0.7s 0.3s ease both;
  }

  .tagline {
    font-size: clamp(0.9rem, 2vw, 1.05rem);
    color: #9e9e9e;
    max-width: 460px;
    line-height: 1.6;
    animation: fadeUp 0.7s 0.45s ease both;
  }

  .divider {
    width: 60px; height: 2px;
    background: linear-gradient(90deg, #7b2ff7, #00d4ff);
    border-radius: 2px;
    margin: 0.5rem 0;
    animation: fadeUp 0.7s 0.5s ease both;
  }

  /* ── Cards ─────────────────────────────────────────────────────── */
  .cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 0.85rem;
    width: 100%;
    margin-top: 0.5rem;
  }

  .card {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 0.25rem;
    background: rgba(255, 255, 255, 0.04);
    border: 1px solid rgba(255, 255, 255, 0.09);
    border-radius: 14px;
    padding: 1.1rem 1.2rem;
    text-decoration: none;
    color: inherit;
    position: relative;
    overflow: hidden;
    transition: transform 0.2s ease, border-color 0.2s ease, background 0.2s ease;
    animation: fadeUp 0.6s ease both;
    backdrop-filter: blur(8px);
  }
  .card::before {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(0,212,255,0.07), rgba(123,47,247,0.07));
    opacity: 0;
    transition: opacity 0.2s ease;
  }
  .card:hover {
    transform: translateY(-4px);
    border-color: rgba(0, 212, 255, 0.4);
    background: rgba(255, 255, 255, 0.07);
  }
  .card:hover::before { opacity: 1; }

  .card-icon {
    font-size: 1.3rem;
    line-height: 1;
    margin-bottom: 0.2rem;
  }
  .card-label {
    font-size: 0.7rem;
    font-weight: 700;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: #00d4ff;
  }
  .card-value {
    font-size: 0.85rem;
    color: #c9cfe8;
    word-break: break-all;
  }
  .card-arrow {
    position: absolute;
    top: 0.9rem;
    right: 1rem;
    font-size: 0.9rem;
    color: rgba(255,255,255,0.2);
    transition: color 0.2s ease, transform 0.2s ease;
  }
  .card:hover .card-arrow {
    color: #00d4ff;
    transform: translate(2px, -2px);
  }

  /* ── Footer ────────────────────────────────────────────────────── */
  footer {
    position: absolute;
    bottom: 1.5rem;
    font-size: 0.75rem;
    color: #555;
    letter-spacing: 0.05em;
  }

  /* ── Shared animations ─────────────────────────────────────────── */
  @keyframes fadeDown {
    from { opacity: 0; transform: translateY(-12px); }
    to   { opacity: 1; transform: translateY(0); }
  }
  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(16px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* ── Responsive ────────────────────────────────────────────────── */
  @media (max-width: 480px) {
    .cards { grid-template-columns: 1fr 1fr; }
  }
</style>
