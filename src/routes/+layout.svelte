<script lang="ts">
	import './layout.css';
	import favicon from '#lib/assets/favicon.svg';
  import { page } from '$app/state';
	import type { LayoutProps } from './$types';

  const links = [
    { href: '/calc/', label: 'Calculator' },
    { href: '/units/', label: 'Unit converter' },
  ];

	let { children }: LayoutProps = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<nav>
  {#each links as link}
    <a
      href={link.href}
      aria-current={page.url.pathname === link.href ? 'page' : undefined }
    >
      {link.label}
    </a>
  {/each}
</nav>

{@render children()}

<style>
nav {
  display: flex;
  justify-content: center;
  gap: 0.5rem;
  padding: 0.75rem;
  border-bottom: 1px solid #ddd;
}
a {
  padding: 0.4rem 0.9rem;
  border-radius: 999px;
  text-decoration: none;
  color: inherit;
  opacity: 0.55;
  transition: opacity 0.15s, background 0.15s;
}
a:hover {
  opacity: 0.85;
  background: #f0f0f0;
}
a[aria-current='page'] {
  opacity: 1;
  font-weight: 600;
  background: #888;
  color: white;
}
</style>
