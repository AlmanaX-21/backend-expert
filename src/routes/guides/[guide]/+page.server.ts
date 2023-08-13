import fs from 'fs';
import { resolveWithin } from '$lib/sanitize';

export async function load({ params: { guide } }) {
	const pathPart1 = resolveWithin('guides', guide);
	const path = `${pathPart1}/index.html`;

	const htmlContent = await fs.promises.readFile(path, 'utf-8');

	return { content: htmlContent };
}
