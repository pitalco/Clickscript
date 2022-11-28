<script>
	import { script } from "../stores/script";
    import { options } from "../actions/actions"
	import { Buffer } from 'buffer'
	globalThis.Buffer = Buffer

    let active = "basic"

    function onHoverOption(e, group) {
        active = e.target.getAttribute("group")
        let els = document.querySelectorAll('[is-options="true"]')
        for (let l of els) {
            if (!l.classList.contains("is-hidden")) {
                l.classList.add("is-hidden")
            }
        }
        let el = document.getElementById("options-"+group)
        el.classList.remove("is-hidden")
        el.classList.add("is-shown")
    }
</script>

<div class="action">
    <div id="add-action" class="box mainBox">
        <div class="columns">
            <div class="column is-5">
                <div class="columns is-multiline">
                    {#each options as opt}
                        <div group={opt.group} on:focus={e => onHoverOption(e, opt.group)} on:mouseover={e => onHoverOption(e, opt.group)} class="column is-full group">
                            {opt.group.charAt(0).toUpperCase() + opt.group.slice(1)}
                        </div>
                    {/each}
                </div>
            </div>
            <div class="column is-7">
                <div class="columns is-multiline">
                    {#each options as opt}
                        <div id={"options-"+opt.group} group={opt.group} class="is-hidden" style="width: 100%;" is-options="true">
                            {#each opt.actions as act}
                                <div on:click={() => script.addAction(act.name, {})} class="column is-full option">
                                    {act.description}
                                </div>
                            {/each}
                        </div>
                    {/each}
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.group {
    cursor: pointer;
}
.group:hover {
    cursor: pointer;
    background-color: rgba(0, 0, 0, 0.05);
}
.option {
    cursor: pointer;
}
.option:hover {
    cursor: pointer;
    background-color: rgba(0, 0, 0, 0.05);
}
.action {
    border-color: black;
    border-width: 1px;
    width: 100%;
    box-shadow: 0 0.5em 1em -0.125em rgb(10 10 10 / 10%), 0 0 0 1px rgb(10 10 10 / 20%);
    border-radius: 5px;
}
.mainBox {
    width: 400px;
    height: 400px;
    overflow: hidden;
    padding: 10px;
}
</style>