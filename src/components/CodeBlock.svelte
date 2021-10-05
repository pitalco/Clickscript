<script>
    import { popup } from '../stores/popup';

    export let ext;
    export let fileName;
    export let actionId;

	function displayPopup(event) {
		document.getElementById("popup").style.display = "block";

		popup.set(event.target.getAttribute("file-name"));
	}
</script>

<svelte:head>
  <link
    rel="stylesheet"
    type="text/css"
    href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css"
  />
  <script src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
</svelte:head>

<div on:click={e => displayPopup(e)} class="action" action-id={actionId} file-name={fileName}>
    <div class="box mainBox" action-id={actionId} file-name={fileName}>
        <div class="columns" action-id={actionId} file-name={fileName}>
            <div class="column is-12" action-id={actionId} file-name={fileName}>
                <h2 class="content functionHeader" action-id={actionId} file-name={fileName}>
                    {ext}
                </h2>
                <p class="content functionExplainer" action-id={actionId} file-name={fileName}>
                    {fileName}
                </p>
            </div>
        </div>
    </div>
</div>

<style>
h2 {
    margin-bottom: 0px;
}
.action {
    width: 100%;
}
.content {
    margin-bottom: 0px;
}
.mainBox {
    width: 100%;
    height: 125px;
    cursor: pointer;
    border-radius: 5px;
    overflow: hidden;
    padding: 0px;
    padding-top: 10px;
}
.functionHeader {
    font-size: 22px;
    text-align: center;
    text-overflow: ellipsis;
}
.functionExplainer {
    font-size: 16px;
    text-align: center;
    text-overflow:ellipsis;
    overflow: hidden;
}
</style>