<script>
	import { onMount } from 'svelte';
	import Action from '../components/Action.svelte';
	import AddFile from '../components/AddFile.svelte';
	import Popup from '../components/Popup.svelte';
	import { interactable } from "../interactable";
	import { goto } from '$app/navigation';

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
	<Popup />
	<section>
		<div class="columns">
			<div class="column is-2">
				<Action ext="main" fileName="main.py" actionId="main_97g9g9"></Action>
			</div>
			<div class="column is-2 icon-div">
				<AddFile></AddFile>
			</div>
		</div>
	</section>
</main>

<style>
main {
	padding: 20px;
}
.icon-div {
        justify-content: center;
        display: flex;
        align-items: center;
    }
</style>