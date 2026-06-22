<div class="bg" aria-hidden="true"></div>

<style>
	.bg {
		position: fixed;
		inset: 0;
		z-index: 0;
		background-image: url('/honeycomb.png');
		background-repeat: repeat;
		background-size: 289px 283px;
		animation: drift 20s linear infinite;
		will-change: background-position;
		pointer-events: none;
	}

	@keyframes drift {
		from { background-position: 0 0; }
		to   { background-position: 289px 283px; }
	}

	@media (prefers-reduced-motion: reduce) {
		.bg {
			animation: none;
		}
	}
</style>
