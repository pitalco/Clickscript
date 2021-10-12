<script>
    import { title, content } from '../stores/popup';
    import { goto } from '$app/navigation';

    export let ext;
    export let fileName;
    export let actionId;

	function displayPopup(event) {
		document.getElementById("popup").style.display = "block";

		title.set(event.target.getAttribute("file-name"));
	}
</script>

<div on:click={displayPopup} on:dblclick={e => goto("/" + actionId)} class="action" file-name={fileName}>
    <div class="box mainBox" file-name={fileName}>
        <div class="columns" file-name={fileName}>
            <div class="column is-12" file-name={fileName}>
                <h2 class="content functionHeader" file-name={fileName}>
                    {ext}
                </h2>
                <p class="content functionExplainer" file-name={fileName}>
                    {fileName}
                </p>
            </div>
        </div>
    </div>
</div>

<style>
.action {
    width: 100%;
    height: 125px;
}
.content {
    margin-bottom: 0px;
}
.mainBox {
    width: 100%;
    height: 100%;
    cursor: pointer;
    border-radius: 5px;
}
.functionHeader {
    font-size: 20px;
    text-align: center;
}
.functionExplainer {
    font-size: 16px;
    text-align: center;
}
</style>