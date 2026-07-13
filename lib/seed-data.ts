import type { Announcement, Download, FacultyMember, Institute, Page } from "./types";

export const institutes: Institute[] = [
  {
    id: "cmc",
    name: "Chandka Medical College",
    code: "CMC",
    slug: "chandka-medical-college",
    city: "Larkana",
    description:
      "One of Sindh's oldest medical colleges, training physicians for upper Sindh for five decades. Home to the MBBS programme, a 1,650-bed teaching hospital network, and 28 clinical departments.",
    logo_url: null,
    hero_photo_url: null,
    is_constituent: true,
    established_year: 1973,
    programmes: [
      { level: "UG", name: "Bachelor of Medicine, Bachelor of Surgery (MBBS)", duration: "5 YRS" },
      { level: "PG", name: "MS / MD Clinical Specialties (14 disciplines)", duration: "4-5 YRS" },
      { level: "PG", name: "M.Phil Basic Medical Sciences", duration: "2 YRS" },
      { level: "PG", name: "MSc Public Health", duration: "2 YRS" },
      { level: "DIP", name: "Postgraduate Diplomas (Anaesthesia, Radiology, Gynae)", duration: "1 YR" },
    ],
    principal_name: "Prof. Dr. Abdul Rasheed Shaikh",
    principal_email: "principal.cmc@smbbmu.edu.pk",
    vice_principal_name: "Prof. Dr. Shabnam Naz",
    vice_principal_email: "vp.academics.cmc@smbbmu.edu.pk",
    student_affairs_office: "Block B, Ground Floor · Mon-Fri 9:00-15:00",
    sort_order: 1,
  },
  {
    id: "gmmmc",
    name: "Ghulam Muhammad Mahar Medical College",
    code: "GMMMC",
    slug: "ghulam-muhammad-mahar-medical-college",
    city: "Sukkur",
    description:
      "Constituent medical college serving the Sukkur region with an MBBS programme and affiliated teaching hospital.",
    logo_url: null,
    hero_photo_url: null,
    is_constituent: true,
    established_year: 2010,
    programmes: [{ level: "UG", name: "Bachelor of Medicine, Bachelor of Surgery (MBBS)", duration: "5 YRS" }],
    principal_name: "Prof. Dr. Ghulam Sarwar Mahar",
    principal_email: "principal.gmmmc@smbbmu.edu.pk",
    vice_principal_name: null,
    vice_principal_email: null,
    student_affairs_office: "Student Affairs Office · Mon-Fri 9:00-15:00",
    sort_order: 2,
  },
  {
    id: "badc",
    name: "Bibi Aseefa Dental College",
    code: "BADC",
    slug: "bibi-aseefa-dental-college",
    city: "Larkana",
    description:
      "Constituent dental college offering the BDS programme with a full range of dental clinical departments.",
    logo_url: null,
    hero_photo_url: null,
    is_constituent: true,
    established_year: 2011,
    programmes: [{ level: "UG", name: "Bachelor of Dental Surgery (BDS)", duration: "4 YRS" }],
    principal_name: "Prof. Dr. Nasreen Rind",
    principal_email: "principal.badc@smbbmu.edu.pk",
    vice_principal_name: null,
    vice_principal_email: null,
    student_affairs_office: "Student Affairs Office · Mon-Fri 9:00-15:00",
    sort_order: 3,
  },
  {
    id: "bcon",
    name: "Benazir College of Nursing",
    code: "BCON",
    slug: "benazir-college-of-nursing",
    city: "Larkana",
    description: "Constituent nursing college offering generic and post-RN nursing programmes.",
    logo_url: null,
    hero_photo_url: null,
    is_constituent: true,
    established_year: 2013,
    programmes: [
      { level: "UG", name: "BSN (Generic)", duration: "4 YRS" },
      { level: "UG", name: "BSN (Post-RN)", duration: "2 YRS" },
    ],
    principal_name: "Prof. Rehana Soomro",
    principal_email: "principal.bcon@smbbmu.edu.pk",
    vice_principal_name: null,
    vice_principal_email: null,
    student_affairs_office: "Student Affairs Office · Mon-Fri 9:00-15:00",
    sort_order: 4,
  },
  {
    id: "iop",
    name: "Institute of Pharmacy",
    code: "IOP",
    slug: "institute-of-pharmacy",
    city: "Larkana",
    description: "Constituent institute offering the Pharm-D programme and pharmaceutical sciences research.",
    logo_url: null,
    hero_photo_url: null,
    is_constituent: true,
    established_year: 2014,
    programmes: [{ level: "UG", name: "Doctor of Pharmacy (Pharm-D)", duration: "5 YRS" }],
    principal_name: "Prof. Dr. Imran Memon",
    principal_email: "director.iop@smbbmu.edu.pk",
    vice_principal_name: null,
    vice_principal_email: null,
    student_affairs_office: "Student Affairs Office · Mon-Fri 9:00-15:00",
    sort_order: 5,
  },
  {
    id: "iprs",
    name: "Institute of Physiotherapy & Rehabilitation Sciences",
    code: "IPRS",
    slug: "institute-of-physiotherapy-rehabilitation-sciences",
    city: "Larkana",
    description: "Constituent institute offering the Doctor of Physical Therapy programme.",
    logo_url: null,
    hero_photo_url: null,
    is_constituent: true,
    established_year: 2015,
    programmes: [{ level: "UG", name: "Doctor of Physical Therapy (DPT)", duration: "5 YRS" }],
    principal_name: "Prof. Dr. Saima Baloch",
    principal_email: "director.iprs@smbbmu.edu.pk",
    vice_principal_name: null,
    vice_principal_email: null,
    student_affairs_office: "Student Affairs Office · Mon-Fri 9:00-15:00",
    sort_order: 6,
  },
  {
    id: "cmt",
    name: "College of Medical Technology",
    code: "CMT",
    slug: "college-of-medical-technology",
    city: "Larkana",
    description: "Constituent college offering allied health technology diplomas and degrees.",
    logo_url: null,
    hero_photo_url: null,
    is_constituent: true,
    established_year: 2016,
    programmes: [
      { level: "UG", name: "BS Medical Laboratory Technology", duration: "4 YRS" },
      { level: "UG", name: "BS Radiology Technology", duration: "4 YRS" },
    ],
    principal_name: "Prof. Dr. Aijaz Bhutto",
    principal_email: "principal.cmt@smbbmu.edu.pk",
    vice_principal_name: null,
    vice_principal_email: null,
    student_affairs_office: "Student Affairs Office · Mon-Fri 9:00-15:00",
    sort_order: 7,
  },
  {
    id: "scnm",
    name: "Sukkur College of Nursing & Midwifery",
    code: "SCNM",
    slug: "sukkur-college-of-nursing-midwifery",
    city: "Sukkur",
    description: "Constituent nursing and midwifery college serving the Sukkur region.",
    logo_url: null,
    hero_photo_url: null,
    is_constituent: true,
    established_year: 2017,
    programmes: [
      { level: "UG", name: "BSN (Generic)", duration: "4 YRS" },
      { level: "DIP", name: "Diploma in Midwifery", duration: "3 YRS" },
    ],
    principal_name: "Prof. Rukhsana Abro",
    principal_email: "principal.scnm@smbbmu.edu.pk",
    vice_principal_name: null,
    vice_principal_email: null,
    student_affairs_office: "Student Affairs Office · Mon-Fri 9:00-15:00",
    sort_order: 8,
  },
];

