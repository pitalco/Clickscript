<script>
    import { contents } from '../stores/script';

    function addContentToStore(type, name) {
        var ret;
        if(type == "folder") {
            ret = {
            "type": "folder",
            "name": name,
            "contents": [
                {
                    "type": "script",
                    "name": "index",
                    "contents": []
                    }
                ]
            }
        }
        if(type == "file") {
            ret = {
                "type": "file",
                "name": name,
                "script": []
            }
        }
        if(type != "folder" || type != "file") {
            throw new Error("The content type " + type + " is not currently supported.")
        }
        return ret
    }

    function addFile() {
        var add = {
            "type": "folder",
            "fileName": "server",
            "ext": null,
            "contents": []
        }
        contents.update((prev) => {prev.push(add)})
    }

    function openAddFileDropDown(event) {
        var rect = event.target.getBoundingClientRect();
        var currentState = document.getElementById("add-file-dropdown").style.display
		if(currentState == "none") {
            document.getElementById("add-file-dropdown").style.display = "block";
        } else {
            document.getElementById("add-file-dropdown").style.display = "none";
        }
    }
</script>

<div class="action">
    <div on:click={e => openAddFileDropDown(e)} class="box mainBox">
        <div class="columns">
            <div class="column is-12">
                <p class="content functionExplainer">
                    Add a new action to file...
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
    width: 160px;
    height: 160px;
    cursor: pointer;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 0px;
}
.functionExplainer {
    font-size: 16px;
    text-align: center;
}
</style>