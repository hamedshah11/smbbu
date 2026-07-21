-- The generic content template (components/generic-content-page.tsx) derives
-- several design features directly from markdown structure in pages.body:
--   - splitSections() (lib/markdown.ts) only treats `## ` lines as section
--     breaks, driving both the sticky section-nav (shown for 3+ sections)
--     and the green-primary rule Prose renders above every h2.
--   - Prose's first `- ` bullet list (>=3 items) becomes the numbered
--     feature grid; `1. ` ordered lists are left as plain numbered lists.
-- The migrated bodies used `# ` (h1) for every subsection instead of `## `,
-- so no section ever qualified for the nav or the green-primary rule, and
-- several plain enumerations were captured as ordered lists instead of
-- bullets, so they never qualified for the feature grid either. This fixes
-- markdown structure only — no prose content is reworded.

-- the-university: drop the leading heading (it duplicates pages.title
-- "History"), promote the remaining two headings to h2, and convert the two
-- parallel-value enumerations (mission pillars, programme values) from
-- ordered lists to bullets so the first one qualifies for the feature grid.
update pages
set body = replace(body, $t$# History

In early 1970$t$, $t$In early 1970$t$)
where slug = 'the-university';

update pages
set body = replace(body, $t$# Vice Chancellor's Message$t$, $t$## Vice Chancellor's Message$t$)
where slug = 'the-university';

update pages
set body = replace(body, $t$# Vision And Mission$t$, $t$## Vision And Mission$t$)
where slug = 'the-university';

update pages
set body = replace(
  body,
  $t$1. To promote curiosity, critical thinking, problem solving and decision-making skills to develop life-long learners.
2. To build a positive learning environment by encouraging a culture of respect, understanding, tolerance and support.
3. To promote a culture of scientific research, publication, technological development and academic leadership.$t$,
  $t$- To promote curiosity, critical thinking, problem solving and decision-making skills to develop life-long learners.
- To build a positive learning environment by encouraging a culture of respect, understanding, tolerance and support.
- To promote a culture of scientific research, publication, technological development and academic leadership.$t$
)
where slug = 'the-university';

update pages
set body = replace(
  body,
  $t$1. Honesty and Altruism
2. Self-accountability
3. Compassion, understanding and empathy
4. Importance of public health and prevention of disease
5. Inter professional respect
6. Importance of working hard and serving the humanity
7. Collaboration and teamwork$t$,
  $t$- Honesty and Altruism
- Self-accountability
- Compassion, understanding and empathy
- Importance of public health and prevention of disease
- Inter professional respect
- Importance of working hard and serving the humanity
- Collaboration and teamwork$t$
)
where slug = 'the-university';

-- administration: drop the leading heading (duplicates pages.title "Vice
-- Chancellor Secretariat") and promote the remaining heading to h2.
update pages
set body = replace(body, $t$# Vice Chancellor Secretariat

|$t$, $t$|$t$)
where slug = 'administration';

update pages
set body = replace(body, $t$# Contact Information:$t$, $t$## Contact Information:$t$)
where slug = 'administration';

-- scholarship-financial-aid-policy: drop the "# Introduction" heading
-- (duplicates pages.title "Introduction"; its paragraphs fold into the
-- preceding SFAO heading instead), promote the remaining three headings to
-- h2, and flatten a nested 4-item bullet list (scholarship counts per
-- college) to inline text so it can't be mistaken for the page's first
-- qualifying list — that's the 9-item bullet list under "HEC Need Based
-- Scholarship", which now correctly becomes the feature grid.
update pages
set body = replace(
  body,
  $t$# Introduction

Shaheed$t$,
  $t$Shaheed$t$
)
where slug = 'scholarship-financial-aid-policy';

update pages
set body = replace(
  body,
  $t$# Student Financial Aid Office (SFAO)$t$,
  $t$## Student Financial Aid Office (SFAO)$t$
)
where slug = 'scholarship-financial-aid-policy';

update pages
set body = replace(body, $t$# The Committee$t$, $t$## The Committee$t$)
where slug = 'scholarship-financial-aid-policy';

update pages
set body = replace(body, $t$# Scholarships$t$, $t$## Scholarships$t$)
where slug = 'scholarship-financial-aid-policy';

update pages
set body = replace(
  body,
  $t$Distribution of scholarship shall be as follows:
   - CMC 10 scholarships
   - GMMMC 4 scholarships
   - BADC 2 scholarships
   - Pharmacy department 2 scholarships$t$,
  $t$Distribution of scholarship shall be as follows: CMC 10 scholarships, GMMMC 4 scholarships, BADC 2 scholarships, Pharmacy department 2 scholarships.$t$
)
where slug = 'scholarship-financial-aid-policy';
