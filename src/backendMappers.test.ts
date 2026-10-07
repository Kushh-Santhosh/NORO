import { describe, expect, it } from 'vitest'
import { geographyPoint, isVerificationTimeValid, parsePublicPoint, requiresNightVerification, roleForGrant } from './backendMappers'

describe('backend data mappers',()=>{
 it('maps database grants to least-ambiguous workspace roles',()=>{
  expect(roleForGrant('citizen')).toBe('Citizen')
  expect(roleForGrant('municipal_officer')).toBe('Manager')
  expect(roleForGrant('contractor')).toBe('Contractor')
  expect(roleForGrant('verifier')).toBe('Verifier')
  expect(roleForGrant('admin')).toBeUndefined()
  expect(roleForGrant('auditor')).toBeUndefined()
 })

 it('serializes validated WGS84 points in PostGIS longitude-latitude order',()=>{
  expect(geographyPoint(12.97,77.59)).toBe('SRID=4326;POINT(77.59 12.97)')
  expect(()=>geographyPoint(91,0)).toThrow(/valid latitude/i)
  expect(()=>geographyPoint(0,Number.NaN)).toThrow(/valid latitude/i)
 })

 it('reads the curated public view point formats and rejects malformed locations',()=>{
  expect(parsePublicPoint('POINT(77.59 12.97)')).toEqual([77.59,12.97])
  expect(parsePublicPoint({type:'Point',coordinates:[77.59,12.97]})).toEqual([77.59,12.97])
  const bytes=new Uint8Array(25),view=new DataView(bytes.buffer)
  bytes[0]=1;view.setUint32(1,0x20000001,true);view.setUint32(5,4326,true);view.setFloat64(9,77.59,true);view.setFloat64(17,12.97,true)
  const ewkb=Array.from(bytes,b=>b.toString(16).padStart(2,'0')).join('')
  expect(parsePublicPoint(ewkb)).toEqual([77.59,12.97])
  expect(parsePublicPoint('not a point')).toBeUndefined()
  expect(parsePublicPoint('POINT(300 12)')).toBeUndefined()
 })

 it('requires after-dark checks for lighting and accepts applicable daylight checks',()=>{
  expect(requiresNightVerification('Street lighting')).toBe(true)
  expect(requiresNightVerification('Lighting')).toBe(true)
  expect(requiresNightVerification('Road')).toBe(false)
  expect(isVerificationTimeValid('Street lighting',false)).toBe(false)
  expect(isVerificationTimeValid('Street lighting',true)).toBe(true)
  expect(isVerificationTimeValid('Road',false)).toBe(true)
 })
})
