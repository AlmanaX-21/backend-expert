import * as path from 'path';

export function resolveWithin(directory: string, userPath: string): string {
	const normalizedPath = path.normalize(path.join(directory, userPath));

	// Check if the path is within the intended directory
	if (!normalizedPath.startsWith(directory)) {
		throw new Error('Path is not within the allowed directory');
	}

	return normalizedPath;
}
