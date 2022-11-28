<script>
    import { script } from "../stores/script";

    export let title
    export let type
    export let line
    export let action

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

    console.log($script)
</script>

<div class="column is-12">
    <p class="input-text">{title}</p>
    {#if type == "list"}
        <input value={action.action.args[title.toLowerCase()]} line={line} arg={title.toLowerCase()} on:change={updateAction(line)} type="text" class="input">
        <div class="is-flex">
            <button class="button">+</button>
            <button class="button">-</button>
        </div>
    {:else}
        <input value={action.action.args[title.toLowerCase()]} line={line} arg={title.toLowerCase()} on:change={updateAction(line)} type="text" class="input">
    {/if}
</div>

<style>
    .button {
        font-weight: 700;
    }
    .is-flex {
        justify-content: space-between;
        margin-top: 10px;
    }
    .input-text {
        color: rgba(0, 0, 0, 0.40);
        font-weight: 600;
    }
</style>