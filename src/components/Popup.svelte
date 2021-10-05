<script>
  export let currentFile;

	function hidePopup() {
		document.getElementById("popup").style.display = "none"
	}
</script>

<div id="popup" class="modal interact">
    <div class="modal-card">
      <header class="modal-card-head">
        <div class="overflow-wrapper">
          <div class="modal-card-title">{currentFile}</div>
        </div>
        <button on:click={hidePopup} class="delete" aria-label="close"></button>
      </header>
      <section class="modal-card-body">
        <!-- Content ... -->
      </section>
    </div>
  </div>

<style>
.overflow-wrapper {
  overflow: hidden;
}
.modal-card-head {
  white-space: nowrap;
  overflow: hidden;
  width: 90%;
}
.modal-card-title {
  text-overflow: ellipsis;
  max-width: 90%;
}
.modal {
    display: none;
    width: fit-content;
    height: fit-content;
}
.modal-card {
  max-width: 300px;
}
.delete {
  margin-left: 15px; 
}
</style>