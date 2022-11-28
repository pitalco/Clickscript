<script>
    function toggleAddActionDiv(e) {
        let el = document.getElementById("add-action-div");
        if (el.classList.contains("is-hidden")) {
            el.classList.remove("is-hidden")
            el.classList.add("is-block")
        } else {
            el.classList.remove("is-block")
            el.classList.add("is-hidden")
        }
        let pos = e.target.getBoundingClientRect()
        el.style.left = String(pos.left-23)+"px"
        el.style.top = String(pos.top+27)+"px"
    }
</script>

<div on:click={toggleAddActionDiv} id="action" class="action">
    <div class="box mainBox">
        <div class="columns">
            <div class="column is-12">
                Add an action...
            </div>
        </div>
    </div>
</div>

<style>
.action {
    width: 100%;
}
.mainBox {
    width: 200px;
    min-height: 80px;
    height: 100%;
    cursor: pointer;
    border-radius: 5px;
    box-shadow: 0 0.5em 1em -0.125em rgb(10 10 10 / 10%), 0 0 0 1px rgb(10 10 10 / 20%);
    overflow: hidden;
    padding: 10px;
}
</style>