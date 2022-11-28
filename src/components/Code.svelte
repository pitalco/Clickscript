<script lang="ts">
    import CodeMirror from "svelte-codemirror-editor";
    import { javascript } from "@codemirror/lang-javascript";

    let value = "var name = 'ryan'\n\nconst run = () => {\n\treturn 'running'\n}"
</script>

<div class="container">
    <CodeMirror bind:value lang={javascript()} />
</div>

<style>
</style>