export const faculty: FacultyMember[] = [
  { id: "f1", name: "Prof. Dr. Shabnam Naz", designation: "Professor & Chairperson", department: "Anatomy", institute_id: "cmc", photo_url: null, email: null, sort_order: 1 },
  { id: "f2", name: "Prof. Dr. Aftab A. Soomro", designation: "Professor", department: "Medicine", institute_id: "cmc", photo_url: null, email: null, sort_order: 2 },
  { id: "f3", name: "Dr. Farzana Memon", designation: "Associate Professor", department: "Physiology", institute_id: "cmc", photo_url: null, email: null, sort_order: 3 },
  { id: "f4", name: "Dr. Imran A. Sheikh", designation: "Associate Professor", department: "Surgery", institute_id: "cmc", photo_url: null, email: null, sort_order: 4 },
  { id: "f5", name: "Dr. Sanam Bhutto", designation: "Assistant Professor", department: "Pathology", institute_id: "cmc", photo_url: null, email: null, sort_order: 5 },
  { id: "f6", name: "Dr. Zulfiqar Laghari", designation: "Assistant Professor", department: "Medicine", institute_id: "cmc", photo_url: null, email: null, sort_order: 6 },
  { id: "f7", name: "Dr. Rubina Chandio", designation: "Senior Lecturer", department: "Anatomy", institute_id: "cmc", photo_url: null, email: null, sort_order: 7 },
  { id: "f8", name: "Dr. Waseem Abbasi", designation: "Lecturer", department: "Physiology", institute_id: "cmc", photo_url: null, email: null, sort_order: 8 },
];

