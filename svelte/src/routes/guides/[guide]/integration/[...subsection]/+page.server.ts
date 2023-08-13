import fs from 'fs';
import { resolveWithin } from '$lib/sanitize';

export async function load({ params: { guide, subsection } }) {
	const pathPart1 = resolveWithin('guides', guide);

	let path = `${pathPart1}/integration/`;

	if (subsection) {
		path = resolveWithin(path, `${subsection}`);

		try {
			const test = `${path}/index.html`;
			await fs.promises.access(test);
			path = test;
		} catch {
			path = `${path}.html`;
		}
	} else {
		path += 'index.html';
	}

	const htmlContent = await fs.promises.readFile(path, 'utf-8');

	return { content: htmlContent };
}
