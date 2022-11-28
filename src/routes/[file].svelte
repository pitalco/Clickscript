<script>
	import { onMount } from 'svelte';
	import Popup from '../components/Popup.svelte';
	import { interactable } from "../interactable";

	onMount(() => {
		const elements = [...document.querySelectorAll(".interact")];

		if (elements) {
			for (const el of elements) {
			interactable(el);
			}
		}
	});
</script>

<main>
	<Popup/>
	<section>
		<div class="columns">
		</div>
	</section>
</main>

<style>
main {
	padding: 20px;
}
</style>