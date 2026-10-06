export interface EnvironmentStatus {
  application: 'running'
  mode: 'demo' | 'configured'
  supabaseConfigured: boolean
  workflowPersistence: 'browser-local'
  routingConfigured: boolean
  mapsAvailable: true
}

/** Reports configuration presence only. Never returns or logs environment values. */
export function getEnvironmentStatus(): EnvironmentStatus {
  const supabaseConfigured = Boolean(import.meta.env.VITE_SUPABASE_URL?.trim() && import.meta.env.VITE_SUPABASE_ANON_KEY?.trim())
  return {
    application: 'running',
    mode: supabaseConfigured ? 'configured' : 'demo',
    supabaseConfigured,
    workflowPersistence: 'browser-local',
    routingConfigured: Boolean(import.meta.env.VITE_OPENROUTESERVICE_API_KEY?.trim()),
    mapsAvailable: true,
  }
}