export const announcements: Announcement[] = [
  {
    id: "a1", title: "Examination Certificate Fees Challan", slug: "examination-certificate-fees-challan",
    category: "examination", ref_number: "SMBBMU/EXAM/2026/430",
    body: "Candidates requiring examination certificates must deposit the prescribed fee using the attached challan form before submitting their application to the Controller of Examinations office.",
    excerpt: "Candidates requiring examination certificates must deposit the prescribed fee using the attached challan form.",
    kicker: null, photo_url: null,
    attachments: [{ name: "Examination Certificate Fees Challan.pdf", url: "#", size_kb: 286 }],
    published_at: "2026-07-01T09:00:00Z", created_at: "2026-07-01T09:00:00Z",
  },
  {
    id: "a2", title: "Tender Notice: Supply of Laboratory Equipment & Consumables 2026-27", slug: "tender-notice-laboratory-equipment-consumables-2026-27",
    category: "tender", ref_number: "SMBBMU/PROC/2026/091",
    body: "Sealed tenders are invited from registered suppliers for the supply of laboratory equipment and consumables for the academic year 2026-27. Tender documents may be obtained from the Procurement Office during working hours.",
    excerpt: "Sealed tenders are invited from registered suppliers for the supply of laboratory equipment and consumables for 2026-27.",
    kicker: null, photo_url: null,
    attachments: [{ name: "Tender Document - Lab Equipment 2026-27.pdf", url: "#", size_kb: 940 }],
    published_at: "2026-06-30T09:00:00Z", created_at: "2026-06-30T09:00:00Z",
  },
  {
    id: "a3", title: "Notification: Revised Academic Calendar 2026-27", slug: "notification-revised-academic-calendar-2026-27",
    category: "circular", ref_number: "SMBBMU/REG/2026/212",
    body: "The competent authority has approved a revised academic calendar for the session 2026-27. All constituent institutes are directed to align their teaching schedules accordingly.",
    excerpt: "The competent authority has approved a revised academic calendar for the session 2026-27.",
    kicker: null, photo_url: null,
    attachments: [{ name: "Revised Academic Calendar 2026-27.pdf", url: "#", size_kb: 512 }],
    published_at: "2026-06-28T09:00:00Z", created_at: "2026-06-28T09:00:00Z",
  },
  {
    id: "a4", title: "Result of Postgraduate Entry Test for Session July 2026", slug: "result-postgraduate-entry-test-session-july-2026",
    category: "admission", ref_number: "SMBBMU/ADM/2026/188",
    body: "The result of the Postgraduate Entry Test conducted for admission to Session July 2026 has been declared. Candidates may check their roll number in the attached gazette.",
    excerpt: "The result of the Postgraduate Entry Test conducted for admission to Session July 2026 has been declared.",
    kicker: null, photo_url: null,
    attachments: [{ name: "PG Entry Test Result Gazette - July 2026.pdf", url: "#", size_kb: 1340 }],
    published_at: "2026-06-24T09:00:00Z", created_at: "2026-06-24T09:00:00Z",
  },
  {
    id: "a5", title: "Result of BSN (Generic) Year-II, Semester-III Regular Examination, Session 2023-24", slug: "result-bsn-generic-year-ii-semester-iii-regular-examination-2023-24",
    category: "examination", ref_number: "SMBBMU/EXAM/2026/417",
    body: "The result of BSN (Generic) Year-II, Semester-III Regular Examination, Session 2023-24, conducted by the university has been declared and is attached.",
    excerpt: "The result of BSN (Generic) Year-II, Semester-III Regular Examination, Session 2023-24 has been declared.",
    kicker: null, photo_url: null,
    attachments: [{ name: "BSN Generic Year-II Sem-III Result.pdf", url: "#", size_kb: 780 }],
    published_at: "2026-06-23T09:00:00Z", created_at: "2026-06-23T09:00:00Z",
  },
  {
    id: "a6", title: "Rescheduling of Interviews for Various Positions in Colleges, Institutes & Departments", slug: "rescheduling-interviews-various-positions-colleges-institutes-departments",
    category: "job", ref_number: "SMBBMU/HR/2026/096",
    body: "Interviews for various teaching and non-teaching positions across constituent colleges, institutes and departments have been rescheduled. Candidates should note the revised dates in the attached notice.",
    excerpt: "Interviews for various positions across constituent colleges, institutes and departments have been rescheduled.",
    kicker: null, photo_url: null,
    attachments: [{ name: "Revised Interview Schedule.pdf", url: "#", size_kb: 410 }],
    published_at: "2026-06-22T09:00:00Z", created_at: "2026-06-22T09:00:00Z",
  },
  {
    id: "a7", title: "Revised Time Table: 3rd Professional MBBS (Supplementary) OSPE Examination, Session 2022-23", slug: "revised-time-table-3rd-professional-mbbs-supplementary-ospe-examination-2022-23",
    category: "examination", ref_number: "SMBBMU/EXAM/2026/417",
    body: "The OSPE examination of 3rd Professional MBBS (Supplementary), Session 2022-23, has been rescheduled. Candidates are directed to note the revised dates and report to their examination centres thirty minutes before commencement. Admit cards remain valid for the revised dates. For queries, contact the Controller of Examinations office during working hours. No separate intimation will be issued to individual candidates.",
    excerpt: "The OSPE examination has been rescheduled. Candidates are directed to note the revised dates and report to their centres thirty minutes before commencement. Admit cards remain valid.",
    kicker: null, photo_url: null,
    attachments: [
      { name: "Revised OSPE Time Table - 3rd Prof MBBS (Supplementary).pdf", url: "#", size_kb: 412 },
      { name: "Examination Centre Allocation List.pdf", url: "#", size_kb: 1229 },
    ],
    published_at: "2026-06-18T09:00:00Z", created_at: "2026-06-18T09:00:00Z",
  },
  {
    id: "a8", title: "Time Table for Supplementary Examination — 1st, 2nd & 3rd Year MBBS", slug: "time-table-supplementary-examination-1st-2nd-3rd-year-mbbs",
    category: "examination", ref_number: "SMBBMU/EXAM/2026/409",
    body: "The time table for the Supplementary Examination of 1st, 2nd and 3rd Year MBBS is attached. Candidates should verify their examination centre and roll number.",
    excerpt: "The time table for the Supplementary Examination of 1st, 2nd and 3rd Year MBBS is attached.",
    kicker: null, photo_url: null,
    attachments: [{ name: "Supplementary Time Table - 1st 2nd 3rd Year MBBS.pdf", url: "#", size_kb: 365 }],
    published_at: "2026-06-17T09:00:00Z", created_at: "2026-06-17T09:00:00Z",
  },
  {
    id: "a9", title: "Time Table for the Supplementary Examination of 1st Year MBBS (Term-Back)", slug: "time-table-supplementary-examination-1st-year-mbbs-term-back",
    category: "examination", ref_number: "SMBBMU/EXAM/2026/408",
    body: "The time table for the Supplementary Examination of 1st Year MBBS (Term-Back) candidates is attached.",
    excerpt: "The time table for the Supplementary Examination of 1st Year MBBS (Term-Back) candidates is attached.",
    kicker: null, photo_url: null,
    attachments: [{ name: "Supplementary Time Table - 1st Year MBBS Term-Back.pdf", url: "#", size_kb: 298 }],
    published_at: "2026-06-17T09:00:00Z", created_at: "2026-06-17T09:00:00Z",
  },
  {
    id: "a10", title: "Rescheduling of Interviews for Admission to Postgraduate Courses, Session July 2026", slug: "rescheduling-interviews-admission-postgraduate-courses-july-2026",
    category: "admission", ref_number: "SMBBMU/ADM/2026/175",
    body: "Interviews for admission to postgraduate courses for Session July 2026 have been rescheduled. The revised schedule is attached.",
    excerpt: "Interviews for admission to postgraduate courses for Session July 2026 have been rescheduled.",
    kicker: null, photo_url: null,
    attachments: [{ name: "Revised PG Admission Interview Schedule.pdf", url: "#", size_kb: 355 }],
    published_at: "2026-06-17T09:00:00Z", created_at: "2026-06-17T09:00:00Z",
  },
  {
    id: "a11", title: "Postgraduate Entry Test for Session July 2026", slug: "postgraduate-entry-test-session-july-2026",
    category: "admission", ref_number: "SMBBMU/ADM/2026/160",
    body: "Applications are invited for the Postgraduate Entry Test for Session July 2026. Eligible candidates should apply before the closing date mentioned in the attached notice.",
    excerpt: "Applications are invited for the Postgraduate Entry Test for Session July 2026.",
    kicker: null, photo_url: null,
    attachments: [{ name: "PG Entry Test Notice - July 2026.pdf", url: "#", size_kb: 420 }],
    published_at: "2026-06-15T09:00:00Z", created_at: "2026-06-15T09:00:00Z",
  },
  {
    id: "a12", title: "Result of Final Professional MBBS (Supplementary) Examination, Session 2020-21", slug: "result-final-professional-mbbs-supplementary-examination-2020-21",
    category: "examination", ref_number: "SMBBMU/EXAM/2026/399",
    body: "The result of the Final Professional MBBS (Supplementary) Examination, Session 2020-21, has been declared and is attached.",
    excerpt: "The result of the Final Professional MBBS (Supplementary) Examination, Session 2020-21, has been declared.",
    kicker: null, photo_url: null,
    attachments: [{ name: "Final Prof MBBS Supplementary Result 2020-21.pdf", url: "#", size_kb: 690 }],
    published_at: "2026-06-11T09:00:00Z", created_at: "2026-06-11T09:00:00Z",
  },
  {
    id: "a13", title: "Flag hoisting & plantation drive mark Youm-e-Azadi", slug: "flag-hoisting-plantation-drive-mark-youm-e-azadi",
    category: "news", ref_number: null,
    body: "The university marked Youm-e-Azadi with a flag hoisting ceremony and a plantation drive across the Larkana campus, attended by faculty, staff and students.",
    excerpt: "The university marked Youm-e-Azadi with a flag hoisting ceremony and a plantation drive across the Larkana campus.",
    kicker: "CAMPUS", photo_url: null,
    attachments: [], published_at: "2026-07-10T09:00:00Z", created_at: "2026-07-10T09:00:00Z",
  },
  {
    id: "a14", title: "Free mega medical camp brings care to Warah", slug: "free-mega-medical-camp-brings-care-to-warah",
    category: "event", ref_number: null,
    body: "SMBBMU faculty and students held a free mega medical camp in Warah, providing consultation, diagnostics and medicines to residents of the surrounding area.",
    excerpt: "SMBBMU faculty and students held a free mega medical camp in Warah, providing consultation, diagnostics and medicines.",
    kicker: "OUTREACH", photo_url: null,
    attachments: [], published_at: "2026-07-08T09:00:00Z", created_at: "2026-07-08T09:00:00Z",
  },
  {
    id: "a15", title: "NAHE faculty trainings: photos & highlights", slug: "nahe-faculty-trainings-photos-highlights",
    category: "event", ref_number: null,
    body: "The National Academy of Higher Education (NAHE) conducted a series of faculty development trainings at SMBBMU, covering modern pedagogy and assessment methods.",
    excerpt: "NAHE conducted a series of faculty development trainings at SMBBMU covering modern pedagogy and assessment.",
    kicker: "FACULTY", photo_url: null,
    attachments: [], published_at: "2026-06-10T09:00:00Z", created_at: "2026-06-10T09:00:00Z",
  },
  {
    id: "a16", title: "SMBBMU ranked among top 1500+ universities worldwide", slug: "smbbmu-ranked-top-1500-universities-worldwide",
    category: "news", ref_number: null,
    body: "SMBBMU has been ranked among the top 1500+ universities worldwide in an international ranking, reflecting the university's growing academic and research standing.",
    excerpt: "SMBBMU has been ranked among the top 1500+ universities worldwide in an international ranking.",
    kicker: "CAMPUS", photo_url: null,
    attachments: [], published_at: "2026-06-28T09:00:00Z", created_at: "2026-06-28T09:00:00Z",
  },
  {
    id: "a17", title: "The 7th Convocation comes to Larkana this December.", slug: "7th-convocation-comes-to-larkana-this-december",
    category: "event", ref_number: null,
    body: "Graduates of MBBS, BDS, Nursing and allied health programmes will be conferred degrees on 18 December. Registration closes 30 November. The ceremony will be held at the university's main campus in Larkana, with the Chief Guest to be announced closer to the date.",
    excerpt: "Graduates of MBBS, BDS, Nursing and allied health programmes will be conferred degrees on 18 December. Registration closes 30 November.",
    kicker: "CONVOCATION", photo_url: null,
    attachments: [], published_at: "2026-07-11T09:00:00Z", created_at: "2026-07-11T09:00:00Z",
  },
];

