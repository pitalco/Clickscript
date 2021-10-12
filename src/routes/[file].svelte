<script>
	import { onMount } from 'svelte';
    import { page } from '$app/stores';
	import CodeBlock from '../components/CodeBlock.svelte';
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
			<div class="column is-2">
				<CodeBlock ext="Function" fileName="Create items function." actionId={"fun_8439g43g43gv"}></CodeBlock>
			</div>
			<div class="column is-2">
				<CodeBlock ext="Function" fileName="Get all data function." actionId={"fun_34g524g52g5"}></CodeBlock>
			</div>
			<div class="column is-2">
				<CodeBlock ext="Line" fileName="Run the get all data function." actionId={"ln_3f34g235g35g"}></CodeBlock>
			</div>
		</div>
	</section>
</main>

<style>
main {
	padding: 20px;
}
</style>