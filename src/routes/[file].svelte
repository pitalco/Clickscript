<script>
	import { onMount } from 'svelte';
    import { page } from '$app/stores';
	import CodeBlock from '../components/CodeBlock.svelte';
	import Popup from '../components/Popup.svelte';
	import { interactable } from "../interactable";
    import { popup } from '../stores/popup';

	onMount(() => {
		const elements = [...document.querySelectorAll(".interact")];

		if (elements) {
			for (const el of elements) {
			interactable(el);
			}
		}
	});
</script>

<svelte:head>
  <link
    rel="stylesheet"
    type="text/css"
    href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css"
  />
  <script src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
</svelte:head>

<main>
	<Popup currentFile={$popup}/>
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