<script>
	import Action from '../components/Action.svelte'
	import Popup from '../components/Popup.svelte'

	function displayPopup() {
		document.getElementById("popup").display = "block"
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

<main>
	<Popup />
	<section>
		<div class="columns">
			<div on:click={displayPopup} class="column is-2">
				<Action type="Function" description="A scraper function to scrape an HTML page provided."></Action>
			</div>
			<div on:click={displayPopup} class="column is-2">
				<Action type="Endpoint" description="Return the scraped body as JSON on endpoint."></Action>
			</div>
			<div on:click={displayPopup} class="column is-2">
				<Action type="Endpoint" description="A scraper function to scrape an HTML page provided."></Action>
			</div>
			<div on:click={displayPopup} class="column is-2">
				<Action type="Task" description="Run an email to send the scraped data every other day."></Action>
			</div>
			<div on:click={displayPopup} class="column is-2">
				<Action type="Script" description="Take the scraper functions and run them."></Action>
			</div>
			<div on:click={displayPopup} class="column is-2">
				<Action type="Script" description="Take the scraper functions and run csv push."></Action>
			</div>
		</div>
	</section>
</main>

<style>
main {
	padding: 20px;
}
</style>