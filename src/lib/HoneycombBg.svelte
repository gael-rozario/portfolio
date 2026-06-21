<div class="bg" aria-hidden="true"></div>

<style>
	.bg {
		position: fixed;
		inset: 0;
		z-index: 0;
		background-image: url('/honeycomb.png');
		background-repeat: repeat;
		background-size: 300px 294px;
		animation: drift 20s linear infinite;
		will-change: background-position;
		pointer-events: none;
	}

	@keyframes drift {
		from { background-position: 0 0; }
		to   { background-position: 300px 294px; }
	}

	@media (prefers-reduced-motion: reduce) {
		.bg {
			animation: none;
		}
	}
</style>
