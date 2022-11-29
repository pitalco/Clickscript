<script>
    import { script } from "../stores/script";
    import CodeMirror from "svelte-codemirror-editor";
    import { javascript } from "@codemirror/lang-javascript";
    import { afterUpdate } from "svelte";

    export let title
    export let line
    let value = ""

    afterUpdate(() => {
        if (value == "[") {value = "[]"}
        if (value == "{") {value = "{}"}
        if (value == null) {value = ""}
    })

    function updateAction(line) {
        const els = document.querySelectorAll('[line="' + line + '"]')
        let json = {}
        for (let el of els) {
            // get the name of the arg for this input
            let argName = el.getAttribute("arg")
            // add the arg into the json as the input value
            json[argName] = el.value
            script.updateAction(line, json)
        }
    }
</script>

<div class="column is-12">
    <p class="input-text">{title}</p>
    {#if isNaN(value) || value == ""}
        {#if value[0] == "[" || value[0] == "{"}
            <div style="cursor: text;">
                <CodeMirror bind:value lang={javascript()} />
            </div>
        {:else}
            <input bind:value={value} line={line} arg={title.toLowerCase()} on:change={updateAction(line)} type="text" class="input" autofocus="autofocus">
        {/if}
    {:else}
        <input bind:value={value} line={line} arg={title.toLowerCase()} on:change={updateAction(line)} type="number" class="input" autofocus="autofocus">
    {/if}
</div>

<style>
    .input-text {
        color: rgba(0, 0, 0, 0.40);
        font-weight: 600;
    }
</style>