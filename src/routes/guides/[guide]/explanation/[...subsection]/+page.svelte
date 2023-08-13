<script lang="ts">
    export let data: {
        content: string
    };
</script>

<p>Markdown (Explanation...):</p>
<article>
    {@html data.content}
</article>