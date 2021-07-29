<script>
    export let type;
    export let description;
</script>

<svelte:head>
  <link
    rel="stylesheet"
    type="text/css"
    href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css"
  />
  <script src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
</svelte:head>

<div class="action">
    <div class="box mainBox">
        <div class="columns">
            <div class="column is-12">
                <h2 class="content functionHeader">
                    {type}
                </h2>
                <p class="content functionExplainer">
                    {description}
                </p>
            </div>
        </div>
    </div>
</div>

<style>
.action {
    width: 100%;
}
.mainBox {
    width: 100%;
    height: 100%;
    cursor: pointer;
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