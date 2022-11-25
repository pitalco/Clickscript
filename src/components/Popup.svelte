<script>
  import { title, content } from '../stores/popup';

	function hidePopup() {
		document.getElementById("popup").style.display = "none"
	}
</script>

<div id="popup" class="modal interact">
  <div class="modal-card">
    <header class="modal-card-head">
      <div class="overflow-wrapper">
        <input class="input is-medium title-input" value={$title}>
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
  display: flex;
  justify-content: space-between;
  padding: 0px;
  padding-left: 15px;
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
  right: 10px;
  position: absolute;
}
.title-input {
  padding: 0px;
  background-color: transparent;
  border: none;
  box-shadow: none;
  width: 90%;
  cursor: move;
}
</style>