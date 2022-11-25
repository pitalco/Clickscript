<script>
    import { title, content } from '../stores/popup';

    export let action;

	function displayPopup(event) {
		document.getElementById("popup").style.display = "block";

		title.set(event.target.getAttribute("desc"));
	}
</script>

<div on:click={e => displayPopup(e)} class="action" action-name={action.actionName} desc={action.desc}>
    <div class="content padding"><p class="action-header">Action {action.actionNumber}</p></div>
    <div class="box mainBox" action-name={action.actionName} desc={action.desc}>
        <div class="columns" action-name={action.actionName} desc={action.desc}>
            <div class="column is-12" action-name={action.actionName} desc={action.desc}>
                <p class="content actionExplainer" action-name={action.actionName} desc={action.desc}>
                    {action.desc}
                </p>
            </div>
        </div>
    </div>
</div>

<style>
.action-header {
    color: rgba(0, 0, 0, 0.40);
    font-weight: 600;
}
.action {
    width: 100%;
}
.content {
    margin-bottom: 0px;
}
.mainBox {
    margin-top: 10px;
    width: 100%;
    min-width: 150px;
    min-height: 80px;
    cursor: pointer;
    border-radius: 5px;
    box-shadow: 0 0.5em 1em -0.125em rgb(10 10 10 / 10%), 0 0 0 1px rgb(10 10 10 / 20%);
    overflow: hidden;
    padding: 10px;
}
.actionExplainer {
    font-size: 16px;
    text-align: left;
    text-overflow:ellipsis;
    overflow: hidden;
}
</style>