<script>
	import { onMount } from 'svelte';
	import CodeBlock from '../components/CodeBlock.svelte';
	import Popup from '../components/Popup.svelte';
	import { interactable } from "../interactable";
	import { contents } from '../stores/project';
	import AddEvent from '../components/AddEvent.svelte';

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
		<div class="columns is-multiline">
			{#each $contents as item}
				<div class="column is-2">
					<CodeBlock type={item.type} ext={item.ext} action={item}></CodeBlock>
				</div>
			{/each}
			<div class="column is-2">
				<AddEvent></AddEvent>
			</div>
		</div>
	</section>
</main>

<style>
.column {
	flex: content;
}
.columns {
	display: flex;
	align-items: flex-end;
}
main {
	padding: 20px;
}
</style>