export const pages: Page[] = [
  {
    id: "p1", slug: "vc-message", title: "Vice Chancellor's Message", standfirst: null,
    body: "I envision the university transformed into a place of academic excellence which produces critical thinkers, competent health professionals and community leaders.",
    meta: { name: "Prof. Dr. Nusrat Shah", title: "Vice Chancellor, SMBBMU Larkana" },
    updated_at: "2026-06-01T09:00:00Z",
  },
  {
    id: "p2", slug: "quality-enhancement-cell", title: "Quality Enhancement Cell",
    standfirst: "The QEC safeguards academic standards across all constituent institutes through systematic self-assessment, programme review and compliance with HEC quality assurance frameworks.",
    body: `## Mandate

Established under HEC directives, the Cell reports directly to the Vice Chancellor and coordinates with the Quality Assurance Agency. Its remit covers curriculum review, faculty appraisal, and institutional performance evaluation conducted on an annual cycle.

## Core functions

- Annual self-assessment reports for every degree programme
- Programme team reviews and rubric-based scoring
- Graduate and employer survey administration
- Liaison with HEC QAA and accreditation councils (PMDC, PNC, PCP)

## Assessment cycle 2026-27

| Phase | Window | Responsible |
|---|---|---|
| Self-assessment reports | SEP - NOV | Programme teams |
| External review visits | JAN - MAR | QEC + external assessors |
| Implementation plans | APR - JUN | Deans & heads of department |`,
    meta: {
      related_links: [
        { label: "HEC Quality Assurance Framework", url: "#" },
        { label: "Programme review rubrics", url: "#" },
        { label: "Institutional Performance Evaluation", url: "#" },
      ],
    },
    updated_at: "2026-06-01T09:00:00Z",
  },
  {
    id: "p3", slug: "directorate-of-medical-education", title: "Directorate of Medical Education",
    standfirst: "The DME leads curriculum development, faculty training and assessment reform across all constituent colleges and institutes.",
    body: `## Mandate

The Directorate of Medical Education (DME) coordinates curriculum design, faculty development, and modern assessment practice across all constituent colleges under HEC and PMDC guidance.

## Core functions

- Curriculum review and integration across professional years
- Faculty development workshops in medical education
- OSCE/OSPE assessment design and item banking
- Student support and remediation programme oversight`,
    meta: { related_links: [{ label: "PMDC Curriculum Guidelines", url: "#" }] },
    updated_at: "2026-06-01T09:00:00Z",
  },
  {
    id: "p5", slug: "administration", title: "Administration",
    standfirst: "The university's administrative structure supports academic governance across all constituent institutes.",
    body: `## Registrar's Office

The Registrar's Office is responsible for admissions, examinations records, and academic governance across the university.

## Directorates

- Directorate of Admissions
- Directorate of Finance
- Directorate of Medical Education
- Directorate of Human Resources`,
    meta: {},
    updated_at: "2026-06-01T09:00:00Z",
  },
  {
    id: "p6", slug: "scholarship-financial-aid-policy", title: "Scholarship & Financial Aid Policy",
    standfirst: "Guidelines governing need-based and merit-based financial assistance for enrolled students.",
    body: `## Eligibility

Students enrolled in any constituent institute with demonstrated financial need or outstanding academic merit may apply for financial assistance each semester.

## How to apply

Applications are submitted through the Directorate of Finance along with supporting documentation. Awards are reviewed on a rolling basis.`,
    meta: { related_links: [{ label: "Directorate of Finance", url: "/contact" }] },
    updated_at: "2026-06-01T09:00:00Z",
  },
  {
    id: "p4", slug: "the-university", title: "The University",
    standfirst: "SMBBMU, Larkana was established to expand access to quality medical, dental, nursing and allied health education across upper Sindh.",
    body: `## About SMBBMU

Shaheed Mohtarma Benazir Bhutto Medical University, Larkana is a public sector university comprising eight constituent institutes across Larkana and Sukkur, offering undergraduate and postgraduate programmes in medicine, dentistry, nursing, pharmacy, physiotherapy and allied health sciences.

## Vision

To be a leading centre of medical education, research and community health service in Sindh and beyond.`,
    meta: {},
    updated_at: "2026-06-01T09:00:00Z",
  },
];

