export type WorkspaceRole='Citizen'|'Manager'|'Contractor'|'Verifier'

export function requiresNightVerification(category:string|undefined):boolean {
 return Boolean(category&&/light/i.test(category))
}

export function isVerificationTimeValid(category:string|undefined,afterDusk:boolean):boolean {
 return !requiresNightVerification(category)||afterDusk
}

export function roleForGrant(grant:string):WorkspaceRole|undefined {
 return ({citizen:'Citizen',municipal_officer:'Manager',ward_admin:'Manager',department_officer:'Manager',contractor:'Contractor',field_worker:'Contractor',verifier:'Verifier'} as Record<string,WorkspaceRole>)[grant]
}

export function geographyPoint(lat:number,lng:number):string {
 if(!Number.isFinite(lat)||!Number.isFinite(lng)||lat < -90||lat > 90||lng < -180||lng > 180)throw new Error('Enter a valid latitude and longitude.')
 return `SRID=4326;POINT(${lng} ${lat})`
}

export function parsePublicPoint(value:unknown):[number,number]|undefined {
 if(value&&typeof value==='object'&&'coordinates' in value){const pair=(value as {coordinates?:unknown}).coordinates;if(Array.isArray(pair)&&Number.isFinite(pair[0])&&Number.isFinite(pair[1])&&Math.abs(pair[0] as number)<=180&&Math.abs(pair[1] as number)<=90)return [pair[0] as number,pair[1] as number]}
 if(typeof value!=='string')return undefined
 const wkt=value.match(/POINT\s*\(\s*(-?[\d.]+)\s+(-?[\d.]+)\s*\)/i);if(wkt&&Math.abs(Number(wkt[1]))<=180&&Math.abs(Number(wkt[2]))<=90)return [Number(wkt[1]),Number(wkt[2])]
 const hex=value.replace(/^\\x/i,'');if(!/^[\da-f]{50,}$/i.test(hex))return undefined
 try{const bytes=Uint8Array.from(hex.match(/.{2}/g)!.map(b=>parseInt(b,16))),view=new DataView(bytes.buffer),little=bytes[0]===1;let offset=5;const type=view.getUint32(1,little);if(type&0x20000000)offset+=4;const lng=view.getFloat64(offset,little),lat=view.getFloat64(offset+8,little);if(Number.isFinite(lat)&&Number.isFinite(lng)&&Math.abs(lat)<=90&&Math.abs(lng)<=180)return [lng,lat]}catch{return undefined}
 return undefined
}
