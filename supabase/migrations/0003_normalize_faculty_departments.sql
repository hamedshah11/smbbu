-- Normalize faculty.department: fix casing/typos, move institute names that were
-- scraped into the department field over to institute_id, null out unrecoverable
-- junk, and add a generated slug column so /faculty/[department] can route on a
-- stable value instead of the raw display string.

-- 1. Institute names that were mistakenly scraped into department → institute_id.
update faculty
set institute_id = (select id from institutes where code = 'CMC'),
    department = null
where department = 'CMC';

update faculty
set institute_id = (select id from institutes where code = 'GMMMC'),
    department = null
where department = 'GMMMC';

update faculty
set institute_id = (select id from institutes where code = 'BADC'),
    department = null
where department = 'Bibi Aseefa Dental College';

-- 2. Scraped page-header artifact, not a department. institute_id on these rows
--    is already correct (IPRS/IOP/BADC/BCON), so only the department is cleared.
update faculty
set department = null
where department = 'Introduction';

-- 3. Single "Dean" rows inferable from the sibling Faculty-of-X Dean rows.
update faculty set department = 'Faculty of Medicine' where department = 'medicine';
update faculty set department = 'Faculty of Surgery' where department = 'surgery';

-- 4. Casing / typo normalization. Every clinical department is standardized to
--    the "Department of X" form for consistency (NEUROSURGERY, FORENSIC MEDICINE
--    previously had no prefix).
update faculty set department = 'Department of Pulmonology' where department = 'DEPARTEMENT OF PULMONOLOGY';
update faculty set department = 'Department of Anesthesiology' where department = 'DEPARTMENT OF ANESTHESIOLOGY';
update faculty set department = 'Department of Biochemistry' where department = 'DEPARTMENT OF BIOCHEMISTRY';
update faculty set department = 'Department of Cardiology' where department = 'DEPARTMENT OF CARDIOLOGY';
update faculty set department = 'Department of Dermatology' where department = 'DEPARTMENT OF DERMATOLOGY';
update faculty set department = 'Department of E.N.T' where department = 'DEPARTMENT OF E.N.T';
update faculty set department = 'Department of Gynecology & Obstetrics' where department = 'DEPARTMENT OF GYNECOLOGY & OBSTETRICS';
update faculty set department = 'Department of Medicine' where department = 'DEPARTMENT OF MEDICINE';
update faculty set department = 'Department of Neurology' where department = 'DEPARTMENT OF NUEROLOGY';
update faculty set department = 'Department of Orthopaedic Surgery' where department = 'DEPARTMENT OF ORTHOPAEDIC SURGERY';
update faculty set department = 'Department of Pathology' where department = 'DEPARTMENT OF PATHOLOGY';
update faculty set department = 'Department of Physiology' where department = 'DEPARTMENT OF PHYSIOLOGY';
update faculty set department = 'Department of Urology' where department = 'DEPARTMENT OF UROLOGY';
update faculty set department = 'Department of Neurosurgery' where department = 'NEUROSURGERY';
update faculty set department = 'Department of Forensic Medicine' where department = 'FORENSIC MEDICINE';

-- Already correctly cased, listed here for the record (no-op, guards against
-- silent drift if the raw casing ever changes):
-- 'Department of Anatomy', 'Department of Gastroenterology', 'Department of Nephrology',
-- 'Department of Pharmacology', 'Faculty of Basic Medical Sciences',
-- 'Faculty of Community Medicine & Public Health Sciences'

-- 5. department is no longer guaranteed not-null (junk values above are cleared).
alter table faculty alter column department drop not null;

-- 6. Stable slug for routing/filtering, generated from department so it can
--    never drift out of sync with the display value.
alter table faculty
  add column department_slug text generated always as (
    case
      when department is null then null
      else trim(both '-' from regexp_replace(lower(department), '[^a-z0-9]+', '-', 'g'))
    end
  ) stored;

drop index if exists faculty_department_idx;
create index faculty_department_slug_idx on faculty (department_slug);
