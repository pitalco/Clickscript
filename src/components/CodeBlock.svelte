<script>
    import { title, action as act } from '../stores/local';

    export let action;

	function displayPopup() {
		document.getElementById("popup").style.display = "block";

        act.set(action)
		title.set(action.notes);
	}
</script>

<div on:click={e => displayPopup(e)} class="action" action-name={action.action.action} desc={action.notes}>
    <div class="content padding"><p class="action-header">Action {action.line+1}</p></div>
    <div class="box mainBox" action-name={action.action.action} desc={action.notes}>
        <div class="columns" action-name={action.action.action} desc={action.notes}>
            <div class="column is-12" action-name={action.action.action} desc={action.notes}>
                <p class="content actionExplainer" action-name={action.action.action} desc={action.notes}>
                    {action.notes}
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
    width: max-content;
}
.mainBox {
    margin-top: 10px;
    width: 200px;
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