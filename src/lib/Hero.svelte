<script>
	const links = [
		{ label: 'gaelrozario.com', href: 'https://gaelrozario.com' },
		{ label: 'GitHub',          href: 'https://github.com/gael-rozario' },
		{ label: 'Blog',            href: 'https://blog.gaelrozario.com' },
		{ label: 'LinkedIn',        href: 'https://www.linkedin.com/in/gael-rozario-834171181' },
		{ label: 'Resume',          href: '/resume.pdf' },
	];
</script>

<main class="hero">
	<h1 class="name">Gael Rozario</h1>

	<nav class="links" aria-label="Social links">
		{#each links as link, i}
			<a href={link.href}>{link.label}</a>
			{#if i < links.length - 1}
				<span class="pipe" aria-hidden="true">|</span>
			{/if}
		{/each}
	</nav>

	<p class="email">
		<a href="mailto:hi@gaelrozario.com">hi@gaelrozario.com</a>
	</p>

	<img
		class="diagram"
		src="/system-diagram.png"
		alt="Abstract bird's-eye system architecture diagram — server racks, databases, VPC and cloud components rendered as black silhouettes"
	/>
</main>

<style>
	.hero {
		position: relative;
		z-index: 1;
		width: 100%;
		max-width: 980px;
		padding: 64px 51px;
		text-align: center;
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	.name {
		font-weight: 800;
		font-size: 37px;
		letter-spacing: 1px;
		text-transform: uppercase;
		line-height: 1;
		margin: 0;
		white-space: nowrap;
		color: var(--ink);
	}

	.links {
		display: flex;
		align-items: center;
		flex-wrap: wrap;
		justify-content: center;
		gap: 10px;
		margin-top: 21px;
		font-weight: 700;
		font-size: 14px;
	}

	.links a {
		color: var(--link);
		text-decoration: none;
	}

	.links a:hover {
		text-decoration: underline;
	}

	.pipe {
		color: var(--line);
	}

	.email {
		margin-top: 10px;
		margin-bottom: 0;
		font-size: 13px;
		opacity: 0.85;
	}

	.email a {
		color: inherit;
		text-decoration: none;
	}

	.email a:hover {
		text-decoration: underline;
	}

	.diagram {
		width: min(504px, 96%);
		height: auto;
		margin-top: 120px;
		display: block;
	}

	@media (max-width: 600px) {
		.hero {
			padding: 48px 20px;
		}

		.name {
			font-size: clamp(22px, 6.5vw, 37px);
			white-space: normal;
		}
	}
</style>
