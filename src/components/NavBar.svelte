<script>
	const toggleCodeDiv = () => {
		let codeDiv = document.getElementById("code-div");
		if (codeDiv.classList.contains("is-hidden")) {
			codeDiv.classList.remove("is-hidden")
            codeDiv.classList.add("is-block")
		} else {
			codeDiv.classList.remove("is-block")
            codeDiv.classList.add("is-hidden")
		}
		let canvasDiv = document.getElementById("canvas-div");
		if (canvasDiv.classList.contains("is-hidden")) {
			canvasDiv.classList.remove("is-hidden")
            canvasDiv.classList.add("is-grid")
		} else {
			canvasDiv.classList.remove("is-grid")
            canvasDiv.classList.add("is-hidden")
		}
	}
</script>

<nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
        <a class="navbar-item">
            <img src="/icon.svg" height="100">
        </a>

        <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        </a>
    </div>

    <div id="navbarBasicExample" class="navbar-menu">

        <div class="navbar-end">
        <div class="navbar-item">
            <div class="buttons">
            <a on:click={toggleCodeDiv} class="button is-primary purple">
                <strong>Code</strong>
            </a>
            </div>
        </div>
        </div>
    </div>
</nav>

<style>
    .purple {
        background-color: #2D0676;
    }
    .purple:hover {
        background-color: #2d0676e1;
    }
</style>