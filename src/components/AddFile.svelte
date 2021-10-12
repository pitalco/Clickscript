<script>
    import { contents } from '../stores/project';

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
        contents.update((prev) => {prev.push()})
    }

    function openPopup() {
		document.getElementById("popup").style.display = "block";

		popup.set(event.target.getAttribute("file-name"));
    }
</script>

<span on:click={addFile} on:dblclick={openPopup} class="icon is-large">
    <i class="fas fa-plus fa-2x"></i>
</span>

<style>
</style>