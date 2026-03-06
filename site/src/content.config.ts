import { defineCollection } from 'astro:content';

// Simple collection without strict schema to handle YAML parsing errors
const blog = defineCollection({
	type: 'content',
});

export const collections = { blog };
