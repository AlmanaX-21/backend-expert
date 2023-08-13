<script lang="ts">
    export let data: {
        content: string
    };
</script>

<p>Markdown (Integration...):</p>
<article>
    {@html data.content}
</article>