export const downloads: Download[] = [
  { id: "d1", title: "QEC Annual Report 2025-26", file_url: "#", category: "Reports", file_size_kb: 2458, page_slug: "quality-enhancement-cell", uploaded_at: "2026-05-01T09:00:00Z" },
  { id: "d2", title: "Self-Assessment Manual", file_url: "#", category: "Guidelines", file_size_kb: 860, page_slug: "quality-enhancement-cell", uploaded_at: "2026-05-01T09:00:00Z" },
  { id: "d3", title: "Fee Structure 2026-27", file_url: "#", category: "Admissions", file_size_kb: 512, page_slug: null, uploaded_at: "2026-05-01T09:00:00Z" },
  { id: "d4", title: "Prospectus 2026-27", file_url: "#", category: "Admissions", file_size_kb: 4200, page_slug: null, uploaded_at: "2026-05-01T09:00:00Z" },
  { id: "d5", title: "Academic Calendar 2026-27", file_url: "#", category: "Academics", file_size_kb: 380, page_slug: null, uploaded_at: "2026-05-01T09:00:00Z" },
  { id: "d6", title: "Undergraduate Curriculum Framework", file_url: "#", category: "Academics", file_size_kb: 1650, page_slug: null, uploaded_at: "2026-05-01T09:00:00Z" },
  { id: "d7", title: "Scholarship & Financial Aid Policy", file_url: "#", category: "Policies", file_size_kb: 290, page_slug: null, uploaded_at: "2026-05-01T09:00:00Z" },
  { id: "d8", title: "Anti-Harassment Policy", file_url: "#", category: "Policies", file_size_kb: 210, page_slug: null, uploaded_at: "2026-05-01T09:00:00Z" },
];
