<script>
	import { onMount } from 'svelte';
	import Content from '../components/Content.svelte';
	import AddFile from '../components/AddFile.svelte';
	import Popup from '../components/Popup.svelte';
	import { interactable } from "../interactable";
	import { goto } from '$app/navigation';
	import { contents } from '../stores/project';
	import RightClickMenu from '../components/RightClickMenu.svelte';

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
			{#each $contents as item}
				<div class="column is-2">
					<Content type={item.type} ext={item.ext} fileName={item.fileName} actionId="main_97g9g9"></Content>
				</div>
			{/each}
			<div class="column is-2">
				<AddFile></AddFile>
			</div>
		</div>
	</section>
</main>

<style>
main {
	padding: 20px;
}
</style>