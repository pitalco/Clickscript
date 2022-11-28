<script>
	import { afterUpdate } from 'svelte';
	import CodeBlock from '../components/CodeBlock.svelte';
	import Popup from '../components/Popup.svelte';
	import { interactable } from "../interactable";
	import { script } from '../stores/script';
	import AddEvent from '../components/AddEvent.svelte';
	import NavBar from '../components/NavBar.svelte';
	import AddAction from '../components/AddAction.svelte';
	import Code from '../components/Code.svelte';
	import { Buffer } from 'buffer'
	globalThis.Buffer = Buffer

	afterUpdate(() => {
		const elements = [...document.querySelectorAll(".interact")];

		if (elements) {
			for (const el of elements) {
				interactable(el);
			}
		}
	});
</script>

<div id="main-div" style="min-height: 100vh;">
	<NavBar/>
	<div class="container">
		<div id="canvas-div" class="is-grid columns is-multiline">
			<Popup/>
			{#each $script.script as item}
				<div class="column is-2">
					<CodeBlock action={item}></CodeBlock>
				</div>
			{/each}
			<div class="column is-2">
				<AddEvent></AddEvent>
			</div>
			<div id="add-action-div" class="add-action-div is-hidden">
				<AddAction/>
			</div>
		</div>
		<div id="code-div" class="is-hidden">
			<Code/>
		</div>
	</div>
</div>

<style>
.container {
	padding: 5px;	
}
.columns {
	display: grid;
	grid-gap: 0px;
	grid-template-columns: auto auto auto auto;
	justify-content: start;
    align-items: end;
}
.add-action-div {
	position: absolute;
	z-index: 100;
    left: 448px;
    top: 127px;
}
</style>