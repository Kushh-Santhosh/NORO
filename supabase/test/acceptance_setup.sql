-- Synthetic NORO acceptance fixture. Run only in the dedicated NORO TEST
-- project, after creating and confirming the four users in Supabase Auth.
-- This script never inserts into auth.users and creates no privileged user.
-- Test emails are reserved .example addresses; change them here if you used
-- different controlled test emails in Authentication > Users.

do $fixture$
declare
  citizen_id uuid;
  manager_id uuid;
  contractor_id uuid;
  verifier_id uuid;
  test_ward_id uuid;
  contractor_org_id uuid;
  electrical_department_id uuid;
  electrical_service_id uuid;
  electrical_category_id uuid;
  lighting_category_id uuid;
begin
  select id into citizen_id from auth.users where lower(email)='asha.rao@noro.example';
  select id into manager_id from auth.users where lower(email)='meera.nair@noro.example';
  select id into contractor_id from auth.users where lower(email)='imran.khan@noro.example';
  select id into verifier_id from auth.users where lower(email)='ravi.menon@noro.example';
  if citizen_id is null or manager_id is null or contractor_id is null or verifier_id is null then
    raise exception 'Create and confirm all four named NORO acceptance users in Supabase Auth before running this fixture.';
  end if;

  insert into public.profiles(id,display_name)
  values (citizen_id,'Asha Rao'),(manager_id,'Meera Nair'),(contractor_id,'Imran Khan'),(verifier_id,'Ravi Menon')
  on conflict (id) do update set display_name=excluded.display_name;

  insert into public.wards(code,name,geom)
  values ('NORO-TEST-WARD-01','NORO Synthetic Test Ward',
    public.st_multi(public.st_geomfromtext(
      'MULTIPOLYGON(((77.58 12.96,77.61 12.96,77.61 12.99,77.58 12.99,77.58 12.96)))',4326
    ))::public.geography)
  on conflict (code) do update set name=excluded.name,geom=excluded.geom
  returning id into test_ward_id;

  insert into public.organisations(name,kind)
  values ('CivicWorks Electrical Services · NORO Test','contractor')
  on conflict (name,kind) do update set name=excluded.name
  returning id into contractor_org_id;

  insert into public.departments(code,name,organisation_id)
  values ('NORO-TEST-ELECTRICAL','Synthetic Electrical Department',contractor_org_id)
  on conflict (code) do update set name=excluded.name,organisation_id=excluded.organisation_id
  returning id into electrical_department_id;

  insert into public.service_categories(code,name,department_id)
  values ('NORO-TEST-ELECTRICAL-SERVICE','Electrical fixture maintenance',electrical_department_id)
  on conflict (code) do update set name=excluded.name,department_id=excluded.department_id
  returning id into electrical_service_id;

  insert into public.asset_categories(code,name,risk_class,service_standard,standard_status,checklist)
  values ('NORO-TEST-ELECTRICAL-FIXTURE','Synthetic civic electrical fixture','medium',
    'Synthetic acceptance-test service standard','proposed',
    '[{"label":"Fixture is safe","required":true},{"label":"Repair works as intended","required":true}]'::jsonb)
  on conflict (code) do update set name=excluded.name,risk_class=excluded.risk_class,
    service_standard=excluded.service_standard,standard_status=excluded.standard_status,checklist=excluded.checklist
  returning id into electrical_category_id;

  insert into public.asset_categories(code,name,risk_class,service_standard,standard_status,checklist)
  values ('NORO-TEST-STREETLIGHT','Synthetic streetlight fixture','medium',
    'Synthetic after-dark acceptance-test standard','proposed',
    '[{"label":"Streetlight illuminates after dusk","required":true}]'::jsonb)
  on conflict (code) do update set name=excluded.name,risk_class=excluded.risk_class,
    service_standard=excluded.service_standard,standard_status=excluded.standard_status,checklist=excluded.checklist
  returning id into lighting_category_id;

  update public.profiles set org_id=contractor_org_id where id=contractor_id;
  insert into public.contractors(organisation_id,registration_reference,operating_wards,availability)
  values (contractor_org_id,'NORO-TEST-SYNTHETIC',array[test_ward_id],'available')
  on conflict (organisation_id) do update set operating_wards=excluded.operating_wards,availability='available';
  insert into public.contractor_specialisations(contractor_id,service_category_id,primary_service)
  select c.id,electrical_service_id,true from public.contractors c where c.organisation_id=contractor_org_id
  on conflict do nothing;
  update public.contractor_specialisations cs set primary_service=true
    where cs.service_category_id=electrical_service_id
      and cs.contractor_id=(select c.id from public.contractors c where c.organisation_id=contractor_org_id);

  insert into public.role_grants(user_id,role,ward_id,active)
  values (citizen_id,'citizen',test_ward_id,true),
         (manager_id,'municipal_officer',test_ward_id,true),
         (contractor_id,'contractor',test_ward_id,true),
         (verifier_id,'verifier',test_ward_id,true)
  on conflict (user_id,role,ward_id) do update set active=true;

  insert into public.verifier_profiles(user_id,operating_wards,training_state,approved_by,approved_at)
  values (verifier_id,array[test_ward_id],'current',manager_id,now())
  on conflict (user_id) do update set operating_wards=excluded.operating_wards,
    training_state='current',approved_by=manager_id,approved_at=now();

  insert into public.assets(public_code,category_id,ward_id,location,location_tier,condition)
  values ('NORO-TEST-ASSET-001',electrical_category_id,test_ward_id,
    public.st_setsrid(public.st_makepoint(77.5942,12.9718),4326)::public.geography,'approx','needs inspection')
  on conflict (public_code) do update set category_id=excluded.category_id,ward_id=excluded.ward_id,
    location=excluded.location,location_tier=excluded.location_tier,condition=excluded.condition;

  insert into public.assets(public_code,category_id,ward_id,location,location_tier,condition)
  values ('NORO-TEST-ASSET-LIGHT-001',lighting_category_id,test_ward_id,
    public.st_setsrid(public.st_makepoint(77.5960,12.9720),4326)::public.geography,'approx','needs inspection')
  on conflict (public_code) do update set category_id=excluded.category_id,ward_id=excluded.ward_id,
    location=excluded.location,location_tier=excluded.location_tier,condition=excluded.condition;
end
$fixture$;

-- Expected fixture only: 1 ward, 2 synthetic assets, 1 synthetic contractor
-- organization, and four scoped grants. No reports are created by this script.
