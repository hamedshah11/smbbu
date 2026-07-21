-- The homepage VC message band (app/(site)/page.tsx) reads pages.slug =
-- 'vc-message' via getVCMessage(). That row never existed — the VC's message
-- text was migrated only as a subsection embedded inside the 'the-university'
-- page body, so getPageBySlug('vc-message') returned null and the band's
-- `{vcMessage && (...)}` guard silently skipped rendering it. This restores
-- the row using that same real migrated text (not fabricated), so both the
-- homepage pull-quote (standfirst) and the full message at /about/vc-message
-- (body) have authentic content.
insert into pages (slug, title, standfirst, body, meta)
values (
  'vc-message',
  'Vice Chancellor''s Message',
  'As a vice chancellor, I envision the university being transformed into a place of academic excellence which produces critical thinkers, competent health professionals and community leaders.',
  '## Message

I am honored to join as a Vice Chancellor in Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU) located in the historical city of Larkana, which lies very close to the ruins of ancient Indus Valley Civilization City of Mohenjo-Daro.

The SMBBMU has come a long way from the Chandka Medical College in 1973 to getting the status of University in 2008. Since then, it has expanded very fast with several colleges and institutes being its constituents and others being affiliated to it.

As a vice chancellor, I envision the university being transformed into a place of academic excellence which produces critical thinkers, competent health professionals and community leaders. The goal is to produce graduates who can provide quality care with empathy, compassion and understanding and are able to handle the social responsibility of looking after the health and wellbeing of local, national and global communities.

Continuous improvement in the quality of teaching, assessment, research, and clinical services remains at the heart of my entire efforts. This would require strategic investments in faculty development, strengthening online teaching environment; and exploring visiting faculty from different regions. One of the aspects of quality enhancement which needs attention is networking with digital education experts both nationally and internationally for partnership in developing innovative digital courses.

The world is witnessing Information and Communication Technologies (ICT) revolution in the form of digitalization, particularly after the Covid-19 pandemic. This has changed the way students'' study and learn all over the world and in order to keep pace with the changing times we need to change the traditional lecture-based teaching to more interactive student-centered, skill-based and project-based teaching, with corresponding changes in assessment.

In this age and time, and particularly after the pandemic of Covid-19, the university must have a strong digital environment both for management as well as for teaching and learning resources. Providing strong digital eco-system including availability of adequate bandwidth for connectivity, IT manpower, equipment and back-up systems would remain a high priority for me. As the healthcare landscape continues to change, our future success requires an organizational commitment to innovation, collaboration, and fiscal stewardship.

At SMBBU, we promote the values of honesty, integrity, polite and caring attitude, collaboration, teamwork and self-accountability, and strive to create a positive learning environment. Along with academics we also encourage a host of co-curricular and extra-curricular activities in the form of sports, gymnasium, debates, exhibitions, and cultural, social and literary events, to encourage physical and mental health and wellbeing of students and to develop their holistic personality.

Finally, I wish you every success, and a comfortable and enjoyable stay at the university. Happy learning!',
  '{"name": "Prof. Dr Nusrat Shah", "title": "Vice Chancellor"}'::jsonb
)
on conflict (slug) do nothing;
