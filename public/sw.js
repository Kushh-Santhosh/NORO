const CACHE = 'noro-shell-v2'
const STATIC = ['/manifest.webmanifest', '/noro-mark.svg']

self.addEventListener('install', event => {
  event.waitUntil(caches.open(CACHE).then(cache => cache.addAll(STATIC)).then(() => self.skipWaiting()))
})

self.addEventListener('activate', event => {
  event.waitUntil(caches.keys().then(keys => Promise.all(keys.filter(key => key !== CACHE).map(key => caches.delete(key)))).then(() => self.clients.claim()))
})

self.addEventListener('fetch', event => {
  const request = event.request
  const url = new URL(request.url)
  if (request.method !== 'GET' || url.origin !== self.location.origin) return

  // Vite module URLs are always served from the current dev server.
  if (url.pathname.startsWith('/src/') || url.pathname.startsWith('/@vite/') || url.pathname.startsWith('/@id/')) return

  if (request.mode === 'navigate' || ['script', 'style'].includes(request.destination)) {
    event.respondWith(fetch(request).then(response => {
      if (response.ok) void caches.open(CACHE).then(cache => cache.put(request, response.clone()))
      return response
    }).catch(async () => (await caches.match(request)) ?? (request.mode === 'navigate' ? (await caches.match('/')) : new Response('', { status: 504 }))))
    return
  }

  if (url.pathname === '/manifest.webmanifest' || url.pathname === '/noro-mark.svg') {
    event.respondWith(caches.match(request).then(cached => cached ?? fetch(request).then(response => {
      if (response.ok) void caches.open(CACHE).then(cache => cache.put(request, response.clone()))
      return response
    })))
  }
})
