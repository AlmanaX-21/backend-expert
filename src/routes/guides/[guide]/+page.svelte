<script lang="ts">
    export let data: {
        content: string
    };
</script>

<p>Markdown:</p>
<article>
    {@html data.content}
</article>