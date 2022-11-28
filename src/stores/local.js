import { writable } from 'svelte/store';

export const title = writable(null);
export const content = writable(null);
export const action = writable(null);
export const showCode = writable(null);