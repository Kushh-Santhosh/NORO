export interface DrivingRoute { distanceMeters:number; durationSeconds:number }

/** Calls ORS only after a user requests directions. A missing key leaves the map usable. */
export async function getDrivingRoute(start:{lat:number;lng:number},end:{lat:number;lng:number}):Promise<DrivingRoute>{
 const key=import.meta.env.VITE_OPENROUTESERVICE_API_KEY as string|undefined
 if(!key)throw new Error('Routing unavailable · add VITE_OPENROUTESERVICE_API_KEY to enable directions.')
 const response=await fetch('https://api.openrouteservice.org/v2/directions/driving-car/geojson',{method:'POST',headers:{Authorization:key,'Content-Type':'application/json'},body:JSON.stringify({coordinates:[[start.lng,start.lat],[end.lng,end.lat]]})})
 if(!response.ok)throw new Error(response.status===403?'Routing unavailable · check the ORS key and allowed domain.':'Could not calculate a route right now.')
 const body=await response.json() as {features?:{properties?:{summary?:{distance:number;duration:number}}}[]};const summary=body.features?.[0]?.properties?.summary
 if(!summary)throw new Error('No driving route was returned.')
 return {distanceMeters:summary.distance,durationSeconds:summary.duration}
}
