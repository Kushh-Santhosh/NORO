import { StrictMode } from 'preact/compat'
import { createRoot } from 'preact/compat/client'
import App from './App'
import './styles.css'


createRoot(document.getElementById('root')!).render(<StrictMode><App /></StrictMode>)
if ('serviceWorker' in navigator) window.addEventListener('load', () => {
  if (import.meta.env.PROD) {
    void navigator.serviceWorker.register('/sw.js').catch(() => undefined)
  } else {
    void navigator.serviceWorker.getRegistrations().then(registrations => Promise.all(registrations.map(registration => registration.unregister())))
  }
})
