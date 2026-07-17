-- 00_truncate.sql
truncate announcements, faculty, institutes, pages, downloads restart identity cascade;

-- 01_institutes.sql
insert into institutes (name, code, slug, city, description, website_url, logo_url, is_constituent, sort_order) values
('Chandka Medical College Larkana', 'CMC', 'chandka-medical-college-larkana', 'Larkana', '', 'http://cmc.edu.pk', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/logos/chandka-medical-college-larkana.jpg', true, 1),
('Ghulam Muhammad Mahar Medical College Sukkur', 'GMMMC', 'ghulam-muhammad-mahar-medical-college-sukkur', 'Sukkur', '', 'https://www.gmc-suk.edu.pk/', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/logos/ghulam-muhammad-mahar-medical-college-sukkur.gif', true, 2),
('Bibi Aseefa Dental College Larkana', 'BADC', 'bibi-aseefa-dental-college-larkana', 'Larkana', 'Introduction', NULL, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/logos/bibi-aseefa-dental-college-larkana.jpg', true, 3),
('Benazir College Of Nursing', 'BCON', 'benazir-college-of-nursing', 'Larkana', 'Introduction Benazir College of nursing is a unique and premier nursing Institute, established in the year 2012 is one of the constitute college of Shaheed Mohtarma Benazir Bhutto Medical University Larkana, and is recognized by Pakistan Nursing Council and Higher Education Commission of Pakistan. It is one of the leading institutes that incorporate all the guidelines and principles set by the council and commission. Benazir College of Nursing is leading nursing college in interior Sindh accommodating students from all over the country as per seat allocation. The graduates of BCON are serving at attractive wages in different public and private sector organizations, according to a partial requirement of undergraduate students study survey conducted in 2019 on illumines of BCON, the result s', NULL, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/logos/benazir-college-of-nursing.jpg', true, 4),
('Institute Of Pharmacy', 'IOP', 'institute-of-pharmacy', 'Larkana', 'Introduction By the grace of ALMIGHTY ALLAH and kind guidance and support of Worthy Vice Chancellor Prof. Dr. Ghulam Ashgar Channa, the Department of Pharmacy is ready to commence the first batch. The well qualified and dedicated Teaching Faculty have been recruited, well equipped laboratories facilities, well furnished spacious lecture halls equipped with multimedia facilities have been provided.
The Pharmacy is well rounded career blending science. The role of the Pharmacy is developing rapidly to meet the needs of modern health care systems. Ensuring accurate dispensing of prescribed medicines against prescriptions and providing sound advice on responsible self-medication remain vitally important parts of the service provided by Pharmacists. The Pharmacists have, however, recognized for', NULL, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/logos/institute-of-pharmacy.jpeg', true, 5),
('Institute Of Physiotherapy & Rehabilitation Sciences', 'IPRS', 'institute-of-physiotherapy-and-rehabilitation-sciences', 'Larkana', 'Introduction The first professional degree in physical therapy endorsed by the Higher Education Commission of Pakistan(HEC) comprises of 5 years (10 semesters). This degree program include foundational science courses, such as anatomy, physiology, histology, exercise physiology, neuroscience, biomechanics, pharmacology, pathology, and radiology/imaging, along with behavioral science courses, such as evidence-based practice and clinical reasoning. In this degree program the students also study the clinically-based courses include medical screening, examination tests and measures, diagnostic process, therapeutic interventions, outcomes assessment, and practice management. Vision: The vision of the Physical Therapy Program is to: Maintain the department''s long tradition of leadership and exce', NULL, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/logos/institute-of-physiotherapy-rehabilitation-sciences.jpg', true, 6)
on conflict (slug) do update set name=excluded.name, city=excluded.city, description=excluded.description, website_url=excluded.website_url, logo_url=excluded.logo_url, sort_order=excluded.sort_order;

-- 02_faculty.sql
insert into faculty (name, designation, department, institute_id, photo_url, sort_order) values
('Prof. Dr. Muhammad Hanif Shaikh', 'Dean', 'Faculty of Basic Medical Sciences', NULL, NULL, 1),
('Prof. Shahid Hussain Soomro', 'Chairperson', 'Department of Anatomy', NULL, NULL, 2),
('Prof. Dr. Shahid Hussain Soomro', 'Professor / Principal(CMC)', 'CMC', NULL, NULL, 3),
('Prof. Dr. M.Saleem Shaikh', 'Professor(on Contract)', 'CMC', NULL, NULL, 4),
('Dr. Sana Kashif', 'Assistant Professor', 'CMC', NULL, NULL, 5),
('Dr. Sajjad Ahmed Channa', 'Lecturer', 'CMC', NULL, NULL, 6),
('Dr. Muhammad Asif Chandio', 'Lecturer', 'CMC', NULL, NULL, 7),
('Dr. Khalid Hussian Shaikh', 'Lecturer', 'CMC', NULL, NULL, 8),
('Dr. Suhail Iqbal Shaikh', 'Lecturer', 'CMC', NULL, NULL, 9),
('Dr. Ashraf Ali Chan', 'Lecturer', 'CMC', NULL, NULL, 10),
('Dr. Rozeena Memon', 'Lecturer', 'CMC', NULL, NULL, 11),
('DR. Moazam Saifullah', 'Lecturer', 'CMC', NULL, NULL, 12),
('DR. Khushbakht Abro', 'Lecturer', 'CMC', NULL, NULL, 13),
('DR. Marvi Sangi', 'Lecturer', 'CMC', NULL, NULL, 14),
('DR. Uzma Lakho', 'Lecturer', 'CMC', NULL, NULL, 15),
('Dr. Abdul Waheed Shaikh', 'Lecturer', 'CMC', NULL, NULL, 16),
('Dr. Syed Faizan Ali', 'Assistant Professor', 'GMMMC', NULL, NULL, 17),
('Dr. Khursheed Bano', 'Senior Lecturer', 'GMMMC', NULL, NULL, 18),
('Dr. Shagufta Shah', 'Senior Lecturer', 'GMMMC', NULL, NULL, 19),
('Dr. Muhammad Usman', 'Senior Lecturer', 'GMMMC', NULL, NULL, 20),
('Dr. Nusrat Memon', 'Lecturer', 'GMMMC', NULL, NULL, 21),
('Dr. Jagdesh Kumar', 'Lecturer', 'GMMMC', NULL, NULL, 22),
('Dr. Pardeep Kumar', 'Lecturer', 'GMMMC', NULL, NULL, 23),
('Dr. Imran Khan Laghari', 'Lecturer', 'GMMMC', NULL, NULL, 24),
('Dr. Nosheen', 'Lecturer', 'GMMMC', NULL, NULL, 25),
('Dr. Madiha Nazeer', 'Lecturer', 'GMMMC', NULL, NULL, 26),
('Dr. Amar Lal Dodani', 'Chairperson', 'DEPARTMENT OF PHYSIOLOGY', NULL, NULL, 27),
('Prof. Dr. Safdar Ali Shaikh', 'Professor', 'CMC', NULL, NULL, 28),
('Dr. Amar Lal Dodani', 'Professor', 'CMC', NULL, NULL, 29),
('Dr. Barkat Ali', 'Assistant Professor(Contract)', 'CMC', NULL, NULL, 30),
('Dr. Ashok Kumar Oad', 'Lecturer', 'CMC', NULL, NULL, 31),
('Dr. Daulat Ram', 'Lecturer', 'CMC', NULL, NULL, 32),
('Dr. Rehana Sadhayo', 'Lecturer', 'CMC', NULL, NULL, 33),
('Dr. Zafar Ali Abro', 'Lecturer', 'CMC', NULL, NULL, 34),
('Dr. Ashfaque Ahmed Bhutto', 'Lecturer', 'CMC', NULL, NULL, 35),
('Dr. Muzaffar Ali Abro', 'Lecturer', 'CMC', NULL, NULL, 36),
('Dr. Benazir Abbasi', 'Lecturer', 'CMC', NULL, NULL, 37),
('Dr. Ayesha Ambreen', 'Lecturer', 'CMC', NULL, NULL, 38),
('Dr. Farah Naz', 'Lecturer', 'CMC', NULL, NULL, 39),
('Dr. Fatima', 'Lecturer', 'CMC', NULL, NULL, 40),
('Dr. Muhammad Babar', 'Lecturer', 'CMC', NULL, NULL, 41),
('Dr. Shagufta Memon', 'Assistant Professor', 'GMMMC', NULL, NULL, 42),
('Dr. Muhammad Abdulah Mirani', 'Senior Lecturer', 'GMMMC', NULL, NULL, 43),
('Dr. Muhammad Irfan Shaikh', 'Senior Lecturer', 'GMMMC', NULL, NULL, 44),
('Dr. Farah Naz', 'Lecturer', 'GMMMC', NULL, NULL, 45),
('Dr. Irshad Batool', 'Lecturer', 'GMMMC', NULL, NULL, 46),
('Dr. Bakhtawar Memon', 'Lecturer', 'GMMMC', NULL, NULL, 47),
('Dr.Naveed Hussain /p>', 'Lecturer', 'GMMMC', NULL, NULL, 48),
('Dr. Siraj Ahmed', 'Lecturer', 'GMMMC', NULL, NULL, 49),
('Dr. Ghulam Sarwar Shaikh', 'Chairperson', 'DEPARTMENT OF BIOCHEMISTRY', NULL, NULL, 50),
('Prof: Dr. Muhammad Hanif Shaikh', 'Professor', 'CMC', NULL, NULL, 51),
('Dr. Ghulam Sarwar Shaikh', 'Professor', 'CMC', NULL, NULL, 52),
('Dr. Mir Hassan Khoso', 'Assistant Professor', 'CMC', NULL, NULL, 53),
('Dr. Atia Masood', 'Assistant Professor', 'CMC', NULL, NULL, 54),
('Dr. Abdul Hameed Lanjwani', 'Assistant Professor', 'CMC', NULL, NULL, 55),
('Dr. Inamullah Soomro', 'Senior Lecturer', 'CMC', NULL, NULL, 56),
('DR. Amber-U-Nisa', 'Lecturer', 'CMC', NULL, NULL, 57),
('Dr. Shaista Mujeeb', 'Lecturer', 'CMC', NULL, NULL, 58),
('Dr. Aneela Qureshi', 'Lecturer', 'CMC', NULL, NULL, 59),
('Dr. Noma Soomro', 'Lecturer', 'CMC', NULL, NULL, 60),
('Dr. Vinay Kumar', 'Lecturer', 'CMC', NULL, NULL, 61),
('Dr, Arshad Hussain Laghari', 'Professor', 'GMMMC', NULL, NULL, 62),
('Dr. Majid Ali', 'Assistant Professor', 'GMMMC', NULL, NULL, 63),
('Dr. Nazakat Hussain', 'Assistant Professor', 'GMMMC', NULL, NULL, 64),
('Dr. Ali Akbar Naich', 'Senior Lecturer', 'GMMMC', NULL, NULL, 65),
('Dr. Rehana Gudi', 'Senior Lecturer', 'GMMMC', NULL, NULL, 66),
('Dr. Ayaz Hussain Shah', 'Senior Lecturer', 'GMMMC', NULL, NULL, 67),
('Dr. Shumaila', 'Lecturer', 'GMMMC', NULL, NULL, 68),
('Dr. Nila', 'Lecturer', 'GMMMC', NULL, NULL, 69),
('Dr. Aisha Bibi', 'Lecturer', 'GMMMC', NULL, NULL, 70),
('Dr.Murkh Rani', 'Lecturer', 'GMMMC', NULL, NULL, 71),
('Dr. OM Parkash', 'Chairperson', 'DEPARTMENT OF PATHOLOGY', NULL, NULL, 72),
('Dr. OM Parkash', 'Associate Professor', 'CMC', NULL, NULL, 73),
('Dr. Dileep Kumar Ahuja', 'Senior Demonstrator', 'CMC', NULL, NULL, 74),
('Dr. Lubna Adnan', 'Assistant Professor', 'CMC', NULL, NULL, 75),
('Dr. Shahzad Ali', 'Assistant Professor', 'CMC', NULL, NULL, 76),
('Dr. Muhammad Wasif Saleem', 'Assistant Professor', 'CMC', NULL, NULL, 77),
('Dr. Hifazuddin  Abro', 'Lecturer', 'CMC', NULL, NULL, 78),
('Dr. Sarfraz Hussain Tunio', 'Lecturer', 'CMC', NULL, NULL, 79),
('Dr. Abdul Qadir', 'Lecturer', 'CMC', NULL, NULL, 80),
('Dr. Fahmeeda Shaikh', 'Lecturer', 'CMC', NULL, NULL, 81),
('Dr. Aisha', 'Lecturer', 'CMC', NULL, NULL, 82),
('Dr. Asma', 'Lecturer', 'CMC', NULL, NULL, 83),
('Dr. Ghazal', 'Lecturer', 'CMC', NULL, NULL, 84),
('Dr. Ghazal Gohar', 'Lecturer', 'CMC', NULL, NULL, 85),
('Dr. Ghazal Saeed', 'Lecturer', 'CMC', NULL, NULL, 86),
('Dr. Hafeezullah', 'Lecturer', 'CMC', NULL, NULL, 87),
('Dr. Mukesh Kumar', 'Lecturer', 'CMC', NULL, NULL, 88),
('Dr. Pritya Gemnani', 'Lecturer', 'CMC', NULL, NULL, 89),
('Dr. Asba Memon', 'Lecturer', 'CMC', NULL, NULL, 90),
('Prof. Dr. Altaf Ahmed Shaikh', 'Professor', 'GMMMC', NULL, NULL, 91),
('Dr. Amanullah Bhutto', 'Assistant Professor', 'GMMMC', NULL, NULL, 92),
('Dr. Rukhsana Saboor', 'Assistant Professor', 'GMMMC', NULL, NULL, 93),
('Dr. Khadim Ali Mangi', 'Senior Lecturer', 'GMMMC', NULL, NULL, 94),
('Dr. Fiza Sharaf Siddiqui', 'Lecturer', 'GMMMC', NULL, NULL, 95),
('Dr. Hidayatullah Memon', 'Lecturer', 'GMMMC', NULL, NULL, 96),
('Dr. Sajjad Ali Soomro', 'Lecturer', 'GMMMC', NULL, NULL, 97),
('Dr.Samina Tarique Sawand', 'Lecturer', 'GMMMC', NULL, NULL, 98),
('Dr. Bakhtawar Giramani', 'Lecturer', 'GMMMC', NULL, NULL, 99),
('Dr.Shakeela Kalhoro', 'Lecturer', 'GMMMC', NULL, NULL, 100),
('Dr. Manesh', 'Lecturer', 'GMMMC', NULL, NULL, 101),
('Dr.Ali Rohail', 'Lecturer', 'GMMMC', NULL, NULL, 102),
('Prof: Dr. Barkat Ali Shaikh', 'Chairperson', 'Department of Pharmacology', NULL, NULL, 103),
('Prof: Dr. Riaz Ahmed Shaikh', 'Professor', 'CMC', NULL, NULL, 104),
('Prof: Dr. Barkat Ali Shaikh', 'Professor', 'CMC', NULL, NULL, 105),
('Dr. Diyal Das', 'Associate Professor', 'CMC', NULL, NULL, 106),
('Dr. Fahad Jibran Siyal', 'Associate Professor', 'CMC', NULL, NULL, 107),
('Dr. Masood Ahmed Unar', 'Assistant Professor', 'CMC', NULL, NULL, 108),
('Dr. Barkat Ali Shaikh', 'Lecturer', 'CMC', NULL, NULL, 109),
('Dr. Andeep Kumar', 'Lecturer', 'CMC', NULL, NULL, 110),
('Dr. Abdul Basit Gopang', 'Lecturer', 'CMC', NULL, NULL, 111),
('Dr. Abdul Aziz Khoso', 'Lecturer', 'CMC', NULL, NULL, 112),
('Dr. Afaque Hussain', 'Lecturer', 'CMC', NULL, NULL, 113),
('Prof: Dr. Nazeer Ahmed Shah', 'Professor', 'GMMMC', NULL, NULL, 114),
('Dr. Ashique Hussian Channa', 'Senior Lecturer', 'GMMMC', NULL, NULL, 115),
('Dr. Allah Jeewayo Panhyar', 'Senior Lecturer', 'GMMMC', NULL, NULL, 116),
('Dr. Ajeet Kumar', 'Senior Lecturer', 'GMMMC', NULL, NULL, 117),
('Dr. Ashfaque Ahmed Jumani', 'Lecturer', 'GMMMC', NULL, NULL, 118),
('Dr. Khadija Shaikh', 'Lecturer', 'GMMMC', NULL, NULL, 119),
('Dr. Dua Rabeel', 'Lecturer', 'GMMMC', NULL, NULL, 120),
('Dr. Farooq Ahmed Abro', 'Chairperson', 'FORENSIC MEDICINE', NULL, NULL, 121),
('Dr. Farooq Ahmed Abro', 'Associate Professor', 'CMC', NULL, NULL, 122),
('Dr. Inayatullah Magsi', 'Assistant Professor', 'CMC', NULL, NULL, 123),
('Dr. Muhammad Rafique Shaikh', 'Assistant Professor', 'CMC', NULL, NULL, 124),
('Dr. Ashok Kumar Parthiani', 'Lecturer', 'CMC', NULL, NULL, 125),
('Dr. Abdul Hafeez Abro', 'Lecturer', 'CMC', NULL, NULL, 126),
('Dr. Asif Raza Gaad', 'Lecturer', 'CMC', NULL, NULL, 127),
('Dr. Aziz Ahmed Soomro', 'Medical Officer', 'CMC', NULL, NULL, 128),
('Dr. Mir Ghulam Ali Talpur', 'Assistant Professor', 'GMMMC', NULL, NULL, 129),
('Prof. Dr. Altaf Shaikh', 'Dean', 'medicine', NULL, NULL, 130),
('Prof. Dr. Bashir Ahmed Shaikh', 'Chairperson', 'DEPARTMENT OF MEDICINE', NULL, NULL, 131),
('Prof: Dr. Hakim Ali Abro', 'Professor', 'CMC', NULL, NULL, 132),
('Dr. Azizullah Jalbani', 'Professor', 'CMC', NULL, NULL, 133),
('Dr. Kouro Mal', 'Professor', 'CMC', NULL, NULL, 134),
('Dr. Mumtaz Ali Chutto', 'Associate Professor', 'CMC', NULL, NULL, 135),
('Dr. Shaikh Khalid Muhammad', 'Associate Professor', 'CMC', NULL, NULL, 136),
('Dr. Zahid Ali Shaikh', 'Associate Professor', 'CMC', NULL, NULL, 137),
('DR. Abdul Wahab', 'Assistant Professor', 'CMC', NULL, NULL, 138),
('DR. Sultan Ahmed Chandio', 'Assistant Professor', 'CMC', NULL, NULL, 139),
('DR. Kamlesh Kumar', 'Assistant Professor', 'CMC', NULL, NULL, 140),
('DR. Aneel Kumar', 'Assistant Professor', 'CMC', NULL, NULL, 141),
('DR. Shakeel Ahmed', 'Senior Registrar', 'CMC', NULL, NULL, 142),
('DR. Sham Lal', 'Senior Registrar', 'CMC', NULL, NULL, 143),
('Dr. Mujeeb –ur- Rehman Abro', 'Senior Registrar', 'CMC', NULL, NULL, 144),
('Dr. Vishamber Lal', 'Senior Registrar', 'CMC', NULL, NULL, 145),
('Prof. Dr. Saleh Muhammad Channa', 'Professor', 'GMMMC', NULL, NULL, 146),
('Prof. Syed Iftkhar Ali Shah', 'Professor', 'GMMMC', NULL, NULL, 147),
('Dr. Bashir Ahmed', 'Assistant Professor', 'GMMMC', NULL, NULL, 148),
('Dr. Abdul Rashid', 'Assistant Professor', 'GMMMC', NULL, NULL, 149),
('Dr. Khalil Ahmed Sanghroo', 'Senior Registrar', 'GMMMC', NULL, NULL, 150),
('Dr. Shanti Lal', 'Professor', 'CMC', NULL, NULL, 151),
('Dr. Shankar Lal', 'Associate Professor', 'CMC', NULL, NULL, 152),
('Dr. Delijan', 'Assistant Professor', 'CMC', NULL, NULL, 153),
('Dr. Nazimuddin', 'Assistant Professor', 'CMC', NULL, NULL, 154),
('Dr. Nazia Faraz', 'Assistant Professor', 'CMC', NULL, NULL, 155),
('Dr. Mumtaz Ali', 'Assistant Professor', 'GMMMC', NULL, NULL, 156),
('Dr. Tufail Ahmed Soomro', 'Assistant Professor', 'GMMMC', NULL, NULL, 157),
('Dr. Rizwana Qureshi', 'Assistant Professor', 'GMMMC', NULL, NULL, 158),
('Dr. Chinkoo Mal', 'Assistant Professor', 'GMMMC', NULL, NULL, 159),
('Dr. Saira Bano', 'Lecturer', 'GMMMC', NULL, NULL, 160),
('Dr. Raj Kumar Sachdewani', 'Chairperson', 'DEPARTMENT OF CARDIOLOGY', NULL, NULL, 161),
('Dr. Muhammad Khalilullah   Shaikh', 'Senior Lecturer', 'CMC', NULL, NULL, 162),
('Dr. Raj Kumar Sachdewani', 'Professor', 'GMMMC', NULL, NULL, 163),
('Dr. Tahir Hussain Soomro', 'Assistant Professor', 'GMMMC', NULL, NULL, 164),
('Dr. Shafi Muhammad Khuhawar', 'Chairperson', 'DEPARTEMENT OF PULMONOLOGY', NULL, NULL, 165),
('Dr. Rizwan Ali Tunio', 'Assistant Professor', 'CMC', NULL, NULL, 166),
('Dr. Shafi Muhammad Khuhawar', 'Associate Professor', 'GMMMC', NULL, NULL, 167),
('Dr. Jagdesh Kumar', 'Assistant Professor', 'GMMMC', NULL, NULL, 168),
('Prof: Dr. Alam Ibrahim   Siddiqui', 'Professor', 'DEPARTMENT OF NUEROLOGY', NULL, NULL, 169),
('Dr. Abdul Ghafoor Magsi', 'Assistant Professor', 'DEPARTMENT OF NUEROLOGY', NULL, NULL, 170),
('Dr. Aijaz Ali', 'Assistant Professor', 'DEPARTMENT OF NUEROLOGY', NULL, NULL, 171),
('Dr. Sajjad Hussain Jalbani', 'Senior Registrar', 'DEPARTMENT OF NUEROLOGY', NULL, NULL, 172),
('Dr. Tariq Rasheed', 'Lecturer', 'DEPARTMENT OF NUEROLOGY', NULL, NULL, 173),
('Dr. Deepak Kumar', 'Senior Registrar', 'GMMMC', NULL, NULL, 174),
('Dr. Zohaib Ahmed Soomro', 'Senior Registrar', 'GMMMC', NULL, NULL, 175),
('Dr. Irfan Ahmed Shaikh', 'Professor / Chairperson', 'DEPARTMENT OF DERMATOLOGY', NULL, NULL, 176),
('Dr. Rahmat Ali Waggan', 'Assistant Professor', 'CMC', NULL, NULL, 177),
('Dr. Anoop Kumar', 'Assistant Professor', 'CMC', NULL, NULL, 178),
('Dr. Inayatullah Awan', 'Associate Professor', 'GMMMC', NULL, NULL, 179),
('Dr. Ghulam Rasool Rind', 'Assistant Professor', 'GMMMC', NULL, NULL, 180),
('Dr. Ali Hyder Mugheri', 'Chairperson', 'Department of Gastroenterology', NULL, NULL, 181),
('Dr. Ali Hyder Mugheri', 'Associate Professor', 'CMC', NULL, NULL, 182),
('Dr. Shabana', 'Assistant Professor', 'CMC', NULL, NULL, 183),
('Dr. Mahesh Kumar', 'Senior Registrar', 'CMC', NULL, NULL, 184),
('Dr. Ghulam Abbas Qadri', 'Assistant Professor', 'Department of Nephrology', NULL, NULL, 185),
('Prof: Dr. Shahida Magsi', 'Dean', 'surgery', NULL, NULL, 186),
('Dr. Yasmeen Bhatti', 'Professor', 'CMC', NULL, NULL, 187),
('Dr. Akleema Abro', 'Professor', 'CMC', NULL, NULL, 188),
('Dr. Aisha Aziz Shaikh', 'Associate Professor', 'CMC', NULL, NULL, 189),
('Dr. Saira Shaikh', 'Associate Professor', 'CMC', NULL, NULL, 190),
('DR. Abdul Ghani Shaikh', 'Associate Professor', 'CMC', NULL, NULL, 191),
('DR. Ehsanullah Malik', 'Assistant Professor', 'CMC', NULL, NULL, 192),
('DR. Muhammad Ali Napar', 'Assistant Professor', 'CMC', NULL, NULL, 193),
('Dr. Abdul Sattar Abro', 'Assistant Professor', 'CMC', NULL, NULL, 194),
('Dr. Nadia Bhatti', 'Senior Registrar', 'CMC', NULL, NULL, 195),
('Dr. Waqar- Sahar- Shah', 'Senior Registrar', 'CMC', NULL, NULL, 196),
('Dr. Abdul Ghaffar', 'Senior Registrar', 'CMC', NULL, NULL, 197),
('Dr. Sachal Faqeer', 'Medical Officer', 'CMC', NULL, NULL, 198),
('Dr. Ghulam Hyder Rind', 'Professor', 'GMMMC', NULL, NULL, 199),
('Dr. Imamuddin Baloch', 'Associate Professor', 'GMMMC', NULL, NULL, 200),
('Dr. Azhar Ali Shah', 'Associate Professor', 'GMMMC', NULL, NULL, 201),
('Dr. Shahid Hussain Mirani', 'Associate Professor', 'GMMMC', NULL, NULL, 202),
('Dr. Abdul Sami', 'Assistant Professor', 'GMMMC', NULL, NULL, 203),
('Dr. Dharmoon Arija', 'Assistant Professor', 'GMMMC', NULL, NULL, 204),
('Dr. Bushra Shaikh', 'Assistant Professor', 'GMMMC', NULL, NULL, 205),
('Prof: Dr. Safia Maqsood', 'Chairperson', 'DEPARTMENT OF GYNECOLOGY & OBSTETRICS', NULL, NULL, 206),
('Prof: Dr. Shahida Magsi', 'Professor', 'CMC', NULL, NULL, 207),
('Dr. Shaista Tabasum', 'Professor', 'CMC', NULL, NULL, 208),
('Dr. Shabnam Naz Shaikh', 'Professor', 'CMC', NULL, NULL, 209),
('Dr. Shazia Shaikh', 'Professor', 'CMC', NULL, NULL, 210),
('Dr. Afshan Bhatti', 'Associate Professor', 'CMC', NULL, NULL, 211),
('Dr. Tanveer Akhtar', 'Associate Professor', 'CMC', NULL, NULL, 212),
('Dr. Fouzia Chandio', 'Assistant Professor', 'CMC', NULL, NULL, 213),
('Dr. Lachmi', 'Senior Lecturer', 'CMC', NULL, NULL, 214),
('Dr. Basma Zia', 'Assistant Professor', 'CMC', NULL, NULL, 215),
('Dr. Najia Bhatti', 'Assistant Professor', 'CMC', NULL, NULL, 216),
('Dr. Shabana Bano', 'Assistant Professor', 'CMC', NULL, NULL, 217),
('Dr. Waqar-U-Nisa', 'Senior Registrar', 'CMC', NULL, NULL, 218),
('Dr. Sonia Bai', 'Senior Registrar', 'CMC', NULL, NULL, 219),
('Dr. Shaista Lashari', 'Senior Registrar', 'CMC', NULL, NULL, 220),
('Prof: Dr. Safia Maqsood', 'Professor', 'GMMMC', NULL, NULL, 221),
('Dr. Tahmina Mahar', 'Associate Professor', 'GMMMC', NULL, NULL, 222),
('Dr. Shoaibunisa Soomro', 'Assistant Professor', 'GMMMC', NULL, NULL, 223),
('Dr. Sabhat Fatima', 'Assistant Professor', 'GMMMC', NULL, NULL, 224),
('Dr. Samina Memon', 'Assistant Professor', 'GMMMC', NULL, NULL, 225),
('Dr. Rubina Hafeez', 'Assistant Professor', 'GMMMC', NULL, NULL, 226),
('Dr. Hazooran Lakhan', 'Assistant Professor', 'GMMMC', NULL, NULL, 227),
('Dr. Mahjabeen', 'Senior Registrar', 'GMMMC', NULL, NULL, 228),
('Dr. Shahneela', 'Senior Registrar', 'GMMMC', NULL, NULL, 229),
('Prof. Amanullah Abbasi', 'Chairperson', 'DEPARTMENT OF UROLOGY', NULL, NULL, 230),
('Prof. Amanullah Abbasi', 'Professor', 'CMC', NULL, NULL, 231),
('Dr. Nisar Ahmed Shaikh', 'Associate Professor', 'CMC', NULL, NULL, 232),
('Dr. Muhammad Iqbal Soomro', 'Associate Professor', 'CMC', NULL, NULL, 233),
('Dr. Safiullah Sohu', 'Assistant Professor', 'CMC', NULL, NULL, 234),
('Dr. Fozia Shaikh', 'Assistant Professor', 'CMC', NULL, NULL, 235),
('Dr. Amir Ali', 'Assistant Professor', 'CMC', NULL, NULL, 236),
('Dr. Muhammad Imran', 'Assistant Professor', 'CMC', NULL, NULL, 237),
('Dr. Azizullah', 'Assistant Professor', 'CMC', NULL, NULL, 238),
('Dr. Yasir Hussain Patujo', 'Assistant Professor', 'CMC', NULL, NULL, 239),
('Dr. Naveed Ahmed', 'Assistant Professor', 'CMC', NULL, NULL, 240),
('Dr. Sajjad Ali Abbasi', 'Assistant Professor', 'CMC', NULL, NULL, 241),
('Dr. Hameed-ur-Rehman', 'Assistant Professor', 'GMMMC', NULL, NULL, 242),
('Dr.Azizullah Mir Bahar', 'Assistant Professor', 'GMMMC', NULL, NULL, 243),
('Dr.Muhammad Imran', 'Assistant Professor', 'GMMMC', NULL, NULL, 244),
('Dr. Hamid Ali Sangi', 'Chairperson', 'DEPARTMENT OF E.N.T', NULL, NULL, 245),
('Prof: Dr. Gulzar Ahmed Shaikh', 'Professor', 'CMC', NULL, NULL, 246),
('Dr. Hamid Ali Sangi', 'Professor', 'CMC', NULL, NULL, 247),
('Dr. Liaquat Ali Dargahi', 'Senior Lecturer', 'CMC', NULL, NULL, 248),
('Dr. Ghulam Shabir Mahar', 'Assistant Professor', 'GMMMC', NULL, NULL, 249),
('Dr. Abdul Malik Shaikh', 'Chairperson', 'DEPARTMENT OF ORTHOPAEDIC SURGERY', NULL, NULL, 250),
('Dr. Abdul Malik Shaikh', 'Professor', 'CMC', NULL, NULL, 251),
('Dr. Zamir Ahmed Soomro', 'Professor', 'CMC', NULL, NULL, 252),
('Dr. Kashif Iqbal Tebani', 'Professor', 'CMC', NULL, NULL, 253),
('Dr. Mushtaque Ahmed Shaikh', 'Assistant Professor', 'CMC', NULL, NULL, 254),
('Dr. Muhammad Shoaib Chandio', 'Assistant Professor', 'CMC', NULL, NULL, 255),
('Dr. Muhammad Zeb Tunio', 'Assistant Professor', 'CMC', NULL, NULL, 256),
('Dr. Shahjahan Siyal', 'Senior Registrar', 'CMC', NULL, NULL, 257),
('Dr. Safiullah Soomro', 'Senior Registrar', 'CMC', NULL, NULL, 258),
('Dr. Zulfiqar Ali Soomro', 'Professor', 'GMMMC', NULL, NULL, 259),
('Dr. Shakeel Ahmed Abbasi', 'Associate Professor', 'GMMMC', NULL, NULL, 260),
('Dr. Azizullah Bhayo', 'Assistant Professor', 'GMMMC', NULL, NULL, 261),
('Dr. Sijad Ahmed', 'Assistant Professor', 'GMMMC', NULL, NULL, 262),
('Dr. Ahmed Raza Leghari', 'Senior Registrar', 'GMMMC', NULL, NULL, 263),
('Prof. Sirajuddin Soomro', 'Professor', 'CMC', NULL, NULL, 264),
('Prof: Dr. Noor Ahmed Shaikh', 'Professor', 'GMMMC', NULL, NULL, 265),
('DR. Bhagwan Das', 'Assistant Professor', 'CMC', NULL, NULL, 266),
('DR. Kailash Kumar', 'Assistant Professor', 'CMC', NULL, NULL, 267),
('DR. Din Muhammad Sohu', 'Assistant Professor', 'CMC', NULL, NULL, 268),
('Dr. Inayatullah  Memon', 'Assistant Professor', 'GMMMC', NULL, NULL, 269),
('Dr. Imran Khan  Memon', 'Assistant Professor', 'GMMMC', NULL, NULL, 270),
('Dr. Rabia Hafeez', 'Senior Registrar', 'GMMMC', NULL, NULL, 271),
('Dr. Muhammad Aslam Shaikh', 'Associate Professor', 'NEUROSURGERY', NULL, NULL, 272),
('Dr. Muhammad Munwar Ali', 'Assistant Professor', 'NEUROSURGERY', NULL, NULL, 273),
('Dr. Najm-u-Saqib', 'Assistant Professor', 'GMMMC', NULL, NULL, 274),
('Dr. Ahmed-uddin Soomro', 'Assistant Professor', 'DEPARTMENT OF ANESTHESIOLOGY', NULL, NULL, 275),
('Dr. Menghraj', 'Lecturer', 'DEPARTMENT OF ANESTHESIOLOGY', NULL, NULL, 276),
('Dr. Aijaz Ali Shaikh', 'Lecturer', 'DEPARTMENT OF ANESTHESIOLOGY', NULL, NULL, 277),
('Dr. Altaf Hussain Abassi', 'Senior Clinical Lecturer', 'DEPARTMENT OF ANESTHESIOLOGY', NULL, NULL, 278),
('Dr. Kamal Patujo', 'Clinical Lecturer', 'DEPARTMENT OF ANESTHESIOLOGY', NULL, NULL, 279),
('Dr. Hafeezullah Laghari', 'Clinical Lecturer', 'DEPARTMENT OF ANESTHESIOLOGY', NULL, NULL, 280),
('Dr. Darshan Lal', 'Clinical Lecturer', 'DEPARTMENT OF ANESTHESIOLOGY', NULL, NULL, 281),
('Dr. Mehtab Ali', 'Clinical Lecturer', 'DEPARTMENT OF ANESTHESIOLOGY', NULL, NULL, 282),
('Dr. Lutufullah Channa', 'Clinical Lecturer', 'GMMMC', NULL, NULL, 283),
('Prof. Dr Syed Qararo Shah', 'Dean', 'Faculty of Community Medicine & Public Health Sciences', NULL, NULL, 284),
('Prof. Saeed Ahmed Shaikh', 'Professor', 'CMC', NULL, NULL, 285),
('Prof. Dr Syed Qararo Shah', 'Professor', 'CMC', NULL, NULL, 286),
('Dr. Vijay Kumar', 'Associate Professor', 'CMC', NULL, NULL, 287),
('Dr. Shah Alam Khan', 'Assistant Professor', 'CMC', NULL, NULL, 288),
('Dr. Masood Ali', 'Assistant Professor', 'CMC', NULL, NULL, 289),
('Dr. Sarmad Jamal', 'Assistant Professor', 'CMC', NULL, NULL, 290),
('Dr. Muhammad Parial Shahani', 'Assistant Professor', 'CMC', NULL, NULL, 291),
('Dr. Kaleemullah', 'Assistant Professor', 'CMC', NULL, NULL, 292),
('Dr. Akhlaque Ahmed Shaikh', 'Lecturer', 'CMC', NULL, NULL, 293),
('Dr. Farheen', 'Lecturer', 'CMC', NULL, NULL, 294),
('Dr. Shabana Jamshed Abro', 'Senior Lecturer', 'CMC', NULL, NULL, 295),
('Dr. Suhail Aman Jokhio', 'Lecturer', 'CMC', NULL, NULL, 296),
('Dr. Fareeda Baloch', 'Lecturer', 'CMC', NULL, NULL, 297),
('Dr. Wahid Bux Solangi', 'Lecturer', 'CMC', NULL, NULL, 298),
('Dr. Alma', 'Lecturer', 'CMC', NULL, NULL, 299),
('Dr. Faisal Saifullah', 'Lecturer', 'CMC', NULL, NULL, 300),
('Dr. Imtiaz Ali', 'Lecturer', 'CMC', NULL, NULL, 301),
('Dr. Samara Jamshed', 'Lecturer', 'CMC', NULL, NULL, 302),
('Dr. Sumera', 'Lecturer', 'CMC', NULL, NULL, 303),
('Dr. Yasmeen', 'Lecturer', 'CMC', NULL, NULL, 304),
('Dr. Shafi Muhammad Wasan', 'Associate Professor', 'GMMMC', NULL, NULL, 305),
('Dr. Khairunnisa Shaikh', 'Assistant Professor', 'GMMMC', NULL, NULL, 306),
('Dr. Asghar Ali', 'Assistant Professor', 'GMMMC', NULL, NULL, 307),
('Dr. Mujeeb Rehman Pathan', 'Senior Lecturer', 'GMMMC', NULL, NULL, 308),
('Dr. Zahida Kousar', 'Lecturer', 'GMMMC', NULL, NULL, 309),
('Dr. Kashif Philpoto', 'Lecturer', 'GMMMC', NULL, NULL, 310),
('Dr. Azharuddin Shaikh', 'Lecturer', 'GMMMC', NULL, NULL, 311),
('Dr. Farah Naz Sarki', 'Lecturer', 'GMMMC', NULL, NULL, 312),
('Dr. Asif Wazir Narejo', 'Lecturer', 'GMMMC', NULL, NULL, 313),
('Dr.Anzar Farooque', 'Lecturer', 'GMMMC', NULL, NULL, 314),
('Dr. Aliza', 'Lecturer', 'GMMMC', NULL, NULL, 315),
('Dr. Tulsi Das', 'Lecturer', 'GMMMC', NULL, NULL, 316),
('Dr. Syed Yousif Ali Shah', 'Professor', 'Bibi Aseefa Dental College', NULL, NULL, 317),
('Dr. Wajid Ali', 'Senior Registrar', 'Bibi Aseefa Dental College', NULL, NULL, 318),
('Dr. Preh Abro', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 319),
('Dr. Muhammad Rafique Tagar', 'Associate Professor', 'Bibi Aseefa Dental College', NULL, NULL, 320),
('Dr. Arsalan Humayun', 'Assistant Professor', 'Bibi Aseefa Dental College', NULL, NULL, 321),
('Dr. Abdul Bari Memon', 'Associate Professor', 'Bibi Aseefa Dental College', NULL, NULL, 322),
('Dr. Imran Ali Maitlo', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 323),
('Dr. Muhammad Adil', 'Faculty Member', 'Bibi Aseefa Dental College', NULL, NULL, 324),
('Prof. Dr. Kouro Mal Gurbakhshani', 'Professor', 'Bibi Aseefa Dental College', NULL, NULL, 325),
('Dr. Saira Baby', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 326),
('Dr. Muharram Ali', 'Assistant Professor', 'Bibi Aseefa Dental College', NULL, NULL, 327),
('Dr. Muhammad Mubashir Ahmed', 'Senior Registrar', 'Bibi Aseefa Dental College', NULL, NULL, 328),
('Dr. Shumaila Shaikh', 'Assistant Professor', 'Bibi Aseefa Dental College', NULL, NULL, 329),
('Dr. Sarwanand', 'Senior Registrar', 'Bibi Aseefa Dental College', NULL, NULL, 330),
('Dr. Imdad Hussain', 'Senior Registrar', 'Bibi Aseefa Dental College', NULL, NULL, 331),
('Dr. Rashid Iqbal Bughio', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 332),
('Dr. Rajesh Kumar', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 333),
('Dr. Sarang Suresh', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 334),
('Dr. Sunny', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 335),
('Dr. Nadia Bashir', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 336),
('Prof. Dr. Qaimuddin Shaikh', 'Professor', 'Bibi Aseefa Dental College', NULL, NULL, 337),
('Dr. Aswad Ahmed', 'Associate Professor (CCB)', 'Bibi Aseefa Dental College', NULL, NULL, 338),
('Dr. Asfar Hussain', 'Assistant Professor (CCB)', 'Bibi Aseefa Dental College', NULL, NULL, 339),
('Dr. Kinza Fatima', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 340),
('Dr. Naeem Mustafa', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 341),
('Dr. Bharti Kumari', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 342),
('Dr. Priya Kumari', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 343),
('Dr. Saleem Raza Khuhawar', 'Professor', 'Bibi Aseefa Dental College', NULL, NULL, 344),
('Dr. Arslan Ali', 'Lecturer / Registrar', 'Bibi Aseefa Dental College', NULL, NULL, 345),
('Dr. Farzana Mangi', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 346),
('Dr. Reeta Khatri', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 347),
('Dr. Surwaich Ali', 'Assistant Professor', 'Bibi Aseefa Dental College', NULL, NULL, 348),
('Dr. Mehak Irshad Abro', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 349),
('Dr. Priya Rani', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 350),
('Dr. Almas Rahoojo', 'Assistant Professor', 'Bibi Aseefa Dental College', NULL, NULL, 351),
('Dr. Seema Hameed', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 352),
('Dr. Shazia Shakeel', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 353),
('Dr. Murk Dodani', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 354),
('Dr. Safia Rani', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 355),
('Dr. Asma Bano', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 356),
('Dr. Ghulam Muhiddin Shah', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 357),
('Dr. Abdul Jabbar Lakhiar', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 358),
('Dr. Mehak Memon', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 359),
('Dr. Ume Farwa', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 360),
('Dr. Ali Gul Tunio', 'Professor', 'Bibi Aseefa Dental College', NULL, NULL, 361),
('Dr. Asif Ali', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 362),
('Prof. Amar Lal Gurbakhshani', 'Professor', 'Bibi Aseefa Dental College', NULL, NULL, 363),
('Dr Imran Samejo', 'Associate Professor', 'Bibi Aseefa Dental College', NULL, NULL, 364),
('Dr. Shabir Ahmed', 'Assistant Professor', 'Bibi Aseefa Dental College', NULL, NULL, 365),
('Dr. Waheed Murad Dahri', 'Assistant Professor', 'Bibi Aseefa Dental College', NULL, NULL, 366),
('Dr. Amit Kumar', 'Lecturer / Registrar', 'Bibi Aseefa Dental College', NULL, NULL, 367),
('Dr Sana Sattar', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 368),
('Dr. Deepak Kumar', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 369),
('Dr. Sanam Bhutto', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 370),
('Dr. Sadam Rind', 'Lecturer', 'Bibi Aseefa Dental College', NULL, NULL, 371),
('Dr. Shahid Ali Mirani', 'Assistant Professor', 'Bibi Aseefa Dental College', NULL, NULL, 372),
('Dr. Sandeep Kumar', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 373),
('Dr. Rajesh Mandhan', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 374),
('Dr. Maria Saba', 'Lecturer / Demonstrator', 'Bibi Aseefa Dental College', NULL, NULL, 375),
('Dr. Syed Yousif Ali Shah', 'Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-syed-yousif-ali-shah.jpg', 376),
('Dr. Wajid Ali', 'Senior Registrar', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 377),
('Dr. Preh Abro', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 378),
('Dr. Muhammad Rafique Tagar', 'Associate Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-muhammad-rafique-tagar.jpg', 379),
('Dr. Arsalan Humayun', 'Assistant Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 380),
('Dr. Abdul Bari Memon', 'Associate Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 381),
('Dr. Imran Ali Maitlo', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 382),
('Dr. Muhammad Adil', 'Faculty Member', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 383),
('Prof. Dr. Kouro Mal Gurbakhshani', 'Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 384),
('Dr. Saira Baby', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-saira-baby.jpg', 385),
('Dr. Muharram Ali', 'Assistant Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 386),
('Dr. Muhammad Mubashir Ahmed', 'Senior Registrar', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 387),
('Dr. Shumaila Shaikh', 'Assistant Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 388),
('Dr. Sarwanand', 'Senior Registrar', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 389),
('Dr. Imdad Hussain', 'Senior Registrar', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 390),
('Dr. Rashid Iqbal Bughio', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 391),
('Dr. Rajesh Kumar', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 392),
('Dr. Sarang Suresh', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 393),
('Dr. Sunny', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 394),
('Dr. Nadia Bashir', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 395),
('Prof. Dr. Qaimuddin Shaikh', 'Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/prof-dr-qaimuddin-shaikh.jpeg', 396),
('Dr. Aswad Ahmed', 'Associate Professor (CCB)', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-aswad-ahmed.jpeg', 397),
('Dr. Asfar Hussain', 'Assistant Professor (CCB)', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-asfar-hussain.jpeg', 398),
('Dr. Kinza Fatima', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-kinza-fatima.jpeg', 399),
('Dr. Naeem Mustafa', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-naeem-mustafa.jpeg', 400),
('Dr. Bharti Kumari', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-bharti-kumari.jpeg', 401),
('Dr. Priya Kumari', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-priya-kumari.jpeg', 402),
('Dr. Saleem Raza Khuhawar', 'Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 403),
('Dr. Arslan Ali', 'Lecturer / Registrar', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 404),
('Dr. Farzana Mangi', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 405),
('Dr. Reeta Khatri', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 406),
('Dr. Surwaich Ali', 'Assistant Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 407),
('Dr. Mehak Irshad Abro', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 408),
('Dr. Priya Rani', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 409),
('Dr. Almas Rahoojo', 'Assistant Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-almas-rahoojo.jpg', 410),
('Dr. Seema Hameed', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 411),
('Dr. Shazia Shakeel', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 412),
('Dr. Murk Dodani', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 413),
('Dr. Safia Rani', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 414),
('Dr. Asma Bano', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 415),
('Dr. Ghulam Muhiddin Shah', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 416),
('Dr. Abdul Jabbar Lakhiar', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 417),
('Dr. Mehak Memon', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 418),
('Dr. Ume Farwa', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 419),
('Dr. Ali Gul Tunio', 'Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-ali-gul-tunio.jpg', 420),
('Dr. Asif Ali', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-asif-ali.jpg', 421),
('Prof. Amar Lal Gurbakhshani', 'Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/prof-amar-lal-gurbakhshani.jpg', 422),
('Dr Imran Samejo', 'Associate Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 423),
('Dr. Shabir Ahmed', 'Assistant Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 424),
('Dr. Waheed Murad Dahri', 'Assistant Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 425),
('Dr. Amit Kumar', 'Lecturer / Registrar', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-amit-kumar.jpg', 426),
('Dr Sana Sattar', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 427),
('Dr. Deepak Kumar', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 428),
('Dr. Sanam Bhutto', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 429),
('Dr. Sadam Rind', 'Lecturer', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 430),
('Dr. Shahid Ali Mirani', 'Assistant Professor', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-shahid-ali-mirani.jpg', 431),
('Dr. Sandeep Kumar', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-sandeep-kumar.jpg', 432),
('Dr. Rajesh Mandhan', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 433),
('Dr. Maria Saba', 'Lecturer / Demonstrator', 'Introduction', (select id from institutes where slug='bibi-aseefa-dental-college-larkana'), NULL, 434),
('Mr. Nazeer Ali', 'Associate Professor', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/mr-nazeer-ali.jpeg', 435),
('MR. GHULAM ABBAS PANHWAR', 'Associate Professor', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/mr-ghulam-abbas-panhwar.jpeg', 436),
('Ms. Sara Chandio', 'Lecturer', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/ms-sara-chandio.jpg', 437),
('Ms. Humera Wagan', 'Lecturer', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/ms-humera-wagan.jpg', 438),
('Mr. Aftab Ghouri', 'Lecturer', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/mr-aftab-ghouri.jpeg', 439),
('MR. Abdul Wahid Bhayo', 'Lecturer', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/mr-abdul-wahid-bhayo.png', 440),
('Ms. Faiza Jokhio', 'Lecturer', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/ms-faiza-jokhio.jpg', 441),
('Mr. Saifullah Soomro', 'Lecturer', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/mr-saifullah-soomro.jpg', 442),
('Mr. Ali Asghar', 'Lecturer', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/mr-ali-asghar.jpg', 443),
('Mr. Asif Ali Magsi', 'Lecturer', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/mr-asif-ali-magsi.jpg', 444),
('Ms. Kaneez Fiza', 'Lecurer', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/ms-kaneez-fiza.jpg', 445),
('Mr. Asif Jamali', 'Lecturer', 'Introduction', (select id from institutes where slug='benazir-college-of-nursing'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/mr-asif-jamali.jpg', 446),
('Dr. Waseem Abbas Malhani', 'Associate Professor', 'Introduction', (select id from institutes where slug='institute-of-pharmacy'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-waseem-abbas-malhani.jpeg', 447),
('Dr. Abdul Rauf Khaskheli', 'Professor', 'Introduction', (select id from institutes where slug='institute-of-pharmacy'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-abdul-rauf-khaskheli.jpeg', 448),
('Prof. Dr. Nadeem Baloch', 'Associate Professor', 'Introduction', (select id from institutes where slug='institute-of-pharmacy'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/prof-dr-nadeem-baloch.png', 449),
('Dr. Maryam Qazi', 'Assistant Professor', 'Introduction', (select id from institutes where slug='institute-of-pharmacy'), NULL, 450),
('Dr. Saleem Ahmed Joyo', 'Assistant Professor', 'Introduction', (select id from institutes where slug='institute-of-pharmacy'), NULL, 451),
('Dr. Bilawal', 'Assistant Professor', 'Introduction', (select id from institutes where slug='institute-of-pharmacy'), NULL, 452),
('Mr. Ayaz Ali Unar', 'Lecturer', 'Introduction', (select id from institutes where slug='institute-of-pharmacy'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/mr-ayaz-ali-unar.png', 453),
('Dr. Sofia', 'Lecturer', 'Introduction', (select id from institutes where slug='institute-of-pharmacy'), NULL, 454),
('Dr Athar Ali', 'Lecturer', 'Introduction', (select id from institutes where slug='institute-of-pharmacy'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-athar-ali.jpeg', 455),
('Dr Muhammad Umair', 'Lecturer', 'Introduction', (select id from institutes where slug='institute-of-pharmacy'), NULL, 456),
('Dr Rasheed Ahmed', 'Lecturer', 'Introduction', (select id from institutes where slug='institute-of-pharmacy'), NULL, 457),
('Dr. Mukesh Kumar', 'Faculty Member', 'Introduction', (select id from institutes where slug='institute-of-physiotherapy-and-rehabilitation-sciences'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-mukesh-kumar.jpeg', 458),
('Dr. Vikash', 'Lecturer', 'Introduction', (select id from institutes where slug='institute-of-physiotherapy-and-rehabilitation-sciences'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-vikash.jpeg', 459),
('Dr. Naseebullah', 'Lecturer', 'Introduction', (select id from institutes where slug='institute-of-physiotherapy-and-rehabilitation-sciences'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-naseebullah.jpeg', 460),
('Dr. Adil Ameer Ali', 'Lecturer', 'Introduction', (select id from institutes where slug='institute-of-physiotherapy-and-rehabilitation-sciences'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-adil-ameer-ali.jpeg', 461),
('Dr. Natasha Bhutto', 'Lecturer', 'Introduction', (select id from institutes where slug='institute-of-physiotherapy-and-rehabilitation-sciences'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-natasha-bhutto.jpeg', 462),
('Dr. Shobha', 'Lecturer', 'Introduction', (select id from institutes where slug='institute-of-physiotherapy-and-rehabilitation-sciences'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-shobha.jpeg', 463),
('Dr. Sunny Kumar', 'Lecturer', 'Introduction', (select id from institutes where slug='institute-of-physiotherapy-and-rehabilitation-sciences'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-sunny-kumar.jpeg', 464),
('Dr Komal', 'Faculty Member', 'Introduction', (select id from institutes where slug='institute-of-physiotherapy-and-rehabilitation-sciences'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-komal.jpeg', 465),
('Dr. Sonam', 'Faculty Member', 'Introduction', (select id from institutes where slug='institute-of-physiotherapy-and-rehabilitation-sciences'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-sonam.jpeg', 466),
('Dr. Shahmeer Khan', 'Faculty Member', 'Introduction', (select id from institutes where slug='institute-of-physiotherapy-and-rehabilitation-sciences'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-shahmeer-khan.jpeg', 467),
('Dr. Fayaz Hussain', 'Faculty Member', 'Introduction', (select id from institutes where slug='institute-of-physiotherapy-and-rehabilitation-sciences'), 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/faculty/dr-fayaz-hussain.jpeg', 468);

-- 03_announcements_00.sql
insert into announcements (title, slug, category, excerpt, body, published_at, attachments, photo_url) values
('Examination Certificate Fees Challan', 'examination-certificate-fees-challan-07-01-2026', 'examination'::announcement_category, 'Transcript Certificate Degree Certificate Verification Form Download Certificate Fees Challan', 'Transcript Certificate
Degree Certificate
Verification Form
Download Certificate Fees Challan', '2026-07-01T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Entry Test for Session July -2026', 'result-of-postgraduate-entry-test-for-session-july-2026-06-24-2026', 'examination'::announcement_category, 'Downlaod Result', 'Downlaod Result', '2026-06-24T09:00:00Z', '[{"name":"Camscanner 24 06 2026 16.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/camscanner-24-06-2026-16-17823163670.pdf","size_kb":8493}]'::jsonb, NULL),
('RESULT OF BSN (GENERIC) YEAR-II, SEMESTER-III REGULAR EXAMINATION SESSION 2023-24', 'result-of-bsn-generic-year-ii-semester-iii-regular-examination-session-2023-24-06-23-2026', 'examination'::announcement_category, 'Download Result', 'Download Result', '2026-06-23T09:00:00Z', '[{"name":"Bsn Result.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bsn-result-17823186350.pdf","size_kb":347}]'::jsonb, NULL),
('Rescheduling of interviews for various positions in the Colleges, Institutes, and Departments of Shaheed Mohtarma Benazir Bhutto Medical University', 'rescheduling-of-interviews-for-various-positions-in-the-colleges-institutes-and-departments-of-shaheed-mohtarma-benazir-bhutto-medical-university-06-22-2026', 'job'::announcement_category, NULL, '', '2026-06-22T09:00:00Z', '[]'::jsonb, NULL),
('Revised Time Table of 3rd Professional MBBS  (Supplementary) OSPE Examination Session 2022 - 23 OF SMBB Medical University Larakana', 'revised-time-table-of-3rd-professional-mbbs-supplementary-ospe-examination-session-2022-23-of-smbb-medical-university-larakana-06-18-2026', 'examination'::announcement_category, NULL, '', '2026-06-18T09:00:00Z', '[]'::jsonb, NULL),
('Time Table for Supplementary Examination for 1st, 2nd and 3rd Year MBBS Examinations', 'time-table-for-supplementary-examination-for-1st-2nd-and-3rd-year-mbbs-examinations-06-17-2026', 'examination'::announcement_category, NULL, '', '2026-06-17T09:00:00Z', '[]'::jsonb, NULL),
('Rescheduling of Interviews for Admission to Postgraduate Courses Session July-2026', 'rescheduling-of-interviews-for-admission-to-postgraduate-courses-session-july-2026-06-17-2026', 'admission'::announcement_category, NULL, '', '2026-06-17T09:00:00Z', '[]'::jsonb, NULL),
('Time Table for the Supplementary Examination of 1st Year MBBS Term-Back', 'time-table-for-the-supplementary-examination-of-1st-year-mbbs-term-back-06-17-2026', 'examination'::announcement_category, NULL, '', '2026-06-17T09:00:00Z', '[]'::jsonb, NULL),
('Postgraduate Entry Test for Session July - 2026', 'postgraduate-entry-test-for-session-july-2026-06-15-2026', 'admission'::announcement_category, NULL, '', '2026-06-15T09:00:00Z', '[]'::jsonb, NULL),
('Result of Final Professional MBBS, Final Year (Supplementary) Examination, Session 2020-2021', 'result-of-final-professional-mbbs-final-year-supplementary-examination-session-2020-2021-06-11-2026', 'examination'::announcement_category, NULL, '', '2026-06-11T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fourth Professional DPT, Eighth Semester Regular Examination Session 2020-2021', 'result-of-fourth-professional-dpt-eighth-semester-regular-examination-session-2020-2021-06-10-2026', 'examination'::announcement_category, NULL, '', '2026-06-10T09:00:00Z', '[]'::jsonb, NULL),
('SMBBMU PHD Policy', 'smbbmu-phd-policy-05-22-2026', 'circular'::announcement_category, 'Download', 'Download', '2026-05-22T09:00:00Z', '[{"name":"Phd Policy Of Smbbmu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/phd-policy-of-smbbmu-17796503530.pdf","size_kb":206}]'::jsonb, NULL),
('Admission for Certificate in Health Professions Education (C-HPE) Session 2026 Batch-09', 'admission-for-certificate-in-health-professions-education-c-hpe-session-2026-batch-09-05-21-2026', 'admission'::announcement_category, 'Application Form', 'Application Form', '2026-05-21T09:00:00Z', '[{"name":"Chpe Form New.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/chpe-form-new-17794278320.pdf","size_kb":494}]'::jsonb, NULL),
('Result of BS (POST-RN) Year-ll, Semester-IlI Regular Examination Session 2023-24', 'result-of-bs-post-rn-year-ll-semester-ili-regular-examination-session-2023-24-05-21-2026', 'examination'::announcement_category, NULL, '', '2026-05-21T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of 2nd Professional DPT 4th Semester Regular Examination Session(2023-24)', 'time-table-of-2nd-professional-dpt-4th-semester-regular-examination-session2023-24-05-21-2026', 'examination'::announcement_category, NULL, '', '2026-05-21T09:00:00Z', '[]'::jsonb, NULL),
('Time Table (Theory) BSN (Generic & Post-Rn) Year-I, Semester-II Regular Examination Session (2024-25)', 'time-table-theory-bsn-generic-post-rn-year-i-semester-ii-regular-examination-session-2024-25-05-21-2026', 'examination'::announcement_category, NULL, '', '2026-05-21T09:00:00Z', '[]'::jsonb, NULL),
('Time Table 1st, 2nd and 3rd Professional MBBS(Supplementary) Theory Examination of CMC, Larkana & GMMMC Sukkur', 'time-table-1st-2nd-and-3rd-professional-mbbssupplementary-theory-examination-of-cmc-larkana-gmmmc-sukkur-05-21-2026', 'examination'::announcement_category, NULL, '', '2026-05-21T09:00:00Z', '[]'::jsonb, NULL),
('Result of Final Professional Pharm-D, Final Year (Annual) Examination, Session 2019-2020 of Institute of Pharmacy, SMBBMU Larkana held in the month of February 2026', 'result-of-final-professional-pharm-d-final-year-annual-examination-session-2019-2020-of-institute-of-pharmacy-smbbmu-larkana-held-in-the-month-of-february-2026-05-19-2026', 'examination'::announcement_category, NULL, '', '2026-05-19T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fourth Professional MBBS, Fourth Year (Supplementary) Examination, Session 2021-2022 of Chandka Medical College Larkana and Gulam Muhammad Mahar Medical College Sukkur held in the month of April 2026', 'result-of-fourth-professional-mbbs-fourth-year-supplementary-examination-session-2021-2022-of-chandka-medical-college-larkana-and-gulam-muhammad-mahar-medical-college-sukkur-held-in-the-month-of-april-2026-05-14-2026', 'examination'::announcement_category, NULL, '', '2026-05-14T09:00:00Z', '[]'::jsonb, NULL),
('Admissions for Postgraduate Studies Session 2025-26', 'admissions-for-postgraduate-studies-session-2025-26-05-14-2026', 'admission'::announcement_category, NULL, '', '2026-05-14T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional MBBS, First Year (Modular) Examination, Session 2024-2025 of Chandka Medical College Larkana & Ghulam Muhammad Mahar Medical College Sukkur held in the month of January', 'result-of-first-professional-mbbs-first-year-modular-examination-session-2024-2025-of-chandka-medical-college-larkana-ghulam-muhammad-mahar-medical-college-sukkur-held-in-the-month-of-january-05-08-2026', 'examination'::announcement_category, 'Download Result', 'Download Result', '2026-05-08T09:00:00Z', '[{"name":"First Year Result.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/first-year-result-17782361810.pdf","size_kb":451}]'::jsonb, NULL),
('Notice of Final Year Supplementary Viva Examination scheduled to be held on 08-05-2026', 'notice-of-final-year-supplementary-viva-examination-scheduled-to-be-held-on-08-05-2026-05-07-2026', 'examination'::announcement_category, NULL, '', '2026-05-07T09:00:00Z', '[]'::jsonb, NULL),
('Declaration of withheld result of Third Year MBBS Annual Examination  Session 2022-23', 'declaration-of-withheld-result-of-third-year-mbbs-annual-examination-session-2022-23-05-05-2026', 'examination'::announcement_category, NULL, '', '2026-05-05T09:00:00Z', '[]'::jsonb, NULL),
('Declaration of withheld result of Second Year MBBS Annual Examination Session 2023-24', 'declaration-of-withheld-result-of-second-year-mbbs-annual-examination-session-2023-24-05-05-2026', 'examination'::announcement_category, NULL, '', '2026-05-05T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Examiners for Viva Voce Examination of Medicine for Supplementary Examination', 'notice-for-examiners-for-viva-voce-examination-of-medicine-for-supplementary-examination-05-04-2026', 'examination'::announcement_category, NULL, '', '2026-05-04T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN (Generic) Year III Semester VI Re-Sit Examination 2021–22', 'result-of-bsn-generic-year-iii-semester-vi-re-sit-examination-202122-05-04-2026', 'examination'::announcement_category, NULL, '', '2026-05-04T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Examiner for conducting Viva Voce Examinations for 5th Year Supplementary Examination.', 'notice-for-examiner-for-conducting-viva-voce-examinations-for-5th-year-supplementary-examination-05-04-2026', 'examination'::announcement_category, NULL, '', '2026-05-04T09:00:00Z', '[]'::jsonb, NULL),
('BADC Downloads', 'badc-downloads-05-01-2026', 'circular'::announcement_category, 'Programme Information File of MDS(OMFS) MDS Circulum', 'Programme Information File of MDS(OMFS)
MDS Circulum', '2026-05-01T09:00:00Z', '[{"name":"Pif.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/pif-17822958851.pdf","size_kb":5008},{"name":"Ciculum Mds.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ciculum-mds-17822958840.pdf","size_kb":1854}]'::jsonb, NULL),
('Timetable of 5th Professional MBBS (Supplementary) Viva Voce Examinations (Session 2020–21)', 'timetable-of-5th-professional-mbbs-supplementary-viva-voce-examinations-session-202021-04-27-2026', 'examination'::announcement_category, NULL, '', '2026-04-27T09:00:00Z', '[]'::jsonb, NULL),
('Result of M.Phil Physiology Thesis Defense Examination Session March-2026', 'result-of-mphil-physiology-thesis-defense-examination-session-march-2026-04-27-2026', 'examination'::announcement_category, NULL, '', '2026-04-27T09:00:00Z', '[]'::jsonb, NULL),
('Timetable of 4th Professional MBBS (Supplementary) Viva Voce Examinations (Session 2021–22)', 'timetable-of-4th-professional-mbbs-supplementary-viva-voce-examinations-session-202122-04-24-2026', 'examination'::announcement_category, NULL, '', '2026-04-24T09:00:00Z', '[]'::jsonb, NULL),
('Result of BS (GENERIC) Year-IV, Semester-VIlI Re-Sit Examination Session 2020-21', 'result-of-bs-generic-year-iv-semester-vili-re-sit-examination-session-2020-21-04-23-2026', 'examination'::announcement_category, NULL, '', '2026-04-23T09:00:00Z', '[]'::jsonb, NULL),
('Time Table (Theory) BSN (Generic) Year - IV, Semester - VII Regular Examination (Session 2021 - 22)', 'time-table-theory-bsn-generic-year-iv-semester-vii-regular-examination-session-2021-22-04-20-2026', 'examination'::announcement_category, NULL, '', '2026-04-20T09:00:00Z', '[]'::jsonb, NULL),
('Timetable (Theory): BSN (Generic) Year III Semester VI Re-Sit Examination (Session 2021–22)', 'timetable-theory-bsn-generic-year-iii-semester-vi-re-sit-examination-session-202122-04-14-2026', 'examination'::announcement_category, NULL, '', '2026-04-14T09:00:00Z', '[]'::jsonb, NULL),
('Result of 2nd Professional MBBS Examination', 'result-of-2nd-professional-mbbs-examination-04-13-2026', 'examination'::announcement_category, 'Page 2 Page 1', 'Page 2
Page 1', '2026-04-13T09:00:00Z', '[]'::jsonb, NULL),
('Result of Diploma of Dermatology (Clinical) Examination Session September 2025 held in the month of March 2026.', 'result-of-diploma-of-dermatology-clinical-examination-session-september-2025-held-in-the-month-of-march-2026-03-26-2026', 'examination'::announcement_category, NULL, '', '2026-03-26T09:00:00Z', '[]'::jsonb, NULL),
('Timetable of MS Surgery Mid-Term & Part-II Clinical Examinations Session September 2025', 'timetable-of-ms-surgery-mid-term-part-ii-clinical-examinations-session-september-2025-03-26-2026', 'examination'::announcement_category, NULL, '', '2026-03-26T09:00:00Z', '[]'::jsonb, NULL),
('Timetable of 1st Professional DPT 2nd Semester Examination Session 2024-25 of SMBBMU Larkana', 'timetable-of-1st-professional-dpt-2nd-semester-examination-session-2024-25-of-smbbmu-larkana-03-25-2026', 'examination'::announcement_category, NULL, '', '2026-03-25T09:00:00Z', '[]'::jsonb, NULL),
('Result of  Postgraduate Diploma Anasthesia (Viva Voce) Examination Session of September 2025 held in the month of March 2026.', 'result-of-postgraduate-diploma-anasthesia-viva-voce-examination-session-of-september-2025-held-in-the-month-of-march-2026-03-24-2026', 'examination'::announcement_category, NULL, '', '2026-03-24T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Diploma Entry Test Session January, 2026', 'result-of-postgraduate-diploma-entry-test-session-january-2026-03-19-2026', 'examination'::announcement_category, NULL, '', '2026-03-19T09:00:00Z', '[]'::jsonb, NULL),
('Circular for  Postgraduate Examinations of Session March-2026 in all Degree and Diploma courses.', 'circular-for-postgraduate-examinations-of-session-march-2026-in-all-degree-and-diploma-courses-03-16-2026', 'examination'::announcement_category, NULL, '', '2026-03-16T09:00:00Z', '[]'::jsonb, NULL),
('Strategic Plan of SMBBMU', 'strategic-plan-of-smbbmu-03-16-2026', 'circular'::announcement_category, 'Download', 'Download', '2026-03-16T09:00:00Z', '[{"name":"Strategic Plan Smbbmu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/strategic-plan-smbbmu-17736399250.pdf","size_kb":1755}]'::jsonb, NULL),
('Result of Final Professional MBBS, Final Year (Annual) Examination, Session 2020-2021 of Chandka Medical College Larkana, Ghulam Muhammad Mahar Medical College Sukkur and Gambat Medical College Gambat held in the month of December 2025', 'result-of-final-professional-mbbs-final-year-annual-examination-session-2020-2021-of-chandka-medical-college-larkana-ghulam-muhammad-mahar-medical-college-sukkur-and-gambat-medical-college-gambat-held-in-the-month-of-december-2025-03-04-2026', 'examination'::announcement_category, 'Result', 'Result', '2026-03-04T09:00:00Z', '[{"name":"Whatsapp Image 2026 03 04 At 11.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/whatsapp-image-2026-03-04-at-11-17726079350.pdf","size_kb":252}]'::jsonb, NULL),
('Time Table of 3rd Professional Pharm-D (Annual) Theory & OSPE Examinations (Session 2022 - 23) OF SMBBMU Larkana', 'time-table-of-3rd-professional-pharm-d-annual-theory-ospe-examinations-session-2022-23-of-smbbmu-larkana-03-03-2026', 'examination'::announcement_category, NULL, '', '2026-03-03T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of 3rd Professional Pharm-D (Supplementary) Theory Examination (Session 2021 - 22) Of SMBBMU LARKANA', 'time-table-of-3rd-professional-pharm-d-supplementary-theory-examination-session-2021-22-of-smbbmu-larkana-03-03-2026', 'examination'::announcement_category, NULL, '', '2026-03-03T09:00:00Z', '[]'::jsonb, NULL),
('Postgraduate Degree (Theory & Clinical) Examination September, 2025 held in the Month of January, 2026', 'postgraduate-degree-theory-clinical-examination-september-2025-held-in-the-month-of-january-2026-03-02-2026', 'examination'::announcement_category, NULL, '', '2026-03-02T09:00:00Z', '[]'::jsonb, NULL),
('Postgraduate Degree & Diploma (Theory & Viva Voce) Examination Session September 2025 held in the month of January & February 2026.', 'postgraduate-degree-diploma-theory-viva-voce-examination-session-september-2025-held-in-the-month-of-january-february-2026-03-02-2026', 'examination'::announcement_category, NULL, '', '2026-03-02T09:00:00Z', '[]'::jsonb, NULL),
('Timetable of 1ST Professional DPT 1st Semester Re-sit Examination (Sessions 2024 - 25) of SMBBMU Larkana', 'timetable-of-1st-professional-dpt-1st-semester-re-sit-examination-sessions-2024-25-of-smbbmu-larkana-03-02-2026', 'examination'::announcement_category, NULL, '', '2026-03-02T09:00:00Z', '[]'::jsonb, NULL),
('Time Table (Theory) BSN (Generic) Year-IV, Semester- VIII Re-sit Examination (Session 2020 - 21)', 'time-table-theory-bsn-generic-year-iv-semester-viii-re-sit-examination-session-2020-21-03-02-2026', 'examination'::announcement_category, NULL, '', '2026-03-02T09:00:00Z', '[]'::jsonb, NULL),
('SMBBMU Act', 'smbbmu-act-02-23-2026', 'circular'::announcement_category, 'SMBBMU Ammendment Act 2018 SMBBMU Act 2008', 'SMBBMU Ammendment Act 2018
SMBBMU Act 2008', '2026-02-23T09:00:00Z', '[{"name":"Amendment Act 2018.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/amendment-act-2018-17718304651.pdf","size_kb":2156},{"name":"Sindh Act 2008.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sindh-act-2008-17718304650.pdf","size_kb":86}]'::jsonb, NULL),
('Result of Postgraduate Degree & Diploma (Theory & Viva Voce) Examination Session September 2025 held in the month of January & February 2026.', 'result-of-postgraduate-degree-diploma-theory-viva-voce-examination-session-september-2025-held-in-the-month-of-january-february-2026-02-10-2026', 'examination'::announcement_category, NULL, '', '2026-02-10T09:00:00Z', '[]'::jsonb, NULL),
('Admisisons to Diploma Courses in Community Medicine & Public Health', 'admisisons-to-diploma-courses-in-community-medicine-public-health-02-07-2026', 'circular'::announcement_category, NULL, '', '2026-02-07T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree (Theory and Viva Voce) Examination September, 2025 held in the Month of January, 2026 and February, 2026.', 'result-of-postgraduate-degree-theory-and-viva-voce-examination-september-2025-held-in-the-month-of-january-2026-and-february-2026-02-06-2026', 'examination'::announcement_category, NULL, '', '2026-02-06T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of 1ST & 2ND Professional Pharm - D (Annual) Theory & OSPE Examinations (Session 2024 - 25 & 2023 - 24) OF SMBBMU Larkana', 'time-table-of-1st-2nd-professional-pharm-d-annual-theory-ospe-examinations-session-2024-25-2023-24-of-smbbmu-larkana-01-28-2026', 'examination'::announcement_category, NULL, '', '2026-01-28T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of 4th & 5th Professional Pharm - D (Annual) Theory & OSPE Examinations (Session 2020 - 21 & 2019 - 20) OF SMBBMU Larkana', 'time-table-of-4th-5th-professional-pharm-d-annual-theory-ospe-examinations-session-2020-21-2019-20-of-smbbmu-larkana-01-28-2026', 'examination'::announcement_category, NULL, '', '2026-01-28T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN (GENERIC) Year-IV, Semester-VII Re-Sit Examination Session of Affliated Colleges', 'result-of-bsn-generic-year-iv-semester-vii-re-sit-examination-session-of-affliated-colleges-01-19-2026', 'examination'::announcement_category, NULL, '', '2026-01-19T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Postgraduate Theory Examinations Session September 2025', 'notice-for-postgraduate-theory-examinations-session-september-2025-01-12-2026', 'examination'::announcement_category, NULL, '', '2026-01-12T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional Pharm-D, Third Year (Annual) Examination, Session 2021-2022 of Institute of Pharmacy, SMBBMU Larkana, held in the month of September 2025', 'result-of-third-professional-pharm-d-third-year-annual-examination-session-2021-2022-of-institute-of-pharmacy-smbbmu-larkana-held-in-the-month-of-september-2025-01-12-2026', 'examination'::announcement_category, NULL, '', '2026-01-12T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional DPT, First Semester Regular Examination Session 2024-2025', 'result-of-first-professional-dpt-first-semester-regular-examination-session-2024-2025-01-12-2026', 'examination'::announcement_category, NULL, '', '2026-01-12T09:00:00Z', '[]'::jsonb, NULL),
('REVISED TIMETABLE OF BSN (GENERIC) YEAR - III, SEMESTER - V REGULAR EXAMINATION (SESSION 2022 - 23)', 'revised-timetable-of-bsn-generic-year-iii-semester-v-regular-examination-session-2022-23-01-12-2026', 'examination'::announcement_category, NULL, '', '2026-01-12T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of 1st 2nd and 3rd Professional MBBS Annual Examination', 'time-table-of-1st-2nd-and-3rd-professional-mbbs-annual-examination-01-12-2026', 'examination'::announcement_category, NULL, '', '2026-01-12T09:00:00Z', '[]'::jsonb, NULL),
('Application Form and Affidavit for Hostel Allotment', 'application-form-and-affidavit-for-hostel-allotment-01-12-2026', 'circular'::announcement_category, 'Allotment Form Affidavit', 'Allotment Form
Affidavit', '2026-01-12T09:00:00Z', '[{"name":"Allotment Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/allotment-form-17682000391.pdf","size_kb":431},{"name":"Affidavit 2025.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/affidavit-2025-17682000390.pdf","size_kb":415}]'::jsonb, NULL),
('Notice Inviting Tender Provie & Suppy Printing Material, Office Stationary & IT Equipment for Examinations Department, SMBB Medical University Larkana', 'notice-inviting-tender-provie-suppy-printing-material-office-stationary-it-equipment-for-examinations-department-smbb-medical-university-larkana-12-29-2025', 'tender'::announcement_category, 'Tender Document', 'Tender Document', '2025-12-29T09:00:00Z', '[{"name":"Sbds Of Examination Department.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sbds-of-examination-department-17670406620.pdf","size_kb":5026}]'::jsonb, NULL),
('Provide & Supply of Furniture & Fixture for Central/Digital  Library Under The Project Title “Establishment of Centre for  Advanced Research in Molecular, Genetic & Allied Facilitates  at Shaheed Mohtarma Benazir Bhutto Medical University,  Larkana.', 'provide-supply-of-furniture-fixture-for-centraldigital-library-under-the-project-title-establishment-of-centre-for-advanced-research-in-molecular-genetic-allied-facilitates-at-shaheed-mohtarma-benazir-bhutto-medical-university-larkana-12-22-2025', 'tender'::announcement_category, 'Tender Documents', 'Tender Documents', '2025-12-22T09:00:00Z', '[{"name":"Doc 20251222 Wa0009.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/doc-20251222-wa0009-17666089340.pdf","size_kb":665}]'::jsonb, NULL),
('Interview Postponement Notice for PG Courses (January 2026 Session)', 'interview-postponement-notice-for-pg-courses-january-2026-session-12-16-2025', 'job'::announcement_category, NULL, '', '2025-12-16T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of 2nd Professional DPT 3rd Semester Regular Examination', 'time-table-of-2nd-professional-dpt-3rd-semester-regular-examination-12-13-2025', 'examination'::announcement_category, NULL, '', '2025-12-13T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of 3rd Professional DPT 6th Semester Regular Examination', 'time-table-of-3rd-professional-dpt-6th-semester-regular-examination-12-13-2025', 'examination'::announcement_category, NULL, '', '2025-12-13T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of 3rd Professional DPT 5th Semester Regular Examination', 'time-table-of-3rd-professional-dpt-5th-semester-regular-examination-12-13-2025', 'examination'::announcement_category, NULL, '', '2025-12-13T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Quotations for Demolition and Debris Removal Works at Chandka Medical College Larkana.', 'notice-for-quotations-for-demolition-and-debris-removal-works-at-chandka-medical-college-larkana-12-12-2025', 'tender'::announcement_category, NULL, '', '2025-12-12T09:00:00Z', '[]'::jsonb, NULL),
('Timet Table of 1st, 2nd and 3rd Professional MBBS Examination', 'timet-table-of-1st-2nd-and-3rd-professional-mbbs-examination-12-11-2025', 'examination'::announcement_category, NULL, '', '2025-12-11T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Entry Tests for Session January -2026', 'result-of-postgraduate-entry-tests-for-session-january-2026-12-11-2025', 'examination'::announcement_category, 'Download Result', 'Download Result', '2025-12-11T09:00:00Z', '[{"name":"Camscanner 11 12 2025 12.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/camscanner-11-12-2025-12-17654409590.pdf","size_kb":19331}]'::jsonb, NULL),
('Result of Second Professional DPT, Fourth Semester Re-Sit Examination Session 2022-2023', 'result-of-second-professional-dpt-fourth-semester-re-sit-examination-session-2022-2023-12-04-2025', 'examination'::announcement_category, NULL, '', '2025-12-04T09:00:00Z', '[]'::jsonb, NULL),
('Result OF BSN (GENERIC) YEAR-I, Semster-I| Re-Sit Examinaion Session 2023-24', 'result-of-bsn-generic-year-i-semster-i-re-sit-examinaion-session-2023-24-12-04-2025', 'examination'::announcement_category, NULL, '', '2025-12-04T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN (POST-RN) Year-I, Semester-ll Re-Sit Examination Session 2023-24', 'result-of-bsn-post-rn-year-i-semester-ll-re-sit-examination-session-2023-24-12-04-2025', 'examination'::announcement_category, NULL, '', '2025-12-04T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Services for Convocation 2025 @ SMBB Medical University Larkana', 'notice-inviting-tender-for-services-for-convocation-2025-smbb-medical-university-larkana-11-28-2025', 'tender'::announcement_category, 'Technical Documents Financial Documents NIT', 'Technical Documents
Financial Documents
NIT', '2025-11-28T09:00:00Z', '[{"name":"Sbds Technical.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sbds-technical-17643233792.pdf","size_kb":3342},{"name":"Sbds Financial.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sbds-financial-17643233791.pdf","size_kb":2029},{"name":"Nit.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-17643233790.pdf","size_kb":138}]'::jsonb, NULL),
('Admisison to MPhil Anatomy Session January 2026', 'admisison-to-mphil-anatomy-session-january-2026-11-28-2025', 'circular'::announcement_category, NULL, '', '2025-11-28T09:00:00Z', '[]'::jsonb, NULL),
('Timetable Theory BSN(Generic & PostRN) Year-II Semester-III Regular Examination (Session 2023-24)', 'timetable-theory-bsngeneric-postrn-year-ii-semester-iii-regular-examination-session-2023-24-11-24-2025', 'examination'::announcement_category, NULL, '', '2025-11-24T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Basic Life Support (BLS) & Advanced Cardiovascular Life Support (ACLS) Workshop American Heart Association (AHA) Certified', 'notice-for-basic-life-support-bls-advanced-cardiovascular-life-support-acls-workshop-american-heart-association-aha-certified-11-20-2025', 'circular'::announcement_category, NULL, '', '2025-11-20T09:00:00Z', '[]'::jsonb, NULL),
('Notice for prohibition of New Tobbaco Products in Educational Institutes across Sindh', 'notice-for-prohibition-of-new-tobbaco-products-in-educational-institutes-across-sindh-11-19-2025', 'circular'::announcement_category, NULL, '', '2025-11-19T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Anti-Harrasment Inquiry Committee of SMBBMU, Larkana', 'notice-for-anti-harrasment-inquiry-committee-of-smbbmu-larkana-11-19-2025', 'circular'::announcement_category, NULL, '', '2025-11-19T09:00:00Z', '[]'::jsonb, NULL),
('Admission for Certificate in Health Professions Education(C-HPE) Session 2026', 'admission-for-certificate-in-health-professions-educationc-hpe-session-2026-11-17-2025', 'admission'::announcement_category, 'Application Form', 'Application Form', '2025-11-17T09:00:00Z', '[{"name":"Chpe Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/chpe-form-17633702060.pdf","size_kb":494}]'::jsonb, NULL),
('Result of Postgraduate Diploma Examination(Theory & Clinical) March, 2025 held in the month of November 2025', 'result-of-postgraduate-diploma-examinationtheory-clinical-march-2025-held-in-the-month-of-november-2025-11-12-2025', 'examination'::announcement_category, NULL, '', '2025-11-12T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate MPhil Program(Thesis Defense) Examination September, 2025 held in the month of November 2025', 'result-of-postgraduate-mphil-programthesis-defense-examination-september-2025-held-in-the-month-of-november-2025-11-12-2025', 'examination'::announcement_category, NULL, '', '2025-11-12T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Provide & Supply Office Stationary, Petty Articles & other Miscellanous Items for SMBB Medical University, Larkana', 'notice-inviting-tender-for-provide-supply-office-stationary-petty-articles-other-miscellanous-items-for-smbb-medical-university-larkana-11-11-2025', 'tender'::announcement_category, 'NIT & Tender Document', 'NIT & Tender Document', '2025-11-11T09:00:00Z', '[{"name":"Sbds Nit.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sbds-nit-17629319580.pdf","size_kb":6695}]'::jsonb, NULL),
('Notice to Affiliated Colleges Regarding Admission Announcement', 'notice-to-affiliated-colleges-regarding-admission-announcement-11-11-2025', 'admission'::announcement_category, NULL, '', '2025-11-11T09:00:00Z', '[]'::jsonb, NULL),
('Result of 5th Professional DPT, Tenth Semester Regular Examination Session 2019-20', 'result-of-5th-professional-dpt-tenth-semester-regular-examination-session-2019-20-11-10-2025', 'examination'::announcement_category, NULL, '', '2025-11-10T09:00:00Z', '[]'::jsonb, NULL),
('Timetable of 4th & 5th Professional MBBS Regular Examination', 'timetable-of-4th-5th-professional-mbbs-regular-examination-11-06-2025', 'examination'::announcement_category, NULL, '', '2025-11-06T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender Provide & Supply of Fixture Furniture for Central/Digital Library Under the project Title Establishment of Center for Advance Research in Molecular, Genetic & Allied Facilities at SMBB Medical Unviersity Larkana', 'notice-inviting-tender-provide-supply-of-fixture-furniture-for-centraldigital-library-under-the-project-title-establishment-of-center-for-advance-research-in-molecular-genetic-allied-facilities-at-smbb-medical-unviersity-larkana-11-05-2025', 'tender'::announcement_category, 'NIT & Tender Document', 'NIT & Tender Document', '2025-11-05T09:00:00Z', '[{"name":"Sbds Nit.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sbds-nit-17627722060.pdf","size_kb":11693}]'::jsonb, NULL),
('Admission in Postgraduate Courses for the Session January 2026', 'admission-in-postgraduate-courses-for-the-session-january-2026-10-28-2025', 'admission'::announcement_category, NULL, '', '2025-10-28T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Remaining work Central Masjid at (Arija)', 'notice-inviting-tender-for-remaining-work-central-masjid-at-arija-10-22-2025', 'tender'::announcement_category, NULL, '', '2025-10-22T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree & Diploma Examination Session March-2025', 'result-of-postgraduate-degree-diploma-examination-session-march-2025-10-01-2025', 'examination'::announcement_category, NULL, '', '2025-10-01T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Supply & Installation of OPG-CBCT Digital  X-Ray Machine for SMBB Medical  University Larkana', 'notice-inviting-tender-for-supply-installation-of-opg-cbct-digital-x-ray-machine-for-smbb-medical-university-larkana-09-30-2025', 'tender'::announcement_category, 'Tender Document NIT', 'Tender Document
NIT', '2025-09-30T09:00:00Z', '[{"name":"Sbds Of Opg X Ray Machine.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sbds-of-opg-x-ray-machine-17592533801.pdf","size_kb":687},{"name":"Nit 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-1-17592533800.pdf","size_kb":142}]'::jsonb, NULL),
('Notice for the students to apply for Freeship Scholarship 2025-26', 'notice-for-the-students-to-apply-for-freeship-scholarship-2025-26-09-18-2025', 'circular'::announcement_category, 'To Apply online please click here https://forms.gle/fttTM9G7Ca2XknyX6', 'To Apply online please click here
https://forms.gle/fttTM9G7Ca2XknyX6', '2025-09-18T09:00:00Z', '[]'::jsonb, NULL),
('Timetable for 1st Professional DPT 2nd Semester Re-Sit Examination', 'timetable-for-1st-professional-dpt-2nd-semester-re-sit-examination-09-09-2025', 'examination'::announcement_category, NULL, '', '2025-09-09T09:00:00Z', '[]'::jsonb, NULL),
('Timetable for 5th Professional DPT 9th Semester Re-Sit Examination', 'timetable-for-5th-professional-dpt-9th-semester-re-sit-examination-09-09-2025', 'examination'::announcement_category, NULL, '', '2025-09-09T09:00:00Z', '[]'::jsonb, NULL),
('Timetable for BSN Year-III Semester - V  Re-Sit Examination', 'timetable-for-bsn-year-iii-semester-v-re-sit-examination-09-09-2025', 'examination'::announcement_category, 'Timetable at GMMMC Campus Timetable at Arija Campus', 'Timetable at GMMMC Campus
Timetable at Arija Campus', '2025-09-09T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Examination Session March-2025 held in the month of August-2025', 'result-of-postgraduate-examination-session-march-2025-held-in-the-month-of-august-2025-09-08-2025', 'examination'::announcement_category, NULL, '', '2025-09-08T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN(POST-RN) Year-II Semester -IV Regular Examination Session 2022-23', 'result-of-bsnpost-rn-year-ii-semester-iv-regular-examination-session-2022-23-09-04-2025', 'examination'::announcement_category, NULL, '', '2025-09-04T09:00:00Z', '[]'::jsonb, NULL),
('Timetable of 1st, 2nd, 3rd & 4th Professional BDS Supplementary (Theory & OSPE / OSCE ) Examination', 'timetable-of-1st-2nd-3rd-4th-professional-bds-supplementary-theory-ospe-osce-examination-09-03-2025', 'examination'::announcement_category, NULL, '', '2025-09-03T09:00:00Z', '[]'::jsonb, NULL),
('List of Students Penalized Rs.50,000 for Installing ACs in Hostel Rooms', 'list-of-students-penalized-rs50000-for-installing-acs-in-hostel-rooms-09-02-2025', 'circular'::announcement_category, 'List', 'List', '2025-09-02T09:00:00Z', '[{"name":"Hostels Rules Violation Penalty.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/hostels-rules-violation-penalty-17568172700.pdf","size_kb":6121}]'::jsonb, NULL),
('Result of 4th Professional BDS Examination Session 2020-21 of Bibi Aseefa Dental College, held in the month of July 2025', 'result-of-4th-professional-bds-examination-session-2020-21-of-bibi-aseefa-dental-college-held-in-the-month-of-july-2025-08-27-2025', 'examination'::announcement_category, NULL, '', '2025-08-27T09:00:00Z', '[]'::jsonb, NULL),
('Circular for 14th Annual Sports Week', 'circular-for-14th-annual-sports-week-08-25-2025', 'circular'::announcement_category, NULL, '', '2025-08-25T09:00:00Z', '[]'::jsonb, NULL),
('Extension of Date for Submission of PhD Physiology Application Forms Session July , 2025', 'extension-of-date-for-submission-of-phd-physiology-application-forms-session-july-2025-08-14-2025', 'circular'::announcement_category, NULL, '', '2025-08-14T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional Examination (Supplementary) Session 2021-22', 'result-of-third-professional-examination-supplementary-session-2021-22-08-06-2025', 'examination'::announcement_category, NULL, '', '2025-08-06T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fourth Professional Examination (Supplementary) Session 2020-21', 'result-of-fourth-professional-examination-supplementary-session-2020-21-08-06-2025', 'examination'::announcement_category, NULL, '', '2025-08-06T09:00:00Z', '[]'::jsonb, NULL),
('Result of 1st Year BDS Annual Examination Session 2023-24', 'result-of-1st-year-bds-annual-examination-session-2023-24-08-05-2025', 'examination'::announcement_category, NULL, '', '2025-08-05T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional BDS Examination Session 2022-23', 'result-of-second-professional-bds-examination-session-2022-23-08-05-2025', 'examination'::announcement_category, NULL, '', '2025-08-05T09:00:00Z', '[]'::jsonb, NULL),
('Admissions are open for PHD in Physiology', 'admissions-are-open-for-phd-in-physiology-07-31-2025', 'admission'::announcement_category, NULL, '', '2025-07-31T09:00:00Z', '[]'::jsonb, NULL),
('Result of Diploma Entry Test and MD/MS Part-I Examinations Session July-2025', 'result-of-diploma-entry-test-and-mdms-part-i-examinations-session-july-2025-07-10-2025', 'examination'::announcement_category, 'Download Result', 'Download Result', '2025-07-10T09:00:00Z', '[{"name":"Result Md Ms Part I Examinations.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-md-ms-part-i-examinations-17521356300.pdf","size_kb":1386}]'::jsonb, NULL),
('Result of Third Professional BDS Annual Examination Session 2021-22', 'result-of-third-professional-bds-annual-examination-session-2021-22-07-02-2025', 'examination'::announcement_category, NULL, '', '2025-07-02T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN (POST-RN) Year-II Semester-II Re-sit Examination Session 2022-23', 'result-of-bsn-post-rn-year-ii-semester-ii-re-sit-examination-session-2022-23-07-02-2025', 'examination'::announcement_category, NULL, '', '2025-07-02T09:00:00Z', '[]'::jsonb, NULL),
('Timetable of Postgraduate Entry Test & Part-I Examination Session July - 2025', 'timetable-of-postgraduate-entry-test-part-i-examination-session-july-2025-06-26-2025', 'examination'::announcement_category, NULL, '', '2025-06-26T09:00:00Z', '[]'::jsonb, NULL),
('Result of Final Year MBBS Supplementary Examination for Session 2019-2020 held in the month of May 2025', 'result-of-final-year-mbbs-supplementary-examination-for-session-2019-2020-held-in-the-month-of-may-2025-06-18-2025', 'examination'::announcement_category, NULL, '', '2025-06-18T09:00:00Z', '[]'::jsonb, NULL),
('Sindh Educational Endowment Fund Trust Scholarship', 'sindh-educational-endowment-fund-trust-scholarship-06-12-2025', 'circular'::announcement_category, 'Notice', 'Notice', '2025-06-12T09:00:00Z', '[{"name":"Letter And Notice Sindh Endowment Seef Year 2024 2025.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/letter-and-notice-sindh-endowment-seef-year-2024-2025-17497285950.pdf","size_kb":775}]'::jsonb, NULL),
('Result of First Professional Pharm-D Annual Examination Session 2023-24', 'result-of-first-professional-pharm-d-annual-examination-session-2023-24-06-11-2025', 'examination'::announcement_category, NULL, '', '2025-06-11T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional Pharm-D Annual Examination Session 2022-23', 'result-of-second-professional-pharm-d-annual-examination-session-2022-23-06-11-2025', 'examination'::announcement_category, NULL, '', '2025-06-11T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN(Generic) Year-III, Semester VI Re-Sit Examination Session 2020-21', 'result-of-bsngeneric-year-iii-semester-vi-re-sit-examination-session-2020-21-06-11-2025', 'examination'::announcement_category, NULL, '', '2025-06-11T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Anti-Plagiarism Policy of HEC', 'notice-for-anti-plagiarism-policy-of-hec-06-11-2025', 'circular'::announcement_category, NULL, '', '2025-06-11T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Development & Implementation of Customized Modules for ERP System', 'notice-inviting-tender-for-development-implementation-of-customized-modules-for-erp-system-06-05-2025', 'tender'::announcement_category, 'Technical Documents NIT', 'Technical Documents
NIT', '2025-06-05T09:00:00Z', '[{"name":"Tender Document Technical.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/tender-document-technical-17496268250.pdf","size_kb":894},{"name":"Nit Erp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-erp-17496265270.pdf","size_kb":403}]'::jsonb, NULL),
('Corrigendum for the Admission to Postgraduate Courses for Session July-2025', 'corrigendum-for-the-admission-to-postgraduate-courses-for-session-july-2025-06-05-2025', 'admission'::announcement_category, NULL, '', '2025-06-05T09:00:00Z', '[]'::jsonb, NULL)
on conflict (slug) do update set title=excluded.title, category=excluded.category, excerpt=excluded.excerpt, body=excluded.body, published_at=excluded.published_at, attachments=excluded.attachments, photo_url=excluded.photo_url;

-- 03_announcements_01.sql
insert into announcements (title, slug, category, excerpt, body, published_at, attachments, photo_url) values
('Timetable of 1st Professional MBBS(Supplementary) Theory & OSPE Examiation', 'timetable-of-1st-professional-mbbssupplementary-theory-ospe-examiation-06-02-2025', 'examination'::announcement_category, NULL, '', '2025-06-02T09:00:00Z', '[]'::jsonb, NULL),
('Revised Timetable of 2nd & 4th Professional MBBS (Supplementary) Examinations', 'revised-timetable-of-2nd-4th-professional-mbbs-supplementary-examinations-06-02-2025', 'examination'::announcement_category, NULL, '', '2025-06-02T09:00:00Z', '[]'::jsonb, NULL),
('Renewal of Ehsas Undergraduate Scholarship Program', 'renewal-of-ehsas-undergraduate-scholarship-program-05-27-2025', 'circular'::announcement_category, NULL, '', '2025-05-27T09:00:00Z', '[]'::jsonb, NULL),
('Admission to Postgraduate Courses for the Session July-2025', 'admission-to-postgraduate-courses-for-the-session-july-2025-05-25-2025', 'admission'::announcement_category, NULL, '', '2025-05-25T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree &  Diploma (Theory & Viva Voce) Examinations Session September-2024 held in the month of May-2025', 'result-of-postgraduate-degree-diploma-theory-viva-voce-examinations-session-september-2024-held-in-the-month-of-may-2025-05-22-2025', 'examination'::announcement_category, NULL, '', '2025-05-22T09:00:00Z', '[]'::jsonb, NULL),
('Quotation for supply of Medical Books for the FY - 2024-25', 'quotation-for-supply-of-medical-books-for-the-fy-2024-25-05-21-2025', 'tender'::announcement_category, 'Central Library Arija Books List of BADC Books List of Physiotherapy Books List of Central Library Books List of GMMMC Books List of CMC Books', 'Central Library Arija Books
List of BADC Books
List of Physiotherapy Books
List of Central Library Books
List of GMMMC Books
List of CMC Books', '2025-05-21T09:00:00Z', '[{"name":"Central Library Arija Books.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/central-library-arija-books-17483417920.pdf","size_kb":389},{"name":"List Of Books Badc.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/list-of-books-badc-17479836820.pdf","size_kb":67},{"name":"Institute Of Phsiothrapy Quot Aug 2023 013106.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/institute-of-phsiothrapy-quot-aug-2023-013106-17478967034.pdf","size_kb":161},{"name":"List Of Books For Central Library.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/list-of-books-for-central-library-17478967032.pdf","size_kb":15552},{"name":"List Of Books From Gmmmc Sukkur.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/list-of-books-from-gmmmc-sukkur-17478967031.pdf","size_kb":414},{"name":"Chandaka Medical Colleg Books Req.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/chandaka-medical-colleg-books-req-17478967030.pdf","size_kb":148}]'::jsonb, NULL),
('Result of Postgraduate Degree & Diploma(Clinical / Theory) Examination Session Sept-2024 held in the month of May 2025', 'result-of-postgraduate-degree-diplomaclinical-theory-examination-session-sept-2024-held-in-the-month-of-may-2025-05-20-2025', 'examination'::announcement_category, NULL, '', '2025-05-20T09:00:00Z', '[]'::jsonb, NULL),
('Re-totaling of Marks on Applications forwarded by students of CMC', 're-totaling-of-marks-on-applications-forwarded-by-students-of-cmc-05-20-2025', 'circular'::announcement_category, NULL, '', '2025-05-20T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Postponement of Supplementary Examination of  2nd & 4th Year of MBBS', 'notice-for-postponement-of-supplementary-examination-of-2nd-4th-year-of-mbbs-05-19-2025', 'examination'::announcement_category, NULL, '', '2025-05-19T09:00:00Z', '[]'::jsonb, NULL),
('Re-totaling of Marks on Applications forwarded by students of CMC & GMMMC', 're-totaling-of-marks-on-applications-forwarded-by-students-of-cmc-gmmmc-05-19-2025', 'examination'::announcement_category, NULL, '', '2025-05-19T09:00:00Z', '[]'::jsonb, NULL),
('Declaration of Withheld result of 2nd & 4th Year of MBBS', 'declaration-of-withheld-result-of-2nd-4th-year-of-mbbs-05-19-2025', 'examination'::announcement_category, NULL, '', '2025-05-19T09:00:00Z', '[]'::jsonb, NULL),
('Admission for Certificate in Health Professions Education (C-HPE) Session 2025 Batch-07', 'admission-for-certificate-in-health-professions-education-c-hpe-session-2025-batch-07-05-19-2025', 'admission'::announcement_category, 'Application Form', 'Application Form', '2025-05-19T09:00:00Z', '[{"name":"Chpe Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/chpe-form-17480011360.pdf","size_kb":494}]'::jsonb, NULL),
('Hostel Allotment List for Academic Year 2025', 'hostel-allotment-list-for-academic-year-2025-05-17-2025', 'circular'::announcement_category, 'Boys Hostel No. 07 Boys Hostel No. 06 Boys Hostel No. 05', 'Boys Hostel No. 07
Boys Hostel No. 06
Boys Hostel No. 05', '2025-05-17T09:00:00Z', '[]'::jsonb, NULL),
('Result of Final Professional Pharm-D Examination for Session 2018-19', 'result-of-final-professional-pharm-d-examination-for-session-2018-19-05-16-2025', 'examination'::announcement_category, NULL, '', '2025-05-16T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional DPT, Third Semester Re-Sit Examination Session 2022-23', 'result-of-second-professional-dpt-third-semester-re-sit-examination-session-2022-23-05-15-2025', 'examination'::announcement_category, NULL, '', '2025-05-15T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional DPT, Fourth Semester Re-Sit Examination Session 2023-24', 'result-of-second-professional-dpt-fourth-semester-re-sit-examination-session-2023-24-05-14-2025', 'examination'::announcement_category, NULL, '', '2025-05-14T09:00:00Z', '[]'::jsonb, NULL),
('Postgraduate Theory Examination Session March - 2025', 'postgraduate-theory-examination-session-march-2025-05-14-2025', 'examination'::announcement_category, NULL, '', '2025-05-14T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Theory & Diploma Examination Session Sept-2024', 'result-of-postgraduate-theory-diploma-examination-session-sept-2024-05-13-2025', 'examination'::announcement_category, NULL, '', '2025-05-13T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional DPT, Sixth Semester Re-Sit Examination Session 2020-21', 'result-of-third-professional-dpt-sixth-semester-re-sit-examination-session-2020-21-05-09-2025', 'examination'::announcement_category, NULL, '', '2025-05-09T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fourth Professional DPT, Eighth Semester Re-Sit Examination Session 2019-20', 'result-of-fourth-professional-dpt-eighth-semester-re-sit-examination-session-2019-20-05-09-2025', 'examination'::announcement_category, NULL, '', '2025-05-09T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Provide & Supply of Air Conditioners for SMBB Medical University, Larkana', 'notice-inviting-tender-for-provide-supply-of-air-conditioners-for-smbb-medical-university-larkana-04-30-2025', 'tender'::announcement_category, 'NIT & Documents', 'NIT & Documents', '2025-04-30T09:00:00Z', '[{"name":"Sbds Nit.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sbds-nit-17460093690.pdf","size_kb":5193}]'::jsonb, NULL),
('Withheld Result of the candidates of 4th Year', 'withheld-result-of-the-candidates-of-4th-year-04-25-2025', 'examination'::announcement_category, NULL, '', '2025-04-25T09:00:00Z', '[]'::jsonb, NULL),
('Timetable of 2nd & 3rd Professional BDS Annual (Theory & OSPE / OSCE) Examination (Session 2022 - 23 & 2021 - 22) OF SMBBMU@ BADC Larkana Centre', 'timetable-of-2nd-3rd-professional-bds-annual-theory-ospe-osce-examination-session-2022-23-2021-22-of-smbbmu-badc-larkana-centre-04-25-2025', 'examination'::announcement_category, NULL, '', '2025-04-25T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of 1st  Professional DPT 2nd Semester Regular Examination Session 2023-24', 'time-table-of-1st-professional-dpt-2nd-semester-regular-examination-session-2023-24-04-25-2025', 'examination'::announcement_category, NULL, '', '2025-04-25T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fourth Professional MBBS, Fourth Year (Annual) Examination, Session 2020-2021', 'result-of-fourth-professional-mbbs-fourth-year-annual-examination-session-2020-2021-04-24-2025', 'examination'::announcement_category, 'Page - II Page - I', 'Page - II
Page - I', '2025-04-24T09:00:00Z', '[]'::jsonb, NULL),
('Result of MD Internal Medicine Part-ll', 'result-of-md-internal-medicine-part-ll-04-24-2025', 'examination'::announcement_category, NULL, '', '2025-04-24T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Provide & Supply of Office Stationary & other Miscellaneous Items for SMBB Medical University, Larkana', 'notice-inviting-tender-for-provide-supply-of-office-stationary-other-miscellaneous-items-for-smbb-medical-university-larkana-04-23-2025', 'tender'::announcement_category, 'NIT & Documents', 'NIT & Documents', '2025-04-23T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Postponement of M.Phil Biochemistry Viva Voce Examinations Scheduled for 24th April 2025', 'notice-for-postponement-of-mphil-biochemistry-viva-voce-examinations-scheduled-for-24th-april-2025-04-23-2025', 'examination'::announcement_category, NULL, '', '2025-04-23T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional DPT, First Semester Re-Sit Examination Session 2023-2024', 'result-of-first-professional-dpt-first-semester-re-sit-examination-session-2023-2024-04-23-2025', 'examination'::announcement_category, NULL, '', '2025-04-23T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN (GENERIC) Year-III, Semester-VI Regular Examination Session 2020-21', 'result-of-bsn-generic-year-iii-semester-vi-regular-examination-session-2020-21-04-22-2025', 'examination'::announcement_category, 'Page - II Page - I', 'Page - II
Page - I', '2025-04-22T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional MBBS, Third Year (Annual) Examination, Session 2021-2022 of Chandka Medical College Larkana, Ghulam Muhammad Mahar Medical College Sukkur and Gambat Medical College Gambat held in the month of January 2025', 'result-of-third-professional-mbbs-third-year-annual-examination-session-2021-2022-of-chandka-medical-college-larkana-ghulam-muhammad-mahar-medical-college-sukkur-and-gambat-medical-college-gambat-held-in-the-month-of-january-2025-04-18-2025', 'examination'::announcement_category, 'Page - 2 Page - 1', 'Page - 2
Page - 1', '2025-04-18T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN (Generic) Year-II, Semester-III Regular Examination Session 2022-23', 'result-of-bsn-generic-year-ii-semester-iii-regular-examination-session-2022-23-04-17-2025', 'examination'::announcement_category, 'Page-II Page-I', 'Page-II
Page-I', '2025-04-17T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree and Diploma (Theory) Examinations Session September-2024 held in the month of March- 2024', 'result-of-postgraduate-degree-and-diploma-theory-examinations-session-september-2024-held-in-the-month-of-march-2024-04-16-2025', 'examination'::announcement_category, NULL, '', '2025-04-16T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN(Generic) Year-II, Semester-IV Re-Sit Examination, Session 2021-22', 'result-of-bsngeneric-year-ii-semester-iv-re-sit-examination-session-2021-22-04-15-2025', 'examination'::announcement_category, NULL, '', '2025-04-15T09:00:00Z', '[]'::jsonb, NULL),
('Time Table for 1st Professional BDS Annual(Theory & OSPE) Examination Session 2023-24', 'time-table-for-1st-professional-bds-annualtheory-ospe-examination-session-2023-24-04-15-2025', 'examination'::announcement_category, NULL, '', '2025-04-15T09:00:00Z', '[]'::jsonb, NULL),
('Time Table for BSN Generic Year-III Semester -V Examination', 'time-table-for-bsn-generic-year-iii-semester-v-examination-04-15-2025', 'examination'::announcement_category, 'Nova Institute, Islamabad @ Illahi Bux Institute, SBA @ Sindhu Institute, Khairpur @ GMMMC, Sukkur @ SMBBMU Arija Campus', 'Nova Institute, Islamabad
@ Illahi Bux Institute, SBA
@ Sindhu Institute, Khairpur
@ GMMMC, Sukkur
@ SMBBMU Arija Campus', '2025-04-15T09:00:00Z', '[]'::jsonb, NULL),
('Declaration of Withheld Result of Final Professional MBBS, Final Year (Annual) Examination, Session 2019-2020', 'declaration-of-withheld-result-of-final-professional-mbbs-final-year-annual-examination-session-2019-2020-04-14-2025', 'examination'::announcement_category, NULL, '', '2025-04-14T09:00:00Z', '[]'::jsonb, NULL),
('Time Table for MPHIL Microbiology Thesis Defence Examination Session September - 2024', 'time-table-for-mphil-microbiology-thesis-defence-examination-session-september-2024-04-14-2025', 'examination'::announcement_category, NULL, '', '2025-04-14T09:00:00Z', '[]'::jsonb, NULL),
('Declaration of Withheld Result of Final Professional MBBS, Final Year (Annual) Examination, Session 2019-2020', 'declaration-of-withheld-result-of-final-professional-mbbs-final-year-annual-examination-session-2019-2020-04-10-2025', 'examination'::announcement_category, NULL, '', '2025-04-10T09:00:00Z', '[]'::jsonb, NULL),
('Declaration of Withheld Result of Final Professional MBBS, Final Year (Annual) Examination, Session 2019-2020', 'declaration-of-withheld-result-of-final-professional-mbbs-final-year-annual-examination-session-2019-2020-04-09-2025', 'examination'::announcement_category, NULL, '', '2025-04-09T09:00:00Z', '[]'::jsonb, NULL),
('Result of Final Professional MBBS, Final Year (Annual) Examination, Session 2019-2020', 'result-of-final-professional-mbbs-final-year-annual-examination-session-2019-2020-04-05-2025', 'examination'::announcement_category, 'Download Result', 'Download Result', '2025-04-05T09:00:00Z', '[{"name":"Final Year Mbbs 2025.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/final-year-mbbs-2025-17438550620.pdf","size_kb":340}]'::jsonb, NULL),
('Result of BSN (GENERIC) Year-IV Semester-VIII Regular Examination Session 2019-20 of Benazir College of Nursing, SMBBMU Larkana, held in the month of February, 2025', 'result-of-bsn-generic-year-iv-semester-viii-regular-examination-session-2019-20-of-benazir-college-of-nursing-smbbmu-larkana-held-in-the-month-of-february-2025-03-26-2025', 'examination'::announcement_category, NULL, '', '2025-03-26T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Meeting of Institutional Review Board', 'notice-for-meeting-of-institutional-review-board-03-24-2025', 'circular'::announcement_category, NULL, '', '2025-03-24T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Postgraduate Theory Examination', 'notice-for-postgraduate-theory-examination-03-21-2025', 'examination'::announcement_category, NULL, '', '2025-03-21T09:00:00Z', '[]'::jsonb, NULL),
('Academic Calendar - 2025', 'academic-calendar-2025-03-19-2025', 'circular'::announcement_category, 'PHARM-D DPT MBBS', 'PHARM-D
DPT
MBBS', '2025-03-19T09:00:00Z', '[{"name":"Academic Calendar Pharm D.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/academic-calendar-pharm-d-17423257762.pdf","size_kb":267},{"name":"Academic Calendar Dpt.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/academic-calendar-dpt-17423257761.pdf","size_kb":1514},{"name":"Academic Calendar Mbbs.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/academic-calendar-mbbs-17423257760.pdf","size_kb":68}]'::jsonb, NULL),
('Time Table for Postgraduate Theory Examination September 2024', 'time-table-for-postgraduate-theory-examination-september-2024-03-18-2025', 'examination'::announcement_category, 'View Time Table', 'View Time Table', '2025-03-18T09:00:00Z', '[{"name":"Time Table Septmber 2024.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-septmber-2024-17423255570.pdf","size_kb":460}]'::jsonb, NULL),
('Time Table of Diploma in Medical Jurisprudence (DMJ) PART-II', 'time-table-of-diploma-in-medical-jurisprudence-dmj-part-ii-03-18-2025', 'examination'::announcement_category, NULL, '', '2025-03-18T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional DPT, Sixth Semester Regular Examination Session 2020-21', 'result-of-third-professional-dpt-sixth-semester-regular-examination-session-2020-21-03-06-2025', 'examination'::announcement_category, NULL, '', '2025-03-06T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Provide & Supply of Office Stationary for Examination Department, SMBB Medical University Larkana', 'notice-inviting-tender-for-provide-supply-of-office-stationary-for-examination-department-smbb-medical-university-larkana-03-03-2025', 'tender'::announcement_category, 'Tender Documents NIT', 'Tender Documents
NIT', '2025-03-03T09:00:00Z', '[{"name":"Final Tender Document Exam.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/final-tender-document-exam-17418025241.pdf","size_kb":637}]'::jsonb, NULL),
('Guidelines for Submitting Leave Requests at SMBBMU Larkana', 'guidelines-for-submitting-leave-requests-at-smbbmu-larkana-02-28-2025', 'circular'::announcement_category, 'Non-Teaching Faculty Procedure for Ex-Pakistan Leave Teaching Faculty Procedure for Ex-Pakistan Leave', 'Non-Teaching Faculty Procedure for Ex-Pakistan Leave
Teaching Faculty Procedure for Ex-Pakistan Leave', '2025-02-28T09:00:00Z', '[{"name":"Ex Pakistan For Non Teaching.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ex-pakistan-for-non-teaching-17408103541.pdf","size_kb":371},{"name":"Ex Pakistan For Teaching.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ex-pakistan-for-teaching-17408103540.pdf","size_kb":422}]'::jsonb, NULL),
('Result of Fourth Professional DPT, Eighth Semester Regular Examination Session 2019-220', 'result-of-fourth-professional-dpt-eighth-semester-regular-examination-session-2019-220-02-27-2025', 'examination'::announcement_category, NULL, '', '2025-02-27T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional DPT, Third Semester Regular Examination Session 2022-23', 'result-of-second-professional-dpt-third-semester-regular-examination-session-2022-23-02-27-2025', 'examination'::announcement_category, NULL, '', '2025-02-27T09:00:00Z', '[]'::jsonb, NULL),
('Timetable for Postgraduate Degree Theory Examination Session September-2024', 'timetable-for-postgraduate-degree-theory-examination-session-september-2024-02-24-2025', 'examination'::announcement_category, 'View Timetable', 'View Timetable', '2025-02-24T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN(Generic) Year-I, Semester-I Regular Examination Session 2023-24', 'result-of-bsngeneric-year-i-semester-i-regular-examination-session-2023-24-02-24-2025', 'examination'::announcement_category, 'Page - II Page - I', 'Page - II
Page - I', '2025-02-24T09:00:00Z', '[]'::jsonb, NULL),
('Circular for Postgraduate Theory Examinations of Session September-2024', 'circular-for-postgraduate-theory-examinations-of-session-september-2024-01-16-2025', 'examination'::announcement_category, NULL, '', '2025-01-16T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional DPT, First Semester Regular Examination Session 2023-2024', 'result-of-first-professional-dpt-first-semester-regular-examination-session-2023-2024-01-09-2025', 'examination'::announcement_category, NULL, '', '2025-01-09T09:00:00Z', '[]'::jsonb, NULL),
('Result of MS Gynaecology & Obsterics PART-II Session March-2024 held in the month of January,', 'result-of-ms-gynaecology-obsterics-part-ii-session-march-2024-held-in-the-month-of-january-01-06-2025', 'examination'::announcement_category, NULL, '', '2025-01-06T09:00:00Z', '[]'::jsonb, NULL),
('Result of Diploma in Dermatology Examinations Session March 2024 held in the month of October 2024', 'result-of-diploma-in-dermatology-examinations-session-march-2024-held-in-the-month-of-october-2024-01-06-2025', 'examination'::announcement_category, NULL, '', '2025-01-06T09:00:00Z', '[]'::jsonb, NULL),
('Result of MD Internal Medicine Part-ll Examinations Session March 2024 held in the month of October 2024.', 'result-of-md-internal-medicine-part-ll-examinations-session-march-2024-held-in-the-month-of-october-2024-01-06-2025', 'examination'::announcement_category, NULL, '', '2025-01-06T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree and Diploma (Clinical) Examinations Session March-2024 held in the month of December, 2024', 'result-of-postgraduate-degree-and-diploma-clinical-examinations-session-march-2024-held-in-the-month-of-december-2024-12-31-2024', 'examination'::announcement_category, NULL, '', '2024-12-31T09:00:00Z', '[]'::jsonb, NULL),
('Result of  MS General Surgery Part-I Examinations Session  March 2024 held in the month of October 2024', 'result-of-ms-general-surgery-part-i-examinations-session-march-2024-held-in-the-month-of-october-2024-12-26-2024', 'examination'::announcement_category, NULL, '', '2024-12-26T09:00:00Z', '[]'::jsonb, NULL),
('Corrigendum for Expression of Interest  for hiring of an individual consultant on short term basis as Finance Consultant', 'corrigendum-for-expression-of-interest-for-hiring-of-an-individual-consultant-on-short-term-basis-as-finance-consultant-12-24-2024', 'tender'::announcement_category, NULL, '', '2024-12-24T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN (Post-RN) Year - II Semester- IV Regular Examination Session 2021-22', 'result-of-bsn-post-rn-year-ii-semester-iv-regular-examination-session-2021-22-12-11-2024', 'examination'::announcement_category, NULL, '', '2024-12-11T09:00:00Z', '[]'::jsonb, NULL),
('Result of Part-I(MD/MS), Entry Test(PHD,MPHIL,MSPH,MSN) and Induction of Training Merit Test FCPS-II Session January 2025', 'result-of-part-imdms-entry-testphdmphilmsphmsn-and-induction-of-training-merit-test-fcps-ii-session-january-2025-12-10-2024', 'examination'::announcement_category, 'Download Result', 'Download Result', '2024-12-10T09:00:00Z', '[{"name":"Result Md Ms Ph.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-md-ms-ph-17338283440.pdf","size_kb":4262}]'::jsonb, NULL),
('Expression of Interest (EOI) for Hiring of An Individual consultant of short term basis as Finance Consultant', 'expression-of-interest-eoi-for-hiring-of-an-individual-consultant-of-short-term-basis-as-finance-consultant-12-10-2024', 'circular'::announcement_category, 'Download Document', 'Download Document', '2024-12-10T09:00:00Z', '[{"name":"Eoi Document Smbbmu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/eoi-document-smbbmu-17338295750.pdf","size_kb":320}]'::jsonb, NULL),
('Notice Inviting Tender to Provide & Supply of Printing Material, Office Stationary Items and IT Equipments/Machinery for Examinations Department, SMBB Medical University Larkana', 'notice-inviting-tender-to-provide-supply-of-printing-material-office-stationary-items-and-it-equipmentsmachinery-for-examinations-department-smbb-medical-university-larkana-12-09-2024', 'tender'::announcement_category, 'Tender Document NIT', 'Tender Document
NIT', '2024-12-09T09:00:00Z', '[{"name":"Tender Document Exam.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/tender-document-exam-17338293031.pdf","size_kb":4392},{"name":"Nit Newpapers.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-newpapers-17338293030.pdf","size_kb":592}]'::jsonb, NULL),
('Result of Postgraduate Degree and Diploma Theory Examinations Session March-2024', 'result-of-postgraduate-degree-and-diploma-theory-examinations-session-march-2024-11-29-2024', 'examination'::announcement_category, NULL, '', '2024-11-29T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree & Diploma(Theory) Examinations Session March-2024 held in the month of September-2024', 'result-of-postgraduate-degree-diplomatheory-examinations-session-march-2024-held-in-the-month-of-september-2024-11-18-2024', 'examination'::announcement_category, NULL, '', '2024-11-18T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Diploma Examination (Thesis Defence) held in the month of November 2024', 'result-of-postgraduate-diploma-examination-thesis-defence-held-in-the-month-of-november-2024-11-18-2024', 'examination'::announcement_category, NULL, '', '2024-11-18T09:00:00Z', '[]'::jsonb, NULL),
('Admission for Certificate in Health Professions Education(C-HPE) Session 2025 Batch-06', 'admission-for-certificate-in-health-professions-educationc-hpe-session-2025-batch-06-11-04-2024', 'admission'::announcement_category, 'Application Form', 'Application Form', '2024-11-04T09:00:00Z', '[{"name":"Chpe Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/chpe-form-17307923770.pdf","size_kb":516}]'::jsonb, NULL),
('Admissions for Postgraduate Courses for Session January 2025', 'admissions-for-postgraduate-courses-for-session-january-2025-10-31-2024', 'admission'::announcement_category, 'MSPH Eligibility Criteria MSN Eligibility Criteria', 'MSPH Eligibility Criteria
MSN Eligibility Criteria', '2024-10-31T09:00:00Z', '[{"name":"Eligiblity Msph.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/eligiblity-msph-17304838310.pdf","size_kb":5},{"name":"Master In Nursing Msn.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/master-in-nursing-msn-17304428440.pdf","size_kb":86}]'::jsonb, NULL),
('Result of Fourth Professional DPT, Seventh Semester Re-Sit Examination Session 2019-2020 of Institute of Physiotherapy & Rehabilitation Sciences (IPRS), SMBBMU Larkana, held in the month of October 2024', 'result-of-fourth-professional-dpt-seventh-semester-re-sit-examination-session-2019-2020-of-institute-of-physiotherapy-rehabilitation-sciences-iprs-smbbmu-larkana-held-in-the-month-of-october-2024-10-29-2024', 'examination'::announcement_category, NULL, '', '2024-10-29T09:00:00Z', '[]'::jsonb, NULL),
('Date Extended Notification of Postgraduate Examination', 'date-extended-notification-of-postgraduate-examination-10-28-2024', 'examination'::announcement_category, NULL, '', '2024-10-28T09:00:00Z', '[]'::jsonb, NULL),
('Timetable for Postgraduate Degree/Diploma Theory Examination, March, 2024', 'timetable-for-postgraduate-degreediploma-theory-examination-march-2024-10-18-2024', 'examination'::announcement_category, 'View Timetable', 'View Timetable', '2024-10-18T09:00:00Z', '[{"name":"Time Table Pg.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-pg-17292597920.pdf","size_kb":616}]'::jsonb, NULL),
('Result of BSN(Generic) Year-IV Semester-VII Regular Examination Session 2019 of Benazir College of Nursing Larkana', 'result-of-bsngeneric-year-iv-semester-vii-regular-examination-session-2019-of-benazir-college-of-nursing-larkana-10-17-2024', 'examination'::announcement_category, NULL, '', '2024-10-17T09:00:00Z', '[]'::jsonb, NULL),
('Result of Final Professional BDS, Final Year(Supplementary) Examination, Session 2019-20 of Bibi Aseefa Dental College, Larkana, held in the month of September 2024', 'result-of-final-professional-bds-final-yearsupplementary-examination-session-2019-20-of-bibi-aseefa-dental-college-larkana-held-in-the-month-of-september-2024-10-17-2024', 'examination'::announcement_category, NULL, '', '2024-10-17T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Construction of External Development work of Central/Digital Library & Central Masjid of Establishment of Centre for Advanced Research in Molecular, Genetic and Allied Facilities, at SMBB Medical University, Larkana', 'notice-inviting-tender-for-construction-of-external-development-work-of-centraldigital-library-central-masjid-of-establishment-of-centre-for-advanced-research-in-molecular-genetic-and-allied-facilities-at-smbb-medical-university-larkana-10-14-2024', 'tender'::announcement_category, 'Tender Documents NIT', 'Tender Documents
NIT', '2024-10-14T09:00:00Z', '[{"name":"Bidding Docs Digital Library.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bidding-docs-digital-library-17288941101.pdf","size_kb":2591},{"name":"Nit Digital Library.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-digital-library-17288941100.pdf","size_kb":594}]'::jsonb, NULL),
('Notice Inviting Tender for Provide & Supply of Air Conditioners & Other Miscellaneous Items for SMBB Medical University, Larkana', 'notice-inviting-tender-for-provide-supply-of-air-conditioners-other-miscellaneous-items-for-smbb-medical-university-larkana-10-14-2024', 'tender'::announcement_category, 'NIT Bidding Documents', 'NIT
Bidding Documents', '2024-10-14T09:00:00Z', '[{"name":"Nit.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-17289767010.pdf","size_kb":274},{"name":"Tender Documents Electric.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/tender-documents-electric-17289702000.pdf","size_kb":686}]'::jsonb, NULL),
('Result of MS General Surgery Mid-term Postgraduate Degree (Clinical) Examination Session September 2023 held in September, 2024.', 'result-of-ms-general-surgery-mid-term-postgraduate-degree-clinical-examination-session-september-2023-held-in-september-2024-09-30-2024', 'examination'::announcement_category, NULL, '', '2024-09-30T09:00:00Z', '[]'::jsonb, NULL),
('Result of  BSN (GENERIC) YEAR-I, SEMESTER-II REGULAR EXAMINATION SESSION 2022-23', 'result-of-bsn-generic-year-i-semester-ii-regular-examination-session-2022-23-09-30-2024', 'examination'::announcement_category, 'Page - 2 Page - 1', 'Page - 2
Page - 1', '2024-09-30T09:00:00Z', '[]'::jsonb, NULL),
('Result of  MS General Surgery Part-ll Postgraduate Degree (Clinical) Examination Session March 2023 held in September, 2024.', 'result-of-ms-general-surgery-part-ll-postgraduate-degree-clinical-examination-session-march-2023-held-in-september-2024-09-30-2024', 'examination'::announcement_category, NULL, '', '2024-09-30T09:00:00Z', '[]'::jsonb, NULL),
('Result of  Postgraduate M.Phil programs (Theory and Practical) Examinations March, 2024 held in the month of July, 2024.', 'result-of-postgraduate-mphil-programs-theory-and-practical-examinations-march-2024-held-in-the-month-of-july-2024-09-27-2024', 'examination'::announcement_category, NULL, '', '2024-09-27T09:00:00Z', '[]'::jsonb, NULL),
('Time Table for M.Phil Microbiology Part-I and M.PHIL Physiology Viva Examination', 'time-table-for-mphil-microbiology-part-i-and-mphil-physiology-viva-examination-09-19-2024', 'examination'::announcement_category, NULL, '', '2024-09-19T09:00:00Z', '[]'::jsonb, NULL),
('Circular for Postgraduate Examinations of M.Phil Programs in Biochemistry, Physiology & Pharmacology for the Session September, 2024', 'circular-for-postgraduate-examinations-of-mphil-programs-in-biochemistry-physiology-pharmacology-for-the-session-september-2024-09-19-2024', 'examination'::announcement_category, NULL, '', '2024-09-19T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional BDS, Second Year (Supplementary) Examination, Session 2021-2022 of Bibi Aseefa Dental College, Larkana Held in the month of August 2024', 'result-of-second-professional-bds-second-year-supplementary-examination-session-2021-2022-of-bibi-aseefa-dental-college-larkana-held-in-the-month-of-august-2024-09-12-2024', 'examination'::announcement_category, NULL, '', '2024-09-12T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional DPT, Second Semester Regular Examination Session 2022-2023', 'result-of-first-professional-dpt-second-semester-regular-examination-session-2022-2023-09-10-2024', 'examination'::announcement_category, NULL, '', '2024-09-10T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fourth Professional Pharm-D, Fourth Year (Supplementary) Examination, Session 2018-2019 of Institute of Pharmacy, SMBBMU Larkana, held in the month of August 2024', 'result-of-fourth-professional-pharm-d-fourth-year-supplementary-examination-session-2018-2019-of-institute-of-pharmacy-smbbmu-larkana-held-in-the-month-of-august-2024-09-05-2024', 'examination'::announcement_category, NULL, '', '2024-09-05T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional Pharm-D, Third Year (Supplementary) Examination, Session 2019-2020 of Institute of Pharmacy, SMBBMU Larkana, held in the month of August 2024', 'result-of-third-professional-pharm-d-third-year-supplementary-examination-session-2019-2020-of-institute-of-pharmacy-smbbmu-larkana-held-in-the-month-of-august-2024-09-05-2024', 'examination'::announcement_category, NULL, '', '2024-09-05T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional Pharm-D, Second Year (Supplementary) Examination, Session 2020-2021 of Institute of Pharmacy, SMBBMU Larkana, held in the month of August 2024', 'result-of-second-professional-pharm-d-second-year-supplementary-examination-session-2020-2021-of-institute-of-pharmacy-smbbmu-larkana-held-in-the-month-of-august-2024-09-05-2024', 'examination'::announcement_category, NULL, '', '2024-09-05T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional DPT, Fifth Semester Regular Examination Session 2020-2021', 'result-of-third-professional-dpt-fifth-semester-regular-examination-session-2020-2021-09-02-2024', 'examination'::announcement_category, NULL, '', '2024-09-02T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional DPT, Third Semester Regular Examination Session 2020-2021', 'result-of-second-professional-dpt-third-semester-regular-examination-session-2020-2021-08-30-2024', 'examination'::announcement_category, NULL, '', '2024-08-30T09:00:00Z', '[]'::jsonb, NULL),
('Result of MS Ophthalmology Part-II and Diploma in Ophthalmology', 'result-of-ms-ophthalmology-part-ii-and-diploma-in-ophthalmology-08-26-2024', 'examination'::announcement_category, NULL, '', '2024-08-26T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional BDS, First Year (Supplementary) Examination, Session 2022-2023 of Bibi  Aseefa Dental College, Larkana. Held in the month of July 2024', 'result-of-first-professional-bds-first-year-supplementary-examination-session-2022-2023-of-bibi-aseefa-dental-college-larkana-held-in-the-month-of-july-2024-08-23-2024', 'examination'::announcement_category, NULL, '', '2024-08-23T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fourth Professional DPT, Seventh Semester Regular Examination Session 2019-2020 of Institute of Physiotherapy & Rehabilitation Sciences (IPRS), SMBBMU Larkana, held in the month of June 2024', 'result-of-fourth-professional-dpt-seventh-semester-regular-examination-session-2019-2020-of-institute-of-physiotherapy-rehabilitation-sciences-iprs-smbbmu-larkana-held-in-the-month-of-june-2024-08-23-2024', 'examination'::announcement_category, NULL, '', '2024-08-23T09:00:00Z', '[]'::jsonb, NULL),
('Result of Diploma in Medical Radio-Diagnosis Part-I and Part-II (Practical & VIVA) held in the month of August-2024', 'result-of-diploma-in-medical-radio-diagnosis-part-i-and-part-ii-practical-viva-held-in-the-month-of-august-2024-08-22-2024', 'examination'::announcement_category, NULL, '', '2024-08-22T09:00:00Z', '[]'::jsonb, NULL),
('Date Extended Notification of Postgraduate Examination', 'date-extended-notification-of-postgraduate-examination-08-22-2024', 'examination'::announcement_category, NULL, '', '2024-08-22T09:00:00Z', '[]'::jsonb, NULL),
('Result of Diploma in Medical Jurisprudence (DMJ) Part-l', 'result-of-diploma-in-medical-jurisprudence-dmj-part-l-08-19-2024', 'examination'::announcement_category, NULL, '', '2024-08-19T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Diploma (Theory) Examination September 2023 held in the month of May, 2024.', 'result-of-postgraduate-diploma-theory-examination-september-2023-held-in-the-month-of-may-2024-08-17-2024', 'examination'::announcement_category, NULL, '', '2024-08-17T09:00:00Z', '[]'::jsonb, NULL),
('Result of MS and DGO  Gynaecology & Obsterics Clinical Examination', 'result-of-ms-and-dgo-gynaecology-obsterics-clinical-examination-08-17-2024', 'examination'::announcement_category, NULL, '', '2024-08-17T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of MPHIL Biochemistry 1st Semester Viva Examination Session March - 2024', 'time-table-of-mphil-biochemistry-1st-semester-viva-examination-session-march-2024-08-17-2024', 'examination'::announcement_category, NULL, '', '2024-08-17T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of MS Part-II & Diploma in Ophthalmology Clinical Examinations September , 2023', 'time-table-of-ms-part-ii-diploma-in-ophthalmology-clinical-examinations-september-2023-08-17-2024', 'examination'::announcement_category, NULL, '', '2024-08-17T09:00:00Z', '[]'::jsonb, NULL),
('Time Table MS Gynaecology and Obsterics Part-II and DGO Clinical Examination - Session September 2023', 'time-table-ms-gynaecology-and-obsterics-part-ii-and-dgo-clinical-examination-session-september-2023-07-31-2024', 'examination'::announcement_category, NULL, '', '2024-07-31T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional Pharm-D (Annual) Examination Session 2022-2023 of Institute of Pharmacy, SMBBMU Larkana Held in the month of June 2024', 'result-of-first-professional-pharm-d-annual-examination-session-2022-2023-of-institute-of-pharmacy-smbbmu-larkana-held-in-the-month-of-june-2024-07-30-2024', 'examination'::announcement_category, NULL, '', '2024-07-30T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree (Clinical) Examinations September, 2023 held in the month of July, 2024', 'result-of-postgraduate-degree-clinical-examinations-september-2023-held-in-the-month-of-july-2024-07-29-2024', 'examination'::announcement_category, NULL, '', '2024-07-29T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third, Fourth and Final Year MBBS (Supplementary) Examination of Gambat Medical College, Gambat', 'result-of-third-fourth-and-final-year-mbbs-supplementary-examination-of-gambat-medical-college-gambat-07-29-2024', 'examination'::announcement_category, 'Final Year Fourth Year Third Year', 'Final Year
Fourth Year
Third Year', '2024-07-29T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Sindh Educational Endowment Fund Program 2024-25', 'notice-for-sindh-educational-endowment-fund-program-2024-25-07-24-2024', 'circular'::announcement_category, NULL, '', '2024-07-24T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Need-Cum-Merit Scholarships under Zakat and Usher Department, Govt of Sindh', 'notice-for-need-cum-merit-scholarships-under-zakat-and-usher-department-govt-of-sindh-07-24-2024', 'circular'::announcement_category, 'Required Documents Istehqaq Certificate Application Form', 'Required Documents
Istehqaq Certificate
Application Form', '2024-07-24T09:00:00Z', '[{"name":"Zakat Required Documents.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/zakat-required-documents-17218075272.pdf","size_kb":229},{"name":"Istehqaq Certificate.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/istehqaq-certificate-17218075271.pdf","size_kb":163},{"name":"Zakat Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/zakat-form-17218075260.pdf","size_kb":563}]'::jsonb, NULL),
('Notice for SANA(Sindhi Association of North America) Scholarship Program', 'notice-for-sanasindhi-association-of-north-america-scholarship-program-07-24-2024', 'circular'::announcement_category, 'Application Form', 'Application Form', '2024-07-24T09:00:00Z', '[{"name":"Application Form Sana.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/application-form-sana-17218078650.pdf","size_kb":432}]'::jsonb, NULL),
('Results of Supplementary Examination of (First , Second , Third , Fourth and Final Year of  MBBS', 'results-of-supplementary-examination-of-first-second-third-fourth-and-final-year-of-mbbs-07-22-2024', 'examination'::announcement_category, 'Final Professional Fourth Professional Third Professional Second Professional First Professional', 'Final Professional
Fourth Professional
Third Professional
Second Professional
First Professional', '2024-07-22T09:00:00Z', '[]'::jsonb, NULL),
('Schedule of Clinical Examination of MD Cardiology Part-II Clinical Examination Session September 2023', 'schedule-of-clinical-examination-of-md-cardiology-part-ii-clinical-examination-session-september-2023-07-22-2024', 'examination'::announcement_category, NULL, '', '2024-07-22T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree and Diploma (Theory) Examinations September, 2023 held in the month of May, 2024.', 'result-of-postgraduate-degree-and-diploma-theory-examinations-september-2023-held-in-the-month-of-may-2024-07-09-2024', 'examination'::announcement_category, NULL, '', '2024-07-09T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of M.PHIL Semester-I Theory Examinations  Session March 2024', 'time-table-of-mphil-semester-i-theory-examinations-session-march-2024-07-08-2024', 'examination'::announcement_category, NULL, '', '2024-07-08T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Interview Calls for FCPS -II (Medicine) Candidates', 'notice-for-interview-calls-for-fcps-ii-medicine-candidates-07-03-2024', 'job'::announcement_category, NULL, '', '2024-07-03T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Interview Calls for FCPS -II (Gynae. Obst:) Candidates', 'notice-for-interview-calls-for-fcps-ii-gynae-obst-candidates-07-03-2024', 'job'::announcement_category, NULL, '', '2024-07-03T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree and Diploma (Theory) Examinations September, 2023 held in the month of May, 2024', 'result-of-postgraduate-degree-and-diploma-theory-examinations-september-2023-held-in-the-month-of-may-2024-06-28-2024', 'examination'::announcement_category, NULL, '', '2024-06-28T09:00:00Z', '[]'::jsonb, NULL),
('Result of Entry Tests of M.PHIL, Diploma, MD & MS PART-I Session July 2024', 'result-of-entry-tests-of-mphil-diploma-md-ms-part-i-session-july-2024-06-28-2024', 'examination'::announcement_category, 'Result of MPhil / Diploma Result of MD/MS', 'Result of MPhil / Diploma
Result of MD/MS', '2024-06-28T09:00:00Z', '[{"name":"Result Mphil Diploma.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-mphil-diploma-17195694521.pdf","size_kb":1258},{"name":"Result Md Ms.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-md-ms-17195694520.pdf","size_kb":1264}]'::jsonb, NULL),
('Call for Abstract for 2nd Undergraduate Research Conference 2024', 'call-for-abstract-for-2nd-undergraduate-research-conference-2024-06-19-2024', 'circular'::announcement_category, NULL, '', '2024-06-19T09:00:00Z', '[]'::jsonb, NULL),
('Result of Entry Test FCPS-II July 2024', 'result-of-entry-test-fcps-ii-july-2024-06-14-2024', 'examination'::announcement_category, 'Download Result', 'Download Result', '2024-06-14T09:00:00Z', '[{"name":"Result Fcps 2.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-fcps-2-17183805540.pdf","size_kb":2397}]'::jsonb, NULL),
('Result of Postgraduate Degree and Diploma (Theory) Examinations September, 2023 held in the month of May, 2024.', 'result-of-postgraduate-degree-and-diploma-theory-examinations-september-2023-held-in-the-month-of-may-2024-06-14-2024', 'examination'::announcement_category, NULL, '', '2024-06-14T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree (Theory) Examinations September, 2023 held in the month of May, 2024.', 'result-of-postgraduate-degree-theory-examinations-september-2023-held-in-the-month-of-may-2024-06-11-2024', 'examination'::announcement_category, NULL, '', '2024-06-11T09:00:00Z', '[]'::jsonb, NULL)
on conflict (slug) do update set title=excluded.title, category=excluded.category, excerpt=excluded.excerpt, body=excluded.body, published_at=excluded.published_at, attachments=excluded.attachments, photo_url=excluded.photo_url;

-- 03_announcements_02.sql
insert into announcements (title, slug, category, excerpt, body, published_at, attachments, photo_url) values
('Timetable for Postgraduate Entry Tests for FCPS-II Programs Session July 2024', 'timetable-for-postgraduate-entry-tests-for-fcps-ii-programs-session-july-2024-06-11-2024', 'examination'::announcement_category, NULL, '', '2024-06-11T09:00:00Z', '[]'::jsonb, NULL),
('4™H PROFESSIONAL MBBS (SUPPLEMENTARY) THEORY & SPE / OSCE EXAMINATIONS', '4h-professional-mbbs-supplementary-theory-spe-osce-examinations-05-30-2024', 'examination'::announcement_category, NULL, '', '2024-05-30T09:00:00Z', '[]'::jsonb, NULL),
('Result of BS (GENERIC) Year-II, Semester-IV Regular Examination Session 2020-21', 'result-of-bs-generic-year-ii-semester-iv-regular-examination-session-2020-21-05-27-2024', 'examination'::announcement_category, 'Page - II Page - I', 'Page - II
Page - I', '2024-05-27T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional BDS, First Year (Annual) Examination, Session 2022-2023 of Bibi Aseofa Dental College, Larkana. Held in the month of March 2024', 'result-of-first-professional-bds-first-year-annual-examination-session-2022-2023-of-bibi-aseofa-dental-college-larkana-held-in-the-month-of-march-2024-05-24-2024', 'examination'::announcement_category, NULL, '', '2024-05-24T09:00:00Z', '[]'::jsonb, NULL),
('Circular for Postgraduate Examinations of Session March, 2024 for M.Phil Physiology programs.', 'circular-for-postgraduate-examinations-of-session-march-2024-for-mphil-physiology-programs-05-24-2024', 'examination'::announcement_category, NULL, '', '2024-05-24T09:00:00Z', '[]'::jsonb, NULL),
('Webinar on US Clinical Rotations for the students of SMBB Medical University Larkana', 'webinar-on-us-clinical-rotations-for-the-students-of-smbb-medical-university-larkana-05-24-2024', 'circular'::announcement_category, NULL, '', '2024-05-24T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN (POST-RN) Year-Il, Semester-IV Regular Examination Session', 'result-of-bsn-post-rn-year-il-semester-iv-regular-examination-session-05-22-2024', 'examination'::announcement_category, NULL, '', '2024-05-22T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional Pharm-D, Third Year (Annual) Examination, Session 2019-2020 of Institute of Pharmacy, SMBBMU Larkana, held in the month of March 2024', 'result-of-third-professional-pharm-d-third-year-annual-examination-session-2019-2020-of-institute-of-pharmacy-smbbmu-larkana-held-in-the-month-of-march-2024-05-21-2024', 'examination'::announcement_category, NULL, '', '2024-05-21T09:00:00Z', '[]'::jsonb, NULL),
('Annual Reports', 'annual-reports-05-21-2024', 'circular'::announcement_category, 'Annual Report 2023-24 Annual Report 2024-25 Annual Report 2023', 'Annual Report 2023-24
Annual Report 2024-25
Annual Report 2023', '2024-05-21T09:00:00Z', '[{"name":"Annual Report 2023 24.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-report-2023-24-17822370580.pdf","size_kb":11652},{"name":"Annual Report 2024 25.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-report-2024-25-17579302060.pdf","size_kb":10950},{"name":"Annual Report 2023.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-report-2023-17497274680.pdf","size_kb":15828}]'::jsonb, NULL),
('Result of Second Professional Pharm-D, Second Year (Annual) Examination, Session 2020-2021 of Institute of Pharmacy, SMBBMU Larkana, held in the month of March', 'result-of-second-professional-pharm-d-second-year-annual-examination-session-2020-2021-of-institute-of-pharmacy-smbbmu-larkana-held-in-the-month-of-march-05-20-2024', 'examination'::announcement_category, NULL, '', '2024-05-20T09:00:00Z', '[]'::jsonb, NULL),
('Postgraduate Examinations of Session March, 2024 for M.Phil Biochemistry and M.Phil Pharmacology programs.', 'postgraduate-examinations-of-session-march-2024-for-mphil-biochemistry-and-mphil-pharmacology-programs-05-16-2024', 'examination'::announcement_category, NULL, '', '2024-05-16T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fourth Professional MBBS, Fourth Year (Annual) Examination, Session 2019-2020', 'result-of-fourth-professional-mbbs-fourth-year-annual-examination-session-2019-2020-05-16-2024', 'examination'::announcement_category, 'Page - 2 Page - 1', 'Page - 2
Page - 1', '2024-05-16T09:00:00Z', '[]'::jsonb, NULL),
('Admissions for Postgraduate Courses for Session July 2024', 'admissions-for-postgraduate-courses-for-session-july-2024-05-15-2024', 'admission'::announcement_category, NULL, '', '2024-05-15T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional DPT, Second Semester Re-Sit Examination Session 2021-2022', 'result-of-first-professional-dpt-second-semester-re-sit-examination-session-2021-2022-05-11-2024', 'examination'::announcement_category, NULL, '', '2024-05-11T09:00:00Z', '[]'::jsonb, NULL),
('Rosult of First Professional DPT, First Semester Re-Sit Examination Session 2022-2023', 'rosult-of-first-professional-dpt-first-semester-re-sit-examination-session-2022-2023-05-11-2024', 'examination'::announcement_category, NULL, '', '2024-05-11T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fourth Professional Pharm-D, Fourth Year (Annual) Examination, Session 2018-2019 of Institute of Pharmacy, SMBBMU Larkana Held in the month of March 2024', 'result-of-fourth-professional-pharm-d-fourth-year-annual-examination-session-2018-2019-of-institute-of-pharmacy-smbbmu-larkana-held-in-the-month-of-march-2024-05-10-2024', 'examination'::announcement_category, NULL, '', '2024-05-10T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional MBBS, First Year (Annual) Examination, Session 2022-2023 of Chandka Medical College Larkana & Ghulam Muhammad Mahar Medical College Sukkur held in the month of December 2023', 'result-of-first-professional-mbbs-first-year-annual-examination-session-2022-2023-of-chandka-medical-college-larkana-ghulam-muhammad-mahar-medical-college-sukkur-held-in-the-month-of-december-2023-05-10-2024', 'examination'::announcement_category, 'Page-2 Page-1', 'Page-2
Page-1', '2024-05-10T09:00:00Z', '[]'::jsonb, NULL),
('Admission for Certification in Health Professions Education (C-HPE) Session 2024 Batch-05', 'admission-for-certification-in-health-professions-education-c-hpe-session-2024-batch-05-05-03-2024', 'admission'::announcement_category, 'Application Form', 'Application Form', '2024-05-03T09:00:00Z', '[{"name":"Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/form-17147199670.pdf","size_kb":161}]'::jsonb, NULL),
('Result of Final Professional MBBS, Final Year (Annual) Examination, Session 2018-2019 of Gambat Medical College Gambat held in the month of January 2024.', 'result-of-final-professional-mbbs-final-year-annual-examination-session-2018-2019-of-gambat-medical-college-gambat-held-in-the-month-of-january-2024-04-23-2024', 'examination'::announcement_category, NULL, '', '2024-04-23T09:00:00Z', '[]'::jsonb, NULL),
('Result of BS (GENERIC) Year-IV Semester-VIII Regular Examination Session 2018-19 of Benazir College of Nursing, SMBBMU Larkana, held in the month of March 2024', 'result-of-bs-generic-year-iv-semester-viii-regular-examination-session-2018-19-of-benazir-college-of-nursing-smbbmu-larkana-held-in-the-month-of-march-2024-04-20-2024', 'examination'::announcement_category, NULL, '', '2024-04-20T09:00:00Z', '[]'::jsonb, NULL),
('Result of Final Professional Pharm-D, Final Year (Annual) Examination, Session 2017-2018 of Institute of Pharmacy, SMBBMU Larkana held in the month of March 2024', 'result-of-final-professional-pharm-d-final-year-annual-examination-session-2017-2018-of-institute-of-pharmacy-smbbmu-larkana-held-in-the-month-of-march-2024-04-19-2024', 'examination'::announcement_category, NULL, '', '2024-04-19T09:00:00Z', '[]'::jsonb, NULL),
('Hostel Allotment of the students for Year 2024', 'hostel-allotment-of-the-students-for-year-2024-04-18-2024', 'circular'::announcement_category, 'Hostel No. 07 Hostel No. 06 Hostel No.05', 'Hostel No. 07
Hostel No. 06
Hostel No.05', '2024-04-18T09:00:00Z', '[{"name":"Hostel 7.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/hostel-7-17134494982.pdf","size_kb":877},{"name":"Hostel 6.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/hostel-6-17134494981.pdf","size_kb":574},{"name":"Hostel 5.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/hostel-5-17134494980.pdf","size_kb":649}]'::jsonb, NULL),
('Result of Second Professional MBBS, Second Year (Annual) Examination, Session 2021-2022 of Chandka Medical College Larkana and Ghulam Muhammad Mahar Medical College Sukkur held in the month of December 2023', 'result-of-second-professional-mbbs-second-year-annual-examination-session-2021-2022-of-chandka-medical-college-larkana-and-ghulam-muhammad-mahar-medical-college-sukkur-held-in-the-month-of-december-2023-04-15-2024', 'examination'::announcement_category, 'View Result', 'View Result', '2024-04-15T09:00:00Z', '[{"name":"Result B 51.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-b-51-17131955160.pdf","size_kb":240}]'::jsonb, NULL),
('Result of Final Professional MBBS, Final Year (Annual) Examination, Session 2018-2019 of Chandka Medical College Larkana and G h u l a r Muhammad Mahar Medical College Sukkur hold in the month of January 2024', 'result-of-final-professional-mbbs-final-year-annual-examination-session-2018-2019-of-chandka-medical-college-larkana-and-g-h-u-l-a-r-muhammad-mahar-medical-college-sukkur-hold-in-the-month-of-january-2024-04-08-2024', 'examination'::announcement_category, 'Download Result', 'Download Result', '2024-04-08T09:00:00Z', '[{"name":"Final Year Result.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/final-year-result-17126441860.pdf","size_kb":349}]'::jsonb, NULL),
('Schedule of Postgraduate Theory examinations of Session September, 2023', 'schedule-of-postgraduate-theory-examinations-of-session-september-2023-04-05-2024', 'examination'::announcement_category, NULL, '', '2024-04-05T09:00:00Z', '[]'::jsonb, NULL),
('Result of BS(Generic) Year-I, Semester-I Regular Examination of SMBBMU and its affiliated colleges', 'result-of-bsgeneric-year-i-semester-i-regular-examination-of-smbbmu-and-its-affiliated-colleges-03-02-2024', 'examination'::announcement_category, 'Page-2 Page-1', 'Page-2
Page-1', '2024-03-02T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Day One Celebration of  Batch -52 of Chandka Medical College Larkana and Batch-13 of Bibi Aseefa Dental College, Larkana', 'notice-for-day-one-celebration-of-batch-52-of-chandka-medical-college-larkana-and-batch-13-of-bibi-aseefa-dental-college-larkana-02-12-2024', 'circular'::announcement_category, NULL, '', '2024-02-12T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Day One Celebration of  Batch -21 of Ghulam Muhammad Mahar Medical College, Sukkur', 'notice-for-day-one-celebration-of-batch-21-of-ghulam-muhammad-mahar-medical-college-sukkur-02-12-2024', 'circular'::announcement_category, NULL, '', '2024-02-12T09:00:00Z', '[]'::jsonb, NULL),
('Result of Result of First Professional DPT, First Semester Regular Examination Session 2022-2023', 'result-of-result-of-first-professional-dpt-first-semester-regular-examination-session-2022-2023-01-31-2024', 'examination'::announcement_category, 'Result of First Professional DPT, First Semester Regular Examination Session 2022-2023 of Institute of Physiotherapy & Rehabilitation Sciences (IRS), SMBBMU Larkana, Shaaf Institute of Medical &…', 'Result of First Professional DPT, First Semester Regular Examination Session 2022-2023 of Institute of Physiotherapy & Rehabilitation Sciences (IRS), SMBBMU Larkana, Shaaf Institute of Medical & Modern Sciences Larkana, Larkana Institute of Health & Emerging Sciences Larkana, Moomal Institute of Physiotherapy & Allied Health Sciences Hyderabad and Dua Institute of Medical and Allied Health Sciences Hyderabad, held in the month of November 2023', '2024-01-31T09:00:00Z', '[]'::jsonb, NULL),
('Result of BS (POST-RN) Year-I, Semester-I Regular Examination Session 2022-23', 'result-of-bs-post-rn-year-i-semester-i-regular-examination-session-2022-23-01-29-2024', 'examination'::announcement_category, 'Result of BS (POST-RN) Year-I, Semester-I Regular Examination Session 2022-23 of 1. Benazir College of Nursing, SMBBMU Larkana, 2. Sindhu Institute of Nursing Khairpur Mirs, 3. Lareb Mustafa…', 'Result of BS (POST-RN) Year-I, Semester-I Regular Examination Session 2022-23 of
1. Benazir College of Nursing, SMBBMU Larkana,
2. Sindhu Institute of Nursing Khairpur Mirs,
3. Lareb Mustafa Institute of Nursing Gambat,
4. SMK Institute of Nursing Shikarpur
5. Bhittai Institute of Nursing Nawabshah (SBA)', '2024-01-29T09:00:00Z', '[]'::jsonb, NULL),
('Call of Quotations for Supply of Medical Books for Financial Year 2023-24', 'call-of-quotations-for-supply-of-medical-books-for-financial-year-2023-24-01-26-2024', 'tender'::announcement_category, NULL, '', '2024-01-26T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree (Clinical) Examination March 2023 held in the month of January 2024', 'result-of-postgraduate-degree-clinical-examination-march-2023-held-in-the-month-of-january-2024-01-25-2024', 'examination'::announcement_category, NULL, '', '2024-01-25T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Provide & Supply of Petty Articles, Office Stationery & Other Misc: items for SMBB Medical University Larkana', 'notice-inviting-tender-for-provide-supply-of-petty-articles-office-stationery-other-misc-items-for-smbb-medical-university-larkana-01-22-2024', 'tender'::announcement_category, 'Corrigendum Tender Documents NIT', 'Corrigendum
Tender Documents
NIT', '2024-01-22T09:00:00Z', '[{"name":"Corrigendum 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/corrigendum-1-17059463750.pdf","size_kb":201},{"name":"1295130 Tender Documents.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1295130-tender-documents-17059462261.pdf","size_kb":702},{"name":"1295141 Nit.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1295141-nit-17059462260.pdf","size_kb":141}]'::jsonb, NULL),
('Date Extension for Notice for Expression of Interest for Cafeteria /Mess Services on Rental Basis"', 'date-extension-for-notice-for-expression-of-interest-for-cafeteria-mess-services-on-rental-basis-01-19-2024', 'circular'::announcement_category, NULL, '', '2024-01-19T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Repair & Renovation work of Girls Hostel No. 02 & 03 Chandka Medical College of SMBB Medical University, Larkana', 'notice-inviting-tender-for-repair-renovation-work-of-girls-hostel-no-02-03-chandka-medical-college-of-smbb-medical-university-larkana-01-17-2024', 'tender'::announcement_category, NULL, '', '2024-01-17T09:00:00Z', '[]'::jsonb, NULL),
('Result of BS (GENERIC) Year-I, Semester-II Regular Examination Session 2021-22', 'result-of-bs-generic-year-i-semester-ii-regular-examination-session-2021-22-01-12-2024', 'examination'::announcement_category, 'Page 1 of Result of BSN Generic Page 2 of Result of BSN Generic', 'Page 1 of Result of BSN Generic
Page 2 of Result of BSN Generic', '2024-01-12T09:00:00Z', '[]'::jsonb, NULL),
('Result of BS (POST-RN) Year-I, Semester-Il Regular Examination Session 2021-22', 'result-of-bs-post-rn-year-i-semester-il-regular-examination-session-2021-22-01-12-2024', 'examination'::announcement_category, NULL, '', '2024-01-12T09:00:00Z', '[]'::jsonb, NULL),
('Notice for registered candidates for 5th SMBBMU Convocation', 'notice-for-registered-candidates-for-5th-smbbmu-convocation-01-06-2024', 'circular'::announcement_category, 'All the registered graduates and post graduates are informed to collect the souvenir of 5th Convocation of SMBBMU tomorrow on 07 January 2023 from English Language Center near final year lecture hall…', 'All the registered graduates and post graduates are informed to collect the souvenir of 5th Convocation of SMBBMU tomorrow on 07 January 2023 from English Language Center near final year lecture hall CMC Larkana.', '2024-01-06T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional DPT, Fourth Semester Regular Examination Session 2020-2021 of Institute of Physiotherapy & Rehabilitation Sciences (IRS). SMBBMU Larkana & Moomal Institute of  Physiotherapy & Allied Health Sciences Hyderabad', 'result-of-second-professional-dpt-fourth-semester-regular-examination-session-2020-2021-of-institute-of-physiotherapy-rehabilitation-sciences-irs-smbbmu-larkana-moomal-institute-of-physiotherapy-allied-health-sciences-hyderabad-01-06-2024', 'examination'::announcement_category, NULL, '', '2024-01-06T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional DPT, Sixth Semester Regular Examination Session 2019-2020 of Institute of Physiotherapy & Rehabilitation Sciences (IRS), SMBBMU Larkana, held in the month of November 2023', 'result-of-third-professional-dpt-sixth-semester-regular-examination-session-2019-2020-of-institute-of-physiotherapy-rehabilitation-sciences-irs-smbbmu-larkana-held-in-the-month-of-november-2023-01-06-2024', 'examination'::announcement_category, NULL, '', '2024-01-06T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional DPT, Second Semester Regular Examination Session 2021-2022 of Institute of Physiotherapy & Rehabilitation Sciences (IRS), SMBBMU Larkana, Moomal Institute of Physiotherapy & Allied Health Sciences Hyderabad and Shaaf Institute', 'result-of-first-professional-dpt-second-semester-regular-examination-session-2021-2022-of-institute-of-physiotherapy-rehabilitation-sciences-irs-smbbmu-larkana-moomal-institute-of-physiotherapy-allied-health-sciences-hyderabad-and-shaaf-institute-01-06-20', 'examination'::announcement_category, NULL, '', '2024-01-06T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Expression of Interest for Cafeteria / Mess Services on Rental Basis', 'notice-for-expression-of-interest-for-cafeteria-mess-services-on-rental-basis-01-04-2024', 'circular'::announcement_category, 'Bidding Documents Category B Bidding Documents Category A', 'Bidding Documents Category B
Bidding Documents Category A', '2024-01-04T09:00:00Z', '[{"name":"Catagory B Tender Documents Mess 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/catagory-b-tender-documents-mess-1-17043942531.pdf","size_kb":636},{"name":"Catagory B Tender Documents Mess 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/catagory-b-tender-documents-mess-1-17043942530.pdf","size_kb":636}]'::jsonb, NULL),
('Instructions for Graduating Students during the 5th Convocation 2024 of Shaheed Mohtarma Benazir Bhutto Medical University, Larkana', 'instructions-for-graduating-students-during-the-5th-convocation-2024-of-shaheed-mohtarma-benazir-bhutto-medical-university-larkana-01-03-2024', 'circular'::announcement_category, 'The following instructions (for registered students only) must be strictly followed to attend the 5th Convocation 2024 of Shaheed Mohtarma Benazir Bhutto Medical University, Larkana. All gates will…', 'The following instructions (for registered students only) must be strictly followed to attend the 5th Convocation 2024 of Shaheed Mohtarma Benazir Bhutto Medical University, Larkana.
All gates will be closed by 10:00 am. You are kindly requested to ensure timely entry into the university premises on the convocation day to avoid any inconvenience.
A photo booth will be installed for the students'' photo shoot, and an official photographer will cover the entire event.
During the convocation proceedings, graduates are required to remain seated in their allocated seats and should only move when their name is called for receiving the award/degree.
Only a single parent is allowed to accompany each graduate.
The rent for the convocation gown package is Rs. 700/-
Registered students have to pay Rs. 3200/-
Rs. 2500/- (refundable security) will be returned after handing over the gown package at the end of the convocation.
On Sunday, January 1, 2024, in the Auditorium Hall at Chandka Medical College, and on the convocation day at the Areeja campus, a gown counter will be set up. To avoid any inconvenience, it is encouraged that students pick up their gowns one day before the convocation.
On Sunday, January 7, 2024, a counter for gathering gifts and souvenirs will be set up at the Vice Principal''s office at Chandka Medical College, Larkana. It is recommended that registered students collect their souvenirs and gifts the day before the convocation. The convocation registration fee deposit receipt is mandatory to receive souvenirs and gifts.
At precisely 8:30 a.m. on Monday, buses for the Areeja campus will be made accessible at Chandka Medical College, near the Auditorium Hall.
Silence is crucial for success; all attendees are expected to remain silent during the convocation proceedings.
All participants are requested to maintain a decent and responsible behaviour throughout the proceedings for a successful event.', '2024-01-03T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree (Theory) Examination March, 2023 held in the month of November, 2023.', 'result-of-postgraduate-degree-theory-examination-march-2023-held-in-the-month-of-november-2023-01-01-2024', 'examination'::announcement_category, NULL, '', '2024-01-01T09:00:00Z', '[]'::jsonb, NULL),
('Time Table for Clinical Examination of Diploma in Ophthalmalogy', 'time-table-for-clinical-examination-of-diploma-in-ophthalmalogy-12-30-2023', 'examination'::announcement_category, NULL, '', '2023-12-30T09:00:00Z', '[]'::jsonb, NULL),
('Result of Diploma in Medical Radio-Diagnosis (DMRD) Part-1 held in month of December 2023.', 'result-of-diploma-in-medical-radio-diagnosis-dmrd-part-1-held-in-month-of-december-2023-12-26-2023', 'examination'::announcement_category, NULL, '', '2023-12-26T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate M.Phil Biochemistry (VIVA) Examinations Session March 2023 held in the month of December, 2023.', 'result-of-postgraduate-mphil-biochemistry-viva-examinations-session-march-2023-held-in-the-month-of-december-2023-12-21-2023', 'examination'::announcement_category, NULL, '', '2023-12-21T09:00:00Z', '[]'::jsonb, NULL),
('Results of MS GYNAECOLOGY & OBSTETRICS PART I and DGO DIPLOMA IN GYNECOLOGY & OBSTETRICS)', 'results-of-ms-gynaecology-obstetrics-part-i-and-dgo-diploma-in-gynecology-obstetrics-12-21-2023', 'examination'::announcement_category, NULL, '', '2023-12-21T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Postgraduate of Surgery & Allied for the interview for Session January 2024', 'notice-for-postgraduate-of-surgery-allied-for-the-interview-for-session-january-2024-12-19-2023', 'job'::announcement_category, NULL, '', '2023-12-19T09:00:00Z', '[]'::jsonb, NULL),
('Schedule of Postgraduate Examinations of Session September, 2023', 'schedule-of-postgraduate-examinations-of-session-september-2023-12-19-2023', 'examination'::announcement_category, NULL, '', '2023-12-19T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Postgraduate of Medicine & Allied for the interview', 'notice-for-postgraduate-of-medicine-allied-for-the-interview-12-18-2023', 'job'::announcement_category, NULL, '', '2023-12-18T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree and Diploma (Theory) Examination March, 2023', 'result-of-postgraduate-degree-and-diploma-theory-examination-march-2023-12-16-2023', 'examination'::announcement_category, NULL, '', '2023-12-16T09:00:00Z', '[]'::jsonb, NULL),
('Time Table for MPHIL Biochemistry Part-I and Part-II and M.PHIL Microbiology Part-II Viva Examination - Session March, 2023', 'time-table-for-mphil-biochemistry-part-i-and-part-ii-and-mphil-microbiology-part-ii-viva-examination-session-march-2023-12-14-2023', 'examination'::announcement_category, 'MPHIL Microbiology', 'MPHIL Microbiology', '2023-12-14T09:00:00Z', '[]'::jsonb, NULL),
('Result of Entry Test of FCPS-II Programs', 'result-of-entry-test-of-fcps-ii-programs-12-09-2023', 'examination'::announcement_category, 'Download Result', 'Download Result', '2023-12-09T09:00:00Z', '[{"name":"Fcps Ii.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/fcps-ii-17021848450.pdf","size_kb":986}]'::jsonb, NULL),
('Addendum / Date Extension  for   Services for Convocation 2023 (Venue Setup & Catering)', 'addendum-date-extension-for-services-for-convocation-2023-venue-setup-catering-12-06-2023', 'tender'::announcement_category, NULL, '', '2023-12-06T09:00:00Z', '[]'::jsonb, NULL),
('Admissions for MBBS / BDS Courses Session 2023-24', 'admissions-for-mbbs-bds-courses-session-2023-24-12-01-2023', 'admission'::announcement_category, 'Admissions for MBBS/BDS Courses Session 2023-24 are available now. Please visit https://admissions.smbbmu.edu.pk/announcement/admissions-for-MBBS-BDS-Session-2023-24 to fill your online application…', 'Admissions for MBBS/BDS Courses Session 2023-24 are available now. Please visit
https://admissions.smbbmu.edu.pk/announcement/admissions-for-MBBS-BDS-Session-2023-24
to fill your online application form now
Last Date to submission of form is
11-12-2023', '2023-12-01T09:00:00Z', '[]'::jsonb, NULL),
('Result of Final Professional BDS, Final Year (Supplementary) Examination, Session 2018-2019 of Bibi Aseefa Dental College, Larkana held in the month of November 2023', 'result-of-final-professional-bds-final-year-supplementary-examination-session-2018-2019-of-bibi-aseefa-dental-college-larkana-held-in-the-month-of-november-2023-11-29-2023', 'examination'::announcement_category, NULL, '', '2023-11-29T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Entry Test and Part-I Examination Session January 2024', 'result-of-postgraduate-entry-test-and-part-i-examination-session-january-2024-11-28-2023', 'examination'::announcement_category, 'MPHIL & Diploma Courses MD/MS', 'MPHIL & Diploma Courses
MD/MS', '2023-11-28T09:00:00Z', '[{"name":"P1 Result M.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/p1-result-m-17012371391.pdf","size_kb":316},{"name":"P 1 Result Md Ms Programs.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/p-1-result-md-ms-programs-17012371390.pdf","size_kb":270}]'::jsonb, NULL),
('Notice Inviting Tender for Repair & Renovation work of Girls'' Hostel No. 01 and Hostel No.04 CMC of SMBB Medical University Larkana.', 'notice-inviting-tender-for-repair-renovation-work-of-girls-hostel-no-01-and-hostel-no04-cmc-of-smbb-medical-university-larkana-11-22-2023', 'tender'::announcement_category, 'NIT Complaint Redressal Committee Procurement Committee Bidding Document Hostel No. 4 Bidding Document Hostel No. 1', 'NIT
Complaint Redressal Committee
Procurement Committee
Bidding Document Hostel No. 4
Bidding Document Hostel No. 1', '2023-11-22T09:00:00Z', '[{"name":"Nit Hostel 01 04.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-hostel-01-04-17006536930.pdf","size_kb":410},{"name":"Notification Procurement Committee.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/notification-procurement-committee-17006536540.pdf","size_kb":328},{"name":"Bidding Document Hostel No.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bidding-document-hostel-no-17006535780.pdf","size_kb":988},{"name":"Bidding Document For Hostel No.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bidding-document-for-hostel-no-17006534590.pdf","size_kb":2094}]'::jsonb, NULL),
('Notice Inviting Tender for Services for Convocation', 'notice-inviting-tender-for-services-for-convocation-11-21-2023', 'tender'::announcement_category, 'Bidding Document', 'Bidding Document', '2023-11-21T09:00:00Z', '[{"name":"Convocation 2023 Technical Financial Sbds 2.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/convocation-2023-technical-financial-sbds-2-17012387460.pdf","size_kb":4334}]'::jsonb, NULL),
('Admission for Certification in Health Professionals Education (C-HPE) Session 2024 Batch-04', 'admission-for-certification-in-health-professionals-education-c-hpe-session-2024-batch-04-11-14-2023', 'admission'::announcement_category, 'Application Form', 'Application Form', '2023-11-14T09:00:00Z', '[{"name":"Chpe Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/chpe-form-16999396200.pdf","size_kb":512}]'::jsonb, NULL),
('Resutl of Postgraduate Degree & Diploma (Theory) Examination March 2023 held in the month of October 2023.', 'resutl-of-postgraduate-degree-diploma-theory-examination-march-2023-held-in-the-month-of-october-2023-11-14-2023', 'examination'::announcement_category, NULL, '', '2023-11-14T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Repair & Maintenance Work & Water Proofing/Roof Treatment at Bibi Aseefa Dental College of SMBB Medical University, Larkana', 'notice-inviting-tender-for-repair-maintenance-work-water-proofingroof-treatment-at-bibi-aseefa-dental-college-of-smbb-medical-university-larkana-11-13-2023', 'tender'::announcement_category, 'Annual Procurement Plan Complaint Redressal Committee Bidding Document NIT', 'Annual Procurement Plan
Complaint Redressal Committee
Bidding Document
NIT', '2023-11-13T09:00:00Z', '[{"name":"App 2023.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/app-2023-16999467163.pdf","size_kb":379},{"name":"Complaint Redressal Committee.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/complaint-redressal-committee-16999467162.pdf","size_kb":315},{"name":"Bidding Document For Badc.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bidding-document-for-badc-16999467151.pdf","size_kb":2271},{"name":"Nit Badc.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-badc-16999467150.pdf","size_kb":529}]'::jsonb, NULL),
('Extension of Date for Submission of forms for induction in university courses & MCPS', 'extension-of-date-for-submission-of-forms-for-induction-in-university-courses-mcps-11-10-2023', 'circular'::announcement_category, NULL, '', '2023-11-10T09:00:00Z', '[]'::jsonb, NULL),
('5th SMBBMU Convocation', '5th-smbbmu-convocation-11-10-2023', 'circular'::announcement_category, 'Application Form Undergradaute Fee Voucher Postgraduate Voucher', 'Application Form
Undergradaute Fee Voucher
Postgraduate Voucher', '2023-11-10T09:00:00Z', '[{"name":"Convocation Form 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/convocation-form-1-17019333750.pdf","size_kb":69},{"name":"Undergraduate Voucher.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/undergraduate-voucher-17000438110.pdf","size_kb":222},{"name":"Convocation Postgraduates.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/convocation-postgraduates-17000413951.pdf","size_kb":224}]'::jsonb, NULL),
('Notice Inviting Tender for Repair & Renovation work of Vice Chancellor Secretariat(Camp Office) at SMBB Medical University, Larkano', 'notice-inviting-tender-for-repair-renovation-work-of-vice-chancellor-secretariatcamp-office-at-smbb-medical-university-larkano-11-06-2023', 'tender'::announcement_category, 'NIT', 'NIT', '2023-11-06T09:00:00Z', '[{"name":"Camscanner 10 20 2023 15.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/camscanner-10-20-2023-15-16998634590.pdf","size_kb":404}]'::jsonb, NULL),
('Result Postgraduate Degree and Diploma (Theory) Examination March, 2023 held in the month of October, 2023.', 'result-postgraduate-degree-and-diploma-theory-examination-march-2023-held-in-the-month-of-october-2023-11-04-2023', 'examination'::announcement_category, NULL, '', '2023-11-04T09:00:00Z', '[]'::jsonb, NULL),
('Corrigendum for Advertisement for admissions in various Postgraduate Programs for the Session January, 2024', 'corrigendum-for-advertisement-for-admissions-in-various-postgraduate-programs-for-the-session-january-2024-10-31-2023', 'admission'::announcement_category, NULL, '', '2023-10-31T09:00:00Z', '[]'::jsonb, NULL),
('Time Table for Postgraduate Examination', 'time-table-for-postgraduate-examination-10-31-2023', 'examination'::announcement_category, 'MD/MS Theory Exam MPHILL-I Examination Theory MPHILL-II Examination Theory Postgraduate Diploma Courses Theory Examination, MARCH, 2023', 'MD/MS Theory Exam
MPHILL-I Examination Theory
MPHILL-II Examination Theory
Postgraduate Diploma Courses Theory Examination, MARCH, 2023', '2023-10-31T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Diploma (Theory) Examinations March 2023 held in the month of October, 2023.', 'result-of-postgraduate-diploma-theory-examinations-march-2023-held-in-the-month-of-october-2023-10-21-2023', 'examination'::announcement_category, NULL, '', '2023-10-21T09:00:00Z', '[]'::jsonb, NULL),
('Admission for Postgraduate Courses for Session January 2024', 'admission-for-postgraduate-courses-for-session-january-2024-10-21-2023', 'admission'::announcement_category, NULL, '', '2023-10-21T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree & Diploma (Theory) Examination March 2023 held in the month of October 2023', 'result-of-postgraduate-degree-diploma-theory-examination-march-2023-held-in-the-month-of-october-2023-10-18-2023', 'examination'::announcement_category, NULL, '', '2023-10-18T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Provide & Supply of Printing Material, Stationary Items & IT Equipment For Examinations Department, SMBB Medical University Larkana.', 'notice-inviting-tender-for-provide-supply-of-printing-material-stationary-items-it-equipment-for-examinations-department-smbb-medical-university-larkana-10-10-2023', 'tender'::announcement_category, 'Tender Documents NIT', 'Tender Documents
NIT', '2023-10-10T09:00:00Z', '[{"name":"1245561 Tender Document.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1245561-tender-document-16971245890.pdf","size_kb":682},{"name":"1245564 Nit.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1245564-nit-16971243520.pdf","size_kb":120}]'::jsonb, NULL),
('Result of BSC (POST-RN) Year-Il, Semester-III Regular Examination Session 2020-21 of Benazir College of Nursing, SMBBMU Larkana, Sindhu Institute of Nursing Khairpur Mirs, and Lareeb Mustafa Institute of Nursing Gambat, held in the month of August 2023.', 'result-of-bsc-post-rn-year-il-semester-iii-regular-examination-session-2020-21-of-benazir-college-of-nursing-smbbmu-larkana-sindhu-institute-of-nursing-khairpur-mirs-and-lareeb-mustafa-institute-of-nursing-gambat-held-in-the-month-of-august-2023-10-10-202', 'examination'::announcement_category, 'Result', 'Result', '2023-10-10T09:00:00Z', '[{"name":"Camscanner 10 10 2023 11.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/camscanner-10-10-2023-11-16970156760.pdf","size_kb":599}]'::jsonb, NULL),
('Result of BS(GENERIC) Year-II, Semester-III Regular Examination Session 2020-21 held in the month of August 2023', 'result-of-bsgeneric-year-ii-semester-iii-regular-examination-session-2020-21-held-in-the-month-of-august-2023-10-10-2023', 'examination'::announcement_category, 'Result', 'Result', '2023-10-10T09:00:00Z', '[{"name":"Camscanner 10 10 2023 11.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/camscanner-10-10-2023-11-16970160670.pdf","size_kb":1096}]'::jsonb, NULL),
('Result of First Professional DPT. First Semester Re-Sit Examination Session 2021-2022 of IPRS, SMBBMU Larkana, Moomal Institute of Physiotherapy & Allied Health Sciences Hyderabad and Shaaf Institute Institute of Medical & Modern Sciences Larkana', 'result-of-first-professional-dpt-first-semester-re-sit-examination-session-2021-2022-of-iprs-smbbmu-larkana-moomal-institute-of-physiotherapy-allied-health-sciences-hyderabad-and-shaaf-institute-institute-of-medical-modern-sciences-larkana-10-03-2023', 'examination'::announcement_category, NULL, '', '2023-10-03T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional DPT, Third Semester Re-Sit Examination Session 2020-2021 of Moomal Institute of Physiotherapy & Allied Health Sciences Hyderabad Held in the month of September 2023', 'result-of-second-professional-dpt-third-semester-re-sit-examination-session-2020-2021-of-moomal-institute-of-physiotherapy-allied-health-sciences-hyderabad-held-in-the-month-of-september-2023-10-03-2023', 'examination'::announcement_category, NULL, '', '2023-10-03T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional DPT, Fifth Semester Re-Sit Examination Session 2019-2020 of Institute of Physiotherapy & Rehabilitation Sciences (IRS), SMBBMU Larkana Held in the month of August 2023', 'result-of-third-professional-dpt-fifth-semester-re-sit-examination-session-2019-2020-of-institute-of-physiotherapy-rehabilitation-sciences-irs-smbbmu-larkana-held-in-the-month-of-august-2023-10-03-2023', 'examination'::announcement_category, NULL, '', '2023-10-03T09:00:00Z', '[]'::jsonb, NULL),
('Corrigendum for Notice Inviting Tender for Construction of Open Drain including Pumping Station with Pumping Room Drain from CMC Campus to Rice Canal at CMC of SMBB Medical University, Larkana.', 'corrigendum-for-notice-inviting-tender-for-construction-of-open-drain-including-pumping-station-with-pumping-room-drain-from-cmc-campus-to-rice-canal-at-cmc-of-smbb-medical-university-larkana-10-02-2023', 'tender'::announcement_category, NULL, '', '2023-10-02T09:00:00Z', '[]'::jsonb, NULL),
('Examination Schedule of Postgraduate Courses Session March, 2023.', 'examination-schedule-of-postgraduate-courses-session-march-2023-10-02-2023', 'examination'::announcement_category, 'Postgraduate MD/MS Mid-Term Theory Examination Postgraduate MS-II Theory Examination Postgraduate Diploma Theory Examination', 'Postgraduate MD/MS Mid-Term Theory Examination
Postgraduate MS-II Theory Examination
Postgraduate Diploma Theory Examination', '2023-10-02T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Construction of Open Storm Drain Including Pumping Station with Pumping Room Drain from CMC Campus to Rice Canal at Chandka Medical College of Shaheed Mohtarma Benazir Bhutto Medical University Larkana.', 'notice-inviting-tender-for-construction-of-open-storm-drain-including-pumping-station-with-pumping-room-drain-from-cmc-campus-to-rice-canal-at-chandka-medical-college-of-shaheed-mohtarma-benazir-bhutto-medical-university-larkana-09-25-2023', 'tender'::announcement_category, 'Bidding Document NIT', 'Bidding Document
NIT', '2023-09-25T09:00:00Z', '[{"name":"Bidding Document For Strom Drainage 053525.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bidding-document-for-strom-drainage-053525-16958346141.pdf","size_kb":2215}]'::jsonb, NULL),
('Result of Postgraduate Diploma (Clinical Examinations) of Diploma in Psychiatric Medicine September 2022 held in the month of September 2023', 'result-of-postgraduate-diploma-clinical-examinations-of-diploma-in-psychiatric-medicine-september-2022-held-in-the-month-of-september-2023-09-22-2023', 'examination'::announcement_category, NULL, '', '2023-09-22T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for M&R Work Office of the Principal CMC and Paint Work in Academic Block CMC', 'notice-inviting-tender-for-mr-work-office-of-the-principal-cmc-and-paint-work-in-academic-block-cmc-09-15-2023', 'tender'::announcement_category, 'Bidding Documents NIT', 'Bidding Documents
NIT', '2023-09-15T09:00:00Z', '[{"name":"Bidding Documents Principal Cmc Paint Work Academic Block 053642.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bidding-documents-principal-cmc-paint-work-academic-block-053642-16958339061.pdf","size_kb":816},{"name":"Nit 053739.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-053739-16958339060.pdf","size_kb":459}]'::jsonb, NULL),
('Result of Postgraduate Diploma (Clinical) Examination September, 2022 held in the month of September, 2023', 'result-of-postgraduate-diploma-clinical-examination-september-2022-held-in-the-month-of-september-2023-09-13-2023', 'examination'::announcement_category, NULL, '', '2023-09-13T09:00:00Z', '[]'::jsonb, NULL),
('Result of BS (GENERIC) Year-|II Semester VI Re-Sit Examination Session 2018-19 of Benazir College of Nursing, SMBBMU Larkana, held in the month of August 2023', 'result-of-bs-generic-year-ii-semester-vi-re-sit-examination-session-2018-19-of-benazir-college-of-nursing-smbbmu-larkana-held-in-the-month-of-august-2023-09-13-2023', 'examination'::announcement_category, NULL, '', '2023-09-13T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of Diploma in Psychiatric Medicine (DPM) Clinical Examination September, 2022', 'time-table-of-diploma-in-psychiatric-medicine-dpm-clinical-examination-september-2022-09-08-2023', 'examination'::announcement_category, NULL, '', '2023-09-08T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of Diploma in Dermatology (D.Derm) Examination September, 2022', 'time-table-of-diploma-in-dermatology-dderm-examination-september-2022-09-08-2023', 'examination'::announcement_category, NULL, '', '2023-09-08T09:00:00Z', '[]'::jsonb, NULL),
('Final list of students who have applied in PM Laptop Scheme of SMBBMU Larkana', 'final-list-of-students-who-have-applied-in-pm-laptop-scheme-of-smbbmu-larkana-09-06-2023', 'circular'::announcement_category, 'Download List', 'Download List', '2023-09-06T09:00:00Z', '[{"name":"Smbbmu Final Merit List Pm Laptop 090623.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmu-final-merit-list-pm-laptop-090623-16940660090.pdf","size_kb":1971}]'::jsonb, NULL),
('Result of Postgraduate Degree & Diploma (Theory) Examinations September 2022 held in the month of May 2023.', 'result-of-postgraduate-degree-diploma-theory-examinations-september-2022-held-in-the-month-of-may-2023-09-06-2023', 'examination'::announcement_category, NULL, '', '2023-09-06T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of Diploma in Gynaecology and Obstetrics (DGO) Examination September, 2022', 'time-table-of-diploma-in-gynaecology-and-obstetrics-dgo-examination-september-2022-09-06-2023', 'examination'::announcement_category, NULL, '', '2023-09-06T09:00:00Z', '[]'::jsonb, NULL),
('Provisional List of Students applied for Prime Minister Laptop Scheme Phase-III @Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU) Larkana', 'provisional-list-of-students-applied-for-prime-minister-laptop-scheme-phase-iii-shaheed-mohtarma-benazir-bhutto-medical-university-smbbmu-larkana-08-30-2023', 'circular'::announcement_category, 'Download List', 'Download List', '2023-08-30T09:00:00Z', '[{"name":"Smbbmu Pm Laptop20 30082023.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmu-pm-laptop20-30082023-16934658370.pdf","size_kb":2859}]'::jsonb, NULL),
('Final Provisional List of Students applied for Prime Minister Laptop Scheme Phase-III @Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU) Larkana', 'final-provisional-list-of-students-applied-for-prime-minister-laptop-scheme-phase-iii-shaheed-mohtarma-benazir-bhutto-medical-university-smbbmu-larkana-08-19-2023', 'circular'::announcement_category, 'Download List', 'Download List', '2023-08-19T09:00:00Z', '[{"name":"Smbbmu Pm Laptop Final List 180823 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmu-pm-laptop-final-list-180823-1-16926363740.pdf","size_kb":2805}]'::jsonb, NULL),
('List of candidates recommended for induction in the university Postgraduate Courses Session July 2023', 'list-of-candidates-recommended-for-induction-in-the-university-postgraduate-courses-session-july-2023-08-12-2023', 'circular'::announcement_category, 'Remaining University Courses University Courses Diploma Courses', 'Remaining University Courses
University Courses
Diploma Courses', '2023-08-12T09:00:00Z', '[{"name":"Remaining Courses Updt.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/remaining-courses-updt-16919112392.pdf","size_kb":171},{"name":"University Courses.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/university-courses-16919112391.pdf","size_kb":409},{"name":"Diploma.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/diploma-16919112390.pdf","size_kb":394}]'::jsonb, NULL),
('Notice Inviting Tender for Security Services for SMBB Medical University, Larkana.', 'notice-inviting-tender-for-security-services-for-smbb-medical-university-larkana-08-11-2023', 'tender'::announcement_category, 'Financial Bidding Document Technical Bidding Document', 'Financial Bidding Document
Technical Bidding Document', '2023-08-11T09:00:00Z', '[{"name":"Security Sbd Financial.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/security-sbd-financial-16917377261.pdf","size_kb":734},{"name":"Security Sbd Technical.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/security-sbd-technical-16917377260.pdf","size_kb":885}]'::jsonb, NULL),
('Circular for celebrating 76th Independence Day at SMBBMU', 'circular-for-celebrating-76th-independence-day-at-smbbmu-08-11-2023', 'circular'::announcement_category, NULL, '', '2023-08-11T09:00:00Z', '[]'::jsonb, NULL),
('Auction for various unserviceable properties, Scrap and Waste/Dumped materials', 'auction-for-various-unserviceable-properties-scrap-and-wastedumped-materials-08-08-2023', 'circular'::announcement_category, NULL, '', '2023-08-08T09:00:00Z', '[]'::jsonb, NULL),
('Interviews of Postgraduate Courses for Session July 2023', 'interviews-of-postgraduate-courses-for-session-july-2023-08-07-2023', 'job'::announcement_category, NULL, '', '2023-08-07T09:00:00Z', '[]'::jsonb, NULL),
('Vacant space available for renting purpose near ChandkA Medical College SMBBMU Larkana', 'vacant-space-available-for-renting-purpose-near-chandka-medical-college-smbbmu-larkana-08-05-2023', 'circular'::announcement_category, NULL, '', '2023-08-05T09:00:00Z', '[]'::jsonb, NULL),
('Schedule of Entry test for University Courses Session July 2023', 'schedule-of-entry-test-for-university-courses-session-july-2023-08-02-2023', 'admission'::announcement_category, NULL, '', '2023-08-02T09:00:00Z', '[]'::jsonb, NULL),
('Third Merit List of Students of SMBBMU Larkana who applied for PM Laptop Scheme', 'third-merit-list-of-students-of-smbbmu-larkana-who-applied-for-pm-laptop-scheme-07-31-2023', 'admission'::announcement_category, 'View List', 'View List', '2023-07-31T09:00:00Z', '[{"name":"Smbbmu 3rd Merit List 300723.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmu-3rd-merit-list-300723-16908013120.pdf","size_kb":2521}]'::jsonb, NULL),
('Notice Inviting Tender for Repair & Renovation Work of Boys Hostels No. 05,06 and 07 at Chandka Medical College', 'notice-inviting-tender-for-repair-renovation-work-of-boys-hostels-no-0506-and-07-at-chandka-medical-college-07-24-2023', 'tender'::announcement_category, 'Bidding Documents Annual Procurement Plan NIT', 'Bidding Documents
Annual Procurement Plan
NIT', '2023-07-24T09:00:00Z', '[{"name":"1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1-16907915690.pdf","size_kb":2242},{"name":"2.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/2-16907913290.pdf","size_kb":159},{"name":"Nit Of R R Work Of Boys Hostel No 05 06 07 Pages 2 3.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-of-r-r-work-of-boys-hostel-no-05-06-07-pages-2-3-16903529390.pdf","size_kb":524}]'::jsonb, NULL),
('Notice for Expression of interest for Cafeteria/Mess Services on Rental Basis', 'notice-for-expression-of-interest-for-cafeteriamess-services-on-rental-basis-07-20-2023', 'circular'::announcement_category, 'Category-B Document Category-A Document NIT', 'Category-B Document
Category-A Document
NIT', '2023-07-20T09:00:00Z', '[{"name":"Catagory B Tender Documents Mess.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/catagory-b-tender-documents-mess-16898793732.pdf","size_kb":570},{"name":"Catagory A Tender Documents Cafeteria.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/catagory-a-tender-documents-cafeteria-16898793731.pdf","size_kb":551},{"name":"Nit Cafeteria Mess On Rental Basis.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-cafeteria-mess-on-rental-basis-16898793730.pdf","size_kb":525}]'::jsonb, NULL),
('Provisional list of all students who have applied for PM Laptop Scheme Phase-III 202-23', 'provisional-list-of-all-students-who-have-applied-for-pm-laptop-scheme-phase-iii-202-23-07-14-2023', 'circular'::announcement_category, 'View List', 'View List', '2023-07-14T09:00:00Z', '[{"name":"Provisional Merit List Of Smbbmu 13 07 2023.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/provisional-merit-list-of-smbbmu-13-07-2023-16893231830.pdf","size_kb":2606}]'::jsonb, NULL),
('Hostel allotment list of the boys students of Chandka Medical College, Larkana', 'hostel-allotment-list-of-the-boys-students-of-chandka-medical-college-larkana-07-12-2023', 'circular'::announcement_category, 'Hostel No.(107) Arija Campus Hostel No. 07 Hostel No.06 Hostel No.05', 'Hostel No.(107) Arija Campus
Hostel No. 07
Hostel No.06
Hostel No.05', '2023-07-12T09:00:00Z', '[{"name":"Allotment List For Boys Hostel No.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/allotment-list-for-boys-hostel-no-16892288193.pdf","size_kb":514},{"name":"Allotment List For Boys Hostel No.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/allotment-list-for-boys-hostel-no-16892288192.pdf","size_kb":840},{"name":"Allotment List For Boys Hostel No.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/allotment-list-for-boys-hostel-no-16892288191.pdf","size_kb":567},{"name":"Allotment List For Boys Hostel No.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/allotment-list-for-boys-hostel-no-16892288190.pdf","size_kb":593}]'::jsonb, NULL),
('Result Declaration of the Entry Test of Postgraduate Course', 'result-declaration-of-the-entry-test-of-postgraduate-course-07-10-2023', 'examination'::announcement_category, NULL, '', '2023-07-10T09:00:00Z', '[]'::jsonb, NULL),
('Results of Postgraduate Degree (Theory) Examination September 2022 held in the month of May, 2023', 'results-of-postgraduate-degree-theory-examination-september-2022-held-in-the-month-of-may-2023-07-05-2023', 'examination'::announcement_category, NULL, '', '2023-07-05T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Diploma (Clinical) Examination March 2022 held in the month of June, 2023', 'result-of-postgraduate-diploma-clinical-examination-march-2022-held-in-the-month-of-june-2023-07-05-2023', 'examination'::announcement_category, NULL, '', '2023-07-05T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN(Generic) Year-III Semester -IV Re-Sit Examination Session 2018-19 of Benazir College of Nursing, held in the Month of May 2023', 'result-of-bsngeneric-year-iii-semester-iv-re-sit-examination-session-2018-19-of-benazir-college-of-nursing-held-in-the-month-of-may-2023-07-05-2023', 'examination'::announcement_category, 'Download Result', 'Download Result', '2023-07-05T09:00:00Z', '[{"name":"Camscanner 07 06 2023 11.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/camscanner-07-06-2023-11-16886252590.pdf","size_kb":467}]'::jsonb, NULL),
('Admissions for Postgraduate Courses for Session July 2023', 'admissions-for-postgraduate-courses-for-session-july-2023-07-01-2023', 'admission'::announcement_category, NULL, '', '2023-07-01T09:00:00Z', '[]'::jsonb, NULL),
('Interactive Seminar on USMLE and Residency Application in USA at Chandka Medical College, Larkana', 'interactive-seminar-on-usmle-and-residency-application-in-usa-at-chandka-medical-college-larkana-06-19-2023', 'circular'::announcement_category, NULL, '', '2023-06-19T09:00:00Z', '[]'::jsonb, NULL),
('Revised Result of Third Professional MBBS, Third Year (Annual) Examination, Session 2019-2020 of Chandka Medical College Larkana, Ghulam Muhammad Mahar Medical College Sukkur and Gambat Medical College Gambat held In the month of January 2023', 'revised-result-of-third-professional-mbbs-third-year-annual-examination-session-2019-2020-of-chandka-medical-college-larkana-ghulam-muhammad-mahar-medical-college-sukkur-and-gambat-medical-college-gambat-held-in-the-month-of-january-2023-06-19-2023', 'examination'::announcement_category, 'Download Result', 'Download Result', '2023-06-19T09:00:00Z', '[{"name":"Photo 2023 06 19 12 56 06.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/photo-2023-06-19-12-56-06-16871741920.pdf","size_kb":345}]'::jsonb, NULL),
('Time Table of MD Pediatric Medicine(MidTerm) and DCH Examination', 'time-table-of-md-pediatric-medicinemidterm-and-dch-examination-06-12-2023', 'examination'::announcement_category, NULL, '', '2023-06-12T09:00:00Z', '[]'::jsonb, NULL),
('Notice Initing Tender for Development & Implementation Customised Modules for ERP System for Shaheed Mohtarma Benazir Bhutto Medical University, Larkana', 'notice-initing-tender-for-development-implementation-customised-modules-for-erp-system-for-shaheed-mohtarma-benazir-bhutto-medical-university-larkana-06-08-2023', 'tender'::announcement_category, 'Financial Bidding Document Technical Bidding Document', 'Financial Bidding Document
Technical Bidding Document', '2023-06-08T09:00:00Z', '[{"name":"Erp Bidding Document Financial.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/erp-bidding-document-financial-16864581060.pdf","size_kb":3799},{"name":"Erp Bidding Document Technical.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/erp-bidding-document-technical-16863038500.pdf","size_kb":3844}]'::jsonb, NULL),
('TIME TABLE of DIP-CARD (DIPLOMA IN CARDIOLOGY) CLINICAL EXAMINATION - MARCH, 2022', 'time-table-of-dip-card-diploma-in-cardiology-clinical-examination-march-2022-06-08-2023', 'examination'::announcement_category, NULL, '', '2023-06-08T09:00:00Z', '[]'::jsonb, NULL),
('Circular of Postgraduate Examinations of Session March, 2023 in all Degree and Diploma courses.', 'circular-of-postgraduate-examinations-of-session-march-2023-in-all-degree-and-diploma-courses-06-08-2023', 'examination'::announcement_category, NULL, '', '2023-06-08T09:00:00Z', '[]'::jsonb, NULL),
('Condolence of Mr Sarfraz Ali Soomro PS to Vice Chancellor', 'condolence-of-mr-sarfraz-ali-soomro-ps-to-vice-chancellor-06-01-2023', 'circular'::announcement_category, NULL, '', '2023-06-01T09:00:00Z', '[]'::jsonb, NULL),
('Admission for Certificate in Health Professions Education (C-HPE) Session 2023', 'admission-for-certificate-in-health-professions-education-c-hpe-session-2023-05-30-2023', 'admission'::announcement_category, 'Application Form', 'Application Form', '2023-05-30T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fourth Professional MBBS, Fourth Year (Annual) Examination, Session 2018-2019 of Chandka Medical College Larkana, Ghulam Muhammad Mahar Medical College Sukkur and Gambat Medical College Gambat held in the month of January 2023', 'result-of-fourth-professional-mbbs-fourth-year-annual-examination-session-2018-2019-of-chandka-medical-college-larkana-ghulam-muhammad-mahar-medical-college-sukkur-and-gambat-medical-college-gambat-held-in-the-month-of-january-2023-05-26-2023', 'examination'::announcement_category, 'Download Result', 'Download Result', '2023-05-26T09:00:00Z', '[{"name":"Result Mbbs 4th Year.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-mbbs-4th-year-16851239580.pdf","size_kb":317}]'::jsonb, NULL),
('Result of. Postgraduate Degree (Theory) Examination September 2022 held in the month of May 2023.', 'result-of-postgraduate-degree-theory-examination-september-2022-held-in-the-month-of-may-2023-05-26-2023', 'examination'::announcement_category, NULL, '', '2023-05-26T09:00:00Z', '[]'::jsonb, NULL),
('Result of BS POST-RN Additional Subjects Examination Session 2012-14 of Benazir College of Nursing, SMBBMU Larkana, held in the month of December 2022', 'result-of-bs-post-rn-additional-subjects-examination-session-2012-14-of-benazir-college-of-nursing-smbbmu-larkana-held-in-the-month-of-december-2022-05-22-2023', 'examination'::announcement_category, NULL, '', '2023-05-22T09:00:00Z', '[]'::jsonb, NULL)
on conflict (slug) do update set title=excluded.title, category=excluded.category, excerpt=excluded.excerpt, body=excluded.body, published_at=excluded.published_at, attachments=excluded.attachments, photo_url=excluded.photo_url;

-- 03_announcements_03.sql
insert into announcements (title, slug, category, excerpt, body, published_at, attachments, photo_url) values
('Result of BSN (GENERIC) Year-ll Semester-|V Regular Examination Session 2019-20 of Benazir College of Nursing, SMBBMU Larkana, held in the month of March 2023', 'result-of-bsn-generic-year-ll-semester-v-regular-examination-session-2019-20-of-benazir-college-of-nursing-smbbmu-larkana-held-in-the-month-of-march-2023-05-22-2023', 'examination'::announcement_category, NULL, '', '2023-05-22T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree Clinical Examination March 2022 held in the month of May 2023', 'result-of-postgraduate-degree-clinical-examination-march-2022-held-in-the-month-of-may-2023-05-22-2023', 'examination'::announcement_category, NULL, '', '2023-05-22T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional MBBS, Third Year (Annual) Examination, Session 2019-2020 of Chandka Medical College Larkana, Ghulam Muhammad Mahar Medical College Sukkur and Gambat Medical College Gambat held in the month of January 2023', 'result-of-third-professional-mbbs-third-year-annual-examination-session-2019-2020-of-chandka-medical-college-larkana-ghulam-muhammad-mahar-medical-college-sukkur-and-gambat-medical-college-gambat-held-in-the-month-of-january-2023-05-22-2023', 'examination'::announcement_category, 'View Result', 'View Result', '2023-05-22T09:00:00Z', '[{"name":"Result Mbbs 3rd Year.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-mbbs-3rd-year-16847624800.pdf","size_kb":379}]'::jsonb, NULL),
('Notice Inviting Tenders for Repair & Renovation Work Jamia Masjid at Chandka Medical College Larkana', 'notice-inviting-tenders-for-repair-renovation-work-jamia-masjid-at-chandka-medical-college-larkana-05-17-2023', 'tender'::announcement_category, NULL, '', '2023-05-17T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Purchase of Hospital & General Furniture / Miscellaneous Items at CMC Hospital Larkana', 'notice-inviting-tender-for-purchase-of-hospital-general-furniture-miscellaneous-items-at-cmc-hospital-larkana-05-11-2023', 'tender'::announcement_category, 'Bid Document', 'Bid Document', '2023-05-11T09:00:00Z', '[{"name":"Sbds.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sbds-16838687950.pdf","size_kb":7723}]'::jsonb, NULL),
('Result of BSN(Generic) Year-I, Semester-II Regular Examination Session 2021-22', 'result-of-bsngeneric-year-i-semester-ii-regular-examination-session-2021-22-05-11-2023', 'examination'::announcement_category, 'Result of BSN(Generic) Year-I, Semester-II Regular Examination Session 2021-22 held in the month of December 2022 Download Result', 'Result of BSN(Generic) Year-I, Semester-II Regular Examination Session 2021-22 held in the month of December 2022
Download Result', '2023-05-11T09:00:00Z', '[{"name":"Img 1749.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/img-1749-16837837900.pdf","size_kb":1295}]'::jsonb, NULL),
('Result of the Final Professional MBBS Final Year Examination held in the month of January 2023', 'result-of-the-final-professional-mbbs-final-year-examination-held-in-the-month-of-january-2023-05-05-2023', 'examination'::announcement_category, 'Result of the Final Professional MBBS Final Year(Annual) Examination of Chandka Medical College Larkana, Ghulam Muhammad Mahar Medical College, Sukkur and Gambat Medical College, Gambat held in the…', 'Result of the Final Professional MBBS Final Year(Annual) Examination of Chandka Medical College Larkana, Ghulam Muhammad Mahar Medical College, Sukkur and Gambat Medical College, Gambat held in the month of January 2023
Download Result', '2023-05-05T09:00:00Z', '[{"name":"Cc488d22 36be 4a01 B498 Ba4fb3ddb2f8.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/cc488d22-36be-4a01-b498-ba4fb3ddb2f8-16832617180.pdf","size_kb":530}]'::jsonb, NULL),
('Admissions for English Language Certification Courses', 'admissions-for-english-language-certification-courses-05-03-2023', 'admission'::announcement_category, NULL, '', '2023-05-03T09:00:00Z', '[]'::jsonb, NULL),
('Corrigendum for Admission in leftover Postgraduate Courses Session Jan-2023', 'corrigendum-for-admission-in-leftover-postgraduate-courses-session-jan-2023-03-24-2023', 'admission'::announcement_category, NULL, '', '2023-03-24T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Day One Celebration of  Batch -51 of Chandka Medical College and Batch-12 of Bibi Aseefa Dental College, Larkana', 'notice-for-day-one-celebration-of-batch-51-of-chandka-medical-college-and-batch-12-of-bibi-aseefa-dental-college-larkana-02-21-2023', 'circular'::announcement_category, NULL, '', '2023-02-21T09:00:00Z', '[]'::jsonb, NULL),
('Declaration of Result of Post Graduate Examination of Diploma in Dermatology session March 2022 held in the month  of January 2023', 'declaration-of-result-of-post-graduate-examination-of-diploma-in-dermatology-session-march-2022-held-in-the-month-of-january-2023-01-28-2023', 'examination'::announcement_category, NULL, '', '2023-01-28T09:00:00Z', '[]'::jsonb, NULL),
('Time Table for Clinical examination of Diploma in Dermatology March 2022', 'time-table-for-clinical-examination-of-diploma-in-dermatology-march-2022-01-19-2023', 'examination'::announcement_category, NULL, '', '2023-01-19T09:00:00Z', '[]'::jsonb, NULL),
('Applications are invited for: ADMISSIONS TO BS Nursing(Generic) & B.Sc Nursing (Post RN) at Benazir College of Nursing SMBBMU Larkana', 'applications-are-invited-for-admissions-to-bs-nursinggeneric-bsc-nursing-post-rn-at-benazir-college-of-nursing-smbbmu-larkana-01-14-2023', 'admission'::announcement_category, NULL, '', '2023-01-14T09:00:00Z', '[]'::jsonb, NULL),
('Applications are invited from Interested Candidates for: ADMISSIONS TO 1 st Year Pharm-D / DPT Course Session 2022-23 At SMBBMU Larkana', 'applications-are-invited-from-interested-candidates-for-admissions-to-1-st-year-pharm-d-dpt-course-session-2022-23-at-smbbmu-larkana-01-14-2023', 'admission'::announcement_category, NULL, '', '2023-01-14T09:00:00Z', '[]'::jsonb, NULL),
('Postgraduate interview schedule for the session January 2023 at SMBB Medical University Larkana', 'postgraduate-interview-schedule-for-the-session-january-2023-at-smbb-medical-university-larkana-01-10-2023', 'job'::announcement_category, 'Merit List of Candidates who appeared in other specializations Merit List of candidates appearing in FCPS-II in different specializations', 'Merit List of Candidates who appeared in other specializations
Merit List of candidates appearing in FCPS-II in different specializations', '2023-01-10T09:00:00Z', '[{"name":"New Doc 01 10 2023 12.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/new-doc-01-10-2023-12-16733688260.pdf","size_kb":4156},{"name":"New Doc 01 10 2023 12.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/new-doc-01-10-2023-12-16733665070.pdf","size_kb":2818}]'::jsonb, NULL),
('Schedule of Examination for 1st, 2nd and 3rd  MBBS Professional  (Session 2021 - 22, 2020 - 21 - 2019 -  20) enrolled at SMBB Medical University Larkana and It''s constituent Collages', 'schedule-of-examination-for-1st-2nd-and-3rd-mbbs-professional-session-2021-22-2020-21-2019-20-enrolled-at-smbb-medical-university-larkana-and-its-constituent-collages-01-04-2023', 'examination'::announcement_category, NULL, '', '2023-01-04T09:00:00Z', '[]'::jsonb, NULL),
('Schedule of Examination for 4th and 5th MBBS Professional  (Session 2018 - 19, 2017 - 18) enrolled at SMBB Medical University Larkana and It''s constituent Collages', 'schedule-of-examination-for-4th-and-5th-mbbs-professional-session-2018-19-2017-18-enrolled-at-smbb-medical-university-larkana-and-its-constituent-collages-01-04-2023', 'examination'::announcement_category, NULL, '', '2023-01-04T09:00:00Z', '[]'::jsonb, NULL),
('Announcement of result of various Postgraduate courses held in December 2022 (Session January 2023)', 'announcement-of-result-of-various-postgraduate-courses-held-in-december-2022-session-january-2023-01-04-2023', 'examination'::announcement_category, 'Postgraduate entry test results', 'Postgraduate entry test results', '2023-01-04T09:00:00Z', '[{"name":"Postgraduate Entry Test Results.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/postgraduate-entry-test-results-16728473450.pdf","size_kb":3122}]'::jsonb, NULL),
('Schedule for the entry test of M.SC, MSPH & Diploma/ MCPS Courses December 2022  at SMBB Medical University Larkana.', 'schedule-for-the-entry-test-of-msc-msph-diploma-mcps-courses-december-2022-at-smbb-medical-university-larkana-12-28-2022', 'admission'::announcement_category, NULL, '', '2022-12-28T09:00:00Z', '[]'::jsonb, NULL),
('Schedule for entry test for the PH.D and MPHIL course December 2022 at SMBB Medical University Larkana', 'schedule-for-entry-test-for-the-phd-and-mphil-course-december-2022-at-smbb-medical-university-larkana-12-28-2022', 'admission'::announcement_category, NULL, '', '2022-12-28T09:00:00Z', '[]'::jsonb, NULL),
('Schedule for entry test MD / MS PART-I December 2022 at SMBB Medical University Larkana', 'schedule-for-entry-test-md-ms-part-i-december-2022-at-smbb-medical-university-larkana-12-28-2022', 'admission'::announcement_category, NULL, '', '2022-12-28T09:00:00Z', '[]'::jsonb, NULL),
('Schedule for entry tests FCPS-II Training Programs December 2022 at SMBB Medical University Larkana', 'schedule-for-entry-tests-fcps-ii-training-programs-december-2022-at-smbb-medical-university-larkana-12-28-2022', 'admission'::announcement_category, NULL, '', '2022-12-28T09:00:00Z', '[]'::jsonb, NULL),
('Result of Sucessful Candidates of CHPE Training', 'result-of-sucessful-candidates-of-chpe-training-12-20-2022', 'examination'::announcement_category, NULL, '', '2022-12-20T09:00:00Z', '[]'::jsonb, NULL),
('Applications on prescribed forms are invited from interested IN-SERVICE / PRIVATE Candidates for admissions to Training/Residency  programs (as given below) for the Session January 2023 at  SMBBMU, Larkana.', 'pplications-on-prescribed-forms-are-invited-from-interested-in-service-private-candidates-for-admissions-to-trainingresidency-programs-as-given-below-for-the-session-january-2023-at-smbbmu-larkana-11-30-2022', 'admission'::announcement_category, NULL, '', '2022-11-30T09:00:00Z', '[]'::jsonb, NULL),
('ADMISSION FOR CERTIFICATE IN HEALTH PROFESSIONS EDUCATION (C-HPE) SESSION 2023', 'admission-for-certificate-in-health-professions-education-c-hpe-session-2023-11-30-2022', 'admission'::announcement_category, 'Application Form', 'Application Form', '2022-11-30T09:00:00Z', '[{"name":"Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/form-16700505710.pdf","size_kb":118}]'::jsonb, NULL),
('Notice of Instruction for the candidates appearing in MDCAT test', 'notice-of-instruction-for-the-candidates-appearing-in-mdcat-test-11-10-2022', 'circular'::announcement_category, 'for further details please visit the link for the instruction Video. https://drive.google.com/drive/folders/1KaxdQlf6_GTQhL9noT5D0zP-KfBUyMOH', 'for further details please visit the link for the instruction Video.
https://drive.google.com/drive/folders/1KaxdQlf6_GTQhL9noT5D0zP-KfBUyMOH', '2022-11-10T09:00:00Z', '[]'::jsonb, NULL),
('Circular for Diwali Holiday for Hindu Community', 'circular-for-diwali-holiday-for-hindu-community-10-22-2022', 'circular'::announcement_category, NULL, '', '2022-10-22T09:00:00Z', '[]'::jsonb, NULL),
('Circular for Postgraduate Examination of Session September, 2022', 'circular-for-postgraduate-examination-of-session-september-2022-10-13-2022', 'examination'::announcement_category, NULL, '', '2022-10-13T09:00:00Z', '[]'::jsonb, NULL),
('Notification Regarding Resuming of Academic Activities at SMBB Medical University and it''s Constituent Collages', 'notification-regarding-resuming-of-academic-activities-at-smbb-medical-university-and-its-constituent-collages-09-16-2022', 'circular'::announcement_category, NULL, '', '2022-09-16T09:00:00Z', '[]'::jsonb, NULL),
('Declaration of Results of Postgraduate Examination held in August 2022', 'declaration-of-results-of-postgraduate-examination-held-in-august-2022-09-11-2022', 'examination'::announcement_category, NULL, '', '2022-09-11T09:00:00Z', '[]'::jsonb, NULL),
('Declaration of Results of Postgraduate Examination held in June 2022', 'declaration-of-results-of-postgraduate-examination-held-in-june-2022-09-11-2022', 'examination'::announcement_category, NULL, '', '2022-09-11T09:00:00Z', '[]'::jsonb, NULL),
('Establishment of Contact Committee for students to participate in Flood Relief Camp at SMBB Medical University and its constituent collages / Institutes', 'establishment-of-contact-committee-for-students-to-participate-in-flood-relief-camp-at-smbb-medical-university-and-its-constituent-collages-institutes-08-30-2022', 'circular'::announcement_category, NULL, '', '2022-08-30T09:00:00Z', '[]'::jsonb, NULL),
('Circular for Suspension of Academic Activities due to Heavy Rainfall', 'circular-for-suspension-of-academic-activities-due-to-heavy-rainfall-08-20-2022', 'circular'::announcement_category, NULL, '', '2022-08-20T09:00:00Z', '[]'::jsonb, NULL),
('Circular for Holiday due to Heavy Rainfall', 'circular-for-holiday-due-to-heavy-rainfall-08-17-2022', 'circular'::announcement_category, NULL, '', '2022-08-17T09:00:00Z', '[]'::jsonb, NULL),
('Circular for Suspension of Academic Activities due to Heavy Rainfall', 'circular-for-suspension-of-academic-activities-due-to-heavy-rainfall-08-17-2022', 'circular'::announcement_category, NULL, '', '2022-08-17T09:00:00Z', '[]'::jsonb, NULL),
('Declaration of Results of Postgraduate Examination held in June and July 2022', 'declaration-of-results-of-postgraduate-examination-held-in-june-and-july-2022-08-16-2022', 'examination'::announcement_category, NULL, '', '2022-08-16T09:00:00Z', '[]'::jsonb, NULL),
('Declaration of Results of Postgraduate Examination held in August 2022', 'declaration-of-results-of-postgraduate-examination-held-in-august-2022-08-16-2022', 'examination'::announcement_category, NULL, '', '2022-08-16T09:00:00Z', '[]'::jsonb, NULL),
('Circular for Rain Emergency at SMBB Medical University Larkana', 'circular-for-rain-emergency-at-smbb-medical-university-larkana-08-01-2022', 'circular'::announcement_category, NULL, '', '2022-08-01T09:00:00Z', '[]'::jsonb, NULL),
('Office Order for Extension in Summer Vacation 2022 at SMBB Medical University Larkana.', 'office-order-for-extension-in-summer-vacation-2022-at-smbb-medical-university-larkana-07-30-2022', 'circular'::announcement_category, NULL, '', '2022-07-30T09:00:00Z', '[]'::jsonb, NULL),
('List of Affiliated Collages with SMBB Medical University Larkana', 'list-of-affiliated-collages-with-smbb-medical-university-larkana-07-28-2022', 'circular'::announcement_category, NULL, '', '2022-07-28T09:00:00Z', '[]'::jsonb, NULL),
('Announcement if Result of Post-Graduate Entry Test June, 2022 (Session July 2022) at SMBB Medical University Larkana', 'announcement-if-result-of-post-graduate-entry-test-june-2022-session-july-2022-at-smbb-medical-university-larkana-07-27-2022', 'examination'::announcement_category, 'Results', 'Results', '2022-07-27T09:00:00Z', '[{"name":"Results.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/results-16589238370.pdf","size_kb":2150}]'::jsonb, NULL),
('Call for Interviews of Successful candidates of Post-Graduate Entry Test June 2022 (Session July 2022) at SMBB Medical University Larkana', 'call-for-interviews-of-successful-candidates-of-post-graduate-entry-test-june-2022-session-july-2022-at-smbb-medical-university-larkana-07-27-2022', 'admission'::announcement_category, NULL, '', '2022-07-27T09:00:00Z', '[]'::jsonb, NULL),
('ANNOUNCEMENT OF ENTRY TEST/INTERVIEW FOR ADMISSIONS IN POSTGRAGUATE COURSES SESSION JULY 2022 AT SMBB MEDICAL UNIVERSITY, LARKANA.', 'announcement-of-entry-test-interview-for-admissions-in-postgraduate-courses-session-july-2022-at-smbb-medical-university-larkana', 'admission'::announcement_category, 'NOTIFICATION', 'NOTIFICATION', '2022-07-21T09:00:00Z', '[]'::jsonb, NULL),
('Notification for formation of Committee for Academic Calendar of all Contituent Collages/ Institutes of SMBB Medical University Larkana', 'notification-for-formation-of-committee-for-academic-calendar-of-all-contituent-collages-institutes-of-smbb-medical-university-larkana-07-06-2022', 'circular'::announcement_category, 'Notification', 'Notification', '2022-07-06T09:00:00Z', '[]'::jsonb, NULL),
('Postponed of Postgraduate Entry test for the July 2022 Session SMBB Medical University, Larkana.', 'postponed-of-postgraduate-entry-test-for-the-july-2022-session-smbb-medical-university-larkana-06-27-2022', 'admission'::announcement_category, 'Notification Notification', 'Notification
Notification', '2022-06-27T09:00:00Z', '[{"name":"Notification.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/notification-16563458660.pdf","size_kb":217}]'::jsonb, NULL),
('Corrigendum for Postgraduate Programs for the Session July 2022 at SMBB Medical University Larkana.', 'corrigendum-for-postgraduate-programs-for-the-session-july-2022-at-smbb-medical-university-larkana-06-14-2022', 'circular'::announcement_category, NULL, '', '2022-06-14T09:00:00Z', '[]'::jsonb, NULL),
('Notification regarding reduced 40% POL', 'notification-regarding-reduced-40-pol-06-04-2022', 'circular'::announcement_category, 'Notification', 'Notification', '2022-06-04T09:00:00Z', '[]'::jsonb, NULL),
('Workshop Schedule for the Supervisors and Postgraduate Trainees', 'workshop-schedule-for-the-supervisors-and-postgraduate-trainees-06-01-2022', 'circular'::announcement_category, 'Notifications Notice for Workshops', 'Notifications
Notice for Workshops', '2022-06-01T09:00:00Z', '[{"name":"Notice Of Workshops.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/notice-of-workshops-16541080670.pdf","size_kb":185}]'::jsonb, NULL),
('Admissions of Postgraduate Courses for the session of  July 2022 at SMBB Medical University, Larkana.', 'admissions-of-postgraduate-courses-for-the-session-of-july-2022-at-smbb-medical-university-larkana-05-30-2022', 'admission'::announcement_category, 'NOTIFICATION Advertisement', 'NOTIFICATION
Advertisement', '2022-05-30T09:00:00Z', '[{"name":"Advertisement.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/advertisement-16539191510.pdf","size_kb":878}]'::jsonb, NULL),
('Applications are invited to fill the vacant seats of B.Sc Nursing (Post RN)', 'applications-are-invited-to-fill-the-vacant-seats-of-bsc-nursing-post-rn-05-26-2022', 'circular'::announcement_category, 'Notification Form and Challan', 'Notification
Form and Challan', '2022-05-26T09:00:00Z', '[{"name":"Form And Challan.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/form-and-challan-16535515730.pdf","size_kb":177}]'::jsonb, NULL),
('Admission for Certificate in Health Professions Education (C-HPE) Session 2022', 'admission-for-certificate-in-health-professions-education-c-hpe-session-2022-04-18-2022', 'admission'::announcement_category, 'Application Form', 'Application Form', '2022-04-18T09:00:00Z', '[{"name":"Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/form-16502916770.pdf","size_kb":118}]'::jsonb, NULL),
('Admissions To 1st Year BSN(Generic) on UEAP Local Basis for Session 2021-22', 'admissions-to-1st-year-bsngeneric-on-ueap-local-basis-for-session-2021-22-04-18-2022', 'admission'::announcement_category, 'Application Form', 'Application Form', '2022-04-18T09:00:00Z', '[]'::jsonb, NULL),
('Notice for workshop on Assessment of Competence', 'notice-for-workshop-on-assessment-of-competence-04-16-2022', 'circular'::announcement_category, NULL, '', '2022-04-16T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Examination held in September 2021', 'result-of-postgraduate-examination-held-in-september-2021-03-28-2022', 'examination'::announcement_category, NULL, '', '2022-03-28T09:00:00Z', '[]'::jsonb, NULL),
('Result of Entry Test for Admission into Nursing Programs at SMBBMU for Session  2021-22 held on 06-03-2022', 'result-of-entry-test-for-admission-into-nursing-programs-at-smbbmu-for-session-2021-22-held-on-06-03-2022-03-08-2022', 'examination'::announcement_category, 'Result of Entry Test for Admission into Nursing Programs at SMBBMU for Session 2021-22 held on 06-03-2022 Objection Form can be filled by visiting this url :…', 'Result of Entry Test for Admission into Nursing Programs at SMBBMU for Session  2021-22 held on 06-03-2022
Objection Form can be filled by visiting this url :
https://admissions.smbbmu.edu.pk/objectionForm
Objection form can be filled online from 09-03-2022 to 11-03-2022 5:00 PM
PostRN
BSN(Generic)', '2022-03-08T09:00:00Z', '[{"name":"Postrn Result.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/postrn-result-16467609521.pdf","size_kb":156},{"name":"Bsn Result.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bsn-result-16467609520.pdf","size_kb":569}]'::jsonb, NULL),
('Notice for Workshop on Education Planning and Evaluation', 'notice-for-workshop-on-education-planning-and-evaluation-03-08-2022', 'circular'::announcement_category, NULL, '', '2022-03-08T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree(Clinical) Examination September 2021 held in the month of February 2022', 'result-of-postgraduate-degreeclinical-examination-september-2021-held-in-the-month-of-february-2022-03-07-2022', 'examination'::announcement_category, NULL, '', '2022-03-07T09:00:00Z', '[]'::jsonb, NULL),
('Answer key for Entry Test held on 06-03-2022 for Admission into BSN(GENERIC) for Session 2021-22', 'answer-key-for-entry-test-held-on-06-03-2022-for-admission-into-bsngeneric-for-session-2021-22-03-06-2022', 'admission'::announcement_category, 'Key Code E Key Code U Key Code T Key Code S Key Code Q', 'Key Code E
Key Code U
Key Code T
Key Code S
Key Code Q', '2022-03-06T09:00:00Z', '[]'::jsonb, NULL),
('Answer key for Entry Test held on 06-03-2022 for Admission into BSC(POSTRN) for Session 2021-22', 'answer-key-for-entry-test-held-on-06-03-2022-for-admission-into-bscpostrn-for-session-2021-22-03-06-2022', 'admission'::announcement_category, 'Key Code T Key Code N Key Code G Key Code E Key Code A', 'Key Code T
Key Code N
Key Code G
Key Code E
Key Code A', '2022-03-06T09:00:00Z', '[]'::jsonb, NULL),
('Notice for commencement of classes of Chandka Medical College, Larkana', 'notice-for-commencement-of-classes-of-chandka-medical-college-larkana-02-22-2022', 'circular'::announcement_category, NULL, '', '2022-02-22T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Day One Celebration of Golden Jubilee Batch -50 of Chandka Medical College Larkana', 'notice-for-day-one-celebration-of-golden-jubilee-batch-50-of-chandka-medical-college-larkana-02-22-2022', 'circular'::announcement_category, NULL, '', '2022-02-22T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Academic Session 2022 of MBBS at Chandka Medical College Larkana', 'notice-for-academic-session-2022-of-mbbs-at-chandka-medical-college-larkana-02-12-2022', 'circular'::announcement_category, NULL, '', '2022-02-12T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Degree and Diploma Examination September 2021', 'result-of-postgraduate-degree-and-diploma-examination-september-2021-02-11-2022', 'examination'::announcement_category, 'Download Result', 'Download Result', '2022-02-11T09:00:00Z', '[{"name":"Declaration Of Result.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/declaration-of-result-16448418100.pdf","size_kb":1966}]'::jsonb, NULL),
('Recommendation of 41st Selection Board held on 28th January 2022', 'recommendation-of-41st-selection-board-held-on-28th-january-2022-02-10-2022', 'circular'::announcement_category, NULL, '', '2022-02-10T09:00:00Z', '[]'::jsonb, NULL),
('Recommendation of 42nd Selection Board held on 29th January 2022', 'recommendation-of-42nd-selection-board-held-on-29th-january-2022-02-10-2022', 'circular'::announcement_category, NULL, '', '2022-02-10T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Construction for Central/Digital Library and  Central Masjid at SMBB Medical University(Arija)', 'notice-inviting-tender-for-construction-for-centraldigital-library-and-central-masjid-at-smbb-medical-universityarija-01-21-2022', 'tender'::announcement_category, 'Masjid Drawings Library Drawings Annual Procurement Plan BOQ Library BOQ Masjid Tender Documents Masjid Tender Documents Library NIT', 'Masjid Drawings
Library Drawings
Annual Procurement Plan
BOQ Library
BOQ Masjid
Tender Documents Masjid
Tender Documents Library
NIT', '2022-01-21T09:00:00Z', '[{"name":"Annual Procurement Plan Fy 21 22.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-procurement-plan-fy-21-22-16427654371.pdf","size_kb":136},{"name":"Boq Library.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/boq-library-16427654370.pdf","size_kb":1410},{"name":"Boq Masjid.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/boq-masjid-16427647842.pdf","size_kb":1161},{"name":"Library Bidding Documents.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/library-bidding-documents-16427647841.pdf","size_kb":2189},{"name":"Library Bidding Documents.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/library-bidding-documents-16427647840.pdf","size_kb":2189},{"name":"Nit.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-16427646140.pdf","size_kb":338}]'::jsonb, NULL),
('Workshop on Research Methodology Biostatics and SPSS Referencing Software', 'workshop-on-research-methodology-biostatics-and-spss-referencing-software-12-24-2021', 'circular'::announcement_category, NULL, '', '2021-12-24T09:00:00Z', '[]'::jsonb, NULL),
('Result of Postgraduate Entry Tests and MD/MS Part-I Examination December 2021', 'result-of-postgraduate-entry-tests-and-mdms-part-i-examination-december-2021-12-22-2021', 'examination'::announcement_category, 'MD/MS Dermatology Download Result', 'MD/MS Dermatology
Download Result', '2021-12-22T09:00:00Z', '[{"name":"Md Ms 1 Result.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/md-ms-1-result-16401576900.pdf","size_kb":2099}]'::jsonb, NULL),
('Notice for Interviews of FCPS-II for Session January 2021-22', 'notice-for-interviews-of-fcps-ii-for-session-january-2021-22-12-22-2021', 'job'::announcement_category, NULL, '', '2021-12-22T09:00:00Z', '[]'::jsonb, NULL),
('Admissions for MBBS/BDS for Session 2021-22', 'admissions-for-mbbsbds-for-session-2021-22-12-12-2021', 'admission'::announcement_category, NULL, '', '2021-12-12T09:00:00Z', '[]'::jsonb, NULL),
('Notice for resumption of academic activities of constituent colleges of SMBBMU', 'notice-for-resumption-of-academic-activities-of-constituent-colleges-of-smbbmu-11-25-2021', 'circular'::announcement_category, NULL, '', '2021-11-25T09:00:00Z', '[]'::jsonb, NULL),
('Postgraduate Admissions for Session January 2022', 'postgraduate-admissions-for-session-january-2022-11-15-2021', 'admission'::announcement_category, NULL, '', '2021-11-15T09:00:00Z', '[]'::jsonb, NULL),
('Migration/Transfer Policy of the University for MBBS/BDS students', 'migrationtransfer-policy-of-the-university-for-mbbsbds-students-10-26-2021', 'admission'::announcement_category, '1. Migration / transfer policy of SMBB, Medical University, shall be in accordance with Pakistan Medical Commission’s regulations 2021. 2. As per decision of Provincial Admission Committee, in its…', '1.
Migration / transfer policy of SMBB, Medical University, shall be in accordance with Pakistan Medical Commission’s regulations 2021.
2.
As per decision of Provincial Admission Committee, in its meeting dated: 21/10/2021, following additional criteria shall be observed, while allowing migration/ transfer in Public Sector Universities/ colleges of Sindh.
Migration of students to and from the private Medical Universities / college shall not be allowed under any circumstances.
Migration is allowed once during the entire period of medical education of a student.
All scholarships / financial assistance shall be cancelled once the student migrates to another college/institution and is not transferable.
The migrated student shall not claim any compensation for the loss of time due to differences in starting / ending of academic sessions in examination schedule between concerned institutions.
Migration is not possible if the curriculum being followed in both universities is different (Integrated Modular and conventional)
NOC from relieving and recipient university/college shall be required.', '2021-10-26T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Position for Director Finance at Chandka Medical College Hospital has been Canceled/Withdrawn', 'notice-for-position-for-director-finance-at-chandka-medical-college-hospital-has-been-canceledwithdrawn-10-21-2021', 'circular'::announcement_category, NULL, '', '2021-10-21T09:00:00Z', '[]'::jsonb, NULL),
('Notice for candidates domiciled in the province of Sindh to fill the online form', 'notice-for-candidates-domiciled-in-the-province-of-sindh-to-fill-the-online-form-10-18-2021', 'circular'::announcement_category, 'All the candidates domiciled in the province of Sindh and desirous of admission in MBBS/BDS course who have appeared in MDCAT 2021 are required to fill up the data collection form available on the…', 'All the candidates domiciled in the province of Sindh and desirous of admission in MBBS/BDS course who have appeared in MDCAT 2021 are required to fill up the data collection form available on the website
admissions.smbbmu.edu.pk
upto
23-10-2021
. This activity is only for data collection and does not guarantee the admission in any medical or dental college of province.', '2021-10-18T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Submission of Research Papers in Journal of SMBB Medical University Larkana', 'notice-for-submission-of-research-papers-in-journal-of-smbb-medical-university-larkana-09-16-2021', 'circular'::announcement_category, 'Rules', 'Rules', '2021-09-16T09:00:00Z', '[{"name":"Contents Jsmbbmu 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/contents-jsmbbmu-1-16322558160.pdf","size_kb":492}]'::jsonb, NULL),
('Tution Fee for Various Categories of Admission in MBBS/BDS Course related to all constituent colleges of SMBBMU', 'tution-fee-for-various-categories-of-admission-in-mbbsbds-course-related-to-all-constituent-colleges-of-smbbmu-09-03-2021', 'admission'::announcement_category, 'Tution Fees Structure Sr# Category Fees per year 1. Merit Rs. 31,900 2. UEAP Local Rs. 440,000 3. UEAP Overseas Pakistanis / Foreign Nationals US $ 10,500 CONSTITUENT COLLEGES ARE: Chandka Medical…', 'Tution Fees Structure
Sr#
Category
Fees per year
1.
Merit
Rs. 31,900
2.
UEAP Local
Rs. 440,000
3.
UEAP Overseas Pakistanis  / Foreign Nationals
US $ 10,500
CONSTITUENT COLLEGES ARE:
Chandka Medical College, Larkana
Ghulam Muhammad Mahar Medical College, Sukkur
Bibi Aseefa Dental College, Larkana', '2021-09-03T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Academic Activities / Physical Classes resumption at SMBB Medical University and its constituent colleges', 'notice-for-academic-activities-physical-classes-resumption-at-smbb-medical-university-and-its-constituent-colleges-08-28-2021', 'circular'::announcement_category, NULL, '', '2021-08-28T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Academic Activities / Physical Classes resumption at SMBB Medical University and its constituent colleges', 'notice-for-academic-activities-physical-classes-resumption-at-smbb-medical-university-and-its-constituent-colleges-08-23-2021', 'circular'::announcement_category, NULL, '', '2021-08-23T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Designing and Printing of Prospectus 2021-22 for admission in MBBS & BDS', 'notice-inviting-tender-for-designing-and-printing-of-prospectus-2021-22-for-admission-in-mbbs-bds-08-17-2021', 'tender'::announcement_category, NULL, '', '2021-08-17T09:00:00Z', '[]'::jsonb, NULL),
('Corrigendum for NIT for Supply of Furniture & Fixture of Boys Hostel, SMBB Medical University Larkana', 'corrigendum-for-nit-for-supply-of-furniture-fixture-of-boys-hostel-smbb-medical-university-larkana-08-17-2021', 'tender'::announcement_category, NULL, '', '2021-08-17T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Supply of Furniture & Fixture of Boys Hostel, SMBB Medical University Larkana', 'notice-inviting-tender-for-supply-of-furniture-fixture-of-boys-hostel-smbb-medical-university-larkana-08-02-2021', 'tender'::announcement_category, NULL, '', '2021-08-02T09:00:00Z', '[]'::jsonb, NULL),
('Notice for closure of Academic Activities / Physical Classes at SMBB Medical University and its constituent colleges', 'notice-for-closure-of-academic-activities-physical-classes-at-smbb-medical-university-and-its-constituent-colleges-07-24-2021', 'circular'::announcement_category, NULL, '', '2021-07-24T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Closure of SMBBMU and its constituent colleges on Eid-Ul-Adha', 'notice-for-closure-of-smbbmu-and-its-constituent-colleges-on-eid-ul-adha-07-16-2021', 'circular'::announcement_category, NULL, '', '2021-07-16T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Interviews of Successful Candidates of Different Specialties for Session July 2021', 'notice-for-interviews-of-successful-candidates-of-different-specialties-for-session-july-2021-06-22-2021', 'job'::announcement_category, NULL, '', '2021-06-22T09:00:00Z', '[]'::jsonb, NULL),
('Result of MD/MS Part-I and Entry Test of M.Phil, Diploma, MCPS and FCPS-II for Session July 2021', 'result-of-mdms-part-i-and-entry-test-of-mphil-diploma-mcps-and-fcps-ii-for-session-july-2021-06-22-2021', 'examination'::announcement_category, 'Diploma MD/MS Part - I FCPS-II', 'Diploma
MD/MS Part - I
FCPS-II', '2021-06-22T09:00:00Z', '[{"name":"Diploma July 2021.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/diploma-july-2021-16243554571.pdf","size_kb":639},{"name":"Md Ms Page 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/md-ms-page-1-16243554570.pdf","size_kb":442},{"name":"Fcps Ii.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/fcps-ii-16243551260.pdf","size_kb":767}]'::jsonb, NULL),
('Notice for Invitation of applications for promotion from Professor (BS-21) to Meritorious Professor (BS-22)', 'notice-for-invitation-of-applications-for-promotion-from-professor-bs-21-to-meritorious-professor-bs-22-06-15-2021', 'circular'::announcement_category, NULL, '', '2021-06-15T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Academic Activities / Physical Classes resumption at SMBB Medical University and its constituent colleges', 'notice-for-academic-activities-physical-classes-resumption-at-smbb-medical-university-and-its-constituent-colleges-06-07-2021', 'circular'::announcement_category, NULL, '', '2021-06-07T09:00:00Z', '[]'::jsonb, NULL),
('Request for proposal for Establishment of Center for Advanced Research in molecular, Genetic and Allied Facilities, at Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU) Larkana', 'request-for-proposal-for-establishment-of-center-for-advanced-research-in-molecular-genetic-and-allied-facilities-at-shaheed-mohtarma-benazir-bhutto-medical-university-smbbmu-larkana-06-03-2021', 'tender'::announcement_category, NULL, '', '2021-06-03T09:00:00Z', '[]'::jsonb, NULL),
('Result of Diploma in Medical Radio-Diagnosis(DMRD) Part - I', 'result-of-diploma-in-medical-radio-diagnosisdmrd-part-i-06-03-2021', 'examination'::announcement_category, NULL, '', '2021-06-03T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of Entry Test for M.PHIL, Diploma & MCPS Courses', 'time-table-of-entry-test-for-mphil-diploma-mcps-courses-06-03-2021', 'examination'::announcement_category, NULL, '', '2021-06-03T09:00:00Z', '[]'::jsonb, NULL),
('Time Table of Entry Test for MD/MS Part-I Examination', 'time-table-of-entry-test-for-mdms-part-i-examination-06-03-2021', 'examination'::announcement_category, NULL, '', '2021-06-03T09:00:00Z', '[]'::jsonb, NULL),
('Notice for modification of date of entry test for admission for postgraduate courses for session july 2021', 'notice-for-modification-of-date-of-entry-test-for-admission-for-postgraduate-courses-for-session-july-2021-05-26-2021', 'admission'::announcement_category, NULL, '', '2021-05-26T09:00:00Z', '[]'::jsonb, NULL),
('Circular for Eid-UL-Fitr 2021 Holidays', 'circular-for-eid-ul-fitr-2021-holidays-05-07-2021', 'circular'::announcement_category, NULL, '', '2021-05-07T09:00:00Z', '[]'::jsonb, NULL),
('Circular for Online Classes', 'circular-for-online-classes-05-07-2021', 'circular'::announcement_category, NULL, '', '2021-05-07T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Construction of Central / Digital Library', 'notice-inviting-tender-for-construction-of-central-digital-library-05-05-2021', 'tender'::announcement_category, 'Tender Documents Tender Documents Complaint Redressal Committee Annual Procurement Plan', 'Tender Documents
Tender Documents
Complaint Redressal Committee
Annual Procurement Plan', '2021-05-05T09:00:00Z', '[{"name":"Final Tender Document.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/final-tender-document-16202975400.pdf","size_kb":3094},{"name":"Final Tender Document.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/final-tender-document-16202971862.pdf","size_kb":3094},{"name":"Complaint Redressal Committee.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/complaint-redressal-committee-16202971861.pdf","size_kb":315},{"name":"Annual Procurement Plan 21.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-procurement-plan-21-16202971860.pdf","size_kb":692}]'::jsonb, NULL),
('Result of fourth professional MBBS Fourth Year (Annual Examination)', 'result-of-fourth-professional-mbbs-fourth-year-annual-examination-04-28-2021', 'examination'::announcement_category, 'Page 2', 'Page 2', '2021-04-28T09:00:00Z', '[]'::jsonb, NULL),
('Result of first professional BDS First Year (Supplementary) examination', 'result-of-first-professional-bds-first-year-supplementary-examination-04-22-2021', 'examination'::announcement_category, NULL, '', '2021-04-22T09:00:00Z', '[]'::jsonb, NULL),
('Result of second professional BDS Second Year (Supplementary) examination', 'result-of-second-professional-bds-second-year-supplementary-examination-04-22-2021', 'examination'::announcement_category, NULL, '', '2021-04-22T09:00:00Z', '[]'::jsonb, NULL),
('Admissions for Postgraduate courses for the Session July 2021', 'admissions-for-postgraduate-courses-for-the-session-july-2021-04-20-2021', 'admission'::announcement_category, NULL, '', '2021-04-20T09:00:00Z', '[]'::jsonb, NULL),
('Result of Final Professional MBBS, Final Year (Annual) Examination, Session 2015-16', 'result-of-final-professional-mbbs-final-year-annual-examination-session-2015-16-04-19-2021', 'examination'::announcement_category, 'Page - 2', 'Page - 2', '2021-04-19T09:00:00Z', '[]'::jsonb, NULL),
('Time table for Postgraduate Degree / Diploma Theory Examinations March 2021', 'time-table-for-postgraduate-degree-diploma-theory-examinations-march-2021-04-05-2021', 'examination'::announcement_category, NULL, '', '2021-04-05T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Designing, Printing & Supply of Annual Report 2020-21', 'notice-inviting-tender-for-designing-printing-supply-of-annual-report-2020-21-03-30-2021', 'tender'::announcement_category, 'Tender Documents', 'Tender Documents', '2021-03-30T09:00:00Z', '[{"name":"Tender Document Ann.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/tender-document-ann-16176089060.pdf","size_kb":1854}]'::jsonb, NULL),
('Recommendation of selection board for different teaching and administrative posts held on 24th February 2021', 'recommendation-of-selection-board-for-different-teaching-and-administrative-posts-held-on-24th-february-2021-03-17-2021', 'circular'::announcement_category, 'Download Result', 'Download Result', '2021-03-17T09:00:00Z', '[{"name":"Result Selection Board.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-selection-board-16159765570.pdf","size_kb":1917}]'::jsonb, NULL),
('Notice Inviting Tender for M&R Works at SMBBMU', 'notice-inviting-tender-for-mr-works-at-smbbmu-03-05-2021', 'tender'::announcement_category, 'NIT Procurement Committee Complaint Redressal Committee Annual Procurement Plan Bidding Document for Quarter No.6 Bidding Document for PD Office Bidding Document for Forensic Medicine', 'NIT
Procurement Committee
Complaint Redressal Committee
Annual Procurement Plan
Bidding Document for Quarter No.6
Bidding Document for PD Office
Bidding Document for Forensic Medicine', '2021-03-05T09:00:00Z', '[{"name":"Nit Three Works.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-three-works-16152791150.pdf","size_kb":616},{"name":"Procurement Committee For Smbbmu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/procurement-committee-for-smbbmu-16152790582.pdf","size_kb":400},{"name":"Complaint Redressal Committee.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/complaint-redressal-committee-16152790581.pdf","size_kb":371},{"name":"Annual Procurement Plan 2020 21.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-procurement-plan-2020-21-16152790580.pdf","size_kb":538}]'::jsonb, NULL),
('Provisional List of Candidates who have Applied for Admission to DPT/PHARM-D Courses for Session 2020-21', 'provisional-list-of-candidates-who-have-applied-for-admission-to-dptpharm-d-courses-for-session-2020-21-03-03-2021', 'admission'::announcement_category, 'Download List', 'Download List', '2021-03-03T09:00:00Z', '[{"name":"Provisional List Dpt Pharmd 2020 21.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/provisional-list-dpt-pharmd-2020-21-16147574940.pdf","size_kb":261}]'::jsonb, NULL),
('Provisional List of Candidates who have Applied for Admission to  DPT/PHARM-D Courses for Session 2020-21', 'provisional-list-of-candidates-who-have-applied-for-admission-to-dptpharm-d-courses-for-session-2020-21-02-26-2021', 'admission'::announcement_category, 'Students can file their online objection at http://111.68.108.138/admission/public/objectionForm on provisional list with in three days Download List', 'Students can file their online objection at
http://111.68.108.138/admission/public/objectionForm
on provisional list with in three days
Download List', '2021-02-26T09:00:00Z', '[{"name":"List Dpt Pharm D.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/list-dpt-pharm-d-16143520650.pdf","size_kb":274}]'::jsonb, NULL),
('Notice Inviting Tender for M&R work of BADC and Repair & Renovation of (OLD CPSP) building', 'notice-inviting-tender-for-mr-work-of-badc-and-repair-renovation-of-old-cpsp-building-02-11-2021', 'tender'::announcement_category, 'NIT Bidding Document of Old CPSP Bidding Document of BADC Procurement Committee Complaint Redressal Committee Annual Procurement Plan', 'NIT
Bidding Document of Old CPSP
Bidding Document of BADC
Procurement Committee
Complaint Redressal Committee
Annual Procurement Plan', '2021-02-11T09:00:00Z', '[{"name":"Nit.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-16134545390.pdf","size_kb":568},{"name":"Procurement Committee For Smbbmu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/procurement-committee-for-smbbmu-16134544162.pdf","size_kb":400},{"name":"Annual Procurement Plan.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-procurement-plan-16134544160.pdf","size_kb":552}]'::jsonb, NULL),
('List of Candidates who have Applied for Admission to DPT /PHARM.D Courses for Session 2020-21', 'list-of-candidates-who-have-applied-for-admission-to-dpt-pharmd-courses-for-session-2020-21-02-11-2021', 'admission'::announcement_category, 'Students can file their online objection at admissions.smbbmu.edu.pk on provisional list with in three days Rejected / Not Eligible Candidates Download List', 'Students can file their online objection at
admissions.smbbmu.edu.pk
on provisional list with in three days
Rejected / Not Eligible Candidates
Download List', '2021-02-11T09:00:00Z', '[{"name":"13 02 2102 00 54 All Report.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/13-02-2102-00-54-all-report-16132089670.pdf","size_kb":419},{"name":"Dpt And D Pharmacy Provisional Merit List Cmc Dpt 20 21.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dpt-and-d-pharmacy-provisional-merit-list-cmc-dpt-20-21-16130677840.pdf","size_kb":976}]'::jsonb, NULL),
('Notice Inviting Tender for Pre-Qualification of contractors for construction of central / digital library', 'notice-inviting-tender-for-pre-qualification-of-contractors-for-construction-of-central-digital-library-02-10-2021', 'tender'::announcement_category, 'Annual Procurement Plan Approval of Procurement Committee Advertisement', 'Annual Procurement Plan
Approval of Procurement Committee
Advertisement', '2021-02-10T09:00:00Z', '[{"name":"Annual Procurement Plan.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-procurement-plan-16134570872.pdf","size_kb":40},{"name":"Approval Of Procurement Committee.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/approval-of-procurement-committee-16134570871.pdf","size_kb":348},{"name":"Advertisement For Hiring Of Contractor.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/advertisement-for-hiring-of-contractor-16134570870.pdf","size_kb":61}]'::jsonb, NULL),
('Result of Mid-Term Examination of MS Gynecology & Obsterics', 'result-of-mid-term-examination-of-ms-gynecology-obsterics-02-05-2021', 'examination'::announcement_category, NULL, '', '2021-02-05T09:00:00Z', '[]'::jsonb, NULL),
('Provisional list of candidates who applied for admission to BSc Nursing(Post-RN) at SMBBMU, Larkana', 'provisional-list-of-candidates-who-applied-for-admission-to-bsc-nursingpost-rn-at-smbbmu-larkana-02-02-2021', 'admission'::announcement_category, 'Download List', 'Download List', '2021-02-02T09:00:00Z', '[{"name":"Postrn.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/postrn-16122493660.pdf","size_kb":771}]'::jsonb, NULL),
('Provisional list of candidates who applied for admission to BSc Nursing(Generic) at SMBBMU, Larkana', 'provisional-list-of-candidates-who-applied-for-admission-to-bsc-nursinggeneric-at-smbbmu-larkana-02-02-2021', 'admission'::announcement_category, 'Download List', 'Download List', '2021-02-02T09:00:00Z', '[{"name":"11untouch Bsn Generic 4 Year 2020 21.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/11untouch-bsn-generic-4-year-2020-21-16122475780.pdf","size_kb":1949}]'::jsonb, NULL),
('Schedule of interview for the candidates provisionally selected to 1st year MBBS session 2020-21 for GMMMC Center', 'schedule-of-interview-for-the-candidates-provisionally-selected-to-1st-year-mbbs-session-2020-21-for-gmmmc-center-01-27-2021', 'job'::announcement_category, 'SCHEDULE OF INTERVIEW FOR THE CANDIDATES PROVISIONALLY SELECTED TO 1ST YEAR MBBS COURSE SESSION 2020-21, AT Principal Office Ghulam Muhammad Mahar Medical College , Sukkur. Name of District Date &…', 'SCHEDULE OF INTERVIEW FOR THE CANDIDATES PROVISIONALLY SELECTED TO 1ST YEAR MBBS COURSE SESSION 2020-21, AT Principal Office Ghulam Muhammad Mahar Medical College , Sukkur.
Name of District
Date & Time
Sukkur & Ghotki
29-01-2021 (Friday)
09:00 AM
Khairpur
30-01-2021 (Saturday)
09:00 AM
FOLLOWING ALL ORIGINAL DOCUMENTS MUST BE BROUGHT @  ADMISSIONS OFFICE GMMMC SUKKUR
OFFER LETTER
INTERMEDIATE MARK SHEET
MATRIC PAKKA CERTIFICATE
MATRIC MARK SHEET
STUDENT PRC
STUDENT DOMICILE
STUDENT CNIC/ B-FORM
FATHER’S DOMICILE & CNIC
AFFIDAVIT ON (RS. 100 STAMP PAPER)
06 (SIX) PHOTOGRAPHS OF CANDIDATE
02 SETS OF PHOTOSTAT COPY OF ALL ABOVE DOCUMENTS (ATTESTED).', '2021-01-27T09:00:00Z', '[]'::jsonb, NULL),
('Provisional List of Candidates who have applied for Admission to MBBS /BDS Courses on UEAP local basis for Session 2020-21 at Chandka Medical College Larkana', 'provisional-list-of-candidates-who-have-applied-for-admission-to-mbbs-bds-courses-on-ueap-local-basis-for-session-2020-21-at-chandka-medical-college-larkana-01-25-2021', 'admission'::announcement_category, 'Students can file their online objection at admissions.smbbmu.edu.pk on provisional list upto 27-01-2021 5:00 PM. No objection will be entertained after 27th of January 2021. Kambar-Shahdadkot…', 'Students can file their online objection at
admissions.smbbmu.edu.pk
on provisional list upto 27-01-2021 5:00 PM. No objection will be entertained after 27th of January 2021.
Kambar-Shahdadkot
Shikarpur
Naushahro-Feroze
Larkana
Kashmore
Jacobabad
Dadu', '2021-01-25T09:00:00Z', '[{"name":"K Shd New.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/k-shd-new-16116608360.pdf","size_kb":364},{"name":"Shp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/shp-16115954752.pdf","size_kb":372},{"name":"Nfz.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nfz-16115954751.pdf","size_kb":374},{"name":"Lrk.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/lrk-16115954750.pdf","size_kb":438},{"name":"Kshm.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/kshm-16115953272.pdf","size_kb":573},{"name":"Jcd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/jcd-16115953271.pdf","size_kb":388},{"name":"Dadu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dadu-16115953270.pdf","size_kb":371}]'::jsonb, NULL),
('Provisional List of Candidates who have applied for Admission to MBBS /BDS Courses on UEAP local basis for Session 2020-21 at Ghulam Muhammad Mahar Medical College Sukkur', 'provisional-list-of-candidates-who-have-applied-for-admission-to-mbbs-bds-courses-on-ueap-local-basis-for-session-2020-21-at-ghulam-muhammad-mahar-medical-college-sukkur-01-25-2021', 'admission'::announcement_category, 'Students can file their online objection at admissions.smbbmu.edu.pk on provisional list upto 27-01-2021 5:00 PM. No objection will be entertained after 27th of January 2021. Sukkur Khairpur Ghotki', 'Students can file their online objection at
admissions.smbbmu.edu.pk
on provisional list upto 27-01-2021 5:00 PM. No objection will be entertained after 27th of January 2021.
Sukkur
Khairpur
Ghotki', '2021-01-25T09:00:00Z', '[{"name":"Suk.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/suk-16115954172.pdf","size_kb":566},{"name":"Khp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/khp-16115954171.pdf","size_kb":595},{"name":"Ghotki.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ghotki-16115954170.pdf","size_kb":578}]'::jsonb, NULL),
('Schedule of interview for the candidates provisionally selected to 1st year MBBS session 2020-21 for CMC Center', 'schedule-of-interview-for-the-candidates-provisionally-selected-to-1st-year-mbbs-session-2020-21-for-cmc-center-01-21-2021', 'job'::announcement_category, 'SCHEDULE OF INTERVIEW FOR THE CANDIDATES PROVISIONALLY SELECTED TO 1ST YEAR MBBS COURSE SESSION 2020-21, AT SYNDIACATE HALL, CMC, SMBBMU, LARKANA. Name of District Date & Time JACOBABAD KASHMORE…', 'SCHEDULE OF INTERVIEW FOR THE CANDIDATES PROVISIONALLY SELECTED TO 1ST YEAR MBBS COURSE SESSION 2020-21, AT SYNDIACATE HALL, CMC, SMBBMU, LARKANA.
Name of District
Date & Time
JACOBABAD
KASHMORE
SHIKARPUR
23-01-2021 (SATURDAY)
10:00 AM
LARKANA
KAMBER-SHAHDADKOT
25-01-2021 (MONDAY)
10:00 AM
DADU
KNAUSHEHRO FEROZ
26-01-2021 (TUESDAY)
10:00 AM
FOLLOWING ALL ORIGINAL DOCUMENTS MUST BE BROUGHT @ DIRECTORATE OF ADMISSIONS SMBBMU LARKANA
OFFER LETTER
INTERMEDIATE MARK SHEET
MATRIC PAKKA CERTIFICATE
MATRIC MARK SHEET
STUDENT PRC
STUDENT DOMICILE
STUDENT CNIC/ B-FORM
FATHER’S DOMICILE & CNIC
AFFIDAVIT ON (RS. 100 STAMP PAPER)
06 (SIX) PHOTOGRAPHS OF CANDIDATE
02 SETS OF PHOTOSTAT COPY OF ALL ABOVE DOCUMENTS (ATTESTED).', '2021-01-21T09:00:00Z', '[]'::jsonb, NULL),
('Provisional List of Candidates who have Applied for Admission to MBBS /BDS Courses for Session 2020-21 at Chandka Medical College Larkana as on 18-01-2021', 'provisional-list-of-candidates-who-have-applied-for-admission-to-mbbs-bds-courses-for-session-2020-21-at-chandka-medical-college-larkana-as-on-18-01-2021-01-19-2021', 'admission'::announcement_category, 'Shikarpur Naushahro-Feroze Larkana Kambar - Shahdadkot Kashmore Jacobabad Dadu', 'Shikarpur
Naushahro-Feroze
Larkana
Kambar - Shahdadkot
Kashmore
Jacobabad
Dadu', '2021-01-19T09:00:00Z', '[{"name":"Shp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/shp-16110667496.pdf","size_kb":613},{"name":"Nfz.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nfz-16110667495.pdf","size_kb":794},{"name":"Lrk.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/lrk-16110667494.pdf","size_kb":766},{"name":"K Shd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/k-shd-16110667493.pdf","size_kb":675},{"name":"Kshm.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/kshm-16110667492.pdf","size_kb":872},{"name":"Jcd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/jcd-16110667491.pdf","size_kb":625},{"name":"Dadu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dadu-16110667490.pdf","size_kb":702}]'::jsonb, NULL),
('Provisional List of Candidates who have Applied for Admission to MBBS /BDS Courses for Session 2020-21 at Ghulam Muhammad Mahar Medical College Sukkur as on 18-01-2021', 'provisional-list-of-candidates-who-have-applied-for-admission-to-mbbs-bds-courses-for-session-2020-21-at-ghulam-muhammad-mahar-medical-college-sukkur-as-on-18-01-2021-01-19-2021', 'admission'::announcement_category, 'Khairpur Sukkur Ghotki', 'Khairpur
Sukkur
Ghotki', '2021-01-19T09:00:00Z', '[{"name":"Gmmmc Khp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/gmmmc-khp-16110675770.pdf","size_kb":1172},{"name":"Gmmmc Suk.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/gmmmc-suk-16110669822.pdf","size_kb":927},{"name":"Gmmmc Ghotki.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/gmmmc-ghotki-16110669820.pdf","size_kb":936}]'::jsonb, NULL),
('Candidate Selected on Reserved Seat for Disabled Candidate for Session 2020-21', 'candidate-selected-on-reserved-seat-for-disabled-candidate-for-session-2020-21-01-19-2021', 'admission'::announcement_category, 'Download', 'Download', '2021-01-19T09:00:00Z', '[{"name":"Disable Quota.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/disable-quota-16110671060.pdf","size_kb":305}]'::jsonb, NULL)
on conflict (slug) do update set title=excluded.title, category=excluded.category, excerpt=excluded.excerpt, body=excluded.body, published_at=excluded.published_at, attachments=excluded.attachments, photo_url=excluded.photo_url;

-- 03_announcements_04.sql
insert into announcements (title, slug, category, excerpt, body, published_at, attachments, photo_url) values
('List of Candidates Selected on Reserved Seats of DUHS Karachi,JSMU Karachi and FJMU Lahore for Session 2021 at SMBBMU CMC Center', 'list-of-candidates-selected-on-reserved-seats-of-duhs-karachijsmu-karachi-and-fjmu-lahore-for-session-2021-at-smbbmu-cmc-center-01-19-2021', 'admission'::announcement_category, 'Download List', 'Download List', '2021-01-19T09:00:00Z', '[{"name":"Reciprocal Lrk.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/reciprocal-lrk-16110673600.pdf","size_kb":528}]'::jsonb, NULL),
('List of Candidates Selected on Reserved Seats of DUHS Karachi,JSMU Karachi and FJMU Lahore for Session 2021 at SMBBMU GMMMC Center', 'list-of-candidates-selected-on-reserved-seats-of-duhs-karachijsmu-karachi-and-fjmu-lahore-for-session-2021-at-smbbmu-gmmmc-center-01-19-2021', 'admission'::announcement_category, 'Download List', 'Download List', '2021-01-19T09:00:00Z', '[{"name":"Sukgmmcduhsjsmu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sukgmmcduhsjsmu-16111356710.pdf","size_kb":506}]'::jsonb, NULL),
('Admissions for DPT/PHARM-D course for Session 2020-21', 'admissions-for-dptpharm-d-course-for-session-2020-21-01-19-2021', 'admission'::announcement_category, NULL, '', '2021-01-19T09:00:00Z', '[]'::jsonb, NULL),
('Advertisement for admission into 1st year MBBS/BDS on UEAP Local basis for session 2020-21', 'advertisement-for-admission-into-1st-year-mbbsbds-on-ueap-local-basis-for-session-2020-21-01-16-2021', 'admission'::announcement_category, 'Download Form', 'Download Form', '2021-01-16T09:00:00Z', '[{"name":"Application Form For Ueap Local Cmc B 49 2020 2021.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/application-form-for-ueap-local-cmc-b-49-2020-2021-16108024400.pdf","size_kb":72}]'::jsonb, NULL),
('Provisional list of candidates who have applied for Admission into 1st: year MBBS /BDS courses for session 2020-2021 at  Chandka Medical College Larkana', 'provisional-list-of-candidates-who-have-applied-for-admission-into-1st-year-mbbs-bds-courses-for-session-2020-2021-at-chandka-medical-college-larkana-01-14-2021', 'admission'::announcement_category, 'Students can file their online objection at admissions.smbbmu.edu.pk on provisional list upto 17-01-2021. No objection will be entertained after 17th of January 2021. District Naushahro - Feroze…', 'Students can file their online objection at
admissions.smbbmu.edu.pk
on provisional list upto 17-01-2021. No objection will be entertained after 17th of January 2021.
District Naushahro - Feroze
District Jacobabad
District Larkana
District Shikarpur
District Kambar - Shahdadkot
District Kashmore
District Dadu', '2021-01-14T09:00:00Z', '[{"name":"Nfz.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nfz-16107123230.pdf","size_kb":802},{"name":"Jcd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/jcd-16107122540.pdf","size_kb":627},{"name":"Lrk.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/lrk-16107121290.pdf","size_kb":769},{"name":"Shp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/shp-16106278852.pdf","size_kb":613},{"name":"K Shd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/k-shd-16106273912.pdf","size_kb":676},{"name":"Kshm.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/kshm-16106273911.pdf","size_kb":871},{"name":"Dadu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dadu-16106272560.pdf","size_kb":694}]'::jsonb, NULL),
('Provisional list of candidates who have applied for Admission into 1st: year MBBS /BDS courses for session 2020-2021 at Ghulam Muhammad Mahar Medical College Sukkur', 'provisional-list-of-candidates-who-have-applied-for-admission-into-1st-year-mbbs-bds-courses-for-session-2020-2021-at-ghulam-muhammad-mahar-medical-college-sukkur-01-14-2021', 'admission'::announcement_category, 'Students can file their online objection at admissions.smbbmu.edu.pk on provisional list upto 17-01-2021. No objection will be entertained after 17th of January 2021. District Khairpur District…', 'Students can file their online objection at
admissions.smbbmu.edu.pk
on provisional list upto 17-01-2021. No objection will be entertained after 17th of January 2021.
District Khairpur
District Sukkur
Ghotki', '2021-01-14T09:00:00Z', '[{"name":"Khp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/khp-16107790671.pdf","size_kb":1155},{"name":"Sukur.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sukur-16107790670.pdf","size_kb":916},{"name":"Ghotki.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ghotki-16106269292.pdf","size_kb":931}]'::jsonb, NULL),
('List of rejected / not eligible candidates who have applied for admission into MBBS/BDS course session 2020-21 @ SMBBMU Larkana', 'list-of-rejected-not-eligible-candidates-who-have-applied-for-admission-into-mbbsbds-course-session-2020-21-smbbmu-larkana-01-14-2021', 'admission'::announcement_category, 'Students can file their online objection at admissions.smbbmu.edu.pk on provisional list upto 17-01-2021. No objection will be entertained after 17th of January 2021. Download List', 'Students can file their online objection at
admissions.smbbmu.edu.pk
on provisional list upto 17-01-2021. No objection will be entertained after 17th of January 2021.
Download List', '2021-01-14T09:00:00Z', '[{"name":"List Of Rejected Files.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/list-of-rejected-files-16106281770.pdf","size_kb":467}]'::jsonb, NULL),
('Provisional list of candidates who applied for admission to BSc Nursing(Generic) at SMBBMU, Larkana', 'provisional-list-of-candidates-who-applied-for-admission-to-bsc-nursinggeneric-at-smbbmu-larkana-01-09-2021', 'admission'::announcement_category, 'List of rejected candidates List of eligible candidates', 'List of rejected candidates
List of eligible candidates', '2021-01-09T09:00:00Z', '[{"name":"Untouch Bsn Rejected 04 Year.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/untouch-bsn-rejected-04-year-16101801481.pdf","size_kb":507},{"name":"Untouch Bsn Generic 4 Year 2020 21.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/untouch-bsn-generic-4-year-2020-21-16101801480.pdf","size_kb":2472}]'::jsonb, NULL),
('Provisional list of candidates who applied for admission to BSc Nursing(Post RN) at SMBBMU, Larkana', 'provisional-list-of-candidates-who-applied-for-admission-to-bsc-nursingpost-rn-at-smbbmu-larkana-01-09-2021', 'admission'::announcement_category, 'List of eligible candidates', 'List of eligible candidates', '2021-01-09T09:00:00Z', '[{"name":"Bsn Post Rn.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bsn-post-rn-16101933460.pdf","size_kb":712}]'::jsonb, NULL),
('Notice for interviews of disabled candidates who have applied for admission for MBBS/BDS', 'notice-for-interviews-of-disabled-candidates-who-have-applied-for-admission-for-mbbsbds-01-09-2021', 'admission'::announcement_category, 'Notice All the candidates who have applied for admission to MBBS / BDS courses session 2020-21, are hereby informed that the interviews for Disabled persons shall be held on Thursday, the 1 4th of…', 'Notice
All the candidates who have applied for admission to MBBS / BDS courses session 2020-21,  are hereby informed that the interviews for
Disabled
persons shall be held on Thursday, the 1
4th of January 2021 at 12:00 PM
at Vice Chancellor''s Secretariat, SMBBMU, Larkana', '2021-01-09T09:00:00Z', '[]'::jsonb, NULL),
('Notice for interviews of hafiz-e-quran candidates who have applied for admission for MBBS/BDS', 'notice-for-interviews-of-hafiz-e-quran-candidates-who-have-applied-for-admission-for-mbbsbds-01-06-2021', 'admission'::announcement_category, 'NOTICE All the candidates who have applied for admission to MBBS / BDS courses session 2020-21, are hereby informed that the interviews for HAFIZ-E-QURAN persons shall be held on Thursday, the 1 4th…', 'NOTICE
All the candidates who have applied for admission to MBBS / BDS courses session 2020-21,  are hereby informed that the interviews for
HAFIZ-E-QURAN
persons shall be held on Thursday, the 1
4th of January 2021 on 10:00 AM
at Vice Chancellor''s Secretariat, SMBBMU, Larkana for CMC tagged districts & Principal Office GMMMC, Sukkur for GMMMC tagged districts.', '2021-01-06T09:00:00Z', '[]'::jsonb, NULL),
('Admissions for MBBS/BDS for Session 2020-21', 'admissions-for-mbbsbds-for-session-2020-21-01-01-2021', 'admission'::announcement_category, NULL, '', '2021-01-01T09:00:00Z', '[]'::jsonb, NULL),
('Notice for interviews for successful postgraduate students of different specialties', 'notice-for-interviews-for-successful-postgraduate-students-of-different-specialties-12-18-2020', 'job'::announcement_category, NULL, '', '2020-12-18T09:00:00Z', '[]'::jsonb, NULL),
('Result of entry test of Diploma, MSPH, MSc. MS/MD  PH.D, MPhil and FCPS-II', 'result-of-entry-test-of-diploma-msph-msc-msmd-phd-mphil-and-fcps-ii-12-16-2020', 'examination'::announcement_category, 'Download Result', 'Download Result', '2020-12-16T09:00:00Z', '[{"name":"Result Sheet.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-sheet-16081043210.pdf","size_kb":10680}]'::jsonb, NULL),
('Admissions for BS Nursing (Generic) & BSc Nursing (Post RN) at Benazir College of Nursing SMBBMU Larkana', 'admissions-for-bs-nursing-generic-bsc-nursing-post-rn-at-benazir-college-of-nursing-smbbmu-larkana-12-11-2020', 'admission'::announcement_category, 'Seats Distribution and Fees Structure Application Form Challan', 'Seats Distribution and Fees Structure
Application Form
Challan', '2020-12-11T09:00:00Z', '[{"name":"Smbbmu Application Form For Nursing Course 2020 21.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmu-application-form-for-nursing-course-2020-21-16079311770.pdf","size_kb":553},{"name":"Nursing Challan 2020 21.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nursing-challan-2020-21-16079308390.pdf","size_kb":113}]'::jsonb, NULL),
('Corrigendum for admission in Postgraduate programs for session January 2020', 'corrigendum-for-admission-in-postgraduate-programs-for-session-january-2020-11-19-2020', 'admission'::announcement_category, NULL, '', '2020-11-19T09:00:00Z', '[]'::jsonb, NULL),
('Result of BscN Year-II Semester-III regular examination Session 2017-18', 'result-of-bscn-year-ii-semester-iii-regular-examination-session-2017-18-11-16-2020', 'examination'::announcement_category, NULL, '', '2020-11-16T09:00:00Z', '[]'::jsonb, NULL),
('Result of first professional Pham-D first year (supplementary) examination session 2017-18', 'result-of-first-professional-pham-d-first-year-supplementary-examination-session-2017-18-11-14-2020', 'examination'::announcement_category, NULL, '', '2020-11-14T09:00:00Z', '[]'::jsonb, NULL),
('Result of second professional Pham-D second year (supplementary) examination session 2018-19', 'result-of-second-professional-pham-d-second-year-supplementary-examination-session-2018-19-11-14-2020', 'examination'::announcement_category, NULL, '', '2020-11-14T09:00:00Z', '[]'::jsonb, NULL),
('Result of third professional BDS third year (Annual) examination session 2016-17', 'result-of-third-professional-bds-third-year-annual-examination-session-2016-17-11-14-2020', 'examination'::announcement_category, NULL, '', '2020-11-14T09:00:00Z', '[]'::jsonb, NULL),
('Notice for 1st, 2nd, 3rd, 4th and 5th Professional MBBS', 'notice-for-1st-2nd-3rd-4th-and-5th-professional-mbbs-11-03-2020', 'circular'::announcement_category, NULL, '', '2020-11-03T09:00:00Z', '[]'::jsonb, NULL),
('Admissions for Postgraduate courses for the Session January 2021', 'admissions-for-postgraduate-courses-for-the-session-january-2021-11-02-2020', 'admission'::announcement_category, 'Application Form for Postgraduate Students Challan for Postgraduate Students', 'Application Form for Postgraduate Students
Challan for Postgraduate Students', '2020-11-02T09:00:00Z', '[{"name":"Smbbmul Form For P.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmul-form-for-p-15729553181.pdf","size_kb":138},{"name":"Challan Of Controller Postgraduate.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/challan-of-controller-postgraduate-15729553180.pdf","size_kb":65}]'::jsonb, NULL),
('Notice Inviting Tender for Renovation and Rehabilitation of IPRS and Reconstruction of Damaged Boundary wall at GMMMC', 'notice-inviting-tender-for-renovation-and-rehabilitation-of-iprs-and-reconstruction-of-damaged-boundary-wall-at-gmmmc-10-17-2020', 'tender'::announcement_category, 'Complaint Redressal Committee Procurement Committee Annual Procurement Plan Bidding Documents', 'Complaint Redressal Committee
Procurement Committee
Annual Procurement Plan
Bidding Documents', '2020-10-17T09:00:00Z', '[{"name":"Procurement Committee For Smbbmu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/procurement-committee-for-smbbmu-16031764740.pdf","size_kb":400},{"name":"Annual Procurement Plan 2020 21.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-procurement-plan-2020-21-16031764091.pdf","size_kb":903}]'::jsonb, NULL),
('Result of first professional MBBS First Year (Supplementary) examination', 'result-of-first-professional-mbbs-first-year-supplementary-examination-10-16-2020', 'examination'::announcement_category, NULL, '', '2020-10-16T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional MBBS Third Year (Supplementary) examination', 'result-of-third-professional-mbbs-third-year-supplementary-examination-10-16-2020', 'examination'::announcement_category, NULL, '', '2020-10-16T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional MBBS Second Year (Supplementary) examination', 'result-of-second-professional-mbbs-second-year-supplementary-examination-10-15-2020', 'examination'::announcement_category, NULL, '', '2020-10-15T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Ehsaas Undergraduate Scholarship Project Phase-II', 'notice-for-ehsaas-undergraduate-scholarship-project-phase-ii-10-15-2020', 'circular'::announcement_category, NULL, '', '2020-10-15T09:00:00Z', '[]'::jsonb, NULL),
('Notice for mandatory workshops for the post graduate trainees enrolled in various programs of the university', 'notice-for-mandatory-workshops-for-the-post-graduate-trainees-enrolled-in-various-programs-of-the-university-10-13-2020', 'circular'::announcement_category, 'BSN & PostRN Learning Outcomes Pharmacy Learning Outcomes DPT Learning Outcomes BDS Learning Outcomes MBBS Learning Outcomes OSCE Template OSPE Template BCQ Proforma Workshop Form Refund Claim Form', 'BSN & PostRN Learning Outcomes
Pharmacy Learning Outcomes
DPT Learning Outcomes
BDS Learning Outcomes
MBBS Learning Outcomes
OSCE Template
OSPE Template
BCQ Proforma
Workshop Form
Refund Claim Form', '2020-10-13T09:00:00Z', '[{"name":"Bcon Learning Outcome Bsn Bscn Postrn.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bcon-learning-outcome-bsn-bscn-postrn-16795979310.pdf","size_kb":363},{"name":"Pharmacy Learning Outcomes.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/pharmacy-learning-outcomes-16795978821.pdf","size_kb":852},{"name":"Dpt Learning Outcomes.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dpt-learning-outcomes-16795978820.pdf","size_kb":425},{"name":"Bds Learning Outcomes.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bds-learning-outcomes-16795978090.pdf","size_kb":3531},{"name":"Mbbs Learning Outcome.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/mbbs-learning-outcome-16795977050.pdf","size_kb":812},{"name":"Osce Template.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/osce-template-16795973341.pdf","size_kb":122},{"name":"Ospe Template.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ospe-template-16795973340.pdf","size_kb":119},{"name":"Bcq Submission Proforma.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bcq-submission-proforma-16144163370.pdf","size_kb":369},{"name":"Workshop Registration Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/workshop-registration-form-16043905590.pdf","size_kb":299},{"name":"Refund Claim Form Ok.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/refund-claim-form-ok-16029354070.pdf","size_kb":131}]'::jsonb, NULL),
('Admission in Public and Private Sector Medical and Dental Universities/Colleges of Sindh Province for Session 2020-21', 'admission-in-public-and-private-sector-medical-and-dental-universitiescolleges-of-sindh-province-for-session-2020-21-09-18-2020', 'admission'::announcement_category, 'Apply online on NTS Website https://nts.org.pk/Test&Products/Announced/0920/SMC_Sep2020_Online/index.php', 'Apply online on NTS Website
https://nts.org.pk/Test&Products/Announced/0920/SMC_Sep2020_Online/index.php', '2020-09-18T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Misc Items , Stationary, Office & Teaching Equipment, Fixture & Furniture and  Networking/Computerization of SMBB Medical University Larkana', 'notice-inviting-tender-for-misc-items-stationary-office-teaching-equipment-fixture-furniture-and-networkingcomputerization-of-smbb-medical-university-larkana-09-18-2020', 'tender'::announcement_category, 'Central Procurement Committee Complaint Redressal Committee Tender Documents for Office and Teaching Equipments Tender Document for Misc Items Advertisement in Daily Dawn Advertisement in Daily Jung…', 'Central Procurement Committee
Complaint Redressal Committee
Tender Documents for Office and Teaching Equipments
Tender Document for Misc Items
Advertisement in Daily Dawn
Advertisement in Daily Jung
Advertisement in Daily Kawish', '2020-09-18T09:00:00Z', '[{"name":"Teaching Office.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/teaching-office-16007650541.pdf","size_kb":2423},{"name":"Misc Stationary.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/misc-stationary-16007650540.pdf","size_kb":4461}]'::jsonb, NULL),
('Schedule for 1st and 2nd Professional MBBS(Supplementary) Theory & OSPE Examinations', 'schedule-for-1st-and-2nd-professional-mbbssupplementary-theory-ospe-examinations-09-15-2020', 'examination'::announcement_category, NULL, '', '2020-09-15T09:00:00Z', '[]'::jsonb, NULL),
('Schedule for 3rd and 4th Professional MBBS(Supplementary) Theory & OSPE Examinations', 'schedule-for-3rd-and-4th-professional-mbbssupplementary-theory-ospe-examinations-09-15-2020', 'examination'::announcement_category, NULL, '', '2020-09-15T09:00:00Z', '[]'::jsonb, NULL),
('Schedule for 4th Professional BDS Annual (Theory & OSPE / OSCE) Examinations', 'schedule-for-4th-professional-bds-annual-theory-ospe-osce-examinations-09-15-2020', 'examination'::announcement_category, NULL, '', '2020-09-15T09:00:00Z', '[]'::jsonb, NULL),
('Notice for re-opening of the university from 15th September 2020', 'notice-for-re-opening-of-the-university-from-15th-september-2020-09-14-2020', 'circular'::announcement_category, NULL, '', '2020-09-14T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Provide & Supply of equipment for the Institute of Physiotherapy & Rehabilitation Sciences', 'notice-inviting-tender-for-provide-supply-of-equipment-for-the-institute-of-physiotherapy-rehabilitation-sciences-08-31-2020', 'tender'::announcement_category, 'Central Procurement Committee Complaint Redressal Committee Tender Documents', 'Central Procurement Committee
Complaint Redressal Committee
Tender Documents', '2020-08-31T09:00:00Z', '[{"name":"Final Tds.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/final-tds-15998925820.pdf","size_kb":340}]'::jsonb, NULL),
('Request for proposal for consultancy services for preparation of drawings designs estimate & BOQs for project titled Construction Central/Digital Library CMC at SMBB Medical University Larkana', 'request-for-proposal-for-consultancy-services-for-preparation-of-drawings-designs-estimate-boqs-for-project-titled-construction-centraldigital-library-cmc-at-smbb-medical-university-larkana-08-28-2020', 'tender'::announcement_category, 'Updated RFP Document Corrigendum Advertisement Daily Kawish Advertisement Daily Jang Advertisement Daily Dawn Complaint Redressal Committee Consultant Selection Committee', 'Updated RFP Document
Corrigendum
Advertisement Daily Kawish
Advertisement Daily Jang
Advertisement Daily Dawn
Complaint Redressal Committee
Consultant Selection Committee', '2020-08-28T09:00:00Z', '[{"name":"Rfp Corregendum Final.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/rfp-corregendum-final-15995498540.pdf","size_kb":132},{"name":"Consultant Selection Committee.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/consultant-selection-committee-15994636690.pdf","size_kb":294}]'::jsonb, NULL),
('Ehsaas Undergraduate Scholarship Project Phase-II', 'ehsaas-undergraduate-scholarship-project-phase-ii-08-21-2020', 'circular'::announcement_category, NULL, '', '2020-08-21T09:00:00Z', '[]'::jsonb, NULL),
('Notice for MD/MS Mid-term/Part-II Final M.Phil & Diploma Examination March 2020', 'notice-for-mdms-mid-termpart-ii-final-mphil-diploma-examination-march-2020-08-19-2020', 'examination'::announcement_category, NULL, '', '2020-08-19T09:00:00Z', '[]'::jsonb, NULL),
('Schedule for online classes of Institute of Physiotherapy and Rehabilitation Sciences for the month of august', 'schedule-for-online-classes-of-institute-of-physiotherapy-and-rehabilitation-sciences-for-the-month-of-august-08-09-2020', 'circular'::announcement_category, 'View', 'View', '2020-08-09T09:00:00Z', '[{"name":"Time Table Iprs Aug Dpt Year 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-iprs-aug-dpt-year-1-15970362510.pdf","size_kb":151}]'::jsonb, NULL),
('Schedule for online classes of Institute of Pharmacy for the month of august', 'schedule-for-online-classes-of-institute-of-pharmacy-for-the-month-of-august-08-08-2020', 'circular'::announcement_category, 'First Year New Third Year Second Year First Year', 'First Year New
Third Year
Second Year
First Year', '2020-08-08T09:00:00Z', '[{"name":"Time Table Ipr Pharma Aug Year 1 New.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-ipr-pharma-aug-year-1-new-15970550830.pdf","size_kb":67},{"name":"Time Table Ipr Pharma Aug Year 3.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-ipr-pharma-aug-year-3-15970446712.pdf","size_kb":66},{"name":"Time Table Ipr Pharma Aug Year 2.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-ipr-pharma-aug-year-2-15970446711.pdf","size_kb":67},{"name":"Time Table Ipr Pharma Aug Year 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-ipr-pharma-aug-year-1-15970446700.pdf","size_kb":68}]'::jsonb, NULL),
('Schedule for online classes of Benazir College of Nursing for the month of august', 'schedule-for-online-classes-of-benazir-college-of-nursing-for-the-month-of-august-08-08-2020', 'circular'::announcement_category, NULL, '', '2020-08-08T09:00:00Z', '[]'::jsonb, NULL),
('Result of entry test of PhD, M.Phil, MSPH, MCPS, MD/MS-I and Diploma Courses for session July 2020', 'result-of-entry-test-of-phd-mphil-msph-mcps-mdms-i-and-diploma-courses-for-session-july-2020-08-05-2020', 'examination'::announcement_category, 'Result of PHD Result of Diploma Courses Result of MCPS Result of MS-I Result of MD-I Result of MSPH Result of MPHIL', 'Result of PHD
Result of Diploma Courses
Result of MCPS
Result of MS-I
Result of MD-I
Result of MSPH
Result of MPHIL', '2020-08-05T09:00:00Z', '[{"name":"Diplomas.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/diplomas-15966145116.pdf","size_kb":364}]'::jsonb, NULL),
('Schedule for online classes of CMC for the month of august', 'schedule-for-online-classes-of-cmc-for-the-month-of-august-08-05-2020', 'circular'::announcement_category, '1st Year 2nd Year 3rd Year 4th Year 5th Year', '1st Year
2nd Year
3rd Year
4th Year
5th Year', '2020-08-05T09:00:00Z', '[{"name":"Time Table Cmc Aug Year 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-cmc-aug-year-1-15967463524.pdf","size_kb":459},{"name":"Time Table Cmc Aug Year 2.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-cmc-aug-year-2-15967463523.pdf","size_kb":460},{"name":"Time Table Cmc Aug Year 3.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-cmc-aug-year-3-15967463522.pdf","size_kb":134},{"name":"Time Table Cmc Aug Year 4.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-cmc-aug-year-4-15967463521.pdf","size_kb":164},{"name":"Time Table Cmc Aug Year 5.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-cmc-aug-year-5-15967463520.pdf","size_kb":492}]'::jsonb, NULL),
('Schedule for online classes of GMMMC for the month of august', 'schedule-for-online-classes-of-gmmmc-for-the-month-of-august-08-05-2020', 'circular'::announcement_category, 'First Year Second Year Third Year Fourth Year Final Year', 'First Year
Second Year
Third Year
Fourth Year
Final Year', '2020-08-05T09:00:00Z', '[{"name":"Time Table Gmc Aug Year 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-gmc-aug-year-1-15969536744.pdf","size_kb":577},{"name":"Time Table Gmc Aug Year 2.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-gmc-aug-year-2-15969536743.pdf","size_kb":595},{"name":"Time Table Gmc Aug Year 3.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-gmc-aug-year-3-15969536742.pdf","size_kb":109},{"name":"Time Table Gmc Aug Year 4.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-gmc-aug-year-4-15969536741.pdf","size_kb":101},{"name":"Time Table Gmc Aug Year 5.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-gmc-aug-year-5-15969536740.pdf","size_kb":176}]'::jsonb, NULL),
('Time table for 1st and 2nd professional MBBS supplementary examination', 'time-table-for-1st-and-2nd-professional-mbbs-supplementary-examination-08-04-2020', 'examination'::announcement_category, NULL, '', '2020-08-04T09:00:00Z', '[]'::jsonb, NULL),
('Result of Final Professional MBBS Supplementary online examination', 'result-of-final-professional-mbbs-supplementary-online-examination-07-25-2020', 'examination'::announcement_category, NULL, '', '2020-07-25T09:00:00Z', '[]'::jsonb, NULL),
('Addendum for Admissions of Post Graduate Courses for the Session July, 2020', 'addendum-for-admissions-of-post-graduate-courses-for-the-session-july-2020-07-23-2020', 'admission'::announcement_category, NULL, '', '2020-07-23T09:00:00Z', '[]'::jsonb, NULL),
('Admissions for Postgraduate courses for the Session July 2020', 'admissions-for-postgraduate-courses-for-the-session-july-2020-07-06-2020', 'admission'::announcement_category, 'Application Form for Postgraduate Students Challan for Postgraduate Students', 'Application Form for Postgraduate Students
Challan for Postgraduate Students', '2020-07-06T09:00:00Z', '[{"name":"Smbbmul Form For P.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmul-form-for-p-15729553181.pdf","size_kb":138},{"name":"Challan Of Controller Postgraduate.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/challan-of-controller-postgraduate-15729553180.pdf","size_kb":65}]'::jsonb, NULL),
('Notice for closure of university and its constituent colleges', 'notice-for-closure-of-university-and-its-constituent-colleges-06-19-2020', 'circular'::announcement_category, NULL, '', '2020-06-19T09:00:00Z', '[]'::jsonb, NULL),
('Notice for supplementary examination', 'notice-for-supplementary-examination-06-10-2020', 'examination'::announcement_category, NULL, '', '2020-06-10T09:00:00Z', '[]'::jsonb, NULL),
('Time table for final professional MBBS online supplementary examination', 'time-table-for-final-professional-mbbs-online-supplementary-examination-06-10-2020', 'examination'::announcement_category, NULL, '', '2020-06-10T09:00:00Z', '[]'::jsonb, NULL),
('List of recommended and waiting candidates for Ehsaas Undergraduate Scholarship', 'list-fo-recommended-and-waiting-candidates-for-ehsaas-undergraduate-scholarship-06-06-2020', 'circular'::announcement_category, 'Download List', 'Download List', '2020-06-06T09:00:00Z', '[{"name":"Ehsaas Scholarhip Recommended And Waiting List.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ehsaas-scholarhip-recommended-and-waiting-list-15916101350.pdf","size_kb":74}]'::jsonb, NULL),
('Schedule for online classes', 'schedule-for-online-classes-05-27-2020', 'circular'::announcement_category, 'Final Year MBBS(Updated) Fourth Year MBBS(Updated) Third Year MBBS(Updated) Second Year MBBS(Updated) First Year MBBS(Updated) BSC Post RN Semester I BSN-Generic Semester I Third Year Pharm-D Second…', 'Final Year MBBS(Updated)
Fourth Year MBBS(Updated)
Third Year MBBS(Updated)
Second Year MBBS(Updated)
First Year MBBS(Updated)
BSC Post RN Semester I
BSN-Generic Semester I
Third Year Pharm-D
Second Year Pharm-D
First Year Pharm-D
First Year BDS
First Year DPT
Final Year MBBS
Fourth Year MBBS
Third Year MBBS
Second Year MBBS
First Year MBBS', '2020-05-27T09:00:00Z', '[{"name":"Cmc Time Table Final Year Mbbs 150620 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/cmc-time-table-final-year-mbbs-150620-1-15921976734.pdf","size_kb":527},{"name":"Cmc Time Table 4th Year Mbbs 150620.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/cmc-time-table-4th-year-mbbs-150620-15921976733.pdf","size_kb":480},{"name":"Cmc Time Table 3rd Year Mbbs 150620.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/cmc-time-table-3rd-year-mbbs-150620-15921976732.pdf","size_kb":27},{"name":"Cmc Time Table 2nd Year Mbbs 150620.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/cmc-time-table-2nd-year-mbbs-150620-15921976731.pdf","size_kb":441},{"name":"Cmc Time Table 1st Year Mbbs 150620.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/cmc-time-table-1st-year-mbbs-150620-15921976730.pdf","size_kb":441},{"name":"Bscn Post Rn Sem I New.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bscn-post-rn-sem-i-new-15909912221.pdf","size_kb":549},{"name":"Bsn Gen Sem 1 New.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bsn-gen-sem-1-new-15909912220.pdf","size_kb":464},{"name":"Time Table 3rd Year Pharm D B 01.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-3rd-year-pharm-d-b-01-15909911242.pdf","size_kb":457},{"name":"Time Table 2nd Year Pharm D B 02.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-2nd-year-pharm-d-b-02-15909911241.pdf","size_kb":456},{"name":"Time Table New 1st Year Pharm D B 04.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-new-1st-year-pharm-d-b-04-15909911240.pdf","size_kb":457},{"name":"Time Table For 1st Year Bds B09.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-for-1st-year-bds-b09-15906609372.pdf","size_kb":454},{"name":"Time Table For 1st Year Dpt B01.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-for-1st-year-dpt-b01-15906609371.pdf","size_kb":467},{"name":"Time Table Of Final Year Mbbs.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-of-final-year-mbbs-15906603764.pdf","size_kb":571},{"name":"Time Table Of 4th Year Mbbs.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-of-4th-year-mbbs-15906603763.pdf","size_kb":476},{"name":"Time Table Of 3rd Year Mbbs.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-of-3rd-year-mbbs-15906603762.pdf","size_kb":273},{"name":"Time Table Of 2nd Year Mbbs.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-of-2nd-year-mbbs-15906603761.pdf","size_kb":472},{"name":"Time Table Of 1st Year Mbbs.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/time-table-of-1st-year-mbbs-15906603760.pdf","size_kb":468}]'::jsonb, NULL),
('Notice Inviting Tender for ADP Scheme titled Renovation & Rehabilitation of Chandka Medical College and Construction of Noori Girls Hostel of SMBB Medical University Larkana', 'notice-inviting-tender-for-adp-scheme-titled-renovation-rehabilitation-of-chandka-medical-college-and-construction-of-noori-girls-hostel-of-smbb-medical-university-larkana-05-21-2020', 'tender'::announcement_category, NULL, '', '2020-05-21T09:00:00Z', '[]'::jsonb, NULL),
('Notice of training of teaching faculty for online classes', 'notice-of-training-of-teaching-faculty-for-online-classes-05-07-2020', 'circular'::announcement_category, NULL, '', '2020-05-07T09:00:00Z', '[]'::jsonb, NULL),
('Notice for IT Coordination/Focal Persons/Technical Support for online classes', 'notice-for-it-coordinationfocal-personstechnical-support-for-online-classes-05-06-2020', 'circular'::announcement_category, NULL, '', '2020-05-06T09:00:00Z', '[]'::jsonb, NULL),
('List of boys hostel allotments of chandka medical college', 'list-of-boys-hostel-allotments-of-chandka-medical-college-04-30-2020', 'circular'::announcement_category, 'List of hostel No.07 List of hostel No.09 List of hostel No.08 List of hostel No.06 List of hostel No.05', 'List of hostel No.07
List of hostel No.09
List of hostel No.08
List of hostel No.06
List of hostel No.05', '2020-04-30T09:00:00Z', '[]'::jsonb, NULL),
('Notice for registration of students for online classes', 'notice-for-registration-of-students-for-online-classes-04-25-2020', 'circular'::announcement_category, 'Click here to register', 'Click here to register', '2020-04-25T09:00:00Z', '[]'::jsonb, NULL),
('Notice for extension of due date of submission of Annual fees', 'notice-for-extension-of-due-date-of-submission-of-annual-fees-03-30-2020', 'circular'::announcement_category, NULL, '', '2020-03-30T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for ADP Scheme titled Renovation & Rehabilitation of  Chandka Medical College and Construction of Noori Girls Hostel of SMBB Medical University Larkana', 'notice-inviting-tender-for-adp-scheme-titled-renovation-rehabilitation-of-chandka-medical-college-and-construction-of-noori-girls-hostel-of-smbb-medical-university-larkana-03-20-2020', 'tender'::announcement_category, 'Annual Procurement Plan Tender Opening & Evaluation Committee Bidding Document of External Development Work of Hostel No.8 Bidding Document of Type-I Bungalows Bidding Document of Physiology…', 'Annual Procurement Plan
Tender Opening & Evaluation Committee
Bidding Document of External Development Work of Hostel No.8
Bidding Document of Type-I Bungalows
Bidding Document of Physiology Department
Bidding Document of Biochemistry Department
Bidding Document of Academic Block CMC', '2020-03-20T09:00:00Z', '[{"name":"Annual Procurement Plan.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-procurement-plan-15847782911.pdf","size_kb":163},{"name":"Tender Opening Evaluation Committee.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/tender-opening-evaluation-committee-15847782910.pdf","size_kb":314}]'::jsonb, NULL),
('Notice for the closure of SMBB Medical university and its constituent colleges', 'notice-for-the-closure-of-smbb-medical-university-and-its-constituent-colleges-03-18-2020', 'circular'::announcement_category, NULL, '', '2020-03-18T09:00:00Z', '[]'::jsonb, NULL),
('Corrigendum for the closure of SMBB Medical university and its constituent colleges', 'corrigendum-for-the-closure-of-smbb-medical-university-and-its-constituent-colleges-03-18-2020', 'circular'::announcement_category, NULL, '', '2020-03-18T09:00:00Z', '[]'::jsonb, NULL),
('Notice for closure of university and its constituent colleges', 'notice-for-closure-of-university-and-its-constituent-colleges-03-13-2020', 'circular'::announcement_category, NULL, '', '2020-03-13T09:00:00Z', '[]'::jsonb, NULL),
('Preliminary voter list for election to the authorities to university', 'preliminary-voter-list-for-election-to-the-authorities-to-university-03-11-2020', 'circular'::announcement_category, 'Associate Professors List Assistant Professors List Senior Registrars List Senior Lecturers List Officers List Non Voter List', 'Associate Professors List
Assistant Professors List
Senior Registrars List
Senior Lecturers List
Officers List
Non Voter List', '2020-03-11T09:00:00Z', '[{"name":"Associateprofessors.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/associateprofessors-15839433581.pdf","size_kb":949},{"name":"Assistantprofessors.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/assistantprofessors-15839433580.pdf","size_kb":1120},{"name":"Seniorregistrars.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/seniorregistrars-15839432753.pdf","size_kb":788},{"name":"Seniorlecturers.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/seniorlecturers-15839432752.pdf","size_kb":1711},{"name":"Officers.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/officers-15839432751.pdf","size_kb":820},{"name":"Nonvoters.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nonvoters-15839432750.pdf","size_kb":896}]'::jsonb, NULL),
('Result of Final Professional MBBS Final Year Annual Examination Session 2014-15', 'result-of-final-professional-mbbs-final-year-annual-examination-session-2014-15-03-07-2020', 'examination'::announcement_category, 'Download Result', 'Download Result', '2020-03-07T09:00:00Z', '[{"name":"Result Of Final Examination.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-of-final-examination-15839423500.pdf","size_kb":1879}]'::jsonb, NULL),
('Result of First Professional MBBS First Year Annual Examination Session 2018-19', 'result-of-first-professional-mbbs-first-year-annual-examination-session-2018-19-02-25-2020', 'examination'::announcement_category, 'Download Result', 'Download Result', '2020-02-25T09:00:00Z', '[{"name":"Firstyearresult.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/firstyearresult-15826940680.pdf","size_kb":2338}]'::jsonb, NULL),
('Result of Second Professional MBBS Second Year Annual Examination Session 2017-18', 'result-of-second-professional-mbbs-second-year-annual-examination-session-2017-18-02-25-2020', 'examination'::announcement_category, 'Download Result', 'Download Result', '2020-02-25T09:00:00Z', '[{"name":"Secondyearresult.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/secondyearresult-15826942800.pdf","size_kb":1975}]'::jsonb, NULL),
('Interview Schedule for Ehsaas Undergraduate Scholarship', 'interview-schedule-for-ehsaas-undergraduate-scholarship-02-21-2020', 'job'::announcement_category, 'List of Ineligible Candidates List of Eligible Candidates', 'List of Ineligible Candidates
List of Eligible Candidates', '2020-02-21T09:00:00Z', '[{"name":"List Of Ineligible Candidates.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/list-of-ineligible-candidates-15822966580.pdf","size_kb":168},{"name":"List Of Eligible Candidates.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/list-of-eligible-candidates-15822966050.pdf","size_kb":214}]'::jsonb, NULL),
('Notice for MD/MS Mid-term/Part-II Final M.Phil & Diploma Examination March 2020', 'notice-for-mdms-mid-termpart-ii-final-mphil-diploma-examination-march-2020-02-21-2020', 'examination'::announcement_category, NULL, '', '2020-02-21T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Orientation Day of 1st year BDS of Batch 09', 'notice-for-orientation-day-of-1st-year-bds-of-batch-09-02-14-2020', 'circular'::announcement_category, NULL, '', '2020-02-14T09:00:00Z', '[]'::jsonb, NULL),
('Notice for extension in joining period to newly selected teaching faculty upto (27th February 2020)', 'notice-for-extension-in-joining-period-to-newly-selected-teaching-faculty-upto-27th-february-2020-01-31-2020', 'circular'::announcement_category, NULL, '', '2020-01-31T09:00:00Z', '[]'::jsonb, NULL),
('Result of MD Internal Medicine Mid-Term(Theory) Examination September 2019', 'result-of-md-internal-medicine-mid-termtheory-examination-september-2019-01-09-2020', 'examination'::announcement_category, NULL, '', '2020-01-09T09:00:00Z', '[]'::jsonb, NULL),
('Merit List of Candidates who have Applied for Admission to BSN Generic at Benazir College of Nursing SMBBMU for Session 2019-20', 'merit-list-of-candidates-who-have-applied-for-admission-to-bsn-generic-at-benazir-college-of-nursing-smbbmu-for-session-2019-20-01-06-2020', 'admission'::announcement_category, 'Download List', 'Download List', '2020-01-06T09:00:00Z', '[{"name":"Untouchbsn Nursinggeneric4yearprog 2019 20.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/untouchbsn-nursinggeneric4yearprog-2019-20-15783008600.pdf","size_kb":2748}]'::jsonb, NULL),
('Result of Final Professional BDS Examination (Supplementary) for Session 2014-15 of Bibi Aseefa Dental College Larkana Held in the Month of December 2019', 'result-of-final-professional-bds-examination-supplementary-for-session-2014-15-of-bibi-aseefa-dental-college-larkana-held-in-the-month-of-december-2019-12-31-2019', 'examination'::announcement_category, NULL, '', '2019-12-31T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Day One Celebration of Batch 48 at Chandka Medical College', 'notice-for-day-one-celebration-of-batch-48-at-chandka-medical-college-12-28-2019', 'circular'::announcement_category, 'This is for the information of all newly selected students of first year MBBS at Chandka Medical College Larkana Session 2019-20, That the Day One shall be celebrated on Wednesday The 1st of January…', 'This is for the information of all newly selected students of first year MBBS at Chandka Medical College Larkana Session 2019-20, That the Day One shall be celebrated on
Wednesday
The 1st of
January
2020
,
11:00 AM
in Auditorium Hall Chandka Medical College, Larkana.
All newly selected students are invited to attend along with their parents. Shields to meritourius students from all districts shall be awarded by worthy Vice Chancellor of Shaheed Mohtarma Benazir Bhutto Medical University Larkana.', '2019-12-28T09:00:00Z', '[]'::jsonb, NULL),
('Provisional Merit List of Candidates who have Applied for Admission to POST RN BSC Nursing at Benazir College of Nursing SMBBMU for Session 2019-20', 'provisional-merit-list-of-candidates-who-have-applied-for-admission-to-post-rn-bsc-nursing-at-benazir-college-of-nursing-smbbmu-for-session-2019-20-12-26-2019', 'admission'::announcement_category, 'Candidates are advised to Submit their objections on provisional merit list upto Monday 30th December 2019. No Objection shall be entertained afer due date. Download List', 'Candidates are advised to Submit their objections on provisional merit list upto
Monday 30th December 2019.
No Objection shall be entertained afer due date.
Download List', '2019-12-26T09:00:00Z', '[{"name":"Meritlists.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/meritlists-15773760360.pdf","size_kb":690}]'::jsonb, NULL),
('Provisional Merit List of Candidates who have Applied for Admission to BSN Generic at Benazir College of Nursing SMBBMU for Session 2019-20', 'provisional-merit-list-of-candidates-who-have-applied-for-admission-to-bsn-generic-at-benazir-college-of-nursing-smbbmu-for-session-2019-20-12-26-2019', 'admission'::announcement_category, 'Candidates are advised to Submit their objections on provisional merit list upto Monday 30th December 2019. No Objection shall be entertained afer due date. Download List', 'Candidates are advised to Submit their objections on provisional merit list upto
Monday 30th December 2019.
No Objection shall be entertained afer due date.
Download List', '2019-12-26T09:00:00Z', '[{"name":"Untouchbsn Nursinggeneric4yearprog 2019 20.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/untouchbsn-nursinggeneric4yearprog-2019-20-15773847060.pdf","size_kb":913}]'::jsonb, NULL),
('Result of 31st Selection Board held on 12th and 13th November 2019', 'result-of-31st-selection-board-held-on-12th-and-13th-november-2019-12-26-2019', 'examination'::announcement_category, 'Result of 13th November Result of 12th November', 'Result of 13th November
Result of 12th November', '2019-12-26T09:00:00Z', '[{"name":"13th Nov.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/13th-nov-15774620131.pdf","size_kb":171},{"name":"12th Nov.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/12th-nov-15774620130.pdf","size_kb":171}]'::jsonb, NULL),
('Result of 32nd Selection Board held on 23rd and 24th November 2019', 'result-of-32nd-selection-board-held-on-23rd-and-24th-november-2019-12-26-2019', 'examination'::announcement_category, 'Result of 24th November Result of 23rd November', 'Result of 24th November
Result of 23rd November', '2019-12-26T09:00:00Z', '[{"name":"24 Nov.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/24-nov-15774621641.pdf","size_kb":149},{"name":"23 Nov.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/23-nov-15774621640.pdf","size_kb":150}]'::jsonb, NULL),
('Result of 33rd Selection Board held on 7th and 8th December 2019', 'result-of-33rd-selection-board-held-on-7th-and-8th-december-2019-12-26-2019', 'examination'::announcement_category, 'Result of 8th December Result of 7th December', 'Result of 8th December
Result of 7th December', '2019-12-26T09:00:00Z', '[{"name":"8thdec.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/8thdec-15774622991.pdf","size_kb":138},{"name":"7thdec.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/7thdec-15774622990.pdf","size_kb":155}]'::jsonb, NULL),
('Result of 34th Selection Board held on 23rd December 2019', 'result-of-34th-selection-board-held-on-23rd-december-2019-12-26-2019', 'examination'::announcement_category, 'Download Result', 'Download Result', '2019-12-26T09:00:00Z', '[{"name":"23rddec.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/23rddec-15774624030.pdf","size_kb":134}]'::jsonb, NULL),
('Result of Entry Test Of Diploma, FCPS-II Training, MD/MS Part-I Examination for Session January 2019', 'result-of-entry-test-of-diploma-fcps-ii-training-mdms-part-i-examination-for-session-january-2019-12-17-2019', 'examination'::announcement_category, 'Entry Test FCPS-II Entry Test for Diplomas / MCPS MD/MS Part-I', 'Entry Test FCPS-II
Entry Test for Diplomas / MCPS
MD/MS Part-I', '2019-12-17T09:00:00Z', '[{"name":"Convert Jpg To Pdf.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/convert-jpg-to-pdf-15766515070.pdf","size_kb":1217},{"name":"Convert Jpg To Pdf.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/convert-jpg-to-pdf-15766514210.pdf","size_kb":948}]'::jsonb, NULL),
('List of Candidates who have Applied for Admission into 1st Year MBBS/BDS on UEAP Local Basis for Session 2019-20', 'list-of-candidates-who-have-applied-for-admission-into-1st-year-mbbsbds-on-ueap-local-basis-for-session-2019-20-12-11-2019', 'admission'::announcement_category, 'Candidates are advised to Submit their objections on provisional UEAP Local lists upto Saturday 12th December 2019. No Objection shall be entertained afer due date District Ghotki District Khairpur…', 'Candidates are advised to Submit their objections on provisional UEAP Local lists upto
Saturday 12th December 2019.
No Objection shall be entertained afer due date
District Ghotki
District Khairpur
District Sukkur
Not Eligible Candidates
District Shikarpur
District Naushahroferoze
District Larkana
District Kashmore
District Kambar-Shahdadkot
District Jacobabad
District Dadu', '2019-12-11T09:00:00Z', '[{"name":"Ghotki Self List.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ghotki-self-list-15762164460.pdf","size_kb":514},{"name":"Khairpur Self List.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/khairpur-self-list-15762163530.pdf","size_kb":525},{"name":"Sukkur Self Finance.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sukkur-self-finance-15762163190.pdf","size_kb":492},{"name":"Ueap Not Eligible.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ueap-not-eligible-15762162580.pdf","size_kb":570},{"name":"Shpself.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/shpself-15760512660.pdf","size_kb":299},{"name":"Nfzself.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nfzself-15760512530.pdf","size_kb":311},{"name":"Lrkself.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/lrkself-15760512080.pdf","size_kb":306},{"name":"Kshmself.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/kshmself-15760511470.pdf","size_kb":291},{"name":"K Shdself.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/k-shdself-15760499540.pdf","size_kb":289},{"name":"Jcdself.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/jcdself-15760498450.pdf","size_kb":296},{"name":"Daduself.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/daduself-15760498020.pdf","size_kb":289}]'::jsonb, NULL),
('Candidate Selected on Reserved Seat for Disabled Candidate for Session 2019-20', 'candidate-selected-on-reserved-seat-for-disabled-candidate-for-session-2019-20-12-10-2019', 'admission'::announcement_category, NULL, '', '2019-12-10T09:00:00Z', '[]'::jsonb, NULL),
('List of Candidates Selected on Reserved Seats of DOW University of Health Sciences Karachi for Session 2019-20', 'list-of-candidates-selected-on-reserved-seats-of-dow-university-of-health-sciences-karachi-for-session-2019-20-12-05-2019', 'circular'::announcement_category, NULL, '', '2019-12-05T09:00:00Z', '[]'::jsonb, NULL),
('List of Candidates Selected on Reserved Seats of Jinnah Sindh Medical University Karachi for Session 2019-20', 'list-of-candidates-selected-on-reserved-seats-of-jinnah-sindh-medical-university-karachi-for-session-2019-20-12-05-2019', 'circular'::announcement_category, NULL, '', '2019-12-05T09:00:00Z', '[]'::jsonb, NULL),
('List of Candidates Selected on Reserved Seats of Fatima Jinnah Sindh Medical University Lahore for Session 2019-20', 'list-of-candidates-selected-on-reserved-seats-of-fatima-jinnah-sindh-medical-university-lahore-for-session-2019-20-12-05-2019', 'circular'::announcement_category, NULL, '', '2019-12-05T09:00:00Z', '[]'::jsonb, NULL),
('Merit List of Candidates who have Applied for Admission Into 1ST: Year MBBS/BDS Courses for Session 2019-20 at Shaheed Mohtarma Benazir Bhutto Medical University Larkana', 'merit-list-of-candidates-who-have-applied-for-admission-into-1st-year-mbbsbds-courses-for-session-2019-20-at-shaheed-mohtarma-benazir-bhutto-medical-university-larkana-12-02-2019', 'admission'::announcement_category, 'District Ghotki District Khairpur District Sukkur District Shikarpur District Naushahroferoze District Larkana District Kashmore District Kambar-Shahdadkot District Jacobabad District Dadu', 'District Ghotki
District Khairpur
District Sukkur
District Shikarpur
District Naushahroferoze
District Larkana
District Kashmore
District Kambar-Shahdadkot
District Jacobabad
District Dadu', '2019-12-02T09:00:00Z', '[{"name":"Merit List Dist Ghotki.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/merit-list-dist-ghotki-15753486940.pdf","size_kb":955},{"name":"Merit List Dist Khairpur.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/merit-list-dist-khairpur-15753486390.pdf","size_kb":1353},{"name":"Merit List Dist Sukkur.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/merit-list-dist-sukkur-15753485990.pdf","size_kb":924},{"name":"Updated Shp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/updated-shp.pdf","size_kb":689},{"name":"Update Nfz.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/update-nfz.pdf","size_kb":873},{"name":"Updated Lrk.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/updated-lrk.pdf","size_kb":840},{"name":"Updated Kshm.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/updated-kshm.pdf","size_kb":703},{"name":"Updated K Shd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/updated-k-shd.pdf","size_kb":691},{"name":"Updated Jcd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/updated-jcd.pdf","size_kb":623},{"name":"Updated Dadu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/updated-dadu.pdf","size_kb":780}]'::jsonb, NULL),
('Admissions to 1st Year MBBS/BDS on Reserved Seats of Overseas Pakistani''s', 'admissions-to-1st-year-mbbsbds-on-reserved-seats-of-overseas-pakistanis-11-29-2019', 'admission'::announcement_category, 'Application Form', 'Application Form', '2019-11-29T09:00:00Z', '[{"name":"Overseas Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/overseas-form-15751077180.pdf","size_kb":291}]'::jsonb, NULL),
('Admissions to 1st Year MBBS/BDS on UEAP Local Basis', 'admissions-to-1st-year-mbbsbds-on-ueap-local-basis-11-29-2019', 'admission'::announcement_category, 'Application Form', 'Application Form', '2019-11-29T09:00:00Z', '[{"name":"Local Form.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/local-form-15751077400.pdf","size_kb":81}]'::jsonb, NULL),
('Provisional Merit List of Candidates who have Applied for Admission Into 1ST: Year MBBS/BDS Courses for Session 2019-20 at Shaheed Mohtarma Benazir Bhutto Medical University Larkana', 'provisional-merit-list-of-candidates-who-have-applied-for-admission-into-1st-year-mbbsbds-courses-for-session-2019-20-at-shaheed-mohtarma-benazir-bhutto-medical-university-larkana-11-27-2019', 'admission'::announcement_category, 'Candidates are advised to submit their objections on provisional merit list uptp Saturday the 30 TH OF November 2019. No Objection shall be entertained after the due date Not Eligible List GMMMC Not…', 'Candidates are advised to submit their objections on provisional merit list uptp Saturday the 30
TH
OF November 2019. No Objection shall be entertained after the due date
Not Eligible List GMMMC
Not Eligible List CMC
District Dadu
District Jacobabad
District Kambar-Shahdadkot
District Kashmore
District Larkana
District Naushahroferoze
District Shikarpur
District Sukkur
District Ghotki
District Khairpur', '2019-11-27T09:00:00Z', '[{"name":"Gmmmc Not Eligible Candidates.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/gmmmc-not-eligible-candidates-15750160450.pdf","size_kb":307},{"name":"Not Eligible Candidates Cmc.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/not-eligible-candidates-cmc-15750160160.pdf","size_kb":617},{"name":"Dist Dadu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dist-dadu.pdf","size_kb":778},{"name":"Dist Jcd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dist-jcd.pdf","size_kb":617},{"name":"Dist K Shd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dist-k-shd.pdf","size_kb":688},{"name":"Dist Kshm.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dist-kshm.pdf","size_kb":700},{"name":"Dist Lrk.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dist-lrk.pdf","size_kb":839},{"name":"Dist Nfz.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dist-nfz.pdf","size_kb":870},{"name":"Dist Shp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dist-shp.pdf","size_kb":685},{"name":"Dist Sukk.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dist-sukk.pdf","size_kb":922},{"name":"Dist Ghotki.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dist-ghotki.pdf","size_kb":951},{"name":"Dist Khp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dist-khp.pdf","size_kb":1348}]'::jsonb, NULL),
('Admissions for BS Nursing(Generic) & B.Sc Nursing(POST RN) at Benazir College of Nursing SMBBMU for Session 2019-20', 'admissions-for-bs-nursinggeneric-bsc-nursingpost-rn-at-benazir-college-of-nursing-smbbmu-for-session-2019-20-11-21-2019', 'admission'::announcement_category, 'Download IBA Challan Seats Distribution & Fees Structure Download SMBBMU Challan Application Form', 'Download IBA Challan
Seats Distribution & Fees Structure
Download SMBBMU Challan
Application Form', '2019-11-21T09:00:00Z', '[{"name":"Iba Challan.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/iba-challan-15746655600.pdf","size_kb":110},{"name":"Seat Allocation And Tagged Districts Of Nursing Courses.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/seat-allocation-and-tagged-districts-of-nursing-courses-15743995020.pdf","size_kb":424},{"name":"New Univ Challan Nursing.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/new-univ-challan-nursing-15743994220.pdf","size_kb":72},{"name":"Smbbmu Application Form For Nursing Course 2019 20.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmu-application-form-for-nursing-course-2019-20-15743993470.pdf","size_kb":523}]'::jsonb, NULL),
('Revised Advertisement for MBBS/BDS Admissions for Session 2019-20', 'revised-advertisement-for-mbbsbds-admissions-for-session-2019-20-11-18-2019', 'admission'::announcement_category, NULL, '', '2019-11-18T09:00:00Z', '[]'::jsonb, NULL),
('Admissions for Postgraduate courses for the Session January 2020', 'admissions-for-postgraduate-courses-for-the-session-january-2020-11-08-2019', 'admission'::announcement_category, 'Application Form for Postgraduate Students Challan for Postgraduate Students', 'Application Form for Postgraduate Students
Challan for Postgraduate Students', '2019-11-08T09:00:00Z', '[{"name":"Smbbmul Form For P.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmul-form-for-p-15729553181.pdf","size_kb":138},{"name":"Challan Of Controller Postgraduate.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/challan-of-controller-postgraduate-15729553180.pdf","size_kb":65}]'::jsonb, NULL),
('Important Announcement for Admission to MBBS/BDS for Session 2019-20', 'important-announcement-for-admission-to-mbbsbds-for-session-2019-20-11-06-2019', 'admission'::announcement_category, 'IMPORTANT ANNOUNCMENT It is to inform all the concerned that Merit list of all Public / Private Sector Medical and Dental Universties / Colleges of Sindh Province has been suspended till the final…', 'IMPORTANT ANNOUNCMENT
It is to inform all the concerned that Merit list of all Public / Private Sector Medical and Dental Universties / Colleges of Sindh Province has been suspended till the final decision of Honourable High Court of Sindh Karachi, under C.P No.D-6554 of 2019.
New date will be announced soon, for update information keep visiting our website.', '2019-11-06T09:00:00Z', '[]'::jsonb, NULL),
('Recommendation of Selection Board of SMBB Medical University Larkana held on 21st September 2019', 'recommendation-of-selection-board-of-smbb-medical-university-larkana-held-on-21st-september-2019-11-02-2019', 'circular'::announcement_category, NULL, '', '2019-11-02T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Interview of Hafiz-e-Quran and Disabled Persons for Admission to MBBS/BDS for Session 2019-20', 'notice-for-interview-of-hafiz-e-quran-and-disabled-persons-for-admission-to-mbbsbds-for-session-2019-20-10-30-2019', 'admission'::announcement_category, NULL, '', '2019-10-30T09:00:00Z', '[]'::jsonb, NULL),
('Corrigendum for MBBS/BDS Admissions for Session 2019-20', 'corrigendum-for-mbbsbds-admissions-for-session-2019-20-10-02-2019', 'admission'::announcement_category, NULL, '', '2019-10-02T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Online Submission of Form', 'notice-for-online-submission-of-form-09-27-2019', 'circular'::announcement_category, 'It is for the information of all candidates from tagged districts of SMBBMU Larkana that updated online admission forms and lists will be availble on LUMHS website www.lumhs.edu.pk from Monday the…', 'It is for the information of all candidates from tagged districts of SMBBMU Larkana that updated online admission forms and lists will be availble on LUMHS website
www.lumhs.edu.pk
from
Monday
the
30th
September 2019', '2019-09-27T09:00:00Z', '[]'::jsonb, NULL),
('Admission in MBBS/BDS Session 2019-20 Public Sector Medical & Dental Universities / Colleges of Sindh Province', 'admission-in-mbbsbds-session-2019-20-public-sector-medical-dental-universities-colleges-of-sindh-province-09-23-2019', 'admission'::announcement_category, NULL, '', '2019-09-23T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Construction of Boys Hostel at SMBB Medical University, Larkana', 'notice-inviting-tender-for-construction-of-boys-hostel-at-smbb-medical-university-larkana-09-23-2019', 'tender'::announcement_category, 'Procurement / Tender Evaluation Committee Complaint Redressal Committee', 'Procurement / Tender Evaluation Committee
Complaint Redressal Committee', '2019-09-23T09:00:00Z', '[]'::jsonb, NULL),
('Notice for Entry Test Result', 'notice-for-entry-test-result-09-19-2019', 'examination'::announcement_category, 'This is for the information of all candidates who appeared in entry test for admission to MBBS/BDS coures, Session 2019-20 that provisional result is available on NTS website www.nts.org.pk…', 'This is for the information of all candidates who appeared in entry test for admission to MBBS/BDS coures, Session 2019-20 that provisional result is available on NTS website www.nts.org.pk
Candidates can submit their objection(if any) on provisional result upto Monday
23rd September
, 04 PM
Objection form can be downloaded from NTS website
No objection shall be entertained after the date mentioned above.', '2019-09-19T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for Security Services and Misc. Items', 'notice-inviting-tender-for-security-services-and-misc-items-09-03-2019', 'tender'::announcement_category, 'Financial Documents Technical Documents Tender Documents', 'Financial Documents
Technical Documents
Tender Documents', '2019-09-03T09:00:00Z', '[{"name":"Sbd Financial 30 8 2019.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sbd-financial-30-8-2019-15675836962.pdf","size_kb":282},{"name":"Sbd Technical 30 8 2019.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/sbd-technical-30-8-2019-15675836961.pdf","size_kb":388},{"name":"Tender Documents.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/tender-documents-15675836960.pdf","size_kb":351}]'::jsonb, NULL),
('Recommendation of Selection Board of SMBB Medical University Larkana held on 9th & 10th August 2019', 'recommendation-of-selection-board-of-smbb-medical-university-larkana-held-on-9th-10th-august-2019-08-31-2019', 'circular'::announcement_category, NULL, '', '2019-08-31T09:00:00Z', '[]'::jsonb, NULL),
('Admission in Public and Private Sector Medical and Dental Universities/Colleges of Sindh Province', 'admission-in-public-and-private-sector-medical-and-dental-universitiescolleges-of-sindh-province-08-05-2019', 'admission'::announcement_category, NULL, '', '2019-08-05T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for different construction works @SMBBMU', 'notice-inviting-tender-for-different-construction-works-smbbmu-07-17-2019', 'tender'::announcement_category, 'Tender documents for electric work of bungalow no.08 Tender documents for electric work of bungalow no. 02, 07 and 11 Tender document for M&R Compound Wall Tender document for M&R cemented jali and…', 'Tender documents for  electric work of bungalow no.08
Tender documents for  electric work of bungalow no. 02, 07 and 11
Tender document for M&R Compound Wall
Tender document for  M&R cemented jali and Razor wire
Tender Document for M&R Main Gate & Security Check Points', '2019-07-17T09:00:00Z', '[{"name":"5.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/5-15634311151.pdf","size_kb":1278},{"name":"4.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/4-15634311150.pdf","size_kb":1421},{"name":"3.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/3-15634309921.pdf","size_kb":1217},{"name":"2.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/2-15634309920.pdf","size_kb":1046},{"name":"1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1-15634308950.pdf","size_kb":1187}]'::jsonb, NULL),
('Result of Pre-Interview written test for the post of Physiotherapist(BPS-17) held @SMBBMU Areeja Campus on 09-07-2019', 'result-of-pre-interview-written-test-for-the-post-of-physiotherapistbps-17-held-smbbmu-areeja-campus-on-09-07-2019-07-10-2019', 'examination'::announcement_category, NULL, '', '2019-07-10T09:00:00Z', '[]'::jsonb, NULL),
('Answer key for Pre-Interview written test for the post of Physiotherapist(BPS-17) held @SMBBMU Areeja Campus on 09-07-2019', 'answer-key-for-pre-interview-written-test-for-the-post-of-physiotherapistbps-17-held-smbbmu-areeja-campus-on-09-07-2019-07-09-2019', 'job'::announcement_category, NULL, '', '2019-07-09T09:00:00Z', '[]'::jsonb, NULL),
('Pre-Interview written test for the post of Physiotherapist(BPS-17)', 'pre-interview-written-test-for-the-post-of-physiotherapistbps-17-07-02-2019', 'job'::announcement_category, 'List of candidates', 'List of candidates', '2019-07-02T09:00:00Z', '[{"name":"List Of Candidates.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/list-of-candidates-15620634170.pdf","size_kb":1408}]'::jsonb, NULL),
('Notification of extension of summer vacation', 'notification-of-extension-of-summer-vacation-06-27-2019', 'circular'::announcement_category, NULL, '', '2019-06-27T09:00:00Z', '[]'::jsonb, NULL),
('Result of Entry Test Of Diploma, FCPS-II Training, MD/MS Part-I Examination for session july 2019', 'result-of-entry-test-of-diploma-fcps-ii-training-mdms-part-i-examination-for-session-july-2019-06-18-2019', 'examination'::announcement_category, 'Download Result', 'Download Result', '2019-06-18T09:00:00Z', '[{"name":"Result Fcps.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/result-fcps-15609279790.pdf","size_kb":7113}]'::jsonb, NULL),
('Notification of extension of summer vacation', 'notification-of-extension-of-summer-vacation-06-14-2019', 'circular'::announcement_category, NULL, '', '2019-06-14T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Professional MBBS First Year Supplementary Examination Session 2017-18', 'result-of-first-professional-mbbs-first-year-supplementary-examination-session-2017-18-06-13-2019', 'examination'::announcement_category, NULL, '', '2019-06-13T09:00:00Z', '[]'::jsonb, NULL),
('Result of Second Professional MBBS Second Year Supplementary Examination Session 2016-17', 'result-of-second-professional-mbbs-second-year-supplementary-examination-session-2016-17-06-13-2019', 'examination'::announcement_category, NULL, '', '2019-06-13T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional MBBS Third Year Supplementary Examination Session 2015-16', 'result-of-third-professional-mbbs-third-year-supplementary-examination-session-2015-16-06-13-2019', 'examination'::announcement_category, NULL, '', '2019-06-13T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fourth Professional MBBS Fourth Year Supplementary Examination Session 2014-15', 'result-of-fourth-professional-mbbs-fourth-year-supplementary-examination-session-2014-15-06-13-2019', 'examination'::announcement_category, NULL, '', '2019-06-13T09:00:00Z', '[]'::jsonb, NULL),
('Result of Fifth Professional MBBS Fifth Year Supplementary Examination Session 2013-14', 'result-of-fifth-professional-mbbs-fifth-year-supplementary-examination-session-2013-14-06-13-2019', 'examination'::announcement_category, NULL, '', '2019-06-13T09:00:00Z', '[]'::jsonb, NULL),
('List of Candidates Who have Applied for Admission to POST RN B.S.c Nursing on UEAP Local Basis at Benazir College of Nursing', 'list-of-candidates-who-have-applied-for-admission-to-post-rn-bsc-nursing-on-ueap-local-basis-at-benazir-college-of-nursing-05-28-2019', 'admission'::announcement_category, 'Download List', 'Download List', '2019-05-28T09:00:00Z', '[{"name":"Eligible Bsn Nursingpostrn2yearprog 2018 19.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/eligible-bsn-nursingpostrn2yearprog-2018-19-15591547500.pdf","size_kb":539}]'::jsonb, NULL),
('List of Candidates Who Have Applied for Admission to BSN Generic on UEAP Local Basis at Benazir College of Nursing', 'list-of-candidates-who-have-applied-for-admission-to-bsn-generic-on-ueap-local-basis-at-benazir-college-of-nursing-05-28-2019', 'admission'::announcement_category, 'Download List', 'Download List', '2019-05-28T09:00:00Z', '[{"name":"Eligible Bsnnursing4yeargeneric 2018 19 S.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/eligible-bsnnursing4yeargeneric-2018-19-s-15591548920.pdf","size_kb":556}]'::jsonb, NULL),
('Result of selection board of SMBBMU held on 11th May 2019', 'result-of-selection-board-of-smbbmu-held-on-11th-may-2019-05-14-2019', 'examination'::announcement_category, NULL, '', '2019-05-14T09:00:00Z', '[]'::jsonb, NULL)
on conflict (slug) do update set title=excluded.title, category=excluded.category, excerpt=excluded.excerpt, body=excluded.body, published_at=excluded.published_at, attachments=excluded.attachments, photo_url=excluded.photo_url;

-- 03_announcements_05.sql
insert into announcements (title, slug, category, excerpt, body, published_at, attachments, photo_url) values
('Admissions to 1st Year BSN Generic & Post RN BSC Nursing Courses on UEAP Local Basis', 'admissions-to-1st-year-bsn-generic-post-rn-bsc-nursing-courses-on-ueap-local-basis-05-11-2019', 'admission'::announcement_category, 'Application Form', 'Application Form', '2019-05-11T09:00:00Z', '[]'::jsonb, NULL),
('Result of First Prof. Pharm-D Supplementary Examination Session 2016-17', 'result-of-first-prof-pharm-d-supplementary-examination-session-2016-17-04-29-2019', 'examination'::announcement_category, NULL, '', '2019-04-29T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN (Generic) First Semester Regular Examination Session 2017-18', 'result-of-bsn-generic-first-semester-regular-examination-session-2017-18-04-29-2019', 'examination'::announcement_category, NULL, '', '2019-04-29T09:00:00Z', '[]'::jsonb, NULL),
('Result of BSN (POST-RN) First Semester Regular Examination Session 2017-18', 'result-of-bsn-post-rn-first-semester-regular-examination-session-2017-18-04-29-2019', 'examination'::announcement_category, NULL, '', '2019-04-29T09:00:00Z', '[]'::jsonb, NULL),
('Admissions for Postgraduate courses for the Session July 2019', 'admissions-for-postgraduate-courses-for-the-session-july-2019-04-26-2019', 'admission'::announcement_category, NULL, '', '2019-04-26T09:00:00Z', '[]'::jsonb, NULL),
('Entry Test forms for Post Graduate Courses', 'entry-test-forms-for-post-graduate-courses-04-26-2019', 'admission'::announcement_category, 'Application Form Challan', 'Application Form
Challan', '2019-04-26T09:00:00Z', '[{"name":"Smbbmul Form For P.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmul-form-for-p-15729553181.pdf","size_kb":138},{"name":"Challan Of Controller Postgraduate.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/challan-of-controller-postgraduate-15729553180.pdf","size_kb":65}]'::jsonb, NULL),
('Updated Provisional List of Candidates Who have Applied for Admission to BSN GENERIC Course at Benazir College of Nursing SMBBMU session 2018-19', 'updated-provisional-list-of-candidates-who-have-applied-for-admission-to-bsn-generic-course-at-benazir-institute-of-nursing-and-community-health-sciences-smbbmu-session-2018-19-04-08-2019', 'admission'::announcement_category, 'Download List', 'Download List', '2019-04-08T09:00:00Z', '[{"name":"Eligible Bsn Nursingpostrn2yearprog 2018 19 8 4 2019.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/eligible-bsn-nursingpostrn2yearprog-2018-19-8-4-2019-15548815910.pdf","size_kb":833}]'::jsonb, NULL),
('Updated Provisional List of Candidates Who have Applied for Admission to POST RN B.S.c Nursing Course at Benazir College of Nursing SMBBMU session 2018-19', 'updated-provisional-list-of-candidates-who-have-applied-for-admission-to-post-rn-bsc-nursing-course-at-benazir-institute-of-nursing-and-community-health-sciences-smbbmu-session-2018-19-04-08-2019', 'admission'::announcement_category, 'Download List', 'Download List', '2019-04-08T09:00:00Z', '[{"name":"2yearnew142019.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/2yearnew142019-15541406140.pdf","size_kb":832}]'::jsonb, NULL),
('Notice Inviting Tender for Provide & Supply of Stationary, Petty Articles and  Miscellaneous Items', 'notice-inviting-tender-for-provide-supply-of-stationary-petty-articles-and-miscellaneous-items-04-01-2019', 'tender'::announcement_category, 'Annual Procurement Plan Tender Document Advertisement in Daily Kawish Advertisement in Dawn News Advertisement in Daily Jang', 'Annual Procurement Plan
Tender Document
Advertisement in Daily Kawish
Advertisement in Dawn News
Advertisement in Daily Jang', '2019-04-01T09:00:00Z', '[{"name":"Annual Procurement Plan 2018 19.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-procurement-plan-2018-19-15542878071.pdf","size_kb":104},{"name":"Final Tender Document.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/final-tender-document-15542878070.pdf","size_kb":579}]'::jsonb, NULL),
('Notice Inviting Tender for Construction of Boys Hostel at SMBBMU, Larkana.', 'notice-inviting-tender-for-construction-of-boys-hostel-at-smbbmu-larkana-04-01-2019', 'tender'::announcement_category, 'NIT', 'NIT', '2019-04-01T09:00:00Z', '[{"name":"Nit Boys Hostel Smbbmu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nit-boys-hostel-smbbmu-15556912910.pdf","size_kb":134}]'::jsonb, NULL),
('Result of Third Professional MBBS Examination Session 2015-16 held in the month of November 2018', 'result-of-third-professional-mbbs-examination-session-2015-16-held-in-the-month-of-november-2018-03-20-2019', 'examination'::announcement_category, 'Download Result', 'Download Result', '2019-03-20T09:00:00Z', '[{"name":"3rdyear Result.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/3rdyear-result-15536099730.pdf","size_kb":1218}]'::jsonb, NULL),
('Result of Fourth Professional MBBS Session 2014-15 held in the month of November 2018', 'result-of-fourth-professional-mbbs-session-2014-15-held-in-the-month-of-november-2018-03-18-2019', 'examination'::announcement_category, 'Download Result', 'Download Result', '2019-03-18T09:00:00Z', '[{"name":"4thyear.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/4thyear-15529037710.pdf","size_kb":881}]'::jsonb, NULL),
('Result of Second Professional MBBS Session 2016-17 held in the month of November 2018', 'result-of-second-professional-mbbs-session-2016-17-held-in-the-month-of-november-2018-03-12-2019', 'examination'::announcement_category, 'Download Result', 'Download Result', '2019-03-12T09:00:00Z', '[{"name":"2ndyear.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/2ndyear-15529036320.pdf","size_kb":572}]'::jsonb, NULL),
('Result of First Professional MBBS Session 2017-18 held in the month of November 2018', 'result-of-first-professional-mbbs-session-2017-18-held-in-the-month-of-november-2018-03-11-2019', 'examination'::announcement_category, 'Download Result', 'Download Result', '2019-03-11T09:00:00Z', '[{"name":"Mar 11 Doc 1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/mar-11-doc-1-15523738600.pdf","size_kb":268}]'::jsonb, NULL),
('Provisional Merit List of Candidates Who Have Applied for Admission into 1ST: Year  BDS Course as their 2ND Choice at Bibi Aseefa Dental College SMBBMU Larkana  for Session 2018-2019', 'provisional-merit-list-of-candidates-who-have-applied-for-admisson-into-1st-year-bds-course-as-their-2nd-choice-at-bibi-aseefa-dental-college-smbbmu-larkana-for-session-2018-2019-02-27-2019', 'admission'::announcement_category, 'PROVISIONAL MERIT LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSON INTO 1ST: YEAR BDS COURSE AS THEIR 2ND CHOICE AT BIBI ASEEFA DENTAL COLLEGE SMBBMU LARKANA FOR SESSION 2018-2019 DOWNLOAD LIST…', 'PROVISIONAL MERIT LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSON INTO 1ST: YEAR  BDS COURSE AS THEIR 2ND CHOICE AT BIBI ASEEFA DENTAL COLLEGE SMBBMU LARKANA
FOR SESSION 2018-2019
DOWNLOAD LIST SUKKUR REGION
DOWNLOAD LIST SHIKARPUR
DOWNLOAD LIST LARKANA
DOWNLOAD LIST NFZ
DOWNLOAD LIST KSHM
DOWNLOAD LIST K-SHD
DOWNLOAD LIST JACOBABAD
DOWNLOAD LIST DADU', '2019-02-27T09:00:00Z', '[{"name":"Gmcdist.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/gmcdist-15513386637.pdf","size_kb":499},{"name":"1shp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1shp-15513386636.pdf","size_kb":476},{"name":"Lrk1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/lrk1-15513386635.pdf","size_kb":476},{"name":"1nfz.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1nfz-15513386634.pdf","size_kb":479},{"name":"1kshm.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1kshm-15513386633.pdf","size_kb":477},{"name":"1kshd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1kshd-15513386632.pdf","size_kb":478},{"name":"1jcd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1jcd-15513386631.pdf","size_kb":477},{"name":"1dadu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1dadu-15513386630.pdf","size_kb":477}]'::jsonb, NULL),
('List of Candidates Admissions to 1ST Year MBBS on Reserved Seats of AJ&K Medical Colleges for Session 2018-2019', 'list-of-candidates-admissions-to-1st-year-mbbs-on-reserved-seats-of-ajk-medical-colleges-for-session-2018-2019-02-25-2019', 'admission'::announcement_category, 'LIST OF Admissions to 1 st YEAR mbbs on reserved seats of aj&k medical colleges for SESSION 2018-2019 DOWNLOAD LIST', 'LIST OF
Admissions to 1
st
YEAR mbbs on reserved seats of aj&k medical colleges for SESSION 2018-2019
DOWNLOAD LIST', '2019-02-25T09:00:00Z', '[{"name":"Ajklistuntouch201819.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ajklistuntouch201819-15510786140.pdf","size_kb":805}]'::jsonb, NULL),
('List of Candidates Who Have Applied for Admission in BSC Generic Nursing and POST RN   Nursing for Session 2018-2019 at BINACHS SMBBMU Larkana', 'list-of-candidates-who-have-applied-for-admissions-in-bsc-generic-nursing-and-post-rn-nursing-for-session-2018-2019-at-binachs-smbbmu-larkana-02-25-2019', 'admission'::announcement_category, 'LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSIONS IN BSC GENERIC NURSING AND POST RN NURSING FOR SESSION 2018-2019 AT BINACHS SMBBMU LARKANA DOWNLOAD LIST 04 YEAR PROGRAM (BSC GENERIC) DOWNLOAD LIST…', 'LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSIONS IN BSC GENERIC NURSING AND POST RN   NURSING FOR SESSION 2018-2019 AT BINACHS SMBBMU LARKANA
DOWNLOAD LIST 04 YEAR PROGRAM (BSC GENERIC)
DOWNLOAD LIST 02 YEAR PROGRAM (POST RN)', '2019-02-25T09:00:00Z', '[{"name":"4year.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/4year-15510796991.pdf","size_kb":1548},{"name":"2year.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/2year-15510796990.pdf","size_kb":797}]'::jsonb, NULL),
('List of Candidates Who Have Applied for Admission to 1ST Year MBBS on Vacant Seats of  Overseas / Foreign National Seats for Session 2018-2019 @ SMBBMU Larkana', 'list-of-candidates-who-have-applied-for-admissions-to-1st-year-mbbs-on-vacant-seats-of-overseas-foreign-national-seats-for-session-2018-2019-smbbmu-larkana-02-25-2019', 'admission'::announcement_category, 'LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSIONS TO 1ST YEAR MBBS ON VACANT SEATS OF OVERSEAS / FOREIGN NATIONAL SEATS FOR SESSION 2018-2019 @ SMBBMU LARKANA DOWNLOAD LIST', 'LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSIONS TO 1ST YEAR MBBS ON VACANT SEATS OF  OVERSEAS / FOREIGN NATIONAL SEATS FOR SESSION 2018-2019 @ SMBBMU LARKANA
DOWNLOAD LIST', '2019-02-25T09:00:00Z', '[{"name":"Overseaslistuntouch.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/overseaslistuntouch-15511640390.pdf","size_kb":570}]'::jsonb, NULL),
('List of Rejected Candidates and Pending Candidates Who Have Applied for Admission in to Nursing Courses at BINACHS SMBBMU Larkana', 'list-of-rejected-candidates-and-pending-candidates-who-have-applied-for-admission-in-to-nursing-courses-at-binachs-smbbmu-larkana-02-25-2019', 'admission'::announcement_category, 'LIST OF REJECTED CANDIDATES AND PENDING CANDIDATES WHO HAVE APPLIED FOR ADMISSION IN TO NURSING COURSES AT BINACHS SMBBMU LARKANA DOWNLOAD LIST REJECTED CASES DOWNLOAD LIST PENDING CASES', 'LIST OF REJECTED CANDIDATES AND PENDING CANDIDATES WHO HAVE APPLIED FOR ADMISSION IN TO NURSING COURSES AT BINACHS SMBBMU LARKANA
DOWNLOAD LIST REJECTED CASES
DOWNLOAD LIST PENDING CASES', '2019-02-25T09:00:00Z', '[{"name":"Rejectedlist.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/rejectedlist-15511639431.pdf","size_kb":408},{"name":"Pendingcases.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/pendingcases-15511639430.pdf","size_kb":411}]'::jsonb, NULL),
('Advertisement for Admission to MBBS/BDS Course Session 2018-19 on Vacant Seats of Overseas Pakistani''s Category at SMBBMU LARKANA', 'advertisement-for-admissions-to-mbbsbds-course-session-2018-19-on-vacant-seats-of-overseas-pakistanis-category-at-smbmu-larkana-02-13-2019', 'admission'::announcement_category, 'ADVERTISEMENT FOR ADMISSIONS TO MBBS/BDS COURSE SESSION 2018-19 ON VACANT SEATS OF OVERSEAS PAKISTANI’S CATEGORY AT SMBMU LARKANA APPLICATION FORM ADVERTISEMENT', 'ADVERTISEMENT FOR ADMISSIONS TO MBBS/BDS COURSE SESSION 2018-19 ON VACANT SEATS OF OVERSEAS PAKISTANI’S CATEGORY AT SMBMU LARKANA
APPLICATION FORM
ADVERTISEMENT', '2019-02-13T09:00:00Z', '[{"name":"Oversapplicform.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/oversapplicform-15500372981.pdf","size_kb":156},{"name":"Overseadv.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/overseadv-15500372980.pdf","size_kb":581}]'::jsonb, NULL),
('Advertisement for Admission to MBBS Course Session 2018-19 on Reserved Seat Of AJ&K Medical Colleges', 'advertisement-for-admissions-to-mbbs-course-session-2018-19-on-reserved-seat-of-ajk-medical-colleges-02-13-2019', 'admission'::announcement_category, 'ADVERTISEMENT FOR ADMISSIONS TO MBBS COURSE SESSION 2018-19 ON RESERVED SEAT OF AJ&K MEDICAL COLLEGES Application Form', 'ADVERTISEMENT FOR ADMISSIONS TO MBBS COURSE SESSION 2018-19 ON RESERVED SEAT OF AJ&K MEDICAL COLLEGES
Application Form', '2019-02-13T09:00:00Z', '[{"name":"Ajkapplicationformnew.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ajkapplicationformnew-15500441170.pdf","size_kb":24}]'::jsonb, NULL),
('Applications are Invited for  Admissions to BS NURSING (Generic) &  B.Sc Nursing (Post RN) at Benazir Institute of Nursing & Community Health Sciences SMBBMU Larkana  Session 2018-19', 'applications-are-invited-for-admissions-to-bs-nursing-generic-bsc-nursing-post-rn-at-benazir-institute-of-nursing-community-health-sciences-smbbmu-larkana-session-2018-19-01-28-2019', 'admission'::announcement_category, 'Applications are invited for: ADMISSIONS TO BS NURSING (Generic) & B.Sc Nursing (Post RN) at Benazir Institute of Nursing & Community Health Sciences SMBBMU Larkana SESSION 2018-19 CHALLAN 2 SMBBMU…', 'Applications are invited for:  ADMISSIONS TO BS NURSING (Generic) &  B.Sc Nursing (Post RN) at Benazir Institute of Nursing & Community Health Sciences SMBBMU Larkana  SESSION 2018-19
CHALLAN 2 SMBBMU
SMBBMU APPLICATION FORM
IBA APPLICATION FORM
CHALLAN 1 IBA
ADVERTISEMENT OF NURSING PROGRAMS', '2019-01-28T09:00:00Z', '[{"name":"Smbbmu Challan Nursing Programs Smbbmu Larkana Copy.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmu-challan-nursing-programs-smbbmu-larkana-copy-15486723924.pdf","size_kb":216},{"name":"Smbbmu Application Form For Nursing Course 2018 19.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmu-application-form-for-nursing-course-2018-19-15486723923.pdf","size_kb":495},{"name":"Iba Application Form Nursing Programs Smbbmu Larkana.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/iba-application-form-nursing-programs-smbbmu-larkana-15486723922.pdf","size_kb":275},{"name":"Challan Nursing Programs Smbbmu Larkana.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/challan-nursing-programs-smbbmu-larkana-15486723921.pdf","size_kb":206},{"name":"Advertisement Nursing Course 2018 19.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/advertisement-nursing-course-2018-19-15486723920.pdf","size_kb":489}]'::jsonb, NULL),
('Notice Inviting Tender for Provide and Supply of Office Furniture & Miscellaneous Items', 'notice-inviting-tender-for-provide-and-supply-of-office-furniture-miscellaneous-items-01-20-2019', 'tender'::announcement_category, 'Notice Inviting Tender for Provide and Supply of Office Furniture and Miscellaneous Items. Supporting document can also be download from PPRA Sindh Website :…', 'Notice Inviting Tender for Provide and Supply of Office Furniture and Miscellaneous Items.
Supporting document can also be download from PPRA Sindh Website :
https://ppms.pprasindh.gov.pk/PPMS/public/portal/notice-inviting-tender
Tender Documents', '2019-01-20T09:00:00Z', '[{"name":"Tender Documents.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/tender-documents-15486722140.pdf","size_kb":591}]'::jsonb, NULL),
('Result of First Year Pharm-D Examination Session 2016-17', 'result-of-first-year-pharm-d-examination-session-2016-17-01-14-2019', 'examination'::announcement_category, NULL, '', '2019-01-14T09:00:00Z', '[]'::jsonb, NULL),
('Merit Lists of Candidates Who Have Applied for Admission into 1st: year PHARM-D Courses for Session 2018-19', 'merit-lists-of-candidates-who-have-applied-for-admission-into-1st-year-pharm-d-courses-for-session-2018-19-01-11-2019', 'admission'::announcement_category, 'MERIT lists of candidates who have applied for admission into 1st: year PHARM-D courses for session 2018-19 OTHER DISTRICTS GMMMC SUKKUR SHIKARPUR NAUSHEHRO FEROZE LARKANA KASHMORE KAMBER-SHAHDADKOT…', 'MERIT lists of candidates who have applied for admission into 1st: year PHARM-D courses for session 2018-19
OTHER DISTRICTS
GMMMC SUKKUR
SHIKARPUR
NAUSHEHRO FEROZE
LARKANA
KASHMORE
KAMBER-SHAHDADKOT
JACOBABAD
DADU', '2019-01-11T09:00:00Z', '[{"name":"Otd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/otd-15475376498.pdf","size_kb":522},{"name":"Gmcsukpharmd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/gmcsukpharmd-15475376497.pdf","size_kb":631},{"name":"Shp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/shp-15475376496.pdf","size_kb":540},{"name":"Nfz.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nfz-15475376495.pdf","size_kb":516},{"name":"Lrk.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/lrk-15475376494.pdf","size_kb":744},{"name":"Kshm.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/kshm-15475376493.pdf","size_kb":498},{"name":"K Shd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/k-shd-15475376492.pdf","size_kb":617},{"name":"Jcd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/jcd-15475376491.pdf","size_kb":525},{"name":"Dadu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dadu-15475376490.pdf","size_kb":501}]'::jsonb, NULL),
('Notice for Day One Celebration (Amended)', 'notice-day-one-celebration-amended-12-24-2018', 'circular'::announcement_category, 'NOTICE ALL THE STUDENTS WHO ARE ADMITTED TO 1 BATCH -47 TH OF DECEMBER 2018 HAS BEEN RESCHEDULED / REFIXED ON SATURDAY THE 29TH OF DECEMBER 2018 PROGRAM: DATE: 29-12-2018 TIME: 10:00 AM VENUE:…', 'NOTICE
ALL THE STUDENTS WHO ARE ADMITTED TO 1
BATCH -47
TH
OF DECEMBER 2018 HAS BEEN RESCHEDULED / REFIXED ON SATURDAY THE 29TH OF DECEMBER 2018
PROGRAM:
DATE: 29-12-2018
TIME: 10:00 AM
VENUE: AUDITORIUM HALL CMC LARKANA', '2018-12-24T09:00:00Z', '[]'::jsonb, NULL),
('Result of MD/MS Part-I Examination December 2018', 'result-of-mdms-part-i-examination-december-2018-12-17-2018', 'examination'::announcement_category, NULL, '', '2018-12-17T09:00:00Z', '[]'::jsonb, NULL),
('Entry Test Result of FCPS-II, M.PHIL & Diploma Courses for session January 2019', 'entry-test-result-of-fcps-ii-mphil-diploma-courses-for-session-january-2019-12-17-2018', 'examination'::announcement_category, 'FCPS-II Result Diploma Result', 'FCPS-II Result
Diploma Result', '2018-12-17T09:00:00Z', '[{"name":"Entry Test Fcps.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/entry-test-fcps-15451262050.pdf","size_kb":1318},{"name":"Entry Test Diploma.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/entry-test-diploma-15451261470.pdf","size_kb":1137}]'::jsonb, NULL),
('Schedul of Interview for The Candiates Provisionally Selected to 1ST YEAR MBBS Course Session 2018-19 at CMC SMBBMU LARKANA', 'schedule-of-interview-for-the-candidates-provisionally-selected-to-1st-year-mbbs-course-session-2018-19-at-cmc-smbbmu-larkana-11-30-2018', 'job'::announcement_category, 'SCHEDULE OF INTERVIEW FOR THE CANDIDATES PROVISIONALLY SELECTED TO 1 ST YEAR MBBS COURSE SESSION 2018-19 AT CMC SMBBMU LARKANA SCHEDULE AND REQUIRED ORIGINAL DOCUMENTS', 'SCHEDULE OF INTERVIEW FOR THE CANDIDATES PROVISIONALLY SELECTED TO 1
ST
YEAR MBBS COURSE SESSION 2018-19 AT CMC SMBBMU LARKANA
SCHEDULE AND REQUIRED ORIGINAL DOCUMENTS', '2018-11-30T09:00:00Z', '[{"name":"Following All Original Documents Must Be Brought On The Date And Schedule.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/following-all-original-documents-must-be-brought-on-the-date-and-schedule-15435657480.pdf","size_kb":402}]'::jsonb, NULL),
('List of Candidates Who Have Applied for Admission to 1ST: Year  MBBS /BDS Courses for Session 2018-2019 UEAP LOCAL BASIS  AT SHAHEED MOHTARMA BENAZIR BHUTTO MEDICAL UNIVERSITY, LARKANA', 'list-of-candidates-who-have-applied-for-admisson-to-1st-year-mbbs-bds-courses-for-session-2018-2019-ueap-local-basis-at-shaheed-mohtarma-benazir-bhutto-medical-university-larkana-11-29-2018', 'admission'::announcement_category, 'LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSON TO 1ST: YEAR MBBS /BDS COURSES FOR SESSION 2018-2019 UEAP LOCAL BASIS AT SHAHEED MOHTARMA BENAZIR BHUTTO MEDICAL UNIVERSITY, LARKANA NOTICE OBJECTIONS…', 'LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSON TO 1ST: YEAR  MBBS /BDS COURSES FOR SESSION 2018-2019 UEAP LOCAL BASIS  AT
SHAHEED MOHTARMA BENAZIR BHUTTO MEDICAL UNIVERSITY, LARKANA
NOTICE
OBJECTIONS ON LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSION TO MBBS/BDS COURSE ON UEAP LOCAL BASIS (SELF FINANCE) SHALL BE ENTERTAINED TILL SATURDAY 01-12-2018
04 PM
NO OBJECTION SHALL BE ENTERTAINED AFTER DUE  DATE AND TIME
LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSON TO 1ST: YEAR  MBBS /BDS COURSES FOR SESSION 2018-2019 UEAP LOCAL BASIS', '2018-11-29T09:00:00Z', '[{"name":"Self1819b47.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/self1819b47-15434968380.pdf","size_kb":1456}]'::jsonb, NULL),
('Notice Inviting Tender for Printing and Supply of Undergraduate and Postgraduate Prospectus  2018-19', 'notice-inviting-tender-for-printing-and-supply-of-undergraduate-and-postgraduate-prospectus-2018-19-11-29-2018', 'tender'::announcement_category, 'Annual Procurement Plan Central Procurement Committee Complaint Redressal Committee Standard Bidding Document', 'Annual Procurement Plan
Central Procurement Committee
Complaint Redressal Committee
Standard Bidding Document', '2018-11-29T09:00:00Z', '[{"name":"04 Standard Bidding Document Sbd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/04-standard-bidding-document-sbd-15435052020.pdf","size_kb":2351}]'::jsonb, NULL),
('Candidate Selected on Reserved Seat for Disabled Candidate @ CMC Larkana Session 2018-2019 (MBBS) SMBBMU LARKANA', 'candidate-selected-on-reserved-seat-for-disabled-candidate-cmc-larkana-session-2018-2019-mbbs-smbbmu-larkana-11-27-2018', 'admission'::announcement_category, 'CANDIDATE SELECTED ON RESERVED SEAT FOR DISABLED CANDIDATE @ CMC LARKANA SESSION 2018-2019 (MBBS) SMBBMU LARKANA', 'CANDIDATE SELECTED ON RESERVED SEAT FOR DISABLED CANDIDATE @ CMC LARKANA SESSION 2018-2019 (MBBS) SMBBMU LARKANA', '2018-11-27T09:00:00Z', '[]'::jsonb, NULL),
('List of Candidate Who Have Applied for Admission to 1ST: Year  MBBS /BDS Courses for Session 2018-19 at SMBB Medical University, Larkana  and Selected at DUHS, JSMU and FJMC as Per Merit Cum Choice Basis', 'list-of-candidates-who-have-applied-for-admisson-to-1st-year-mbbs-bds-courses-for-session-20182019-at-shaheed-mohtarma-benazir-bhutto-medical-university-larkana-and-selected-at-duhs-jsmu-and-fjmc-as-per-merit-cum-choice-basis-11-20-2018', 'admission'::announcement_category, 'LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSON TO 1ST: YEAR MBBS /BDS COURSES FOR SESSION 20182019 AT SHAHEED MOHTARMA BENAZIR BHUTTO MEDICAL UNIVERSITY, LARKANA AND SELECTED AT DUHS, JSMU AND FJMC…', 'LIST OF CANDIDATES WHO HAVE APPLIED FOR ADMISSON TO 1ST: YEAR  MBBS /BDS COURSES FOR SESSION 20182019 AT SHAHEED MOHTARMA BENAZIR BHUTTO MEDICAL UNIVERSITY, LARKANA  AND SELECTED AT DUHS, JSMU AND FJMC AS PER MERIT CUM CHOICE BASIS
THE CANDIDATES WHO ARE SELECTED AT DUHS JSMU FJMC ARE ADVISED TO COLLECT THEIR
LETTER FROM DIRECTORATE OF ADMISSIONS SMBBMU AT CMC ON FRIDAY THE 23rd OF NOVEMBER 2018
THE CANDIDATES ARE SELECTED FROM GMMMC CENTER ARE ADVISED TO COLLECT THEIR NOMINATION
GMMMC SUKKUR
LIST OF CANDIDATES ADMITTED AT DUHS JSMU AND FJMC AS PER MERIT CUM CHOICE BASIS', '2018-11-20T09:00:00Z', '[{"name":"Res.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/res-15427204510.pdf","size_kb":471}]'::jsonb, NULL),
('Nawabshah Admission Advertisement', 'nawabshah-admission-advertisement-11-20-2018', 'admission'::announcement_category, 'NAWABSHAH ADMISSION ADVERTISEMENT APPLICATION FORM', 'NAWABSHAH ADMISSION ADVERTISEMENT
APPLICATION FORM', '2018-11-20T09:00:00Z', '[{"name":"Doc1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/doc1-15427197150.pdf","size_kb":271}]'::jsonb, NULL),
('Merit Lists OF SMBBMU Larkana', 'merit-lists-of-smbbmu-larkana-11-20-2018', 'admission'::announcement_category, 'MERIT LIST OF DISTRICT SHP MERIT LIST OF DISTRICT NFZ MERIT LIST OF DISTRICT LRK MERIT LIST OF DISTRICT KSHM MERIT LIST OF DISTRICT K-SHD MERIT LIST OF DISTRICT JCD MERIT LIST OF DISTRICT DADU', 'MERIT LIST OF DISTRICT SHP
MERIT LIST OF DISTRICT NFZ
MERIT LIST OF DISTRICT LRK
MERIT LIST OF DISTRICT KSHM
MERIT LIST OF DISTRICT K-SHD
MERIT LIST OF DISTRICT JCD
MERIT LIST OF DISTRICT DADU', '2018-11-20T09:00:00Z', '[{"name":"Shp.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/shp-15427202976.pdf","size_kb":2699},{"name":"Nfz.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nfz-15427202975.pdf","size_kb":4423},{"name":"Lrk.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/lrk-15427202974.pdf","size_kb":3895},{"name":"Kshm.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/kshm-15427202973.pdf","size_kb":2387},{"name":"K Shd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/k-shd-15427202972.pdf","size_kb":3069},{"name":"Jcd.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/jcd-15427202971.pdf","size_kb":2588},{"name":"Dadu.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dadu-15427202970.pdf","size_kb":3603}]'::jsonb, NULL),
('PRIVATE COLLEGE ADMISSIONS SINDH', 'private-college-admissions-sindh-11-19-2018', 'admission'::announcement_category, 'FOR ONLINE FORM HIT THE LINK BELOW Admission Cell - Jinnah Sindh Medical University http://www.jsmu-ae.com/privateadmission.html FOR PROSPECTUS Complete Private Medical Dental College.pdf - Google…', 'FOR ONLINE FORM HIT THE LINK BELOW
Admission Cell - Jinnah Sindh Medical University
http://www.jsmu-ae.com/privateadmission.html
FOR PROSPECTUS
Complete Private Medical Dental College.pdf - Google Drive
https://drive.google.com/file/d/159YqzlSVPU35S1Wf6SIGAiXm6pOOSBCO/view
FOR UNDERTAKING FORM
20181118 UNDERTAKING.pdf
http://www.jsmu.edu.pk/NEWSDATA/201811/News/20181118 UNDERTAKING.pdf
FOR ADVERTISEMENT
20181118 ADMISSION IN MBBS AND BDS OF ALL PRIVATE MEDICAL AND DENTAL COLLEGE AND UNIVERSITIES.pdf
http://www.jsmu.edu.pk/NEWSDATA/201811/News/20181118 ADMISSION IN MBBS AND BDS OF ALL PRIVATE MEDICAL AND DENTAL COLLEGE AND UNIVERSITIES.pdf', '2018-11-19T09:00:00Z', '[]'::jsonb, NULL),
('(UEAP LOCAL)  ADMISSIONS TO 1ST YEAR MBBS/BDS COURSES ON UEAP LOCAL BASIS FOR SESSION 2018-2019', 'ueap-local-admissions-to-1st-year-mbbsbds-courses-on-ueap-local-basis-for-session-2018-2019-11-16-2018', 'admission'::announcement_category, '(UEAP LOCAL) Admissions to 1 st YEAR mbbs/bds courses ON ueap local BASIS for SESSION 2018-2019 ADVERTISEMENT & APPLICATION FORM FOR ADMISSION TO MBBS/BDS COURSE UEAP LOCAL BASIS SESSION 18-19 SMBBMU…', '(UEAP LOCAL)
Admissions to 1
st
YEAR mbbs/bds courses ON ueap local BASIS for SESSION 2018-2019
ADVERTISEMENT & APPLICATION FORM FOR ADMISSION TO MBBS/BDS COURSE UEAP LOCAL BASIS SESSION 18-19 SMBBMU LARKANA', '2018-11-16T09:00:00Z', '[{"name":"Application Form For Ueap Local And Overseas Pakistani B 47 2018 2019.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/application-form-for-ueap-local-and-overseas-pakistani-b-47-2018-2019-15423692450.pdf","size_kb":179}]'::jsonb, NULL),
('Provisional Result uploaded with objection form. Last date of submission of Objection is  3rd Nov 2018', 'provisional-result-uploaded-with-objection-form-last-date-of-submission-of-objection-is-3rd-nov-2018-11-01-2018', 'examination'::announcement_category, 'Provisional Result uploaded with objection form. Last date of submission of Objection is 3rd Nov 2018 http://www.nts.org.pk/Test&Products/Results/102018/SMC_28Oct18_Result/Search.php', 'Provisional Result uploaded with objection form. Last date of submission of Objection is
3rd Nov 2018
http://www.nts.org.pk/Test&Products/Results/102018/SMC_28Oct18_Result/Search.php', '2018-11-01T09:00:00Z', '[]'::jsonb, NULL),
('Result of Final Professional BDS Annual Examination Session 2013-14', 'result-of-final-professional-bds-annual-examination-session-2013-14-11-01-2018', 'examination'::announcement_category, NULL, '', '2018-11-01T09:00:00Z', '[]'::jsonb, NULL),
('Provisional Eligibility list of candidates who have applied for admission into MBBS/BDS @CMC for session 2018-19', 'provisional-eligibility-list-of-candidates-who-have-applied-for-admission-into-mbbsbds-cmc-for-session-2018-19-10-27-2018', 'admission'::announcement_category, 'Download List', 'Download List', '2018-10-27T09:00:00Z', '[{"name":"Eligibility List 2018 19.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/eligibility-list-2018-19-15406371700.pdf","size_kb":19393}]'::jsonb, NULL),
('Notice for Hafiz e Quran & Disabled Candidates', 'notice-for-hafiz-e-quran-disabled-candidates-10-27-2018', 'circular'::announcement_category, 'NOTICE THE INTERVIEWS FOR DISABLED AND HAFIZ QURAN CANDIDATES ARE SCHEDULED AS FOLLOWS: Hafiz-e-Quraan candidates on Friday the 02 nd of November 2018 at 10: 30 AM in Syndicate Hall Medical Board for…', 'NOTICE
THE INTERVIEWS FOR DISABLED AND HAFIZ QURAN CANDIDATES ARE SCHEDULED AS FOLLOWS:
Hafiz-e-Quraan candidates on Friday  the
02
nd
of November 2018
at 10: 30 AM in Syndicate Hall
Medical Board for Disabled Candidates
on
Monday the 05
th
of November 2018
at 10.00 AM in Syndicate Hall SMBBMU, Larkana
List  of candidates, found ineligible/ not eligible  for the admission session 2018-19 SMBBMU/', '2018-10-27T09:00:00Z', '[{"name":"Nts.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/nts-15403000290.pdf","size_kb":402}]'::jsonb, NULL),
('Notice for candidates who applied for MBBS/BDS course Session 2018-19', 'notice-for-candidates-who-applied-for-mbbsbds-course-session-2018-19-10-26-2018', 'circular'::announcement_category, 'NOTICE All the candidates who applied for MBBS/BDS course Session 2018-19 at smbbmu larkana and could not receive their Admit Card/ NTS Roll No slip are advised to download their Admit Card/ NTS Roll…', 'NOTICE
All the candidates who applied for MBBS/BDS course Session 2018-19 at smbbmu larkana and could not receive their Admit Card/ NTS Roll No slip are advised to download their Admit Card/ NTS Roll No slip from website
www.nts.org.pk
or visit the help desk at PTS larkana / Public School Sukkur on Saturday the 27th October 2018 to get their slips.
THEY MUST BRING FOLLOWING DOCUMENTS WHILE VISITING THE HELP DESK OR COMING FOR THE ENTRY TEST:
TWO ATTESTED PHOTOGRAPHS
CNIC/B.FORM
01 PHOTO BEARING DOCUMENT', '2018-10-26T09:00:00Z', '[]'::jsonb, NULL),
('Provisional Eligibility list of candidates GMMMC SUKKUR who have applied for admission into 1st: year MBBS /BDS courses for session 2018-19', 'provisional-eligibility-list-of-candidates-gmmmc-sukkur-who-have-applied-for-admission-into-1st-year-mbbs-bds-courses-for-session-2018-19-10-24-2018', 'admission'::announcement_category, 'NOTICE Candidates are advised to submit their queries on provisional eligibility list to Admissions office Ghulam Muhammad Mahar Medical College Sukkur @ GMC Sukkur by hand or through email up to…', 'NOTICE
Candidates are advised to submit their queries on provisional eligibility list to  Admissions office  Ghulam Muhammad Mahar Medical College Sukkur  @ GMC Sukkur by hand or through  email up to   26-10-2018
gmujtabab@gmail.com
No Objection shall be entertained after 26-10-2018 (Friday)
Download List', '2018-10-24T09:00:00Z', '[{"name":"Gmmmcsukkur.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/gmmmcsukkur-15403853730.pdf","size_kb":11413}]'::jsonb, NULL),
('Admissions for Postgraduate courses for the Session January 2019', 'admissions-for-postgraduate-courses-for-the-session-january-2019-10-22-2018', 'admission'::announcement_category, NULL, '', '2018-10-22T09:00:00Z', '[]'::jsonb, NULL),
('Preliminary List of Voters and Non Voters  For Election of Syndicate', 'preliminary-list-of-voters-and-non-voters-for-election-of-syndicate-10-16-2018', 'circular'::announcement_category, 'Download List Of Non Voters Download List Of Voters', 'Download List Of Non Voters
Download List Of Voters', '2018-10-16T09:00:00Z', '[{"name":"Preliminary Non Voters List.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/preliminary-non-voters-list-15396991741.pdf","size_kb":97},{"name":"Preliminary Voters List.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/preliminary-voters-list-15396991740.pdf","size_kb":151}]'::jsonb, NULL),
('Notice for modification of schedule of election of syndicate', 'notice-for-modification-of-schedule-of-election-of-syndicate-10-16-2018', 'circular'::announcement_category, NULL, '', '2018-10-16T09:00:00Z', '[]'::jsonb, NULL),
('Result of Third Professional BDS (Supplementary Examination)', 'result-of-third-professional-bds-supplementary-examination-10-15-2018', 'examination'::announcement_category, 'Result of Third Professional BDS (Supplementary) Examination, Session 2014 - 2015 Bibi Aseefa Dental College, Larkana Held in the month of September 2018', 'Result of Third Professional BDS (Supplementary) Examination, Session 2014 - 2015 Bibi Aseefa Dental College, Larkana Held in the month of September 2018', '2018-10-15T09:00:00Z', '[]'::jsonb, NULL),
('Overseas Application form, Notice and processing fee voucher', 'overseas-application-form-notice-and-processing-fee-voucher-10-10-2018', 'circular'::announcement_category, 'Overseas Application form, Notice and processing fee voucher Fee Voucher Application Form for Overseas MBBS & BDS Session 2018-19 Notice for Overseas MBBS & BDS', 'Overseas Application form, Notice and processing fee voucher
Fee Voucher
Application Form for Overseas MBBS & BDS Session 2018-19
Notice for Overseas MBBS & BDS', '2018-10-10T09:00:00Z', '[{"name":"Processing Fee Voucher For Overseas 2018.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/processing-fee-voucher-for-overseas-2018-15391526762.pdf","size_kb":82},{"name":"Application Form Overseas 2018 19.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/application-form-overseas-2018-19-15391526761.pdf","size_kb":186},{"name":"Notice For Overseas Mbbs And Bds.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/notice-for-overseas-mbbs-and-bds-15391526760.pdf","size_kb":785}]'::jsonb, NULL),
('Admission in all Public and Private Medical and Dental Universities/Colleges of Sindh', 'admission-in-all-public-and-private-medical-and-dental-universitiescolleges-of-sindh-10-08-2018', 'admission'::announcement_category, NULL, '', '2018-10-08T09:00:00Z', '[]'::jsonb, NULL),
('Notice for candidate for admission at SMBB Medical College Lyari', 'notice-for-candidate-for-admission-at-smbb-medical-college-lyari-10-04-2018', 'admission'::announcement_category, 'Candidates desired for admissions at Shaheed Mohtarma Benazir Bhutto Medical College, Lyari and Sindh Institute Of Oral Health Sciences Karachi, must fill-up separate forms available on website…', 'Candidates desired for admissions at Shaheed Mohtarma Benazir Bhutto Medical College, Lyari and Sindh Institute Of Oral Health Sciences Karachi, must fill-up separate forms available on website
www.jsmu.edu.pk
&
www.smbbmu.edu.pk
ADMISSION FORM 2
ADMISSION FORM 1', '2018-10-04T09:00:00Z', '[{"name":"Form2.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/form2-15386482581.pdf","size_kb":554},{"name":"Form1.pdf","url":"https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/form1-15386482580.pdf","size_kb":655}]'::jsonb, NULL),
('Notice for fill online form for SMBBMU tagged districts candidates', 'notice-for-fill-online-form-for-smbbmu-tagged-districts-candidates-10-04-2018', 'circular'::announcement_category, 'All the candidates of tagged districts of SMBBMU larkana are required to mandatorily register themselves online on website www.jsmu.edu.pk', 'All the candidates of tagged districts of SMBBMU larkana are required to mandatorily register themselves online on website
www.jsmu.edu.pk', '2018-10-04T09:00:00Z', '[]'::jsonb, NULL),
('Circular of Microsoft office specialist exam', 'circular-of-microsoft-office-specialist-exam-10-01-2018', 'circular'::announcement_category, NULL, '', '2018-10-01T09:00:00Z', '[]'::jsonb, NULL),
('Admissions for MBBS-BDS for session 2018-19 for public universities/colleges of sindh province', 'admissions-for-mbbs-bds-for-session-2018-19-for-public-universitiescolleges-of-sindh-province-09-28-2018', 'admission'::announcement_category, NULL, '', '2018-09-28T09:00:00Z', '[]'::jsonb, NULL),
('Result of Diploma in clinical neurology (DCN) clinical examination march 2018', 'result-of-diploma-in-clinical-neurology-dcn-clinical-examination-march-2018-09-24-2018', 'examination'::announcement_category, NULL, '', '2018-09-24T09:00:00Z', '[]'::jsonb, NULL),
('Notice Inviting Tender for petty articles , stationary items and electric materials', 'notice-inviting-tender-for-petty-articles-stationary-items-and-electric-materials-09-10-2018', 'tender'::announcement_category, 'Technical document stationary items Financial document stationary items Technical document stationary items Financial document stationary items Technical document electric materials Financial…', 'Technical document stationary items
Financial document stationary items
Technical document stationary items
Financial document stationary items
Technical document electric materials
Financial document electric materials', '2018-09-10T09:00:00Z', '[]'::jsonb, NULL),
('22nd Meeting of Syndicate held on 08-05-2014.', '22nd-meeting-of-syndicate-held-on-08-05-2014-05-08-2014', 'circular'::announcement_category, 'Prof. Ghulam Asghar Channa, Vice Chancellor Shaheed Mohtarma Benazir Bhutto Medical University Larkana visited various Departments of CMC Larkana on Tuesday, 15-04-2014. He held surprise round of…', 'Prof. Ghulam Asghar Channa, Vice Chancellor Shaheed Mohtarma Benazir Bhutto Medical University Larkana visited various Departments of CMC Larkana on Tuesday, 15-04-2014. He held surprise round of Examination Halls at Chandka Medical College Larkana during the examination conduction procedure. Latteron he visited Examination Branch of University where Prof. Saifullah Jamro, Controller of Examinations (Under-graduate) gave the briefing. Thereafter, His Excellency proceeded to the University land and perceived the on-going development works. In the last on-site briefing was given by Project Director in which he submitted details of projects.', '2014-05-08T09:00:00Z', '[]'::jsonb, NULL),
('Flag Hositing and Plantation Drive mark  Youm-e-Azadi Celebrations at SMBBMU', 'flag-hositing-and-plantation-drive-mark-youm-e-azadi-celebrations-at-smbbmu-08-14-2025', 'event'::announcement_category, 'The national flag was hoisted by Prof Dr Nusrat Shah, the Vice Chancellor SMBBMU, alongside Deans of Faculties, Principals, Directors, faculty members, officers, staff, and students, in a spirit of…', 'The national flag was hoisted by Prof Dr Nusrat Shah, the Vice Chancellor SMBBMU, alongside Deans of Faculties, Principals, Directors, faculty members, officers, staff, and students, in a spirit of unity and patriotism.
Following the flag hoisting, a plantation drive was held, during which the Vice Chancellor, alongside faculty, officers, and students, planted several saplings across the campus. This green initiative symbolized the University’s commitment to environmental sustainability and its vision of contributing to a healthier, greener Pakistan.
On this auspicious occasion, Prof Nusrat Shah congratulated everyone on successful organisation of 7 medical camps around Larkano and Sukkur in the BHUs and RHCs of PPHI, covering Qambar Shahdadkot, Ratodero, Jacobabad, Arija, Pano Aqil, Mirpur Mathelo and Saleh Put; visit to Sweet Home Orphanage of Larkano and for organising many other activities including azadi walks, clinical ward activities, seminars, debates, sports competitions and plantation drives. She said the Independence Day and Marka e Haq fortnight has witnessed our university’s utmost commitment to our vision of improving health of rural and disadvantaged communities. She appreciated and thanked the faculty members, officers and students for participating actively in all Independence Day and Marka e Haq activities throughout the last 14 days. She also appreciated the gardeners for their hard work in preparing the ground and securing plants for the wonderful plantation activity.
The ceremony concluded on a happy note with renewed patriotic spirit, camaraderie, and a collective pledge to uphold the ideals of unity, faith, and discipline, while working towards a prosperous and sustainable Pakistan.', '2025-08-14T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1755755246533165260-731608203209229-7036468186271868761-n-thumb-589f41ae.jpg'),
('Free Mega Medical Camp in Celebration of Jashn-e-Azadi', 'free-mega-medical-camp-in-celebration-of-jashn-e-azadi-08-07-2025', 'event'::announcement_category, 'As part of the Jashn-e-Azadi 2025 celebrations, a Free Mega Medical Camp was organized on Thursday at Taluka Hospital Warah, on the special initiative of Prof Dr Nusrat Shah, Vice Chancellor, SMBBMU,…', 'As part
of the Jashn-e-Azadi 2025 celebrations, a Free Mega Medical Camp was organized on Thursday at Taluka Hospital Warah, on the special initiative of Prof Dr Nusrat Shah, Vice Chancellor, SMBBMU, Larkana,
in collaboration with Dr. Gulzar Ali Tunio (DHO Kamber Shahdadkot) and the Sindh Government Health Department.
A team of senior professors, consultants, and gynecologists from Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU) provided free medical checkups and treatment for a range of conditions,
Hepatitis
Skin Diseases
Malaria
Tuberculosis (TB)
General & Gynecological Checkups
All medical services, tests, and medicines  provided completely free of cost.', '2025-08-07T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/17561076221-thumb-d876a7c4.png'),
('Photos and Highlights of NAHE Trainings', 'photos-and-highlights-of-nahe-trainings-06-10-2025', 'news'::announcement_category, NULL, '', '2025-06-10T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1749545401img-0181-thumb-66a10e1f.jpg'),
('Review of Institutional Performance and Enhancement (RIPE) & PSG-2023 Orientation', 'review-of-institutional-performance-and-enhancement-ripe-psg-2023-orientation-05-27-2025', 'event'::announcement_category, 'QEC Conducts Strategic Workshop on Institutional Performance Review and PSG-2023 Framework at SMBBMU As part of its commitment to academic excellence and institutional quality, the Quality…', 'QEC Conducts Strategic Workshop on Institutional Performance Review and PSG-2023 Framework at SMBBMU
As part of its commitment to academic excellence and institutional quality, the Quality Enhancement Cell (QEC) at SMBBMU organized a high-impact workshop on
“Review of Institutional Performance and Enhancement (RIPE)”
alongside an in-depth orientation on the newly launched
Pakistan Precepts, Standards, and Guidelines (PSG-2023)
developed by the Quality Assurance Agency (QAA) of the Higher Education Commission.
Held on May 27th at the Smart Classroom, BADC, the workshop was tailored for members of the Institutional Quality Circle (IQC) and key administrative office bearers at SMBBMU. The session aimed to equip participants with a clear understanding of the PSG-2023 framework and to support them in the development of the RIPE Report for the university.
The workshop was expertly facilitated by Dr. Nasrullah Channa, Director QEC at Quaid-e-Awam University, Nawabshah, bringing valuable insights and hands-on guidance to ensure effective implementation of the new standards', '2025-05-27T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1749551968img-2087-thumb-956f4f47.jpg'),
('Program Review for Effectiveness & Enhancement (PREE)', 'program-review-for-effectiveness-enhancement-pree-05-26-2025', 'event'::announcement_category, 'QEC Hosts Strategic Workshop to Elevate MS/MPhil & PhD Program Standards at SMBBMU To continuously improve the quality and effectiveness of MS/MPhil and PhD programs at SMBBMU, the Quality…', 'QEC Hosts Strategic Workshop to Elevate MS/MPhil & PhD Program Standards at SMBBMU
To continuously improve the quality and effectiveness of MS/MPhil and PhD programs at SMBBMU, the Quality Enhancement Cell (QEC) successfully conducted a specialized workshop titled
“Program Review for Effectiveness & Enhancement (PREE)”
on May 26th at the Video Conference Hall, SMBBMU.
Targeted at Chairpersons and Program Team (P.T.) members, the workshop aimed to guide participants through the preparation and submission of Self-Assessment Reports (SARs) critical to academic quality assurance.
Dr. Nasrullah Channa, Director QEC at Quaid-e-Awam University, Nawabshah, led the session as the workshop facilitator.', '2025-05-26T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1749551861img-2065-thumb-476011f0.jpg'),
('Shaheed Mohtarma Benazir Bhutto Medical University signs MoU with Begum Nusrat Bhutto Women University Sukkur', 'shaheed-mohtarma-benazir-bhutto-medical-university-signs-mou-with-begum-nusrat-bhutto-women-university-sukkur-12-24-2024', 'news'::announcement_category, 'Shaheed Mohtarma Benazir Bhutto Medical University signs MoU with Begum Nusrat Bhutto Women University Sukkur on Tuesday, 24 December, 2024 at BNBWU Sukkur. The vice chancellor Smbbmu Prof Nusrat…', 'Shaheed Mohtarma Benazir Bhutto Medical University signs MoU with Begum Nusrat Bhutto Women University Sukkur on Tuesday, 24 December, 2024 at BNBWU Sukkur. The vice chancellor Smbbmu Prof Nusrat Shah and Vice Chancellor BNBWU, Prof Tehmina Nangraj signed the MoU, pledging collaboration in the fields of academics, research and technology.', '2024-12-24T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1735618465470664283-548026091567442-9002771475376985990-n-thumb-0996ecee.jpg'),
('SMBBMU Organized a Two-Day STEM Teacher Training Workshop', 'smbbmu-organized-a-two-day-stem-teacher-training-workshop-12-21-2024', 'event'::announcement_category, 'Shaheed Mohtarma Benazir Bhutto Medical University, Larkana organized a Two-day STEM Teacher Training Workshop by the UK-Pakistan Science & Innovation Global Network (UPSIGN), on 18th-19th December…', 'Shaheed Mohtarma Benazir Bhutto Medical University,
Larkana organized a Two-day STEM Teacher Training Workshop by the UK-Pakistan Science & Innovation Global Network (UPSIGN), on 18th-19th December 2024, at Chandka Medical College, Larkana. The workshop focused on evidence-based innovative teaching-learning methods to enhance student engagement and learning in classrooms. The workshop was facilitated by Ms Madiha Sajid (Imperial College
London), Dr Sajid Saleem (NUST, Karachi) and Professor Jawwad Darr (University College London), all three renowned educationists and researchers working on STEM Teacher Training Initiative all over Pakistan. Around 35 faculty members from all constituent colleges and institutes of Smbbmu actively participated in the sessions, contributing to discussions and gaining insights into modern pedagogical approaches. The vice chancellor of Smbbmu Prof. Dr. Nusrat Shah emphasised the university’s dedication to fostering academic excellence and expressed her gratitude to the international experts for their dedication to the cause of improving the standard of education by means of conducting regular teacher training programs in Pakistan. The workshop was organized by Dr Mir Hasan Khoso, Director ORIC,
SMBBMU
, Larkana.', '2024-12-21T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1735618719470575923-546983461671705-5901678991507561728-n-thumb-42250782.jpg'),
('Vice Chancellor of SMBBMU participated as Guest of Honour at the Opening Ceremony of the 21st International Conference on Statistical Sciences by Islamic Countries Society of Statistical Sciences (ISOSS)', 'vice-chancellor-of-smbbmu-participated-as-guest-of-honour-at-the-opening-ceremony-of-the-21st-international-conference-on-statistical-sciences-by-islamic-countries-society-of-statistical-sciences-isoss-12-09-2024', 'event'::announcement_category, NULL, '', '2024-12-09T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/17339883580-thumb-eea77322.jpeg'),
('6th SMBBMU Convocation', '6th-smbbmu-convocation-12-07-2024', 'event'::announcement_category, NULL, '', '2024-12-07T09:00:00Z', '[]'::jsonb, NULL),
('Interactive lecture on Public Health Management', 'interactive-lecture-on-public-health-management-11-30-2024', 'event'::announcement_category, 'The Directorate of ORIC, Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU), Larkana, successfully organized a visit and an interactive lecture on ‘Public Health Management’ by the Consul…', 'The Directorate of ORIC, Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU), Larkana, successfully organized a visit and an interactive lecture on ‘Public Health Management’ by the Consul General of Republic of Indonesia.
The Consul General Mr. Arie Poluzzi and his team visited the Arija campus of Smbbmu, where he delivered an insightful lecture on public health issues in Indonesia, focusing on effective management strategies and collaborative solutions.  He said both Indonesia and Pakistan have huge populations and most of their population is young. He said they need a lot of doctors in Indonesia and Pakistan’s graduates should apply for jobs and also for postgraduation. He visited the Institute of Pharmacy and Benazir College of Nursing and appreciated these educational opportunities being offered to students of rural areas.
The Vice Chancellor of SMBBMU, Prof Dr Nusrat Shah said applying for postgraduation in Indonesia is a great opportunity for our medical graduates as they are offering 250 fully funded scholarships for Pakistani students. She emphasised students should focus more on South East Asian countries which are cheaper and more feasible options for postgraduate education compared to USA and UK. Prof. Shah highlighted the role of international collaboration in fostering research and academic programs. She expressed her gratitude to Mr. Arie Poluzzi for visiting the university, sharing his expertise and fostering strong ties between Indonesia and SMBBMU in the field of health sciences.
Dr. Mir Hassan Khoso, Director ORIC, in his welcome speech highlighted the importance of international collaborations for Smbbmu and said we have already signed an MoU with Air Langga University Indonesia last year and look forward to meeting their team in our scientific conference in February 2025. fruitful discussions that inspire innovation and progress.
The vice chancellor presented ajrak and topi to the Consulate guests and Mr. Poluzzi presented a shield to Prof. Nusrat Shah and souvenirs to all the deans, principals and directors of SMBBMU.
The seminar was attended by the Dean of Basic Medical Sciences, Dean of Dentistry, Registrar, Principals of CMC, BCON, BADC, and Directors of Pharmacy and Physiotherapy, along with faculty members, officers and students.', '2024-11-30T09:00:00Z', '[]'::jsonb, NULL),
('First SMBBMU International Conference on Family Planning', 'first-smbbmu-international-conference-on-family-planning-09-26-2024', 'event'::announcement_category, 'First SMBBMU International Conference on Family Planning was held at the Latif Auditorium Chandka Medical College, Larkana, on 26 September 2024, the World Contraception Day. This landmark event was…', 'First SMBBMU International Conference on Family Planning was held at the Latif Auditorium Chandka Medical College, Larkana, on 26 September 2024, the World Contraception Day. This landmark event was graced by Dr Azra Fazal Pechuho, the honorable Minister of Health and Population Welfare, Government of Sindh.
Population is the cross cutting issue challenging the achievement of all Sustainable Development Goals and the theme of the conference “Family Planning: the way forward to a sustainable world” underscores the pivotal role family planning can play in achieving all the goals, particularly those related to poverty, hunger, mother and child health, quality education, gender equality and environmental sustainability. This was stated by the vice chancellor of Smbbmu, Dr Nusrat Shah in her welcome address.
Dr Azra Fazal Pechuho appreciated the vice chancellor for organising the first international family planning conference in the historical city of Larkana. She said Sindh is the only province where we have combined health and population welfare departments for better coordination and service delivery and this should be replicated by other provinces too. She highlighted that the current policies of NFC award which are based on distribution of resources on the basis of population are not helping our population welfare programs, and may lead to further population growth particularly in Sindh and Balochistan. She said the federal government will have to review its policies for equitable distribution of resources to all provinces and for improving the outcomes of population welfare programs. The health department is trying to ensure universal access to reproductive healthcare services and to provide commodities of family planning. The Child Nutrition Act has been brought to prevent malnutrition and under nutrition and this will help improve child health and development in Sindh. She emphasised the right of every child to live and thrive, to have a good health and education, to be loved and cared for, and that a couple should decide to have children only if they can provide these basic rights.
Mr Abdullah Khan, Secretary PWD Baluchistan, talked about Pakistan''s rapid population growth currently ranking fifth globally and highlighted the limited resources allocated to Baluchistan on the basis of population. The PWD is trying to enhance procurement of commodities and improve service delivery in remote areas of Baluchistan.
Pakistan has not made any significant progress in provision of family planning coverage as the mCPR is still around 37% for modern contraceptives. This was stated by Dr Zulfiqar A Bhutta, the Robert Harding Chair in Global Child Health and Policy SickKids Center for Global Child Health, Toronto and Founding Director Centre of Excellence in Women and Child Health, AKU. He highlighted the inequities in access to FP services due to which the CPR is much less for younger women below 18 years of age, and for poor, illiterate and rural women. He said although rural-urban disparity has reduced in Sindh, overall the FP uptake remains around 35%. Until and unless we  reduce social inequities and integrate FP with maternal and child health, immunisation, infant nutrition, girl education and economic empowerment of women, we will not be able to achieve the goal of 57% CPR by 2030.
Dr Anita Zaidi emphasised that FP does not just save lives but it transforms them. We believe every woman and girl is worthy of opportunity, health and dignity. We know that when lives of individual women improve, everyone’s lives improve and therefore investing in FP and in broader women’s health issues helps them to better plan their lives, unlock their economic power and achieve a gender equal world. Dr Anita is the President of Gender Equality Division at Bill and Melinda Gates Foundation, at Seatle USA.
Pakistan is currently the 5th most populous country in the world and in 26 years it will be the 4th most populous country. Although we have achieved some success in Sindh of improving the CPR from 33% to 41%, we need to reach the target of 57% by 2030 and we can only hope to achieve this if we use multi sectoral approach where departments of health, education, P&D, Women Development, Youth Affairs all work together with PWD. This was stated by Dr Talib Lashari, the Technical Adviser for CIP and Focal Person for FP2030.
Mr Anthony Daly emphasized that a woman''s freedom to decide if and when to marry or have children, as well as to live free from violence and harmful practices, is essential for her empowerment and rights. He noted that family planning not only facilitates these choices but also enhances educational outcomes for families and helps keep girls in schools. He is the Technical Advisor Family Planning at Asia-Pacific Regional Office, United Nations Population Fund.
Dr Shershah Syed emphasized that every hospital should have a dedicated space for male counseling on family planning, highlighting the importance of engaging men in reproductive health discussions.
Sumita Banerji stated that we are committed to ensuring that every woman and girl worldwide has access to voluntary and rights-based family planning services by 2030. She is the MD, FP2030, Asia Hub.
Dr Amanda Sturm, Obstetrician and Gynaecologist from Sweden spoke about the role of midwives in family planning while Dr Martin Verblom, a laparoscopic gynaecological surgeon spoke on the role of youth in family planning.
Apart from the Inauguration ceremony, the conference included three high level Panel discussions on 1) Policies, Services and Capacity; 2) Postpartum and Post-abortion family planning in Sindh; 3) Role of Academia and Youth engagement for family planning in Sindh.
The program of the conference also included two Pre-conference workshops, a Poster Competition, a Plenary Session and an Exhibition Hall for development partners to showcase their projects and materials for the conference participants.
During the concluding session, the vice chancellor Dr Nusrat Shah expressed her gratitude to the Organizing Committee, Collaborating Partners including PWD, UNFPA, Pathfinder, Jhpiego, WHO, Ipas, Hands, Greenstar Social Marketing, Vital Pakistan, SRSO, DKT Pakistan and Peace Foundation, the keynote speakers and Panelists, and all participants for attending the conference.
The conference witnessed a significant turnout of around 650 participants including faculty members, healthcare providers, LHVs, LHWs, nurses, midwives, postgraduate and undergraduate students and students of girls college, Larkano.
The event concluded with announcement by Dr Talib Lashari for laying down the foundation of Academic Faculty Members Working Group and a Youth Club for students.', '2024-09-26T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1727938815img15-thumb-40896fa3.jpg'),
('Tree Plantation seminar was organized by Shaheed Mohtrma Benazir Bhutto Medical University Larkana', 'tree-plantation-seminar-was-organized-by-shaheed-mohtrma-benazir-bhutto-medical-university-larkana-09-10-2024', 'event'::announcement_category, 'A Tree Plantation seminar was organized by Shaheed Mohtrma Benazir Bhutto Medical University Larkana in collaboration with Sindh Agricultural University Tando Jam on 10 September 2024 at Arija Campus…', 'A Tree Plantation seminar was organized by Shaheed Mohtrma Benazir Bhutto Medical University Larkana in collaboration with Sindh Agricultural University Tando Jam on 10 September 2024 at Arija Campus of the University.
The Chief Guest in the seminar was the Vice Chancellor of Sindh Agricultural University, Tando Jam, Dr. Fateh Muhammad Marri, while the seminar was presided over by Prof. Dr. Nusrat Shah. The speakers included Sindh Agriculture University experts Prof. Noor un Nissa Memon and Prof. Inayatullah Rajpar and the District Forest Officer Mr Arshad Haider. Dr Fateh Muhammad Marri while addressing the seminar said SMBBMU is the first university of Sindh to organise a Plantation Seminar, which highlights the vision of the Vice Chancellor Prof Nusrat Shah. He said the goal is to plant 1 crore trees in Sindh. However, taking care of plants is more important than planting trees because if we had done that there would be enough trees in the world today.
Speaking on the occasion, Professor Nusrat Shah said this is a unique seminar as this is the first time university has organized an educational activity regarding Plantation. We are a medical university and we realize that trees are a symbol of health. Planting more trees improves human health by improving the quality of air. She said the good news is that SMBBMU is going to sign an MoU with SAU, Tando Jam for collaborating in the fields of teaching, learning, research, joint seminars and conferences and student and faculty exchange programs.
Addressing the seminar, Professor Noor un Nissa Memon gave a very comprehensive presentation on Plantation.
Dr. Inayatullah Rajpar talked about the quality of soil for successful Plantation.
The seminar was also addressed by District Forest Officer Mr Arshad Haider, Director Pharmacy Dr Waseem Abbas and Dr Nadeem Baloch. Significantly, apart from pharmacy and nursing students, a large number of primary school children of Arija also attended the Seminar along with their Head Master and teachers.', '2024-09-10T09:00:00Z', '[]'::jsonb, NULL),
('SMBBMU Celebrated 77th Independence Day', 'smbbmu-celebrated-77th-independence-day-08-14-2024', 'event'::announcement_category, NULL, '', '2024-08-14T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1723712644indp4-thumb-9502ea4c.jpeg'),
('Workshop on Reference Management Using Mendeley Software', 'workshop-on-reference-management-using-mendeley-software-08-06-2024', 'event'::announcement_category, 'Under the esteemed leadership of Hon''ble Vice Chancellor Prof. Dr. Nusrat Shah, the Directorate of ORIC, SMBB Medical University Larkana, in collaboration with the Pakistan Scientific and…', 'Under the esteemed leadership of Hon''ble Vice Chancellor Prof. Dr. Nusrat Shah, the Directorate of ORIC, SMBB Medical University Larkana, in collaboration with the Pakistan Scientific and Technological Information Centre (PASTIC) Karachi, successfully organized a workshop on Reference Management Using Mendeley Software at the Academic Hall, CMC Larkana.
Dr. Mir Hassan Khoso, Director of ORIC & Research, extended his heartfelt gratitude to Hon''ble Vice Chancellor Prof. Dr. Nusrat Shah for her unwavering support and trust in organizing this interactive training workshop. In his speech, Dr. Khoso also expressed special thanks to the resource person, Dr. Mariyum Ibrar, Additional Director at the Pakistan Scientific and Technological Information Centre, Islamabad, and Ms. Afsheen, Deputy Director of PASTIC Karachi. He also acknowledged the support of Prof. Zamir Ahmed Soomro, Principal of CMC, Dr. Fouzia Chandio, Prof. Altaf Hussain Shaikh, Principal of GMMMC Sukkur, and Dr. Faizan Ali Shah, Vice Principal, Prof Dr. Sirajuddin Soomro and Mr. Waheed U Zaman Deputy Director IT for their invaluable contributions to the successful organization of this event.
The workshop saw active participation from approximately 66 attendees from SMBBMU Larkana and about 50 participants from GMMMC Sukkur, reflecting a strong commitment to enhancing research capabilities and academic excellence.', '2024-08-06T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1723712934453998782-443897868646932-6784718268037419888-n-thumb-bdafb06e.jpg'),
('SMBBMU Observed Youm-e-Istehsal e Kashmir', 'smbbmu-observed-youm-e-istehsal-e-kashmir-08-05-2024', 'event'::announcement_category, 'On the occasion of 5th August, special seminars were organised in all constituent colleges of Smbbmu to observe youm e Istehsal e Kashmir. According to the details, separate events and walks were…', 'On the occasion of 5th August, special seminars were organised in all constituent colleges of Smbbmu to observe youm e Istehsal e Kashmir.
According to the details, separate events and walks were organized at Chandka Medical College (CMC) Larkana, Ghulam Mohammad Maher Medical College (GMMMC) Sukkur, Bibi Aseefa Dental College (BADC) Larkana, Institute of Pharmacy and Benazir College of Nursing (BCON) and Institute of Physiotherapy and Rehabilitation, Larkana.
Students and faculty from all colleges participated in Seminars and delivered speeches in support of Kashmiri people. Vice-Chancellor Professor Dr. Nusrat Shah said in her address at various events that today we are sending a strong message to the global community and United Nations that the illegal revocation of the special status of Kashmir by the Indian government in 2019 is not acceptable to Kashmiris and to Pakistan and must be reversed. Kashmiri people will continue their struggle for their rights and self determination till they get freedom and Pakistan stands united with them.
The Seminars in all colleges were followed by solidarity walks by students, faculty members, officers and staff of SMBBMU.', '2024-08-05T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1722932204event10-thumb-3cc447a6.jpeg'),
('Memorandum of Understanding (MoU) signed between SMBBMU, and the University of Alberta, Canada', 'memorandum-of-understanding-mou-signed-between-smbbmu-and-the-university-of-alberta-canada-07-26-2024', 'event'::announcement_category, 'Memorandum of Understanding (MoU) was signed between Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU), Larkana, and the University of Alberta, Canada, during a virtual ceremony held at the…', 'Memorandum of Understanding (MoU) was signed between Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU), Larkana, and the University of Alberta, Canada, during a virtual ceremony held at the VC Secretariat, SMBBMU Larkana.
The University of Alberta is a public research university located in Edmonton, Alberta, Canada. The University of Alberta has ranked 91st in the world and fourth in Canada.
The Vice Chancellor of SMBBMU, Prof. Dr. Nusrat Shah, along with Registrar Prof. Safdar Ali Shaikh, Dean of Medicine & Allied Sciences Prof. Bashir Ahmad Shaikh, Dean of Basic Science Prof. M. Hanif Shaikh, Prof. Zameer Ahmed Soomro, Principal CMC, Director ORIC & Research Dr. Mir Hassan Khoso, and Dr. Ghulam Abbas Qadri, signed the MoU with the Vice Rector of the University of Alberta, Prof. Dr. Brenda Hemmelgarn, Prof. Xin Min Li, and Prof. Uwais Qarni.
This MoU symbolizes a shared commitment to cooperation across student and faculty exchange programs, fieldwork education, and collaborative endeavors in academics and research. The agreement also includes joint workshops, conferences, and training initiatives.
This collaborative effort signifies a remarkable step toward international academic and research cooperation.
This MoU represents a significant milestone in fostering global partnerships and enhancing educational and research opportunities for both institutions.', '2024-07-26T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1722191367452881432-436916239345095-6281011613946109147-n-thumb-be207e38.jpg'),
('SMBBMU & SRSO Formally signed A Memorandum of Understanding (MOU).', 'smbbmu-srso-formally-signed-a-memorandum-of-understanding-mou-07-25-2024', 'event'::announcement_category, 'Today 24th July 2024 marks a significant milestone as the Honorable Vice Chancellor of Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU) Larkana, Prof. Dr. Nusrat Shah, and the CEO of Sindh…', 'Today 24th July 2024 marks a significant milestone as the Honorable Vice Chancellor of Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU) Larkana, Prof. Dr. Nusrat Shah, and the CEO of Sindh Rural Support Organization (SRSO), Mr. Muhammad Dittal Kalhoro, formally signed a Memorandum of Understanding (MoU). The ceremony, held in the witness of Mr. Asif Ali Khuhro, Chief Financial Officer, SRSO, and Dr. Mir Hassan Khoso, Director ORIC & Research, SMBBMU Larkana, symbolizes a strategic alliance to foster a cooperative relationship between the two esteemed institutions.
This MoU lays the foundation for joint research initiatives, including collaborative projects on rural development, women''s empowerment, social entrepreneurship, and community health initiatives. Both SMBBMU and SRSO will prioritize research projects that address global challenges, foster innovation, and align with sustainable development goals, thereby enhancing the impact and reach of their collaborative efforts.
Mr. Dittal Kalhoro commended the Honorable Vice Chancellor for her remarkable achievements in rapidly transforming the university. During the signing ceremony, the Vice Chancellor expressed gratitude for SRSO''s collaborative approach, underscoring the vital importance of such alliances in promoting regional growth. The CEO of SRSO, along with his team, engaged in discussions highlighting the crucial role that rural development plays in advancing the economic prosperity of the region. The discussions underscored the shared commitment of both institutions to leverage their collective expertise and resources for the betterment of rural communities.
The event was graced by the presence of the Registrar, Dean of Dentistry, Dean Basic Medical Sciences, Principal Chandka Medical College Larkana, Director ORIC & Research and Principal BCON further reflecting the strong support and enthusiasm for this landmark collaboration.', '2024-07-25T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/17219298762-thumb-20d5764b.jpeg'),
('World Environment Day Meeting at the office of Mayer Larkana', 'world-environment-day-meeting-at-the-office-of-mayer-larkana-06-06-2024', 'event'::announcement_category, 'World Environment Day Meeting at the office of Mayer Larkana Mr Anwar Ali Luhur on 5 June 2024 The Vice Chancellor SMBBMU Larkana, Prof Nusrat Shah attended the World Environment Day Meeting…', 'World Environment Day Meeting at the office of Mayer Larkana Mr Anwar Ali Luhur on 5 June 2024
The Vice Chancellor SMBBMU Larkana, Prof Nusrat Shah attended the World Environment Day Meeting organised by the Mayor of Larkana Mr Anwar Ali Luhur on 5 June 2024. The program started with plantation of several ‘Amaltas’ trees followed by cake cutting and then meeting with all the dignitaries of Larkana, and officers of Municipal Committees. Mr Anwar welcomed the vice chancellor and other dignitaries and emphasised his mission of making Larkana green and beautiful. Mr Iftikhar Ahmed, head of Rescue 1122 said plantation and trees can lower the temperatures during heat waves. He quoted the example of Punjab university which has developed botanical gardens in Lahore which has lowered the temperatures there and said we can do the same for Larkana. Mr Munir Ahmed Soomro said he remembered the Larkana in old times when it used to be called the city of gardens and was filled with trees but now things are different and our society has to realise that we need to work together to make Larkana green again. Prof Nusrat Shah congratulated the mayor and everyone else for celebrating the world environment day and said our university is a health science university and one of our important goals is to work for a healthy sustainable environment which can promote health and prevent disease. She said trees are important for survival of our planet and for entire ecosystem including human race, animals, birds and fishes. She said trees give us oxygen and take up our carbon dioxide and we need more and more plantation to face the challenge of climate change and massive floods. She appealed to everyone to join hands and work together to make Larkana beautiful again and to bring down the temperature through massive plantation drive. In the end the Mayor presented Ajraks to the dignitaries and thanked everyone for attending the meeting.', '2024-06-06T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1722191568448250646-408867515483301-4259388286877837136-n-thumb-fe969b67.jpg'),
('2nd Research Poster Competition 2024 at SMBBMU Larkana', '2nd-research-poster-competition-2024-at-smbbmu-larkana-04-24-2024', 'event'::announcement_category, 'The 2nd Research Poster Competition 2024, organized by Dr. Mir Hassan Khoso, Director ORIC, under the esteemed supervision of Prof. Dr. Nusrat Shah, Vice Chancellor of SMBB Medical University…', 'The 2nd Research Poster Competition 2024, organized by Dr. Mir Hassan Khoso, Director ORIC, under the esteemed supervision of Prof. Dr. Nusrat Shah, Vice Chancellor of SMBB Medical University Larkana, was successfully held at the Gymnasium Hall, CMC Larkana.
The event was inaugurated by Prof. Dr. Nusrat Shah, Chief Guest and Vice Chancellor of SMBBMU Larkana, along with distinguished guests including Prof. Dr. M. Hanif Shaikh, Dean of Basic Medical Sciences, Prof. Dr. Qararo Shah, Dean of Community Medicine, Prof. Zameer Ahmed Soomro, Principal CMC, Dr. Mir Hassan Khoso, Director ORIC, and Prof. Dr. Saleem Raza Khuhawar.
Over 100 research posters were presented by undergraduate students from Chandka Medical College Larkana, BADC Dental College, Institute of Pharmacy, GMM Medical College Sukkur, Benazir College of Nursing Larkana, and IPRS Larkana. Additionally, 10 research posters were presented by faculty members and postgraduate students of SMBBMU Larkana.
Prof. Nusrat Shah, the Chief Guest of the event, commended the students for their historic participation and emphasized the importance of research in academia. She pledged university support for publishing research papers in international journals. Prof. Zameer Ahmad Soomro, Principal of Chandka Medical College, applauded the efforts of the ORIC team.
Dr. Mir Hassan Khoso, Director ORIC, highlighted the university''s commitment to research excellence, citing the success of the 1st Research Poster Competition in 2023 and the current event.
The 10,000 cash prizes and certificates awarded for 10 best research posters presented by the Vice Chancellor. Faculty members and postgraduates were also honored, with Dr. M.P Shahani, Prof. Sirajuddin  Soomro, and Dr. Quratulian securing the top three positions.
The esteemed panel of judges included Prof. Mehtab Alam from the University of Karachi, Dr. M. Bilal Azami from Dow University Karachi, Prof. Khursheed Abbasi, Prof. Saifullah Jamro, and Dr. Syed Faizan Shah from GMMMC Sukkur.
The event witnessed a strong turnout, with the participation of Prof. Saleem Sheikh, Prof. Saeed Shaikh, Prof. Sirajuddin Soomro, Dr. Fahad Jibran Siyal, Director HR Jibran Zafar Pirzado, Mr. Nazir Buriro, Dr. Mukesh Kumar, Mr. Ghulam Abbas Panhwar, Dr. Mahesh Odh, Mumtaz Buriro, Dr. Abdul Hafeez Abro, Sultan Bhutto and numerous officers, faculty, and students.', '2024-04-24T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1714246848im10-thumb-7547ca2f.jpeg'),
('An Interactive Session on mpowering Girls to Bridge the Gaps in Reproductive Health and Rights', 'an-interactive-session-on-mpowering-girls-to-bridge-the-gaps-in-reproductive-health-and-rights-03-21-2024', 'news'::announcement_category, 'Under the leadership of Prof. Dr. Nusrat Shah, Vice Chancellor of SMBBMU Larkana, the Directorate of ORIC, in collaboration with the US Mission in Pakistan and the Pakistan-US Alumni network,…', 'Under the leadership of Prof. Dr. Nusrat Shah, Vice Chancellor of SMBBMU Larkana, the Directorate of ORIC, in collaboration with the US Mission in Pakistan and the Pakistan-US Alumni network, organized an interactive session on "Empowering Girls to Bridge the Gaps in Reproductive Health and Rights," held at the Final Year Lecture Hall, CMC Larkana. Following a panel discussion, speech by Principal, CMC Larkana and lecture by Dr. Aisha Memon, Project Lead and member of the US Alumni network, Miss Annamaria, Public Diplomacy Officer at the US Consulate General Karachi, delivered her remarks virtually. In the conclusion of the session, Dr. Mir Hassan Khoso, Director ORIC, delivered the vote of thanks.', '2024-03-21T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1711086951photo-2024-03-21-14-19-19-thumb-76136a57.jpg'),
('An interactive talk featuring His Excellency Dr. June Kuncoro Hadiningrat, Consul General of Indonesia.', 'an-interactive-talk-featuring-his-excellency-dr-june-kuncoro-hadiningrat-consul-general-of-indonesia-03-11-2024', 'news'::announcement_category, 'Under the leadership of the Honorable Vice Chancellor, the Directorate of ORIC, SMBB Medical University Larkana organized an interactive talk featuring His Excellency Dr. June Kuncoro Hadiningrat,…', 'Under the leadership of the Honorable Vice Chancellor, the Directorate of ORIC, SMBB Medical University Larkana organized an interactive talk featuring His Excellency Dr. June Kuncoro Hadiningrat, Consul General of Indonesia.', '2024-03-11T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1711087462photo-2024-03-10-20-51-57-4-thumb-f645fad0.jpg'),
('The 50th Golden Jubilee Ceremony of Chandka Medical College', 'the-50th-golden-jubilee-ceremony-of-chandka-medical-college-02-24-2024', 'event'::announcement_category, 'The 50th Golden Jubilee Ceremony of Chandka Medical College and its First Grand Alumni Re-Union was held on 24 February 2024 at the Latif Auditorium of Chandka Medical College. Prof Ali Muhammad…', 'The 50th Golden Jubilee Ceremony of Chandka Medical College and its First Grand Alumni Re-Union was held on 24 February 2024 at the Latif Auditorium of Chandka Medical College. Prof Ali Muhammad Ansari, the first Principal of Chandka Medical College was the Chief Guest, and Ex Principals Prof Sikander Shaikh and Prof Akbar Haider Soomro were Guest of Honor. Prof Khalid Mehmood, Sitara-e-Imtiaz, renowned Meritorious Professor of Medicine, and alumnus of batch 3 was the Keynote
speaker. He spoke on “Future of Medicine”.', '2024-02-24T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1711088006photo-2024-03-04-20-45-34-10-thumb-e4949eea.jpg'),
('The First International Conference on “Emerging Trends in Basic Medical Sciences”', 'the-first-international-conference-on-emerging-trends-in-basic-medical-sciences-02-12-2024', 'event'::announcement_category, 'The First International Conference on “Emerging Trends in Basic Medical Sciences” was successfully convened at SMBBMU from 12-13 February at Chandka Medical College campus of Smbbmu, organised by…', 'The First International Conference on “Emerging Trends in Basic Medical Sciences” was successfully convened at SMBBMU from 12-13 February at Chandka Medical College campus of Smbbmu, organised by ORIC, Smbbmu and supported by Sindh HEC, Karachi. The Plenary sessions were held at Latif Auditorium of CMC. Parallel sessions were conducted concurrently across five seminar halls, each focusing on a specific field such as medical, dental, nursing, pharmacy, and physiotherapy. The Keynote speakers included Prof Kamarul Ariffin & Prof Zul Izhar Mohd Ismail from University of Sains Malaysia, Prof Yoshiaki Takaya from Meijo University Japan, Prof Dileep Kumar Rohra from Al-Faisal University Saudi Arabia, Prof Mohammad Ansar from Qauid e Azam University Islamabad, Prof. Fauzia Imtiaz, Ex- Vice Chancellor Malir University, Karachi, Prof. Nazeer Khan Director ORIC Baqai Medical University, Dr. Pamela Marshal Dean Ziauddin University, Dr. Rubina Qasim Duhs, and others.
Online Speakers included Prof Li Duanl, Shen Zen University, China, Dr. M. Hanif Pathan, USA, Prof Lubna Muhi Rasul University of Bagdad, Prof. Parveen, University of Sheffield, England, Dr. M. Khatib, Idlib University, Syria and Dr Tazeen Saeed Ali, Aku.
The First International Conference in Basic Sciences marks a significant milestone for SMBBMU with an overwhelming response from across the country and abroad. A total of 96 research papers were presented covering almost all fields of basic medical sciences including anatomy, physiology, biochemistry, pathology, pharmacology and genetics. In addition research papers in physiotherapy, nursing, dentistry and pharmaceutical sciences were also presented.
The conference served as a platform for fruitful exchange of ideas and collaboration among participants from esteemed institutions such as Quaid e Azam university Islamabad, Duhs, University of Karachi, Sindh University, AKU, JSMU, Baqai University, Lumhs, Pumhs and others.
The Vice Chancellor, Professor Dr. Nusrat Shah in her concluding remarks thanked the delegates for their excellent participation, inspiration, and invaluable learning experience this conference provided.', '2024-02-12T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1712300340426626805-336038369432883-8718383016331860125-n-thumb-e03cbb72.jpg'),
('The SMBBMU Larkana organised the Laptop Distribution Ceremony at Ghulam Muhammad Mahar Medical College (GMMMC) Sukkur on 26 January 2024', 'the-smbbmu-larkana-organised-the-laptop-distribution-ceremony-at-ghulam-muhammad-mahar-medical-college-gmmmc-sukkur-on-26-january-2024-01-26-2024', 'event'::announcement_category, 'The SMBBMU Larkana organised the Laptop Distribution Ceremony at Ghulam Muhammad Mahar Medical College (GMMMC) Sukkur on 26 January 2024, under the Prime Minister’s Laptop Distribution Program. Prof…', 'The SMBBMU Larkana organised the Laptop Distribution Ceremony at Ghulam Muhammad Mahar Medical College (GMMMC) Sukkur on 26 January 2024, under the Prime Minister’s Laptop Distribution Program.
Prof Rafique Memon, Principal GMMMC Sukkur welcomed all the guests and congratulated the successful students who have won the laptops due to their hard work and commitment. He said this is a great initiative of the Government of Pakistan to encourage meritorious students and to motivate them to perform even better.
Mr Roshan Ali Shaikh, Director of ICT and Focal Person for PM Laptop Scheme briefed the guests about the importance of the Laptop Scheme. He said the Prime Minister’s Laptop Distribution Scheme had started in 2016. He said a total of 214laptops have been received from HEC Islamabad for our University and hopefully we will get more Laptops in coming days. GMMMC Sukkur has received 37 Laptops for their students.
Laptops were distributed among 37 meritorious students of all five batches of GMMMC Sukkur by Prof Nusrat Shah, Prof Rafiq Memon, Director Postgraduate Studies Prof Altaf Shaikh, Vice Principal Gmmmc, Dr Ghulam Rasool Bouk, and Director IT, Engr Roshan Ali Shaikh.
The Chief Guest of the event, Vice Chancellor, Prof Nusrat Shah congratulated the students who received the Laptops. She thanked the government of Pakistan and HEC for this initiative and said we would like to request the government to provide this facility to even average students who cannot afford to buy their own laptops. She said students are lucky to be born in today’s internet era where all the advanced learning tools eg mobile phones, tablets, and laptops were available. They also have access to artificial intelligence and chat GPT which can provide all the necessary information for their questions and assignments. She said our students are more comfortable with technology than us as our generation was not exposed to modern technology. She said but in those days we used to read books, play in play grounds and also people used to communicate directly with each other rather than through text and WhatsApp messages and emails. Today’s children are not learning the art of conversation. Also, nowadays students are addicted to screens and are not physically active which is causing stress among young people and predisposing them to high blood pressure, diabetes and cardiovascular diseases. She said students have to manage their studies but also take care of their physical and mental health.
The ceremony was attended by Prof: Dr. Nusrat Shah, Vice Chancellor SMBBMU Larkana, Prof: Muhammad Rafique Memon Principal GMMMC Sukkur, Prof: Altaf Ahmed Shaikh, Director Postgraduate Studies, Prof: Ghulam Rasool Bouk, Vice Principal GMMC Sukkur, Engr. Roshan Ali Shaikh, Director ICT & Focal Person for PM Laptop Scheme, Faculty Members, Officers, Staff and students.', '2024-01-26T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/170646045710-thumb-4dfc8eff.jpeg'),
('Laptop Distribution Ceremony at SMBBMU', 'laptop-distribution-ceremony-at-smbbmu-01-10-2024', 'event'::announcement_category, 'The Prime Minister’s Laptop distribution ceremony was held on Wednesday, 10th January 2024, at Arija Campus of SMBBMU. The vice chancellor Prof: Dr. Nusrat Shah inaugurated the event. Mr Abdul Waheed…', 'The Prime Minister’s Laptop distribution ceremony was held on Wednesday, 10th January 2024, at Arija Campus of SMBBMU. The vice chancellor Prof: Dr. Nusrat Shah inaugurated the event. Mr Abdul Waheed Shaikh, commissioner Larkana Division attended as the Guest of Honour. Mr Roshan Shaikh, Director IT and focal person for the PM Laptop Scheme welcomed all participants and briefed regarding the importance of the Scheme which was initiated by the Government of Pakistan and implemented through HEC. He said our university has received 214 laptops which are going to be distributed among the highest achievers of all constituent colleges according to the online merit list.
The laptops were distributed among meritorious students by the Vice Chancellor, the Commissioner, Deans, Principals, and Directors of institutes.
Mr. Abdul Waheed Shaikh congratulated all the students on winning the Laptops and urged them to work hard and utilise the laptops for their studies and research purposes. Prof Nusrat Shah also congratulated all students on getting the reward for their wonderful academic performance. She said we are living in the digital era where the internet and other resources are very important for learning. She said laptops should be given to not just high achievers but to all students so that everyone can learn at par with others. She said we will try to request the government to provide this facility for all our students. The event was attended by the Deans, Registrar, Controller of Examinations, Principals/Directors of constituent Colleges and institutes, Faculty Members, Officers and the winning students.', '2024-01-10T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/17064606298-thumb-2f3e1b40.jpeg'),
('The 5th SMBBMU Convocation', 'the-5th-smbbmu-convocation-01-08-2024', 'event'::announcement_category, 'The 5th convocation of Shaheed Mohtarma Benazir Bhutto Medical University was held successfully at Arija Campus on 8 Jan 2024. The Vice Chancellor Prof Nusrat Shah presided over the ceremony. Prof Dr…', 'The 5th convocation of Shaheed Mohtarma Benazir Bhutto Medical University was held successfully at Arija Campus on 8 Jan 2024.
The Vice Chancellor Prof Nusrat Shah presided over the ceremony. Prof Dr Tahmina Mangan, Vice Chancellor of Begum Nusrat Bhutto Women University and Prof Asghar Channa, Ex-Vice Chancellor of SMBBMU were the Guests of Honour.
The vice chancellor conferred 361 degrees in medicine (MBBS), 119 dental degrees (BDS), 42 Nursing degrees (BSN), 23 Pharmacy degrees (Pharmacy-D) and 10 postgraduate degrees and diplomas. Sixty-four meritorious students were awarded gold medals. Late Prof Wazir Mohammad Shaikh award presented to best graduates in the field of Medicine, Late Prof Bilqees Malik award for best graduates of Obstetrics and Gynaecology and Prof Ali Akbar Siyal award to best graduate of Pharmacy.
Prof Nusrat Shah congratulated the new graduates and said the seed of university was sown 50 years ago by Shaheed Zulfiqar Ali Bhutto in the form of Chandka Medical College. It was the dream of Shaheed Benazir Bhutto that SMBBMU is now a full fledged medical university with 6 constituent colleges and institutes.
She said the university has faced unprecedented academic and infrastructure challenges due to the devastating floods of 2022. It has also braved severe financial crisis due to the 300 M loan and 400 M budget deficit along with huge liabilities in pension and other payments. The vice chancellor said during her one year tenure the university has paid off the loan, significantly reduced budget deficit and completed 3 development projects. Academic challenges have been overcome, several national and international linkages have been developed, a research culture has been promoted and first issue of scientific research journal Jsmbbmu published online.
Addressing the fresh graduates, Prof Nusrat Shah said “you are now a part of healthcare system of Sindh. The world is getting more complicated, technology is advancing at an alarming rate and robots are doing surgeries instead of surgeons. Are you ready to equip yourself with the modern technology skills.” She said we are living in 21st century but our people are still dying of malaria, TB, typhoid, dengue and HIV. The graduates need to take up the challenge of saving their people’s lives and work on prevention of avoidable diseases.
Prof Tahmina Mangan and Prof Asghar Channa paid tributes to Shaheed Z. A. Bhutto and Shaheed Benazir Bhutto and urged the graduates to serve the ailing humanity with empathy, dedication and compassion. They congratulated the vice chancellor and faculty for organising a successful 5th convocation of SMBBMU Larkana.', '2024-01-08T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1706460819c14-thumb-eebb9a49.jpeg'),
('52nd Cardicon held at Sukkur', '52nd-cardicon-held-at-sukkur-11-17-2023', 'event'::announcement_category, 'A Three day 52nd Cardiocon was held at the historical city of Sukkur from 17 to 19 November 2023. The Conference was organised by the Pakistan Cardiac Society in collaboration with SMBBMU Larkana,…', 'A Three day 52nd Cardiocon was held at the historical city of Sukkur from 17 to 19 November 2023. The Conference was organised by the Pakistan Cardiac Society in collaboration with SMBBMU Larkana, GMMMC Sukkur, and the Go Red for Women Society and was convened by Prof Raj Kumar Sachdevani.
The conference was well attended by senior cardiologists coming from all across Pakistan. The opening ceremony on 17 November 2023 was chaired by Prof Nusrat Shah, Vice Chancellor SMBBMU Larkana. Prof Jawaid Siyal was the Guest of Honour.', '2023-11-17T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1701073755photo-2023-11-22-11-55-01-4-thumb-897f38a4.jpeg'),
('Memorandum of Understanding (MoU) Signed between  SMBBMU and Idlib University, Syria', 'memorandum-of-understanding-mou-signed-between-smbbmu-and-idlib-university-syria-11-15-2023', 'event'::announcement_category, 'In a landmark moment of international collaboration, Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU), Larkana, Pakistan and Idlib University, Syria, signed a Memorandum of Understanding…', 'In a landmark moment of international collaboration, Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU), Larkana, Pakistan and Idlib University, Syria, signed a Memorandum of Understanding (MoU) today, 15th November 2023. The virtual ceremony took place at the Syndicate Hall, SMBB Medical University Larkana.
The MoU signing ceremony was attended by vice chancellor Prof Nusrat Shah, Dean Medicine & Allied Sciences Prof. Dr. Alam Ibrahim Siddiqui, Dean Surgical & Allied Sciences Prof. Gulzar Ahmed Shaikh, Dean Basic Science Prof. Amar Lal Gurbakhshani, Dean Community & Public Health Prof. Dr. Qararo Shah, Director of the Institute of Pharmacy Prof Abdul Rauf, Director ORIC and Research Dr Mir Hassan Khoso and Director of QEC, Mr. Altamash Sheeraz signed the MoU with the President Prof. Dr. Abdul Hamid Alkhali, Idlib University, Syria, along with his team Prof. Dr. Muhammed Alkateb, Dean of Medicine, Dr. Abdul Manem, Dean of Pharmacy, Dr. Hussam Ismael, Dean of Dentistry, Prof. Nassan Ahmed, Dean of Health Sciences and Director Research Dr. Mustafa Kayyali.
This collaborative effort signifies a remarkable step toward fostering international academic and research cooperation between SMBB Medical University Larkana and Idlib University, Syria.
The MoU establishes a shared commitment to cooperation across various domains;
Student, Faculty, and Officer Exchange Programs Collaborative Endeavors in Academics, Research, and Development
Joint Workshops, Conferences, and Training Initiatives:
The leadership of both institutions expressed their enthusiasm for this partnership, emphasizing the potential for mutual growth and the positive impact on the academic communities of SMBBMU and Idlib University.
This MoU sets the stage for a dynamic and enriching collaboration that transcends geographical boundaries, contributing to the advancement of education, research, and global understanding.', '2023-11-15T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1701073376.jpg'),
('Two-Days workshop on Research Grant Proposal Writing', 'two-days-workshop-on-research-grant-proposal-writing-11-02-2023', 'event'::announcement_category, 'Under the visionary guidance of the Hon''ble Vice Chancellor, the Directorate of ORIC, SMBB Medical University, Larkana organized a faculty development two-day workshop on "Research Grant Proposal…', 'Under the visionary guidance of the Hon''ble Vice Chancellor, the Directorate of ORIC, SMBB Medical University, Larkana organized a faculty development two-day workshop on "Research Grant Proposal Writing". It was held on 31st October and 1st November 2023 at the Video Conference Room, CMC Larkana.
This workshop introduced a valuable platform offering comprehensive insights into the art of crafting research grant proposals as well as addressing the critical factors which are required to secure grants successfully. It was aimed at engaging faculty members from various Colleges in order to enrich participants with learning experience that left them with enhanced knowledge and expertise.
The faculty members participated very actively in the group work to develop their research proposals and presented their work.
The distinguished facilitators of this learned workshop were Prof. Dr. Saleema Gulzar and Prof. Dr. Salma Rattani, hailing from Aga Khan University Karachi. Their valued wisdom improved the experience and comprehension of the participants.', '2023-11-02T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1698937645two-days-workshop-11-thumb-9c283864.jpeg'),
('Memorandum of Understanding  signed between SMBBMU and Inonu University, Turkey', 'memorandum-of-understanding-signed-between-smbbmu-and-inonu-university-turkey-11-02-2023', 'event'::announcement_category, 'Memorandum of Understanding was signed today, 02nd November 2023, between Shaheed Mohtarma Benazir Bhutto Medical University, Larkana, and Inonu University, Turkey during a virtual ceremony held…', 'Memorandum of Understanding was signed today, 02nd November 2023, between Shaheed Mohtarma Benazir Bhutto Medical University, Larkana, and Inonu University, Turkey during a virtual ceremony held online at Syndicate Hall, SMBB Medical University Larkana.
The Vice Chancellor of SMBBMU
along with Dean of Surgical and Allied Prof Gulzar Ahmed Shaikh, Dean of Basic Science Prof Amar Lal Gurbakhshani, Dean of Dentistry Prof Yousuf Shah, and Director ORIC Dr. Mir Hassan Khoso signed the Mou with the Vice Chancellor of İnönü University Turkey Prof. Dr. Ahmet KIZILAY and his Director Research.
This MOU symbolizes a shared commitment to cooperation across student, faculty, and officer exchange programs, as well as collaborative endeavors in academics, research, and development, along with joint workshops, conference and training initiatives.
The distinguished representatives from İnönü University, Turkey, who were present at this significant event, included Prof. Dr. Nusret Akpolat, Vice Rector for International Relations, Prof. Dr. Ekrem Atalan, Head of the International Office, and Samira Zafer, staff of the Erasmus office. This collaborative effort signifies a remarkable step toward international academic and research cooperation.', '2023-11-02T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1698947295two-days-workshop-1-thumb-fc45f8af.jpeg'),
('The Directorate of ORIC conducted an interactive session on Exploring New Horizons in HIV Research', 'the-directorate-of-oric-conducted-an-interactive-session-on-exploring-new-horizons-in-hiv-research-10-27-2023', 'news'::announcement_category, NULL, '', '2023-10-27T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1698568072ratodero-hiv-visit-1-thumb-a698392b.jpeg'),
('Young researchers of SMBBMU visited the HIV Center at Ratodero', 'young-researchers-of-smbbmu-visited-the-hiv-center-at-ratodero-10-26-2023', 'event'::announcement_category, 'Our young researchers visited the HIV Center at Ratodero on 26-10-2023 under the supervision of Director Oric Dr Mir Hassan Khoso, Director of Student Affairs Dr Fouzia Chandio, and Dr. Rehana…', 'Our young researchers visited the HIV Center at Ratodero on 26-10-2023 under the supervision of Director Oric Dr Mir Hassan Khoso, Director of Student Affairs Dr Fouzia Chandio, and Dr. Rehana Sadhayo lecturer Physiology Department. Students interacted with and interviewed the HIV children and their parents and counseled them about their treatment and rehabilitation.
Positively a great learning experience for students to get a glimpse into the real-life suffering of HIV patients in the community.', '2023-10-26T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1698567946ratodero-hiv-visit-1-thumb-b9bf4f34.jpeg'),
('Interactive talk on How to make a Successful application for achieving Chevening Scholarship UK', 'interactive-talk-on-how-to-make-a-successful-application-for-achieving-chevening-scholarship-uk-10-17-2023', 'news'::announcement_category, 'The Directorate of ORIC successfully organized a talk on "How to make a Successful application for achieving Chevening Scholarship UK" The speaker for this session was Reema Salman Engagement Officer…', 'The Directorate of ORIC successfully organized a talk on "How to make a Successful application for achieving Chevening Scholarship UK"
The speaker for this session was Reema Salman Engagement Officer Communications Department, British High Commission, Lahore.
The postgraduate students from various colleges attended the informative talk on scholarships in the UK both in person and online.', '2023-10-17T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1697555042uk-session-4-thumb-d8df45af.jpeg'),
('Workshop on The Art of Writing Scientific Papers', 'workshop-on-the-art-of-writing-scientific-papers-10-13-2023', 'event'::announcement_category, 'Under the visionary leadership of the Hon''ble Vice Chancellor, the Directorate of ORIC, SMBB Medical University Larkana successfully organized a workshop today on The Art of Writing Scientific Papers…', 'Under the visionary leadership of the Hon''ble Vice Chancellor, the Directorate of ORIC, SMBB Medical University Larkana successfully organized a workshop today on The Art of Writing Scientific Papers in the video conference room, CMC Larkana.
The speaker for this session was Dr. Yeboah Kwaku Opoku from Ghana.
Approximately 40 undergraduate students from various colleges attended the informative scientific workshop.', '2023-10-13T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1697605918387825781-257917753911612-4483309996221097019-n-thumb-d3965d46.jpg'),
('Scholarship Cheque distribution Ceremony was organized by the National Endowment Scholarship for Talent (NEST) along with Federal Education Department at Shaheed Mohtarma Benazir Bhutto Medical University, Larkana', 'scholarship-cheque-distribution-ceremony-was-organized-by-the-national-endowment-scholarship-for-talent-nest-along-with-federal-education-department-at-shaheed-mohtarma-benazir-bhutto-medical-university-larkana-10-08-2023', 'event'::announcement_category, 'Scholarship Cheque distribution Ceremony was organized by the National Endowment Scholarship for Talent (NEST) along with Federal Education Department at Shaheed Mohtarma Benazir Bhutto Medical…', 'Scholarship Cheque distribution Ceremony was organized by the National Endowment Scholarship for Talent (NEST) along with Federal Education Department at Shaheed Mohtarma Benazir Bhutto Medical University, Larkana, on 8th October, 2023.
General Manager of NEST Hajira Sohail, Assistant Manager Abdul Majeed Shaikh, Mazhar Ali Malik, Sohail Ahmad Shaikh distributed cheques to the students of Benazir College of Nursing along with other Colleges of Nursing such as Dera Murad Jamali Balochistan, Ghotki, Khairpur, Gumbat, and Shaheed Benazirabad.
A total of 60 female and male students of the colleges received the scholarship cheques. on behalf of Federal Minister of Education Mr. Madad Ali Sindhi, Cheques worth about two hundred and sixty thousand were distributed among the nursing students of the said colleges.
On this occasion, Vice Chancellor Prof. Dr. Nusrat Shah thanked the Federal Education Department and especially the supervising Federal Minister for Education Madad Ali Sindhi and the officials, and she said that the field of nursing is the most important and noble field in the medical field, it is service and worship, the field of nursing is of great importance in the world, without nursing, doctors are incomplete and hospitals are incomplete.
The Vice Chancellor congratulated Principal BCON, Mr. Ghulam Abbas Panhwar for organising the successful program, at the end of the event cultural gifts were presented to the guests, Dean Prof. Qararo Shah, Registrar Prof. Safdar Ali Shaikh, Director Jibran Zafar, Director Altamash Sheeraz.', '2023-10-08T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1697606415cheque-distribution-ceremony-3-thumb-6fb4ec82.jpeg'),
('Interactive Talk on Insight into Psychiatry under SMBBMU-APPNA-MERIT Partnership', 'interactive-talk-on-insight-into-psychiatry-under-smbbmu-appna-merit-partnership-10-07-2023', 'news'::announcement_category, 'An interactive online session was conducted for faculty and students by foreign faculty member Dr. Mujeeb U. Shad from the USA on the Topic: Insight into Psychiatry under SMBBMU-APPNA-MERIT…', 'An interactive online session was conducted for faculty and students by foreign faculty member Dr. Mujeeb U. Shad from the USA on the Topic: Insight into Psychiatry under SMBBMU-APPNA-MERIT Partnership', '2023-10-07T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1697606038387101660-254753140894740-9191896243744485204-n-thumb-239e4949.jpg'),
('The 12th POA Regional Orthopedic Clinical Meeting and workshop on “Sports Medicine and Arthroscopicy with Live Surgery', 'the-12th-poa-regional-orthopedic-clinical-meeting-and-workshop-on-sports-medicine-and-arthroscopicy-with-live-surgery-10-07-2023', 'event'::announcement_category, 'The 12th POA Regional Orthopedic Clinical Meeting and workshop on “Sports Medicine and Arthroscopicy with Live Surgery was organized by the Department of Orthopedic Surgery, Chandka Medical College…', 'The 12th POA Regional Orthopedic Clinical Meeting and workshop on “Sports Medicine and Arthroscopicy with Live Surgery was organized by the Department of Orthopedic Surgery, Chandka Medical College SMBB Medical University Larkana at Prof Younis H Soomro Memorial Hall.
Vice Chancellor SMBBMU Prof Nusrat Shah inaugurated the event as chief guest, a live interactive lecture and surgery was done, and a clinical case presentation was done by postgraduate of different institutes. Senior professors, consultants, and post graduates from GMMMC sukkur, KMC Khairpur, GIMS Gambat, JIMS Jacobabad, and Chandka Medical College attended the event.', '2023-10-07T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/169760634412th-poa-meeting-1-thumb-030e9bfa.jpeg'),
('SMBB Medical University Celebrating Pink Friday', 'smbb-medical-university-celebrating-pink-friday-10-06-2023', 'event'::announcement_category, NULL, '', '2023-10-06T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1697606171pink-friday-3-thumb-d53cf756.jpeg'),
('One day Fistula Camp organized at SMBBMU', 'one-day-fistula-camp-organized-at-smbbmu-10-03-2023', 'event'::announcement_category, 'One day Fistula Camp was organized by the Vice-Chancellor Professor Dr. Nusrat Shah at Sheikh Zaid Women''s Hospital in collaboration with Dr. Shershah Syed, a renowned gynaecologist and fistula…', 'One day Fistula Camp was organized by the Vice-Chancellor Professor Dr. Nusrat Shah at Sheikh Zaid Women''s Hospital in collaboration with Dr. Shershah Syed, a renowned gynaecologist and fistula surgeon of Pakistan. Six women with complicated fistula were successfully operated upon. On this occasion, Dr Shershah said fistula is a disease of poverty and underage marriages. During childbirth, due to small pelvic bones, head of the baby gets stuck, the baby usually dies and pressure of head makes a hole in the bladder or rectum. This results in fistula with leakage of urine and faeces which makes them outcasts in society due to the constant smell. Koohi goth hospital provides free treatment for such patients coming from all over Pakistan and restores their health and dignity. Dr Shershah said he has been passionately working to reduce maternal mortality and morbidity and started midwifery training in Koohi Goth Hospital Karachi to produce midwives for managing normal delivery. He said this would improve normal delivery rates, reduce the rate of caesarean delivery and also prevent fistula.
Dr Shershah further said a separate fistula ward and OT was developed by WHO at Shaikh Zaid hospital by the order of Supreme Court. He said, that ward is no longer here but there’s a dire need to dedicate a separate space for fistula patients at SZH, Larkana which will also comply with orders of Supreme Court.
The Vice-Chancellor of Smbbmu Prof. Dr. Nusrat Shah said that fistula is a treatable disease, women suffering from fistula are abandoned by the family and society. She said illiteracy is the main cause as millions of girls are out of school or are pulled out at the time of puberty and married off. These little girls are still growing up but as soon as they are married they are expected to bear a child every year with no access to family planning, thus putting them at high risk of developing fistula. She said Sindh is the only province with a law on underage marriage but we must improve the implementation. She said she has requested Dr Shershah to sign MoU between Koohi Goth hospital and Smbbmu to provide support for the university to start a midwifery program.
Prof Fouzia Kashif, Prof Shahida Magsi, Prof Shabnam Shaikh, Dr. Dayali Gul, and Dr. Fauzia Chandio were also present on this occasion.', '2023-10-03T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1696401780photo-2023-10-04-08-08-11-thumb-0520e124.jpeg'),
('An Interactive Talk on Entrepreneurship for Healthcare Professionals  by, Mr. Asad Ali Shah, organised by. Directorate of ORIC, SMBBMU', 'an-interactive-talk-on-entrepreneurship-for-healthcare-professionals-by-mr-asad-ali-shah-organised-by-directorate-of-oric-smbbmu-09-30-2023', 'news'::announcement_category, NULL, '', '2023-09-30T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1696399366382604466-251091937927527-7074876491935743800-n-thumb-05f02a3d.jpg'),
('World Pharmacist Day celebrated at the Institute of Pharmacy, SMBBMU, Larkana', 'world-pharmacist-day-celebrated-at-the-institute-of-pharmacy-smbbmu-larkana-09-26-2023', 'event'::announcement_category, NULL, '', '2023-09-26T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1696313467.jpeg'),
('An interactive session on the Awareness and Application Process for Medical Students on the UGRAD Exchange Program 2024 organized by Directorate of ORIC, SMBBMU, Larkana', 'an-interactive-session-on-the-awareness-and-application-process-for-medical-students-on-the-ugrad-exchange-program-2024-organized-by-directorate-of-oric-smbbmu-larkana-09-25-2023', 'news'::announcement_category, NULL, '', '2023-09-25T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1695657535seminar-ugrad-1-thumb-05e50173.jpeg'),
('Empowering Future Medical Professionals: Highlights of the', 'empowering-future-medical-professionals-highlights-of-the-09-12-2023', 'event'::announcement_category, 'Empowering Future Medical Professionals: Highlights of the "Medical Genetics and Relevant Errors of Morphogenesis" Crash Course Program at Chandka Medical College, Larkana. SMBBMU, LARKANA,…', 'Empowering Future Medical Professionals: Highlights of the "Medical Genetics and Relevant Errors of Morphogenesis" Crash Course Program at Chandka Medical College, Larkana.
SMBBMU, LARKANA, 09/09/2023 – Department of Pathology, Chandka Medical College, Larkana, held a highly successful two-day Crash Course Program titled as “Medical Genetics and Relevant Errors of Morphogenesis” on September 8th and 9th, 2023, at the Final Year Lecture Hall. The event, designed to bolster the knowledge and skills of future medical professionals regarding complex genetical disorders.
The program commenced with recitation of the Holy Quran. Subsequently, the Department of Pathology expressed its gratitude for the valuable contributions made by the esteemed Vice Chancellor in enhancing the standards of education and research. This recognition was evident through various initiatives, including workshops, crash courses, poster presentations, introduction of modular MBBS course and the introduction of new degree program, all of which have significantly contributed to the advancement of education and research within the institution.
Key highlights of the Crash Course Program included:
Comprehensive Subject Coverage:
The program encompassed rigorous sessions encompassing a diverse array of topics pertaining to genetic disorders. These topics included: The Nature of Genetic Abnormalities Contributing to Human Disease, Mendelian Disorders: Diseases Caused by Single-Gene Defects, Complex Multigenic Disorders, Cytogenetic Disorders, Single-Gene Disorders with Atypical Patterns of Inheritance. This comprehensive curriculum was designed to provide students with a holistic and thorough educational experience in the field of genetical disorders, ensuring a well-rounded understanding of the subject matter.
Expert Speaker:
Dr. Seraj Ud Duala, a renowned expert in Medical Genetics led the program, offered profound insights and expert guidance on intricate aspects of genetics. He conducted the crash course with an elevated level of clarity, engagement, organization, and adaptability, ensuring an exceptional educational experience for all participants.
Interactive Learning
:
The sessions encouraged active participation, discussions, and Q&A sessions, fostering a collaborative learning environment.
The Vice Chancellor of SMBBMU shared her insights on the event, expressing her contentment with the proceedings. She articulated, "Our goal is to nurture the talents of our future medical professionals and equip them with the skills they need to succeed. The Crash Course Program stands as a testament to our unwavering dedication to students’ education and prospective accomplishments." The Vice Chancellor further encouraged students to apply the newfound knowledge acquired during the crash course to excel in their academic and professional endeavors."
The Principal of Chandka Medical College, Larkana, expressed profound gratitude for the remarkable success attained during the "Medical Genetics and Relevant Errors of Morphogenesis" crash course. He emphasized the course''s significant value, recognizing it as a highly informative and instrumental resource for comprehending genetic disorders, ultimately arming our students with the expertise needed to identify genetic diseases. This accomplishment stands as proof of our institution''s resolute commitment to preserving the utmost standards in medical education.
The program concluded with a vote of thanks delivered by the Chairperson/HOD of the Department of Pathology at CMC, Larkana. He expressed profound gratitude to the Vice Chancellor of SMBBMU, Larkana, the Principal of CMC, Larkana, the esteemed Guest Speaker, faculty members, and the enthusiastic students for their gracious presence at this event. He also acknowledged the invaluable financial and moral support extended by the administration in facilitating the organization of this event. Furthermore, he extended his appreciation to Dr. Shahid Soomro (Vice Principal, CMC, Larkana), Jabran Pirzado, Abdul Samad Bhatti, Ihsanullah Bhatti and Dua for their invaluable contributions that played a pivotal role in the success of this event.
In conclusion, the program received positive feedback from both students and faculty members who attended, praising its effectiveness in clarifying complex genetics concepts and providing valuable study resources.', '2023-09-12T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1694583759photo-2023-09-12-13-17-29-thumb-06c9f13a.jpeg'),
('The 1st SMBBMU Undergraduate Oral Research Conference', 'the-1st-smbbmu-undergraduate-oral-research-conference-08-31-2023', 'event'::announcement_category, 'The 1st SMBBMU Undergraduate Oral Research Conference was organized by the Directorate of ORIC, under the supervision of Prof. Dr. Nusrat Shah, Vice Chancellor of SMBB Medical University Larkana, on…', 'The 1st SMBBMU Undergraduate Oral Research Conference was organized by the Directorate of ORIC, under the supervision of Prof. Dr. Nusrat Shah, Vice Chancellor of SMBB Medical University Larkana, on August 30, 2023, at the Final Year lecture hall of CMC Larkana.
The Vice Chancellor, SMBBMU Larkana, Prof, Dr. Nusrat Shah, inaugurated the event along with Prof. Dr. Alim Ibrahim Siddiqui, Dean of Medicine and Allied Sciences, Dr. Mir Hassan Khoso Director ORIC, Prof. Dr. Yousif Shah, Dean of Dentistry, Prof. Zameer Ahmed Soomro, Principal CMC.
During the conference, around 18 scholars presented their research on various projects covering a wide range of issues related to health. The 1st, 2nd, and 3rd winners were awarded a cash prize of Rs. 10,000 each besides a certificate of appreciation as well as shields. In addition to this, all other remaining scholars were also awarded a cash prize of Rs. 10,000 and a certificate of appreciation as well. The participants were extended an opportunity and a platform to engage in a detailed panel discussion where questions on health and hygiene were answered amicably.
The Vice Chancellor, Prof. Nusrat Shah expressed that the conference is an innovative nature which has been organised for the first time in the history of the varsity by the Director, ORIC. She further remarked that it will open avenues of research and development in basic and clinical sciences which will further add to the better healthcare services, medical practices, and methods to adopt new technologies. All these will benefit the patients in Pakistan through improved diagnostics and treatments.
Dr. Mir Hassan Khoso, Director, ORIC commented that the conference was established under the supervision of worthy Vice Chancellor, SMBBMU, Larkana in line with our commitment to contribute in scientific advancement through collaborations with the global medical research community. He further added that his office will be working for providing maximum opportunities and platforms to the students of this university to enhance their medical aptitude.', '2023-08-31T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1693487440undergraduate-oral-conference-7-thumb-8fa38580.jpeg'),
('SMBBMU celebrates the 76th Independence Day of Pakistan', 'smbbmu-celebrates-the-76th-independence-day-of-pakistan-08-14-2023', 'event'::announcement_category, 'SMBBMU celebrates the 76th Independence Day of Pakistan in Arija Campus on 14 August 2023', 'SMBBMU celebrates the 76th Independence Day of Pakistan in Arija Campus on 14 August 2023', '2023-08-14T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1693125582independence-cup-7-14-aug-2023-7-thumb-ae3a4bf8.jpeg'),
('SMBBMU, Larkana organised a Condolence Meeting to pay tribute to Prof Dr. Bilquis Malik', 'smbbmu-larkana-organised-a-condolence-meeting-to-pay-tribute-to-prof-dr-bilquis-malik-08-12-2023', 'news'::announcement_category, 'Shaheed Mohtarma Benazir Bhutto Medical University, Larkana organised a Condolence Meeting to pay tribute to Prof Dr. Bilquis Malik on Friday, 11 August 2023 at the Chandka Medical College, Larkana.…', 'Shaheed Mohtarma Benazir Bhutto Medical University, Larkana organised a Condolence Meeting to pay tribute to Prof Dr. Bilquis Malik on Friday, 11 August 2023 at the Chandka Medical College, Larkana. The Meeting was attended by Dr. Bilquis Malik’s daughter, her close associates, alumni of Chandka Medical College, faculty members, students, officers, and staff members of the university.
The vice chancellor of SMBBMU Dr Nusrat announced that four girls'' hostels have been named Prof Bilquis Malik Enclave. She proposed the name of Teaching Hospital CMC may be kept as prof Bilquis Malik Teaching Hospital
Further, she suggested that we can recommend to Syndicate that the name of the new digital Library at Chandka Medical College which is expected to be completed by next year can also be kept as Prof Bilquis Malik Digital Library', '2023-08-12T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1691849096balquis-malik-tribute-11-8-23-5-thumb-970fbaac.jpeg'),
('Interactive Seminar on USMLE and Residency Application in USA at Chandka Medical College, Larkana', 'interactive-seminar-on-usmle-and-residency-application-in-usa-at-chandka-medical-college-larkana-06-23-2023', 'event'::announcement_category, 'As per the visionary guidance of the Hon''ble Vice Chancellor, the Directorate of ORIC in collaboration with Chandka Medical Collage Larkana has organized an interactive Seminar on USMLE and Residency…', 'As per the visionary guidance of the Hon''ble Vice Chancellor, the Directorate of ORIC in collaboration with Chandka Medical Collage Larkana has organized an interactive Seminar on USMLE and Residency Application in the USA” on 21 June 2023', '2023-06-23T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1687518025usmle-23-06-2023-3-thumb-babf0031.jpeg'),
('2nd Sindh HEC Research & Technology Showcase 2023', '2nd-sindh-hec-research-technology-showcase-2023-05-22-2023', 'event'::announcement_category, 'Shaheed Mohtarma Benazir Bhutto Medical University Larkana participated in the Two-Day 2nd Sindh HEC Research & Technology Showcase 2023 at the Expo Center Karachi from 18 -19 May, 2023. Students…', 'Shaheed Mohtarma Benazir Bhutto Medical University Larkana participated in the Two-Day 2nd Sindh HEC Research & Technology Showcase 2023 at the Expo Center Karachi from 18 -19 May, 2023.
Students from Institute of Pharmacy, under the guidance and supervision of Director ORIC Dr Mir Hassan Khoso show-cased their product "Deplytic" a solid perfume with some anti-anxiety and anti-depressent properties.
The event provided an excellent learning opportunity for students where they could interact and engage with students and faculties from all other universities of Sindh, show case their innovation and creativity and learn from each other.
The Vice Chancellor of SMBBMU, Prof Nusrat Shah participated in the Closing Ceremony. She congratulated SHec team and expressed her appreciation for organizing this much needed activity. She recommended that for next time SHec should make sure that Industry people should also put up their stalls to show- case their products. This will allow more interaction between students and industry representatives and students will get guidance on what is the need of industry and how they can improve their products.
On behalf of SMBBMU, Prof Nusrat Shah received a Momento from Chairman SHEC Prof Tariq Rafi. Dr Mir Hassan Khoso also received a shield of appreciation on behalf of participating students.', '2023-05-22T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/16847651021-1-thumb-82b4c2b3.jpeg'),
('Virtual MOU Signing Ceremony between Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU) Larkana & University Sains Malaysia (USM) - Friday,  5th May, 2023.', 'virtual-mou-signing-ceremony-between-shaheed-mohtarma-benazir-bhutto-medical-university-smbbmu-larkana-university-sains-malaysia-usm-friday-5th-may-2023-05-05-2023', 'event'::announcement_category, 'A Memorandum of Understanding was signed today, 5th May, 2023, between Shaheed Mohtarma Benazir Bhutto Medical University, Larkana and University Sains Malaysia during a virtual ceremony held online.…', 'A Memorandum of Understanding was signed today, 5th May, 2023, between Shaheed Mohtarma Benazir Bhutto Medical University, Larkana and University Sains Malaysia during a virtual ceremony held online.
The Vice Chancellor of SMBBMU, Prof Dr Nusrat Shah along with the Director Office of Research, Innovation & Commercialization Dr Mir Hassan Khoso signed an MOU with the Vice Chancellor of USM, Prof Dr Abdul Rehman Mohammed and his Director International Affairs.  The MOU signifies mutual cooperation on student and faculty exchange programs, joint academic, research and development programs, and joint workshops and training programs.
The Ceremony was witnessed by Prof. Dr. Alam Ibrahim Siddiqui, Dean Medicine and Allied, Prof. Gulzar Ahmed Sheikh, Dean Surgery & Allied, Prof. Dr. Amar Lal Garbakhshani, Dean Basic Medical Sciences and Prof. Dr. Yusuf Shah, Dean Dentistry on behalf of SMBBMU Larkana.
The participants from USM who witnessed the ceremony included Prof. Dr. Narimah Samat, Deputy Vice Chancellor (Academic & International), Prof. Dr. Azlan Abdul Aziz, Dean, Institute of Postgraduate Studies, Prof. Dr. Irfan Mohammad, Deputy Dean for Postgraduate Studies, School of Medical Sciences, Prof. Dr. Kamarul Aryffin Baharuddin, Deputy Dean for Academic & International, School of Medical Sciences.', '2023-05-05T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/16834493651-1-thumb-c0d30aff.jpeg'),
('Special Condolence Meeting in memory of Shaheed Dr. Ajmal Sawand', 'special-condolence-meeting-in-memory-of-shaheed-dr-ajmal-sawand-04-15-2023', 'news'::announcement_category, 'SMBBMU Larkana held a special condolence meeting for remembering Shaheed Dr. Ajmal Sawand, a Ph.D. in Artificial intelligence from France, working as Assistant Professor at Sukkur IBA, and was the…', 'SMBBMU Larkana held a special condolence meeting for remembering Shaheed Dr. Ajmal Sawand, a Ph.D. in Artificial intelligence from France, working as Assistant Professor at Sukkur IBA, and was the victim of a brutal tribal murder at Kandhkot on 15 April 2023. After dua for Dr. Ajmal, a one-minute silence was observed in his memory. The meeting was attended by Dr. Tariq Sawand, brother of Dr. Ajmal, Vice Chancellor Prof Nusrat Shah, Dean of Medical and Allied Sciences Prof Alam Ibrahim, faculty members, students, and staff of SMBBMU.', '2023-04-15T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1681725832new-photo-1-thumb-b12052bd.jpeg'),
('Plantation Day Organized by Green Youth Movement (GYM) Club of SMBB Medical University', 'plantation-day-organized-by-green-youth-movement-gym-club-of-smbb-medical-university-04-13-2023', 'event'::announcement_category, NULL, '', '2023-04-13T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1681474031new-photo-1-thumb-42b19441.jpeg'),
('WHO, “Workshop on Kangroo Mothercare” SMBBMU on 21st March, 2023', 'who-workshop-on-kangroo-mothercare-smbbmu-on-21st-march-2023-03-22-2023', 'event'::announcement_category, 'A two days training workshop was carried out at Paeds hospital in collaboration with World Health Organization (WHO) on Kangaroo Mother Care (KMC) at Unit-I of Prof. Shanti Lal. Who organized the…', 'A two days training workshop was carried out at Paeds hospital in collaboration with World Health Organization (WHO) on Kangaroo Mother Care (KMC) at Unit-I of Prof. Shanti Lal. Who organized the training for
neonatologists,
paediatricians, nurses, and other health care professionals under the sponsorship of WHO & KMC.
Prof. Dr. Nusrat Shah Vice chancellor SMBBMU, graced the occasion as the Chief Guest and shared her views on KMC, She Said “Larkana is doing a wonderful job in terms of trainings on KMC,
it is necessary that we train every neonatologist, paediatrician, nurse and other health professionals in charge of preterm or LBW infants in the Kangaroo Mother Care (KMC) Method. She said, KMC should be practiced not only for babies delivered normally but also those delivered by
C-section.
Preterm births with complications are considered as the leading cause of neonatal deaths in Pakistan and The current infant mortality rate for Pakistan in 2023 is 55.777 deaths per 1000 live births,
Kangaroo Mother Care is a broader package of care defined by the World Health Organization. Kangaroo Mother Care originally referred only to care of low birth weight and preterm infants, and is defined as a care strategy including three main components:
kangaroo position, kangaroo nutrition and kangaroo discharge
.
At the end the session,
Prof. Dr. Nusrat Shah
distributed training Certificates amongst the participants.', '2023-03-22T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1679641419new-photo-2-thumb-ef7cd237.jpeg'),
('Colorectal Public Awareness Walk and Seminar Organized by Gastroenterology Department CMC, SMBBMU Larkana', 'colorectal-public-awareness-walk-and-seminar-organized-by-gastroenterology-department-cmc-smbbmu-larkana-03-22-2023', 'event'::announcement_category, NULL, '', '2023-03-22T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1679642355new-photo-7-thumb-0bfbd8d5.jpeg'),
('The World Oral Health Day celebrated at Bibi Aseefa Dental College SMBBMU', 'the-world-oral-health-day-celebrated-at-bibi-aseefa-dental-college-smbbmu-03-21-2023', 'event'::announcement_category, 'The 1st Research Poster Competition was held at Shaheed Mohtarma Benazir Bhutto Medical University, Larkana. It was organized by Dr. Mir Hassan Khoso, Director of the Office of Research, Innovation,…', 'The 1st Research Poster Competition was held at Shaheed Mohtarma Benazir Bhutto Medical University, Larkana. It was organized by Dr. Mir Hassan Khoso, Director of the Office of Research, Innovation, and Commercialization (ORIC). Students from all constituent colleges participated including Chandka Medical College (CMC), Ghulam Muhammad Mahar Medical College(GMMMC), Bibi Aseefa Dental College (BADC), Benazir College of Nursing (BCON), Institute of Pharmacy & Institute of Physiotherapy and Rehabilitation Sciences (IPRS) and Gambat Medical College (GMC). Moreover, Postgraduate students working in various medical & surgical wards of Chandka Medical College Hospital (CMCH) also presented their research Posters. More than 90 posters exhibited abstracts of scientific papers.
Vice Chancellor Prof Nusrat Shah said I''m surprised to see so much enthusiasm and motivation among students for research. She said students have chosen important and relevant topics for research eg diabetes, high blood pressure, HIV AIDS, Hepatitis, Asthma, and mental health. She said our students are very talented and willing to work hard for conducting research, they just need guidance and some training. She said we want to promote a research culture in the university and the university will pay for publication charges if students research papers get accepted by impact factor journals.
The first 10 research posters who won the competition were given cash prizes. Postgraduate students who won were presented shields by the Vice Chancellor. All participating students were given Certificates. The panel of judges included Prof. Alam Ibrahim, Prof. Gulzar Ahmed Sheikh, Prof. Amar Lal Gurbakhshani, Prof. Sayed Yusuf Shah, Prof. Qararo Shah, Prof. Shanti Lal, and Prof. Shahid Hussain Soomro.', '2023-03-21T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1679451801new-photo-4-thumb-96738ed9.jpeg'),
('First Research Poster Competition', 'first-research-poster-competition-03-17-2023', 'news'::announcement_category, 'The 1st Research Poster Competition was held at Shaheed Mohtarma Benazir Bhutto Medical University, Larkana. It was organized by Dr. Mir Hassan Khoso, Director of the Office of Research, Innovation,…', 'The 1st Research Poster Competition was held at Shaheed Mohtarma Benazir Bhutto Medical University, Larkana. It was organized by Dr. Mir Hassan Khoso, Director of the Office of Research, Innovation, and Commercialization (ORIC). Students from all constituent colleges participated including Chandka Medical College (CMC), Ghulam Muhammad Mahar Medical College(GMMMC), Bibi Aseefa Dental College (BADC), Benazir College of Nursing (BCON), Institute of Pharmacy & Institute of Physiotherapy and Rehabilitation Sciences (IPRS) and Gambat Medical College (GMC). Moreover, Postgraduate students working in various medical & surgical wards of Chandka Medical College Hospital (CMCH) also presented their research Posters. More than 90 posters exhibited abstracts of scientific papers.
Vice Chancellor Prof Nusrat Shah said I''m surprised to see so much enthusiasm and motivation among students for research. She said students have chosen important and relevant topics for research eg diabetes, high blood pressure, HIV AIDS, Hepatitis, Asthma, and mental health. She said our students are very talented and willing to work hard for conducting research, they just need guidance and some training. She said we want to promote a research culture in the university and the university will pay for publication charges if students research papers get accepted by impact factor journals.
The first 10 research posters who won the competition were given cash prizes. Postgraduate students who won were presented shields by the Vice Chancellor. All participating students were given Certificates. The panel of judges included Prof. Alam Ibrahim, Prof. Gulzar Ahmed Sheikh, Prof. Amar Lal Garbakhshani, Prof. Yusuf Shah, Prof. Qarao Shah, Prof. Shanti Lal, and Prof. Shahid Hussain Soomro.', '2023-03-17T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1679302516new-photo-1-thumb-f88b625a.jpeg'),
('12th Shaheed Mohtarma Benazir Bhutto Medical Univesity, Sports Week.', '12th-shaheed-mohtarma-benazir-bhutto-medical-univesity-sports-week-03-13-2023', 'event'::announcement_category, 'The 12th Sports Week was Organized by University for all its constituent colleges at the Gymnasium Hall for indoor games and a stadium for our-door games, the games include Badminton, Snooker, Ludo,…', 'The 12th  Sports Week was Organized by University for all its constituent colleges at the Gymnasium Hall for indoor games and a stadium for our-door games, the games include Badminton, Snooker, Ludo, Chess, Musical Chair, Tug of War, Cricket, Volley, and other interesting games. The event was Organized by Dr. Fahad Jibran Siyal and inaugurated by Vice Chancellor Shaheed Mohtarma Benazir Bhutto Medical University, Prof. Dr. Nusrat Shah by cutting the ribbon of Sports Week at Gymnasium Hall. All the participants expressed great enthusiasm and passion. Sports Week features sports competitions amongst all the constituent Colleges.
All the faculty and students from constituent colleges attended the opening ceremony of Sports Week. The students participated from Chandka Medical College (CMC), Bibi Aseefa Dental College (BADC), Benazir College of Nursing (BCON), Institute of Physiotherapy and Rehabilitation Sciences (IPRS), and Institute of Pharmacy. The Vice Chancellor said every student should participate in their favorite sport because it is crucial for health, along with studies, physical games and activities are equally important for living a healthy life not just physical health but also for mental social health, she said, we encourage and promote such activities for both boys and girls students with equal participation and zero gender discrimination to participate in every game. Sports and Physical activity is also important for character building, as they learn tolerance, patience, & acceptance, and would learn how to be happy.  She further said, sports are not merely for winning only, it teaches how to lose greacefully
and makes us learn how to handle it positively with a sportsman spirit that needs to be built in one''s character.
Principal Chandka Medical College Professor Dr. Zameer Ahmed Soomro said that we are organizing various activities during Sports Week, As cricket, badminton, football, table tennis, ludo, tug of war, chess and other games will be played, these activities will boost the sportsman spirit in the children, Principal Bibi Aseefa Dental College Professor Dr. Yusuf Shah said, at the same time curricular activities are going on in the university and sports are being organized at the same time, Director Physiotherapy Dr. Mukesh Kumar, Administrative Officer Ahmed Bux Dhani also addressed the inaugural function, Director Sports Dr. Fahad Jibran, Vice Principal BADC College Prof. Dr. Saleem Khawar, Director Planning & Development Zahid Hussain Dharejo, Chief Librarian Mumtaz Buriro, Director QEC Altamash Sheeraz, Chief Security Officer Sultan Ahmad Bhutto, other officers, faculty and a large number of students were present in the ceremony.', '2023-03-13T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1679301593new-photo-3-thumb-de5330d0.jpeg'),
('Celebrating the International Woman’s Day', 'celebrating-the-international-womans-day-03-08-2023', 'event'::announcement_category, 'The event was organized on Wednesday, March 8, 2023 by Prof. Dr. Fozia Kashif & Prof. Dr. Shahida Magsi and their team of doctors & PGs at Gyne & Obs Unit (I)&(II) at Shaikh Zaid Women Hospital…', 'The event was organized on Wednesday, March 8, 2023 by Prof. Dr. Fozia Kashif & Prof. Dr. Shahida Magsi and their team of doctors & PGs at Gyne & Obs Unit (I)&(II) at Shaikh Zaid Women Hospital Shaheed Mohtarma Benazir Bhutto Medical University, (SMBBMU) Larkana.
Prof. Dr. Nusrat Shah the Vice Chancellor SMBBMU was invited to be the Chief Guest of the Occasion. She inaugurated the newly established
High Dependency ward
at unit II. The formal proceedings of the program were initiated with the glorious verses of Holy Quran followed by Naat-e-Rasool Maqbool SWT, The Vice Chancellor in her speech mentioned “that her mother is her role-model who was a brave lady. Although she herself never went to school, but she made sure that all her daughters went to school.  My father was inspired by the leadership of Begum Nusrat Bhutto that he named me after her”. From childhood, education, career, and accomplishments she had had many stumbling blocks however, with high spirit. self-confidence and internal motivation she always kept going. “I am happy to be the 2
nd
lady Vice Chancellor of SMBBMU, Larkana” named after bibi Shaheed  she added. We have to change the patriarchal thinking now as the women are competing in every filed of education and career.
Professor Dr. Shahida Magsi said that the day is not far when a woman will be considered a first-class citizen, She further said that it is a pity that women are not being given the right of any decision,
Professor Dr Fauzia Kashif said that mother is the greatest miracle in the world, We are lucky to have a woman vice-chancellor of the university for the second time, every lady doctor here is a success story in herself, she added. The ceremony was attended by MS Dr. Gulzar Ahmed Tanio, Prof. Shaista Abro, Dr. Dayali Gul, Dr. Tanveer Gad, and a large number of female doctors and paramedical staff, At the end of the program, commemorative shields and gifts were given to the guests. In the ceremony, songs were sung and tableaus were presented regarding International Women''s Day.', '2023-03-08T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1679641472new-photo-2-thumb-fd45d915.jpeg'),
('Symposium on Healthy Liver for All', 'symposium-on-healthy-liver-for-all-03-04-2023', 'event'::announcement_category, 'The Gastroenterology department of Shaheed Mohtarma Benazir Bhutto Medical University at Chandka Medical College Larkana organized a symposium on the topic “HEALTY LIVER FOR ALL” from the platform of…', 'The Gastroenterology department of Shaheed Mohtarma Benazir Bhutto Medical University at Chandka Medical College Larkana organized a symposium on the topic
“HEALTY LIVER FOR ALL”
from the platform of Pakistan Society of Hepatology on 4th March 2023. For third Pakistan Society of Hepatology (PSH) symposium program. The event was organized by Chief Organizer Prof. Dr. Ali Haider Baloch and an assistant Asstt: Prof. Sultan Ahmed Chandio general secretary and  panel of experts as well as postgraduates from different hospitals from across the Pakistan participated in this scientific program. Amongst them are:-
·
Prof: Dr. Asad Chaudhary             President PSH
·
Prof: Dr. Asif Amir Nawaz            Governor American College of Gastroenterology in Pakistan
·
Prof: Dr. Javed Iqbal Farooqi          Consultant from Peshawar
·
Prof: Dr. Amanullah Abbasi           Dow University of Karachi
·
Dr.  Nazish Butt                          JPMC Karachi
·
Dr.  Zeeshan Ali Junejo                JPMC Karachi
·
Dr. Asif Raza Zaidi                      Sheikh Zayed hospital Larkana
·
Dr. Shahzad Riaz                         Shifa International Hospital Islamabad
·
Dr. Yasir Abbas Zaidi                  Nishtar Hospital Multan
·
Dr. Najam -Us- Sahar                   Gujranwala Medical College
·
Dr. Azizullah Sahito                     People''s Medical University Shaheed Benazirabad
·
Dr. Riaz Ali kokar                       People''s Medical University Shaheed Benazirabad
·
Dr. Riaz Ali Awan                       Liaquat University of Medical and Health Sciences Jamshoro
·
Dr. Akram Bajwa                        Liaquat University of Medical and Health Sciences Jamshoro
This scientific program also includes a session on follow up workshop on liver diseases in pregnancy which is organized by Assistant Professor Dr. Tanveer Fatima from Sheikh Zayed hospital Larkana.
Panel of the session experts includes Prof Dr. Shahida Magsi, Dr. Fozia Kashif, Dr. Shaista Hifaz, Prof. Dr. Safia Maqsood and Prof. Dr. Shabnam Naz, all from Sheikh Zaid women Hospital Larkana.
Highlights from various speakers include Dr. Asad Chaudhary, President PSH said that unfortunately Pakistan nowadays is number one country in the world as far as burden of viral hepatitis is concerned. Everyone has to work hard, including government and NGO''s as well as society to eliminate hepatitis from Pakistan. PSH is prestigious society to promote standards of care for liver problems since its foundation in 2001.
Prof. Dr. Javed Iqbal Farooqi: “NAFLD / MAFLD is the most common disease of liver in the world as well as Pakistan. It is mostly associated with obesity, diabetes, hypertension, and hyperlipidemia. If not treated in time, it leads to liver cirrhosis and cancer”.
Prof. Ali Haider Baloch, Chairman organizer Symposium said, to prevent our population from liver diseases and its consequences like cirrhosis of liver, liver failure and liver cancer for better management. The one way is to share recent advancement in the field of hepatology with our doctor community through Seminars, Symposia, Conferences. Gastroenterology Department, in collaboration with Pakistan Societies of hepatology (PSH) is trying to fulfill its responsibilities to promote standards of care for liver problems.
Dr. Shahzad Riaz concluded that liver transplantation is the only treatment for end stage liver diseases management of hepatocellular carcinoma and crucial decisions in liver transplantation are complex-MDT and team working is the key.', '2023-03-04T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1678090049new-photo-2-thumb-5f88be72.jpeg'),
('SMBBMU Employees Service Structure/BPS-Scale upgradation/promotion orders served by Madam Nusrat Shah the Vice Chancellor SMBBMU, Larkana.', 'smbbmu-employees-service-structurebps-scale-upgradationpromotion-orders-served-by-madam-nusrat-shah-the-vice-chancellor-smbbmu-larkana-03-01-2023', 'event'::announcement_category, 'The Vice Chancellor Shaheed Mohtarma Benazir Bhutto Medical University Larkana (SMBBMU) distributed Service-Structure/BPS-Scale upgradation/promotion orders amongst the fifty employees at Ghulam…', 'The Vice Chancellor Shaheed Mohtarma Benazir Bhutto Medical University Larkana (SMBBMU) distributed Service-Structure/BPS-Scale upgradation/promotion orders amongst the fifty employees at Ghulam Mohammad Mahar Medical College Sukkur (GMMMC) and eighteen employees at Chandka Medical College SMBBMU who had completed consecutive five (05) years of their service on erstwhile respective BPS on the forenoon of March 1, 2023 at Vice Chancellor’s Secretariat main Arija Campus.
With the collaboration of Director Human Resource (HR) Mr. Jibran Zaffar Pirzado and Registrar Prof. Abdul Rauf Kheskheli, the employees service structure was made with chronological order and disseminated to university workers of which from grade 14 to 16, one employee, Grade11 to 13 two employees, Grade 05 to 07 two employees, Grade 03 to 04 six employees, & Grade 02 to 03 seven employees respectively in CMC whereas, Grade 10 to 12 four employees, Grade 08 to 10 nine employees, Grade 05 to 06 five employees, Grade 04 to 05 thirty-two employees at GMMMC Sukkur respectively.
The employees were overwhelmed with pride and joy on the moment of receiving the orders, and expressed their dedication for future efforts to uplift the University’s development.', '2023-03-01T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1679297901new-photo-1-thumb-d81ffee5.jpeg'),
('Workshop on How to Conduct Research', 'workshop-on-how-to-conduct-research-02-28-2023', 'event'::announcement_category, 'The Directorate of ORIC has successfully organized Workshop on "How to Conduct Research". The Speaker was Prof Dr. Israr Khan from South Korea on 28th February 2023', 'The Directorate of ORIC has successfully organized Workshop on "How to Conduct Research". The Speaker was Prof Dr. Israr Khan from South Korea on 28th February 2023', '2023-02-28T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1681474235new-photo-1-thumb-7f58c514.jpeg'),
('HEC visit at SMBBMU for Postgraduate Training Evaluation', 'hec-visit-at-smbbmu-for-postgraduate-training-evaluation-02-08-2023', 'event'::announcement_category, NULL, '', '2023-02-08T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1677863902new-photo-1-thumb-4f2894e3.jpeg'),
('Faculty development workshop on ScholarRx online course for USMLE', 'faculty-development-workshop-on-scholarrx-online-course-for-usmle-01-29-2023', 'event'::announcement_category, 'Faculty development workshop on ScholarRx online course for USMLE conducted by Mr . Farzand from Amee Dundee , at CMC campus of SMBBMU Larkana on 29 Jan 2023', 'Faculty development workshop on ScholarRx online course for USMLE conducted by Mr
. Farzand
from
Amee Dundee
, at CMC campus of SMBBMU Larkana on 29 Jan 2023', '2023-01-29T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1677843935new-photo-1-thumb-eb442755.jpeg'),
('28th Academic Council Meeting', '28th-academic-council-meeting-01-26-2023', 'event'::announcement_category, '28th Academic Council Meeting of SMBBMU, Larkana, conducted on Thursday 26 Jan 2023 at the Auditorium of the Institute of Pharmacy Arija Campus', '28th Academic Council Meeting of SMBBMU, Larkana, conducted on Thursday 26 Jan 2023 at the Auditorium of the Institute of Pharmacy Arija Campus', '2023-01-26T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1677827682new-photo-1-2-thumb-df0d490b.jpeg'),
('Meeting of Hospital Management Board', 'meeting-of-hospital-management-board-07-31-2021', 'news'::announcement_category, NULL, '', '2021-07-31T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1627978122pic2-thumb-47de6432.jpeg')
on conflict (slug) do update set title=excluded.title, category=excluded.category, excerpt=excluded.excerpt, body=excluded.body, published_at=excluded.published_at, attachments=excluded.attachments, photo_url=excluded.photo_url;

-- 03_announcements_06.sql
insert into announcements (title, slug, category, excerpt, body, published_at, attachments, photo_url) values
('PhD Program Meetings', 'phd-program-meetings-07-31-2021', 'news'::announcement_category, NULL, '', '2021-07-31T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1627979460pic11-thumb-9a45d958.jpeg'),
('Visit of GOC Pano Aqil to SMBBMU', 'visit-of-goc-pano-aqil-to-smbbmu-07-12-2021', 'event'::announcement_category, NULL, '', '2021-07-12T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1626440546image9-thumb-8a5153fc.jpeg'),
('Quality Assurance (Internal & External Mechanism) & Self Assessment Report (SAR)', 'quality-assurance-internal-external-mechanism-self-assessment-report-sar-06-29-2021', 'event'::announcement_category, 'Quality Enhancement Cell has conducted a Workshop on “Quality Assurance (Internal & External Mechanism) & Self Assessment Report (SAR)” on Tuesday 29 th June, 2021 at SMBBMU. The targeted audience of…', 'Quality Enhancement Cell has conducted a Workshop on
“Quality Assurance (Internal & External Mechanism) & Self Assessment Report (SAR)”
on
Tuesday 29
th
June, 2021
at SMBBMU. The targeted audience of this workshop was
all Deans, all Chairmen Basic & Clinical Departments & the Principals/ Directors of all the Constitutes Colleges/ Institutes of SMBBMU, Larkana.
Ms. Sanam Soomro
,
Director QEC, has acted as the Resource person/ Facilitator. The purpose of this refresher workshop is to make the faculty and senior administration aware about the Mechanism of Quality, QAA, QEC and its role at DAIs and how to prepare SAR', '2021-06-29T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1632415876picture3-thumb-6de9375f.png'),
('Quality Enhancement Cell represented SMBBMU in the annual progress review meeting 2019-20 arranged by HEC at SUKKUR-IBA', 'quality-enhancement-cell-represented-smbbmu-in-the-annual-progress-review-meeting-2019-20-arranged-by-hec-at-sukkur-iba-03-09-2021', 'news'::announcement_category, NULL, '', '2021-03-09T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1628666667picture5-thumb-f542df49.png'),
('Higher Education Team Visit to SMBBMU', 'higher-education-team-visit-to-smbbmu-02-16-2021', 'event'::announcement_category, NULL, '', '2021-02-16T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1613840676dsc-0051-thumb-5f0a61f5.jpg'),
('Meeting on Library Project', 'meeting-on-library-project-01-25-2021', 'news'::announcement_category, NULL, '', '2021-01-25T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1613841456dsc-0133-thumb-013a38df.jpg'),
('Meeting of Hospital Management Board', 'meeting-of-hospital-management-board-01-13-2021', 'news'::announcement_category, NULL, '', '2021-01-13T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1613841731dsc-0021-thumb-8ded871e.jpg'),
('Interviews of Postgraduate Students for Sesssion January 2020', 'interviews-of-postgraduate-students-for-sesssion-january-2020-01-04-2021', 'news'::announcement_category, NULL, '', '2021-01-04T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1613840905dsc-0042-thumb-45519417.jpg'),
('20th Meeting of Board of Advanced Studies & Research', '20th-meeting-of-board-of-advanced-studies-research-12-21-2020', 'news'::announcement_category, NULL, '', '2020-12-21T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1613842161dsc-0010-thumb-d1bd4fe4.jpg'),
('Meeting about Self-Institutional Performance Evaluation', 'meeting-about-self-institutional-performance-evaluation-11-19-2020', 'news'::announcement_category, 'As per the guidelines from HEC the Self-Internal Evaluations of SMBBMU was conducted in last 2 years by the Institutional Performance Evaluation (IPE) panel and now next step is to prepare the…', 'As per the guidelines from HEC the Self-Internal Evaluations of SMBBMU was conducted in last 2 years by the Institutional Performance Evaluation (IPE) panel and now next step is to prepare the Implementation/ Action Plan Summary addressing the observations highlighted in IPE report.
Therefore, the Quality Enhancement Cell call a meeting of all concerned stakeholders to discuss and prepare the Implementation/ Action Plan Summary for subject mentioned report on
Thursday 19th November, 2020 by 11:00 AM
at Vice Chancellor Secretariat.', '2020-11-19T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1605853014photo-2020-11-19-13-08-01-thumb-eae33393.jpg'),
('19th Meeting of Board of Advanced Studies & Research', '19th-meeting-of-board-of-advanced-studies-research-11-17-2020', 'news'::announcement_category, NULL, '', '2020-11-17T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1605599786photo-2020-11-17-12-16-001-thumb-fac9aafd.jpg'),
('Breast Cancer Day', 'breast-cancer-day-10-20-2020', 'event'::announcement_category, NULL, '', '2020-10-20T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1613842065dsc-0089-thumb-8eb088f8.jpg'),
('Academic Council', 'academic-council-10-19-2020', 'news'::announcement_category, NULL, '', '2020-10-19T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1613842210dsc-3782-thumb-5d62d86e.jpg'),
('Academic Council', 'academic-council-09-12-2020', 'news'::announcement_category, NULL, '', '2020-09-12T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1613842249dsc-3713-thumb-e66a655b.jpg'),
('Chairman HEC Dr. Tariq Banuri visit of SMBBMU, Larkana and ground breaking of boys hostel at Main Arija Campus', 'chairman-hec-dr-tariq-banuri-visit-of-smbbmu-larkana-and-ground-breaking-of-boys-hostel-at-main-arija-campus-01-20-2020', 'event'::announcement_category, NULL, '', '2020-01-20T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1605115118nikon-d3300022-thumb-b6bacdfa.jpg'),
('8th Finance Planning Committee Meeting', '8th-finance-planning-committee-meeting-01-16-2020', 'news'::announcement_category, NULL, '', '2020-01-16T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1605113156nikon-d3300684-thumb-674e905b.jpg'),
('Day one celebration of Batch-48 , Session 2019-20', 'day-one-celebration-of-batch-48-session-2019-20-01-01-2020', 'event'::announcement_category, NULL, '', '2020-01-01T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1605114091nikon-d3300556-thumb-a9905484.jpg'),
('SMBBMU Syndicate Meeting at camp office larkana', 'smbbmu-syndicate-meeting-at-camp-office-larkana-12-24-2019', 'event'::announcement_category, NULL, '', '2019-12-24T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1605110166nikon-d33002392-thumb-b5690543.jpg'),
('PSH Symposium CMC Larkana on care of CIRRHOTIC patient', 'psh-symposium-cmc-larkana-on-care-of-cirrhotic-patient-12-21-2019', 'news'::announcement_category, NULL, '', '2019-12-21T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1605111019nikon-d33002071-thumb-00f16af0.jpg'),
('4th SMBBMU Larkana Convocation', '4th-smbbmu-larkana-convocation-12-14-2019', 'event'::announcement_category, NULL, '', '2019-12-14T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1605112589nikon-d33001001-thumb-6a331327.jpg'),
('Convocation Meeting', 'convocation-meeting-10-11-2019', 'event'::announcement_category, NULL, '', '2019-10-11T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1571121325image8-thumb-00dc63b1.jpeg'),
('Meeting on Estate Issues', 'meeting-on-estate-issues-10-11-2019', 'news'::announcement_category, NULL, '', '2019-10-11T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1571124835image7-thumb-cc58fd03.jpeg'),
('Selection Board', 'selection-board-09-21-2019', 'news'::announcement_category, NULL, '', '2019-09-21T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1571031027image7-thumb-688845b6.jpeg'),
('Condolences with BDS Student Dr. Nimerta Chandani''s  Family at Ghotki', 'condolences-with-bds-student-dr-nimerta-chandanis-family-at-ghotki-09-17-2019', 'news'::announcement_category, NULL, '', '2019-09-17T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1568808568photo11-thumb-f5311c3c.jpeg'),
('Entry Test', 'entry-test-09-15-2019', 'news'::announcement_category, NULL, '', '2019-09-15T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1571030835image7-thumb-e4c1cff6.jpeg'),
('National Defence Day Celebrations', 'national-defence-day-celebrations-09-06-2019', 'event'::announcement_category, NULL, '', '2019-09-06T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1568620771photo7-thumb-d0815106.jpeg'),
('Vice Chancellor Visit to Ghulam Muhammad Mahar Medical College Sukkur', 'vice-chancellor-visit-to-ghulam-muhammad-mahar-medical-college-sukkur-09-03-2019', 'event'::announcement_category, NULL, '', '2019-09-03T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1571030745image8-thumb-7a5084e3.jpeg'),
('40th Syndicate Meeting', '40th-syndicate-meeting-08-31-2019', 'news'::announcement_category, '40th Syndicate Meeting held on 31st august 2019.', '40th Syndicate Meeting held on 31st august 2019.', '2019-08-31T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1568719786img-1228-thumb-191517e6.jpg'),
('22nd Academic Council', '22nd-academic-council-08-26-2019', 'news'::announcement_category, NULL, '', '2019-08-26T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1568626157img-1069-thumb-88636eb0.jpg'),
('PM&DC visit to SMBBMU', 'pm-visit-to-smbbmu-08-19-2019', 'event'::announcement_category, NULL, '', '2019-08-19T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1567838438img-0246-thumb-9240f284.jpg'),
('Independence Day Celebrations', 'independence-day-celebrations-08-14-2019', 'event'::announcement_category, NULL, '', '2019-08-14T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1568624977img-0040-thumb-3ddbe307.jpg'),
('Selection Board for Administrative Positions', 'selection-board-for-administrative-positions-08-09-2019', 'news'::announcement_category, 'Selection Board for different administrative positions held on 09th and 10th august 2019', 'Selection Board for different administrative positions held on 09th and 10th august 2019', '2019-08-09T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1568625663img-9860-thumb-0c4e3d81.jpg'),
('Workshop on Role of Quality Enhancement Cell (QEC) in University and its Constituents & Affiliated College', 'workshop-on-role-of-quality-enhancement-cell-qec-in-university-and-its-constituents-affiliated-college-06-25-2019', 'event'::announcement_category, 'The Quality Enhancement Cell, SMBBMU Larkano Conduct Workshop on “Role of Quality Enhancement Cell (QEC) in University and its Constituents & Affiliated Colleges & PhD. Program Review and MS/M. Phil…', 'The Quality Enhancement Cell, SMBBMU Larkano Conduct Workshop on “Role of Quality Enhancement Cell (QEC) in University and its Constituents & Affiliated Colleges & PhD. Program Review and MS/M. Phil & Equivalent Program Review” for All Supervisors & Heads of Concerned Departments on
25th June 2019
at Video Conference Hall
Facilitator :
Prof. Dr. Abdul Razzak Mahar Director QEC, Shah Abdul Latif University', '2019-06-25T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1570085513picture1-thumb-78c095ff.png'),
('Self-Internal Evaluation of SMBBMU by Institutional Performance Evaluation (IPE) Panel', 'self-internal-evaluation-of-smbbmu-by-institutional-performance-evaluation-ipe-panel-06-25-2019', 'news'::announcement_category, 'The Quality Enhancement Cell, SMBBMU Larkano arranged Self-Internal Evaluation of SMBBMU on 24th - 25th June 2019 by Institutional Performance Evaluation (IPE) Panel. 1. Prof. Hakim Ali Abro Dean…', 'The Quality Enhancement Cell, SMBBMU Larkano arranged Self-Internal Evaluation of SMBBMU on
24th - 25th June
2019 by Institutional Performance Evaluation (IPE) Panel.
1.
Prof. Hakim Ali Abro
Dean faculty of Medicine & Allied Sciences
SMBBMU Larkana
Chairperson
2.
Prof. Saeed Ahmed Shaikh
Professor of Community Medicine
CMC/ SMBBMU Larkana
Member/ Convener
3.
Prof. Bashir Ahmed Shaikh
Professor of Medicine
CMC/ SMBBMU Larkana
Member
4.
Prof. Dr. Abdul Razak Mahar
Dean faculty of Medicine & Allied Sciences
SMBBMU Larkana
External Member
The Deputy Director QEC SMBBMU Larkana was the coordinator for Institutional Performance Evaluation (IPE)', '2019-06-25T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1570086229picture3-thumb-adf8c379.png'),
('39th Syndicate Meeting', '39th-syndicate-meeting-05-14-2019', 'news'::announcement_category, '39th Syndicate Meeting held on 14th may 2019.', '39th Syndicate Meeting held on 14th may 2019.', '2019-05-14T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1558259499photo-2019-05-18-15-44-02-thumb-548118ef.jpg'),
('Pakistan Day Celebrations', 'pakistan-day-celebrations-03-23-2019', 'event'::announcement_category, 'Pakistan day ceremony celebrated at Auditorium Hall @ Chandka Medical College Larkana. Ceremony was commenced with hoisting of National Flag Vice Chancellor Prof Dr Aneela Atta Ur Rahman hoisted the…', 'Pakistan day ceremony celebrated at Auditorium Hall @ Chandka Medical College Larkana. Ceremony was commenced with hoisting of National Flag  Vice Chancellor Prof Dr Aneela Atta Ur Rahman hoisted the National Flag.', '2019-03-23T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1553491032img-8533-thumb-644b1291.jpg'),
('38th Syndicate Meeting', '38th-syndicate-meeting-03-05-2019', 'news'::announcement_category, '38th Syndicate Meeting held on 5th & 6th March 2019.', '38th Syndicate Meeting held on 5th & 6th March 2019.', '2019-03-05T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1552024182img-8300-thumb-a009b357.jpg'),
('Spring Tree Plantation Ceremony @CMC', 'spring-tree-plantation-ceremony-cmc-03-04-2019', 'event'::announcement_category, 'Spring Tree Plantation Ceremony held on 4th March 2018', 'Spring Tree Plantation Ceremony held on 4th March 2018', '2019-03-04T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1551851310img-8238-thumb-681a54bc.jpg'),
('Laptop Distribution Ceremony @GMMMC', 'laptop-distribution-ceremony-gmmmc-02-12-2019', 'event'::announcement_category, 'Prime Minister Laptop scheme distribution ceremony held at GMMMC on 12th Feburuary 2019. Vice Chancellor Prof Dr Atta Ur Rahman was the chief guest of the ceremony.', 'Prime Minister Laptop scheme distribution ceremony held at GMMMC on 12th Feburuary 2019. Vice Chancellor Prof Dr Atta Ur Rahman was the chief guest of the ceremony.', '2019-02-12T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1550037690photo-2019-02-12-19-02-20-thumb-92079b36.jpg'),
('W.H.O Team Visit to SMBBMU', 'who-team-visit-to-smbbmu-01-25-2019', 'event'::announcement_category, 'Four Members Team of World Health Organization visited Shaikh Zaid Women Hospital and CMC Children hospital larkana SMBBMU', 'Four Members Team of World Health Organization visited Shaikh Zaid Women Hospital and CMC Children hospital larkana SMBBMU', '2019-01-25T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1548660214ac-2-thumb-f8654fe7.jpg'),
('Laptop Distribution Ceremony', 'laptop-distribution-ceremony-01-18-2019', 'event'::announcement_category, 'Laptop Distribution ceremony held on 16th January 2019 at final year lecture hall @CMC SMBBMU. Prof Dr Aneela Atta Ur Rahman was the chief guest of the ceremony. Registrar , Deans , Principals of…', 'Laptop Distribution ceremony held on
16th January 2019
at final year lecture hall @CMC SMBBMU. Prof Dr Aneela Atta Ur Rahman was the chief guest of the ceremony. Registrar , Deans , Principals of various colleges , faculty members , officers and students attended the ceremony.', '2019-01-18T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1547965448.jpg'),
('16th Day One Celebration of GMMMC SMBBMU', '16th-day-one-celebration-of-gmmmc-smbbmu-01-10-2019', 'event'::announcement_category, '16th Day One celebrated on 8th January 2019 @GMMMC SMMBMU. Prof Dr Aneela Atta Ur Rahman was the chief guest of the ceremony.', '16th Day One celebrated on
8th January 2019
@GMMMC SMMBMU. Prof Dr Aneela Atta Ur Rahman was the chief guest of the ceremony.', '2019-01-10T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1547971317img-3940-thumb-2b74ce6f.jpg'),
('47th Day One Celebration of CMC SMBBMU', '47th-day-one-celebration-of-cmc-smbbmu-12-29-2018', 'event'::announcement_category, 'Day one ceremony of 47th Batch of CMC celebrated @Audotorium hall CMC SMBBMU.', 'Day one ceremony of 47th Batch of CMC celebrated @Audotorium hall CMC SMBBMU.', '2018-12-29T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1546234781ab-22-thumb-909a480a.jpg'),
('Seminar on Breast Cancer Awareness Day', 'seminar-on-breast-cancer-awareness-day-10-15-2018', 'event'::announcement_category, 'Seminar on Breast Cancer Awareness was held at Chandka Medical College Larkana on 15th October 2018', 'Seminar on Breast Cancer Awareness was held at Chandka Medical College Larkana on 15th October 2018', '2018-10-15T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1540184600b-15-thumb-75d0f6e3.jpg'),
('Seminar on careers in Pakistan Navy', 'seminar-on-careers-in-pakistan-navy-10-09-2018', 'event'::announcement_category, NULL, '', '2018-10-09T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/15392382386ea23296-caf6-422a-bc37-8ec7e97be540-thumb-49cffa78.jpg'),
('Workshop on Plagiarism: How to avoid it', 'workshop-on-plagiarism-how-to-avoid-it-11-02-2017', 'event'::announcement_category, 'The Quality Enhancement Cell, SMBBMU Larkana in Collaboration with department of Medical Education organized One day workshop on ''''Plagiarism: How to avoid it'''' for Post Graduate Supervisors of…', 'The Quality Enhancement Cell, SMBBMU Larkana in Collaboration with department of Medical Education organized One day workshop on ''''Plagiarism: How to avoid it'''' for Post Graduate Supervisors of SMBBMU Larkana on 2nd November 2017 at Video Conference Hall, SMBBMUL.
Prof. Dr. Khurshid Ahmed Abbasi,
Ex-Chairman Plagiarism Standing Committee SMBBMU was Facilitator of this workshop.
Facilitator :
Prof. Dr. Khurshid Ahmed Abbasi', '2017-11-02T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1510163309-thumb-7a3775ac.png'),
('QEC Conduct Seminar/ Workshop on Self-Assessment Report (SAR) , for faculty members of CMC, BADC BINACHS and Pharmacy', 'qec-conduct-seminar-workshop-on-self-assessment-report-sar-for-faculty-members-of-cmc-badc-binachs-and-pharmacy-05-03-2017', 'event'::announcement_category, 'QEC Conduct Seminar/ Workshop on Self-Assessment Report (SAR) writing and Role of Quality Enhancement Cell (QEC) in University for faculty members of CMC, BADC, BINACHS and Pharmacy on Wednesday 3rd…', 'QEC Conduct Seminar/ Workshop on Self-Assessment Report (SAR) writing and Role of  Quality Enhancement Cell (QEC) in University for faculty members of CMC, BADC, BINACHS and Pharmacy on Wednesday 3rd May, 2017 at Video Conference Hall SMBBMU Larkana.
Facilitator : Ms. Suraiya Khatoon, Manager QEC IBA Karachi', '2017-05-03T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/14939730939-thumb-dea9b05b.png'),
('Survey for Course  Evaluation of  Physiology', 'survey-for-course-evaluation-of-physiology-02-23-2017', 'news'::announcement_category, 'QEC Team Conduct Survey (Student Course Evaluation & Teacher Evaluation) Department of Physiology 2 nd year 13 th Batch Students at GMMMC Sukkur on Thursday 23.02.2017.', 'QEC Team
Conduct Survey (Student Course Evaluation & Teacher Evaluation) Department of Physiology 2
nd
year 13
th
Batch Students at GMMMC Sukkur on Thursday 23.02.2017.', '2017-02-23T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/14895608955-thumb-3c21d754.png'),
('Survey for Course  Evaluation of Pharmacology', 'survey-for-course-evaluation-of-pharmacology-02-22-2017', 'news'::announcement_category, 'QEC Team Conduct Survey (Student Course Evaluation & Teacher Evaluation) Department of Pharmacology 4 th year Students 11th Batch at GMMMC Sukkur on Wednesday 22.02.2017.', 'QEC Team
Conduct Survey (Student Course Evaluation & Teacher Evaluation) Department of Pharmacology 4
th
year Students 11th Batch at GMMMC Sukkur on Wednesday 22.02.2017.', '2017-02-22T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/14895604917-thumb-4484a290.png'),
('Survey for  Course Evaluation of Anatomy', 'survey-for-course-evaluation-of-anatomy-02-15-2017', 'news'::announcement_category, 'QEC Team Conduct Survey (Student Course Evaluation & Teacher Evaluation) Department of Anatomy2 nd year Students 13 th Batch at GMMMC Sukkur on Wednesday 15.02.2017.', 'QEC Team Conduct Survey (Student Course Evaluation & Teacher Evaluation) Department of Anatomy2
nd
year Students 13
th
Batch at GMMMC Sukkur on Wednesday 15.02.2017.', '2017-02-15T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1489559548image8-thumb-56b1c7fe.png'),
('Workshop on How to write Criteria No. 3, 4 and 5 of SAR', 'workshop-on-how-to-write-criteria-no-3-4-and-5-of-sar-02-11-2017', 'event'::announcement_category, 'Facilitator : Prof. Dr. Khurshid Ahmed Abbasi, Ex Dean Medicine and Allied Sciences SMBBMU, Larkana', 'Facilitator :
Prof. Dr. Khurshid Ahmed Abbasi, Ex Dean Medicine and Allied Sciences SMBBMU, Larkana', '2017-02-11T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1488183649pic1-thumb-c5de3c32.jpg'),
('Workshop on How to write Criteria No. 1 & 2 of  SAR', 'workshop-on-how-to-write-criteria-no-1-and-2-of-sar', 'event'::announcement_category, 'Facilitator : : Prof. Dr. Khurshid Ahmed Abbasi, Dean Medicine and Allied Sciences SMBBMU, Larkana', 'Facilitator :
: Prof. Dr. Khurshid Ahmed Abbasi, Dean Medicine and Allied Sciences SMBBMU, Larkana', '2016-05-26T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1464853230img-0396-thumb-02859d93.jpg'),
('Assessment Team Visit to department of surgery', 'assessment-team-visit-to-department-of-surgery-11-04-2016', 'event'::announcement_category, NULL, '', '2016-04-11T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1465453418img-0273-thumb-f45edba6.jpg'),
('Workshop on How to write Criteria No. 1 & 2 of SAR', 'workshop-on-how-to-write-criteria-no-1-2-of-sar-19-march-2016', 'event'::announcement_category, 'Facilitator : Prof. Abdul Razaq Mahar, Director QEC Shah Abdul Latif University, Khairpur', 'Facilitator :
Prof. Abdul Razaq Mahar, Director QEC Shah Abdul Latif University, Khairpur', '2016-03-19T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1464853954img-0042-thumb-4ff3793f.jpg'),
('Assessment Team Visit to department of Gynae', 'assessment-team-visit-to-department-of-gynae-02-03-2016', 'event'::announcement_category, NULL, '', '2016-03-02T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/146545229312821628-997522823656199-2500863671717934999-n-thumb-cee13e10.jpg'),
('Assessment Team Visit to department of Medicine', 'assessment-team-visit-to-department-of-medicine-26-01-2016', 'event'::announcement_category, NULL, '', '2016-01-26T09:00:00Z', '[]'::jsonb, NULL),
('Assessment Team Visit to ENT Department @ Anwar Paracha Hospital Sukkur', 'visit-to-ent-department-anwar-paracha-hospital-sukkur', 'event'::announcement_category, NULL, '', '2016-01-07T09:00:00Z', '[]'::jsonb, NULL),
('Assessment Team Visit to department of Opthalmology', 'assessment-team-visit-to-department-of-ophthalmology-30-12-2015', 'event'::announcement_category, NULL, '', '2015-12-30T09:00:00Z', '[]'::jsonb, NULL),
('Workshop on Dimensions of Quality Assurance and Self Assessment at GMMMC Sukkur', 'workshop-on-dimensions-of-quality-assurance-and-self-assessment-28-11-2015', 'event'::announcement_category, 'Facilitator : Air Commodore Abdul Wahab Motla, Director QEC, Air University, Islamabad Target Group : The Faculty Members (Senior Registrars, Senior Lecturers, Assistant Professors, Associate…', 'Facilitator :
Air Commodore Abdul Wahab Motla, Director QEC, Air University, Islamabad
Target Group :
The Faculty Members (Senior Registrars, Senior Lecturers, Assistant Professors, Associate Professors and Professors Including Program Team Team members of phase IV of GMMMC Sukkur.', '2015-11-28T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1450162619dsc03496-thumb-6af625bd.jpg'),
('Assessment Team Visit to department of Paediatric Medicine', 'assessment-team-visit-to-department-of-paediatric-medicine-14-11-2015', 'event'::announcement_category, NULL, '', '2015-11-14T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1465451893image10-thumb-009659e6.jpeg'),
('Workshop on Important Of Quality Assurance in Higher Education Institutes & Self Assessment Report', 'workshop-on-important-of-quality-assurance-in-higher-education-institutes-self-assessment-report-dec-08-2014', 'event'::announcement_category, 'Facilitator : Dr. Arshia Samin Naqvi, Director QEC, Ziauddin, University. Target Group : All Teaching Faculty & program Team Members of SMBBMU Larkana', 'Facilitator :
Dr. Arshia Samin Naqvi, Director QEC, Ziauddin, University.
Target Group :
All Teaching Faculty & program Team Members of SMBBMU Larkana', '2014-12-08T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1422485999img-20141208-123645-c58c56f1.jpg'),
('How to write criteria No.6, 7 & 8 of SAR', 'how-to-write-criteria-no-6-7-and-8-of-sar', 'news'::announcement_category, 'Facilitator : Professor Dr. Khurshid Ahmed Abbasi, Chairman Paediatric Medicine Unit-II, Director Academic SMBBMU Target Group : Program Teams (Phase III)', 'Facilitator :
Professor Dr. Khurshid Ahmed Abbasi, Chairman Paediatric Medicine Unit-II, Director Academic SMBBMU
Target Group :
Program Teams (Phase III)', '2014-09-09T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1422556630img-8872-239aedee.jpg'),
('How to write Criteria No. 03, 4 & 5 of SAR', 'how-to-write-criteria-no-3-4-and-5-of-sar-jun-27-2014', 'news'::announcement_category, 'Facilitator : Facilitator. Prof. Dr. Khurshid Ahmed Abbasi, Principal CMC & (Chairman Paediatric Medicine -II, Director Academics SMBBMU Target Group : Program Teams (Phase III)', 'Facilitator :
Facilitator. Prof. Dr. Khurshid Ahmed Abbasi, Principal CMC & (Chairman Paediatric Medicine -II, Director Academics SMBBMU
Target Group :
Program Teams (Phase III)', '2014-06-27T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1422556314img-8525-28a2be9d.jpg'),
('Assessment Team Visit to department of Community Medicine', 'assessment-team-visit-to-comunity-medicine-department-15-03-2014', 'event'::announcement_category, NULL, '', '2014-03-15T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453357714img-8197-thumb-6206cbe7.jpg'),
('Assessment Team Visit to department of Dermatology', 'assessment-team-visit-to-department-of-dermatology-28-02-2014', 'event'::announcement_category, NULL, '', '2014-02-28T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453358145dsc00994-thumb-b6cc47c0.jpg'),
('Assessment Team Visit to department of general medicine', 'assessment-team-visit-to-department-of-general-medicine-28-02-2014', 'event'::announcement_category, NULL, '', '2014-02-28T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453358588img-1254-thumb-b97b2e11.jpg'),
('Assessment Team Visit to department of Pathology', 'assessment-team-visit-to-department-of-pathology-19-02-2014', 'event'::announcement_category, NULL, '', '2014-02-19T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453358847img-8047-thumb-70780b0d.jpg'),
('Assessment Team Visit to department of Pharmacology', 'assessment-team-visit-to-pharmocology-department-17-02-2014', 'event'::announcement_category, NULL, '', '2014-02-17T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453358915img-8021-thumb-e9ee2a42.jpg'),
('Assessment Team Visit to department of Forensic Medicine', 'assessment-team-visit-to-forensic-medicine-department-05-02-2014', 'event'::announcement_category, NULL, '', '2014-02-05T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453358401img-7929-thumb-92483ddd.jpg'),
('How to write Criteria No. 01 & 2 of SAR', 'how-to-write-criteria-no-01-2-sar-jan-23-2014', 'news'::announcement_category, 'Facilitator : Prof. Dr. Khurshid Ahmed Abbasi, Principal CMC & Chairman Paediatric Medicine, Director Academics SMBBMU Target Group : Program Teams (Phase III)', 'Facilitator :
Prof. Dr. Khurshid Ahmed Abbasi, Principal CMC & Chairman Paediatric Medicine, Director Academics SMBBMU
Target Group :
Program Teams (Phase III)', '2014-01-23T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1422556172photo-of-workshop-fac330f1.jpg'),
('Workshop on Quality Assurance Awareness (QAA) & Self Assessment Report (SAR) Writing', 'workshop-on-quality-assurance-awareness-self-assessment-report-sar-writing-nov-26-2013', 'event'::announcement_category, 'Facilitator : Air Commodore (R) Engineer Muhammad Ismail, Director Assurance (QA) @ National University of Science and Technology (NUST) Islamabad Target Group : ALL Teaching Faculty & Program Team…', 'Facilitator :
Air Commodore (R) Engineer Muhammad Ismail, Director Assurance (QA) @ National University of Science and Technology (NUST) Islamabad
Target Group :
ALL Teaching Faculty & Program Team Members of SMBMU Larkana', '2013-11-26T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1422485414new9-e2eb26f7.jpg'),
('How to write Criteria No. 6, 7 & 8 of SAR', 'how-to-write-criteria-no-6-7-and-8-of-sar-sep-18-2013', 'news'::announcement_category, 'Facilitator : Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II, Director Academics SMBBMU) Target Group : Program Teams (Phase II)', 'Facilitator :
Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II, Director Academics SMBBMU)
Target Group :
Program Teams (Phase II)', '2013-09-18T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1422556946dsc01776-abaf159f.jpg'),
('How to write Criteria No. 3, 4, & 5 of SAR', 'how-to-write-criteria-no-3-4-and-5-of-sar-may-29-2013', 'news'::announcement_category, 'Facilitator : Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II, Director Academics SMBBMU) Target Group : Program Teams (Phase II)', 'Facilitator :
Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II, Director Academics SMBBMU)
Target Group :
Program Teams (Phase II)', '2013-05-29T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1422556790dsc01643-c379d754.jpg'),
('Assessment Team Visit to department of Physiology', 'assessment-team-visit-to-department-of-physiology-04-02-2013', 'event'::announcement_category, NULL, '', '2013-02-04T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453102228dsc01443-thumb-07c489c7.jpg'),
('How to write Criteria No. 1  & 2 of SAR', 'how-to-write-criteria-no-1-and-2-of-sar-dec-21-2012', 'news'::announcement_category, 'Facilitator : Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II, Director Academics SMBBMU) Target Group : Program Teams (Phase II)', 'Facilitator :
Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II, Director Academics SMBBMU)
Target Group :
Program Teams (Phase II)', '2012-12-21T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1422558007new14-217e05bb.jpg'),
('Assessment Team Visit to department of Biochemistry', 'assessment-team-visit-to-biochemistry-department-08-11-2012', 'event'::announcement_category, NULL, '', '2012-11-28T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453098919dsc01101-thumb-6ba805b1.jpg'),
('Assessment Team Visit to department of Gynae', 'assessment-team-visit-to-gynae-department-17-11-2012', 'event'::announcement_category, NULL, '', '2012-11-17T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453101383dsc01283-thumb-df2bdfd3.jpg'),
('Assessment Team Visit to department of Paediatric', 'assessment-team-visit-to-paediatric-department-17-11-2012', 'event'::announcement_category, NULL, '', '2012-11-17T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453101820dsc01192-thumb-a00eb916.jpg'),
('Assessment Team Visit to department of Anatomy', 'assessment-team-visit-to-anatomy-department-25-10-2012', 'event'::announcement_category, NULL, '', '2012-10-25T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453098620dsc01027-thumb-ec2c16b9.jpg'),
('How to write Criteria No. 5, 6, 7 & 8 of SAR', 'how-to-write-criteria-no-5-6-7-and-8-of-sar-sept-6-2012', 'news'::announcement_category, 'Facilitator : Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II SMBBMU) Target Group : Program Teams (Phase I)', 'Facilitator :
Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II SMBBMU)
Target Group :
Program Teams (Phase I)', '2012-09-06T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1422559785img-1817-3f740222.jpg'),
('How to write Criteria No. 3 & 4 of SAR', 'how-to-write-criteria-no-3-and-4-of-sar-26-july-2012', 'news'::announcement_category, 'Facilitator : Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II SMBBMU) Target Group : Program Teams (Phase I)', 'Facilitator :
Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II SMBBMU)
Target Group :
Program Teams (Phase I)', '2012-07-26T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1422560484img-1793-dab4c89c.jpg'),
('Assessment Team Visit to department of Opthalmology', 'assessment-team-visit-to-ophthalmology-department-07-11-2012', 'event'::announcement_category, NULL, '', '2012-07-11T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1453101627img-3423-thumb-ca28a9f8.jpg'),
('How to write Criteria No. 2 of SAR', 'how-to-write-criteria-no-2-of-sar-june-28-2012', 'news'::announcement_category, 'Facilitator : Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II SMBBMU) Target Group : Program Teams (Phase I)', 'Facilitator :
Professor Dr. Khurshid Ahmed Abbasi (Chairman Paediatric Medicine Unit-II SMBBMU)
Target Group :
Program Teams (Phase I)', '2012-06-28T09:00:00Z', '[]'::jsonb, NULL),
('Training of Program Teams', 'training-of-program-teams-jan-14-2012', 'news'::announcement_category, 'Facilitator : Air Commodore Abdul Wahab Motla Air University, Islamabad Target Group : Program Teams (Phase I)', 'Facilitator :
Air Commodore Abdul Wahab Motla Air University, Islamabad
Target Group :
Program Teams (Phase I)', '2012-01-14T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/14225609908-24589730.jpg'),
('Training of Program Teams', 'training-of-program-teams-july-27-2011', 'news'::announcement_category, 'Training of Program Teams Facilitator : Mr. Muhammad Naveed Usmani Target Group : Teaching Faculty (Phase I)', 'Training of Program Teams
Facilitator :
Mr. Muhammad Naveed Usmani
Target Group :
Teaching Faculty (Phase I)', '2011-07-27T09:00:00Z', '[]'::jsonb, 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/images/news/1422562841img-0292-70752f8e.jpg')
on conflict (slug) do update set title=excluded.title, category=excluded.category, excerpt=excluded.excerpt, body=excluded.body, published_at=excluded.published_at, attachments=excluded.attachments, photo_url=excluded.photo_url;

-- 04_pages.sql
insert into pages (slug, title, standfirst, body, meta) values
('the-university', 'History', 'In early 1970’s there were only two Medical Colleges in Sindh, one in Karachi and other in Jamshoro. The then Prime Minster of Pakistan, Mr. Zulfiqar Ali Bhutto, who belonged to Larkana city, had the vision that there…', '# History

In early 1970’s there were only two Medical Colleges in Sindh, one in Karachi and other in Jamshoro. The then Prime Minster of Pakistan, Mr. Zulfiqar Ali Bhutto, who belonged to Larkana city, had the vision that there should be a Medical College in this area and announced a Medical college in the very city with the name of Chandka Medical College. The college started functioning on 20th April 1973.   
  
SMBBMU’s vision is to be the “Premier University of Pakistan”. It strives to reflect the society in which it is situated, not only in terms of race, gender and class, but in how it structures its values and priorities and how it responds through its research to health & social needs. SMBBMU provides fertile ground for researchers and the University’s mission commits the institution to critical engagement with its society regarding Health awareness and encourages practical research that leads to socio-economic uplift of communities.   
  
History of establishment of Shaheed Mohtarma Benazir Bhutto Medical University dates back when on 29th March 1989 during the first tenure of People’s Government, requested the Honorable Prime Minister Mohtarma Benazir Bhutto to upgrade Chandka Medical College into a University.   
  
The request was fully supported and applauded by 500 graduates of CMC to which Mohtarma Benazir Bhutto Shaheed gave a knot.   
  
Subsequently the dream, for establishing a Medical University in Larkana city, was fulfilled through an announcement by the Chief Minister of Sindh Syed Qaim Ali Shah on 12th April 2008. This announcement gave a hope to the faculty of CMC and People of Larkana for the amelioration of society.

# Vice Chancellor''s Message

![](https://www.smbbmu.edu.pk/beta/images/vcpic12.jpeg)
  
Prof. Dr Nusrat Shah

I am honored to join as a Vice Chancellor in Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU) located in the historical city of Larkana, which lies very close to the ruins of ancient Indus Valley Civilization City of Mohenjo-Daro.

The SMBBMU has come a long way from the Chandka Medical College in 1973 to getting the status of University in 2008. Since then, it has expanded very fast with several colleges and institutes being its constituents and others being affiliated to it.

As a vice chancellor, I envision the university being transformed into a place of academic excellence which produces critical thinkers, competent health professionals and community leaders. The goal is to produce graduates who can provide quality care with empathy, compassion and understanding and are able to handle the social responsibility of looking after the health and wellbeing of local, national and global communities.

Continuous improvement in the quality of teaching, assessment, research, and clinical services remains at the heart of my entire efforts. This would require strategic investments in faculty development, strengthening online teaching environment; and exploring visiting faculty from different regions. One of the aspects of quality enhancement which needs attention is networking with digital education experts both nationally and internationally for partnership in developing innovative digital courses.

The world is witnessing Information and Communication Technologies (ICT) revolution in the form of digitalization, particularly after the Covid-19 pandemic. This has changed the way students’ study and learn all over the world and in order to keep pace with the changing times we need to change the traditional lecture-based teaching to more interactive student-centered, skill-based and project-based teaching, with corresponding changes in assessment.

In this age and time, and particularly after the pandemic of Covid-19, the university must have a strong digital environment both for management as well as for teaching and learning resources. Providing strong digital eco-system including availability of adequate bandwidth for connectivity, IT manpower, equipment and back-up systems would remain a high priority for me. As the healthcare landscape continues to change, our future success requires an organizational commitment to innovation, collaboration, and fiscal stewardship.

At SMBBU, we promote the values of honesty, integrity, polite and caring attitude, collaboration, teamwork and self-accountability, and strive to create a positive learning environment. Along with academics we also encourage a host of co-curricular and extra-curricular activities in the form of sports, gymnasium, debates, exhibitions, and cultural, social and literary events, to encourage physical and mental health and wellbeing of students and to develop their holistic personality.

Finally, I wish you every success, and a comfortable and enjoyable stay at the university. Happy learning!

# Vision And Mission

**Vision:**

To contribute to society through the pursuit of quality education, research and clinical services and to produce competent and skilled human resource for serving the health needs of local, national and global communities.

**Mission:**

To develop evidence-based knowledge, practical and communication skills and professional attitudes among learners so that they can provide good quality, safe and empathetic patient-centered care.

1. To promote curiosity, critical thinking, problem solving and decision-making skills to develop life-long learners.
2. To build a positive learning environment by encouraging a culture of respect, understanding, tolerance and support.
3. To promote a culture of scientific research, publication, technological development and academic leadership.

**Values for all programs:**

Teachers should try to inculcate the following values among students:

1. Honesty and Altruism
2. Self-accountability
3. Compassion, understanding and empathy
4. Importance of public health and prevention of disease
5. Inter professional respect
6. Importance of working hard and serving the humanity
7. Collaboration and teamwork

© 2026 Shaheed Mohtarama Benazir Bhutto Medical University. All rights reserved.', '{}'::jsonb),
('administration', 'Vice Chancellor Secretariat', '| | | | --- | --- | | Prof. Dr Nusrat Shah | **Vice Chancellor** | | Mr. Kamran Ali | **Protocol Officer** | # Contact Information: Address: Vice Chancellor Secretariat, Shaheed Mohtarma Benazir Bhutto Medical…', '# Vice Chancellor Secretariat

|  |  |
| --- | --- |
| Prof. Dr Nusrat Shah | **Vice Chancellor** |
| Mr. Kamran Ali | **Protocol Officer** |

# Contact Information:

Address:

Vice Chancellor Secretariat, Shaheed Mohtarma Benazir Bhutto Medical University Moenjo-daro Road Larkana

Email:

vc@smbbmu.edu.pk, info@smbbmu.edu.pk

Contact:

[+92-74-9410908](tel:+92-74-9410908) |
[+92-74-9410724](tel:+92-74-9410724)

Fax:

+92-74-9410910, +92-74-4752411', '{}'::jsonb),
('quality-enhancement-cell', 'Introduction', '# Introduction By the decree of the Honourable Chief Minister of Sindh, Syed Qaim Ali Shah on 12th April, 2008 at Larkana, Chandka Medical College (CMC) was upgraded and converted into Shaheed Mohtarma Benazir Bhutto…', '# Quality Enhancement Cell

# Introduction

By the decree of the Honourable Chief Minister of Sindh, Syed Qaim Ali Shah on 12th April, 2008 at Larkana, Chandka Medical College (CMC) was upgraded and converted into Shaheed Mohtarma Benazir Bhutto Medical University (SMBBMU) Larkana. Then the bill for this University was presented and unanimously passed by Sindh Assembly on 12th September, 2008. The act was notified by Honourable Governor of Sindh on 18th October, 2008 and finally the first Vice Chancellor of the University took over the charge on 9th July, 2009.The Chandka Medical College was established on 20th April, 1973 by the then Prime Minister, Mr. Zulfiqar Ali Bhutto. The name “Chandka” was selected as it is an oldest name of Larkana and has been derived from “Chandio Tribe” which is the oldest tribe residing in this area.  
  
The university has been equipped with a well-established teaching institute having 1500 Hospital beds and a bevy of highly qualified personnel. This institute has been providing Medical facilities to the population of Interior Sindh, parts of Balochistan and Punjab provinces.  
  
Today, this University stands as a shining star in the horizon of all teaching Colleges across the Country (Pakistan) and has achieved immense positions both nationally and globally, ranging from College of Physicians and Surgeons Pakistan (CPSP), Higher Education Commission (HEC) and Pakistan Medical and Dental Council (PMDC) to General Medical Council of England.  
  
In order to enhance the quality of output and efficacy of the higher education learning systems at universities, a mechanism of establishment of QECs has been developed by the Higher Education Commission (HEC) Islamabad under the umbrella of Quality Assurance Agency. To achieve the goal, HEC is establishing the QECs in Public and Private sector Universities of the country. At present the QECs are established in about 80 Universities and this University is amongst one of them. The QEC at this University has decorously commenced functioning from May 02, 2011.

# About

**Vision:**

- To ensure highest standards of Professional excellence in the Education that we provide and the Research that we carry out

**Mission:**

- Fostering and encouraging diversity of research and disciplinary innovation.
- Helping and assisting Model Departments towards nurturing talent, encouraging personal achievements and providing an attractive and stimulating place to work and study.
- Working closely with the Model Departments to ensure teaching our students to the very highest academic standards, fostering creativity and innovation in research.
- Supporting the Model Departments in equipping the students to make effective contribution to society and to the welfare of the patients.

**Objective:**

- Working very closely with the Model Departments towards preparation of the SAR by providing them with the help and support as and when required.
- Providing monitoring and control to the Model Departments by evaluating their SARs on different stages of the process against the Criteria and Standards provided by the HEC/QAA for the SAR''s.
- Ensuring keeping the different stages of SAR within the time frame mutually agreed upon between QEC and the Model Department.
- Apprising the Model Department Teams about the QAA meetings, Seminars, and Training Sessions to keep their sense of belonging.
- Ensuring the medical education findings are translated into practice, by advising the Model Departments.
- Making the Students aware about preparations to enter the rapidly changing world of health care delivery.
- Providing awareness about quality assurance and enhancement across the institution through Awareness Sessions, Training Workshops and Seminars.
- Keeping the Model Departments motivated towards Quality Assurance and Enhancement Processes and Procedures by informing and updating them about the achievements of other Institutions and their resulting recognition by HEC/QEC in terms of improved ranking.
- Liaising between the model departments and the HEC/QAA to keep QAA updated regarding the performance of the model departments and to keep them informed about their successes towards achievement of the Vision and Mission.
- To enhance the profile of the community by facilitating the collection and use of our heritage, in partnership and cooperation with other academic and community bodies.
- To disseminate resources to the community at large through celebratory events, conferences, presentations, publications, workshops and networks.

# Message

In order to enhance the quality of private and public Universities in various disciplines, the Higher Education Commission (HEC) of Pakistan has commenced the Quality Enhancement Cells (QEC) in Universities of Pakistan. The HEC is monitoring the quality in Universities by the QECs through its assignments given to QECs. The QEC at Shaheed Mohtarma Benazir Bhutto (SMBB) Medical University Larkana has started functioning effectively from May, 2011.  
  
The initial assignment, given to QEC, is to start the Self Assessment of various undergraduate and post graduate courses/programs being conducted in the Universities.  
  
  
**The objectives of Self Assessment are:**  
  
a) Improve and maintain academic standards.  
b) Enhance students’ learning.  
c) Verify that the existing programs meet their objectives and institutional goals.  
d) Provide feedback for quality assurance of academic programs.  
  
Currently, QEC has started Self Assessment of the undergraduate and postgraduate courses in various disciplines at SMBBMU Larkana. Even though the University is newly established, but QEC is in full cooperation with all departments. It is strongly urged, to the departments of our University, to cooperate and play a vital role to enhance the quality of this University in all aspects so that QEC at SMBBMU can be rose to the international standards.

# Self Assessment Program

**Program for Self Assessment (1st Phase):**

1. MBBS (Basic) (Anatomy, Biochemistry, Physiology)
2. Diploma in Gynae/Obs (DGO)
3. Masters in Ophthalmology (MS Ophthalmology)
4. Diploma in Paeds Medicine (DCH)

**Program for Self Assessment (2nd Phase):**

1. Phamacology (MBBS)
2. Forensic Medicine (MBBS)
3. General Pathology, Micro Biology & Parasitology (MBBS)
4. Department of Community Medicine (MBBS)
5. General Medicine (MD)
6. Dematology (D. Derm)

**Program for Self Assessment (3rd Phase):**

1. Surgery (MBBS)
2. Medicine (MBBS)
3. Gynae/Obst:(MBBS)
4. ENT (MBBS)
5. Ophthalmology (MBBS)
6. Paeds Medicine (MBBS)

**Program for Self Assessment (4th Phase) at GMMMC Sukkur:**

1. Anatomy (MBBS)
2. Biochemistry(MBBS)
3. Physiology:(MBBS)
4. Pharmocology (MBBS)
5. Forensic Medicine (MBBS)
6. Community Medicine (MBBS)

## Workshop

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1749544256.JPG)

# [Photos and Highlights of NAHE ...](https://www.smbbmu.edu.pk/beta/index.php/news/details/photos-and-highlights-of-nahe-trainings-06-10-2025 "Photos and Highlights of NAHE Trainings ")

Jun 10, 2025

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1749551985.JPG)

# [Review of Institutional Perfor...](https://www.smbbmu.edu.pk/beta/index.php/news/details/review-of-institutional-performance-and-enhancement-ripe-psg-2023-orientation-05-27-2025 "Review of Institutional Performance and Enhancement (RIPE) & PSG-2023 Orientation")

May 27, 2025

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1749549969.jpg)

# [Program Review for Effectivene...](https://www.smbbmu.edu.pk/beta/index.php/news/details/program-review-for-effectiveness-enhancement-pree-05-26-2025 "Program Review for Effectiveness & Enhancement (PREE) ")

May 26, 2025

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1632415748.png)

# [Quality Assurance (Internal & ...](https://www.smbbmu.edu.pk/beta/index.php/news/details/quality-assurance-internal-external-mechanism-self-assessment-report-sar-06-29-2021 "Quality Assurance (Internal & External Mechanism) & Self Assessment Report (SAR)")

Jun 29, 2021

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1628666266.png)

# [Quality Enhancement Cell repre...](https://www.smbbmu.edu.pk/beta/index.php/news/details/quality-enhancement-cell-represented-smbbmu-in-the-annual-progress-review-meeting-2019-20-arranged-by-hec-at-sukkur-iba-03-09-2021 "Quality Enhancement Cell represented SMBBMU in the annual progress review meeting 2019-20 arranged by HEC at SUKKUR-IBA")

Mar 09, 2021

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1612723463.jpg)

# [Meeting about Self-Institution...](https://www.smbbmu.edu.pk/beta/index.php/news/details/meeting-about-self-institutional-performance-evaluation-11-19-2020 "Meeting about Self-Institutional Performance Evaluation")

Nov 19, 2020

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1570083960.png)

# [Workshop on Role of Quality En...](https://www.smbbmu.edu.pk/beta/index.php/news/details/workshop-on-role-of-quality-enhancement-cell-qec-in-university-and-its-constituents-affiliated-college-06-25-2019 "Workshop on Role of Quality Enhancement Cell (QEC) in University and its Constituents & Affiliated College")

Jun 25, 2019

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1570086022.png)

# [Self-Internal Evaluation of SM...](https://www.smbbmu.edu.pk/beta/index.php/news/details/self-internal-evaluation-of-smbbmu-by-institutional-performance-evaluation-ipe-panel-06-25-2019 "Self-Internal Evaluation of SMBBMU by Institutional Performance Evaluation (IPE) Panel")

Jun 25, 2019

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1510167277.png)

# [Workshop on Plagiarism: How to...](https://www.smbbmu.edu.pk/beta/index.php/news/details/workshop-on-plagiarism-how-to-avoid-it-11-02-2017 "Workshop on Plagiarism: How to avoid it")

Nov 02, 2017

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/no-image.jpg)

# [QEC Conduct Seminar/ Workshop ...](https://www.smbbmu.edu.pk/beta/index.php/news/details/qec-conduct-seminar-workshop-on-self-assessment-report-sar-for-faculty-members-of-cmc-badc-binachs-and-pharmacy-05-03-2017 "QEC Conduct Seminar/ Workshop on Self-Assessment Report (SAR) , for faculty members of CMC, BADC BINACHS and Pharmacy ")

May 03, 2017

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1489561192.png)

# [Survey for Course Evaluation ...](https://www.smbbmu.edu.pk/beta/index.php/news/details/survey-for-course--evaluation-of--physiology-02-23-2017 "Survey for Course Evaluation of Physiology")

Feb 23, 2017

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1489561135.png)

# [Survey for Course Evaluation ...](https://www.smbbmu.edu.pk/beta/index.php/news/details/survey-for-course--evaluation-of-pharmacology-02-22-2017 "Survey for Course Evaluation of Pharmacology")

Feb 22, 2017

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1489561244.png)

# [Survey for Course Evaluation ...](https://www.smbbmu.edu.pk/beta/index.php/news/details/survey-for--course-evaluation-of-anatomy--02-15-2017 "Survey for Course Evaluation of Anatomy ")

Feb 15, 2017

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/no-image.jpg)

# [Workshop on How to write Crite...](https://www.smbbmu.edu.pk/beta/index.php/news/details/workshop-on-how-to-write-criteria-no.-3,-4-and-5-of-sar-02-11-2017 "Workshop on How to write Criteria No. 3, 4 and 5 of SAR")

Feb 11, 2017

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1464852751.JPG)

# [Workshop on How to write Crite...](https://www.smbbmu.edu.pk/beta/index.php/news/details/workshop-on-how-to-write-criteria-no-1-and-2-of-sar "Workshop on How to write Criteria No. 1 & 2 of SAR")

May 26, 2016

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1464853581.JPG)

# [Workshop on How to write Crite...](https://www.smbbmu.edu.pk/beta/index.php/news/details/workshop-on-how-to-write-criteria-no-1-2-of-sar-19-march-2016 "Workshop on How to write Criteria No. 1 & 2 of SAR")

Mar 19, 2016

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1450162467.JPG)

# [Workshop on Dimensions of Qual...](https://www.smbbmu.edu.pk/beta/index.php/news/details/workshop-on-dimensions-of-quality-assurance-and-self-assessment-28-11-2015 "Workshop on Dimensions of Quality Assurance and Self Assessment at GMMMC Sukkur ")

Nov 28, 2015

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422486003.jpg)

# [Workshop on Important Of Quali...](https://www.smbbmu.edu.pk/beta/index.php/news/details/workshop-on-important-of-quality-assurance-in-higher-education-institutes-self-assessment-report-dec-08-2014 "Workshop on Important Of Quality Assurance in Higher Education Institutes & Self Assessment Report")

Dec 08, 2014

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422556646.JPG)

# [How to write criteria No.6, 7 ...](https://www.smbbmu.edu.pk/beta/index.php/news/details/how-to-write-criteria-No-6-7-and-8-of-SAR "How to write criteria No.6, 7 & 8 of SAR")

Sep 09, 2014

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422556325.JPG)

# [How to write Criteria No. 03, ...](https://www.smbbmu.edu.pk/beta/index.php/news/details/how-to-write-criteria-no-3-4-and-5-of-SAR-jun-27-2014 "How to write Criteria No. 03, 4 & 5 of SAR")

Jun 27, 2014

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422556037.JPG)

# [How to write Criteria No. 01 &...](https://www.smbbmu.edu.pk/beta/index.php/news/details/how-to-write-criteria-no-01-2-SAR-jan-23-2014 "How to write Criteria No. 01 & 2 of SAR")

Jan 23, 2014

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422484001.jpg)

# [Workshop on Quality Assurance ...](https://www.smbbmu.edu.pk/beta/index.php/news/details/workshop-on-Quality-assurance-awareness-self-assessment-report-SAR-writing-nov-26-2013 "Workshop on Quality Assurance Awareness (QAA) & Self Assessment Report (SAR) Writing")

Nov 26, 2013

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422556958.JPG)

# [How to write Criteria No. 6, 7...](https://www.smbbmu.edu.pk/beta/index.php/news/details/how-to-write-criteria-no-6-7-and-8-of-SAR-sep-18-2013 "How to write Criteria No. 6, 7 & 8 of SAR")

Sep 18, 2013

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422556810.JPG)

# [How to write Criteria No. 3, 4...](https://www.smbbmu.edu.pk/beta/index.php/news/details/how-to-write-criteria-no.-3-4-and-5-of-SAR-may-29-2013 "How to write Criteria No. 3, 4, & 5 of SAR")

May 29, 2013

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422558141.jpg)

# [How to write Criteria No. 1 &...](https://www.smbbmu.edu.pk/beta/index.php/news/details/how-to-write-criteria-no-1-and-2-of-SAR-dec-21-2012 "How to write Criteria No. 1 & 2 of SAR")

Dec 21, 2012

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422559845.jpg)

# [How to write Criteria No. 5, 6...](https://www.smbbmu.edu.pk/beta/index.php/news/details/how-to-write-criteria-no-5-6-7-and-8-of-SAR-sept-6-2012 "How to write Criteria No. 5, 6, 7 & 8 of SAR")

Sep 06, 2012

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422560493.jpg)

# [How to write Criteria No. 3 & ...](https://www.smbbmu.edu.pk/beta/index.php/news/details/how-to-write-criteria-no-3-and-4-of-SAR-26-july-2012 "How to write Criteria No. 3 & 4 of SAR")

Jul 26, 2012

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/no-image.jpg)

# [How to write Criteria No. 2 of...](https://www.smbbmu.edu.pk/beta/index.php/news/details/how-to-write-criteria-no-2-of-SAR-june-28-2012 "How to write Criteria No. 2 of SAR")

Jun 28, 2012

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422560966.jpg)

# [Training of Program Teams](https://www.smbbmu.edu.pk/beta/index.php/news/details/training-of-program-teams-jan-14-2012 "Training of Program Teams")

Jan 14, 2012

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1422562849.jpg)

# [Training of Program Teams](https://www.smbbmu.edu.pk/beta/index.php/news/details/training-of-program-teams-july-27-2011 "Training of Program Teams")

Jul 27, 2011

## Workshop

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1613838357.JPG)

# [Higher Education Team Visit to...](https://www.smbbmu.edu.pk/beta/index.php/news/details/higher-education-team-visit-to-smbbmu-02-16-2021 "Higher Education Team Visit to SMBBMU")

Feb 16, 2021

# Program Teams

### 1st Phase

| Name | Designation | Team |
| --- | --- | --- |
| Program Team for MBBS (Anatomy) | | |
| Dr. Muhammad Farooque Mughal | Assistant Professor (Chairman) | Anatomy |
| Dr. Shahid Hussain Soomro | Assistant Professor (Co-ordinator) | Anatomy |
| Program Team for MBBS (Biochemistry) | | |
| Dr. Muhammad Hanif Shaikh | Associate Professor (HOD) | Biochemistry |
| Dr. Ghulam Sarwar Shaikh | Associate Professor (Co-ordinator) | Biochemistry |
| Mr. Dost Muhammad Kalhoro | Assistant Professor (Member) | Biochemistry |
| Program Team for MBBS (Physiology) | | |
| Dr. Safdar Ali Shaikh | Associate Professor (Chairman) | Physiology |
| Dr. Amar Lal Dodani | Assistant Professor (Co-ordinator) | Physiology |
| Program Team for Diploma in Gynae/Obs (DGO) | | |
| Prof. Rafia Baloch | Professor (Chairman) | Gyn/Obs |
| Dr. Shabnam Shaikh | Assistant Professor (Member) | Gyn/Obs |
| Dr. Shaista Abro | Assistant Profesor (Co-ordinator) | Gyn/Obs |
| Program Team for MS Ophthalmology | | |
| Dr. Partab Rai Nagdev | Associate Professor (Chairman) | Ophthalmology |
| Dr. Shahid Jamal Siddique | Associate Professor (Member) | Ophthalmology |
| Dr. Noor Ahmed Shaikh | Ophthalmologist (Co-ordinator) | Ophthalmology |
| Program Team for Diploma in Pediatric Medicine (DCH) | | |
| Prof. Saifullah Jamro | Professor (Chairman) | Paeds Medicine |
| Prof. Khurshid Ahmed Abbasi | Professor (Member) | Paeds Medicine |
| Dr. Abdul Hamid Shaikh | Associate Professor (Co-ordinator) | Paeds Medicine |

### 2nd Phase

| Name |  | Designation |
| --- | --- | --- |
| Department of Pharmacology | | |
| Dr. Barkat Ali Shaikh | Co-ordinator | Associate Professor |
| Dr. Ali Gul Tunio | Member | Assistant Professor |
| Dr. Abdul Basit Gopang | Member | Demonstrator |
| Department of Forensic Medicine | | |
| Dr. Kanwal Kumar | Chairman | Assistant Professor |
| Dr. Ghulam Qadir Kaheri | Member | Professor |
| Dr. Zawar Hussain Khichi | Member | Associate Professor |
| Dr. Rashif Ahmed Pathan | Co-ordinator | Assistant Professor |
| Department of General Pathology | | |
| Prof. Ghulam Murtaza Pathan | Chairman | Professor |
| Dr. Akbar Ali Soomro | Member | Associate Professor |
| Dr. Haq Nawaz Sandano | Member | Senior Demonstrator |
| Dr. Sarfraz Hussain Tunio | Co-ordinator | Demonstrator |
| Department of Community Medicine | | |
| Prof. Niaz Muhammad Shaikh | Chairman | Professor |
| Dr. Saeed Ahmed Shaikh | Member | Assistant Professor |
| Dr. Shabir Ahmed Larik | Co-ordinator | Assistant Professor |
| Department of General Medicine | | |
| Prof. Aftab Hussain Shah | Chairman | Professor |
| Dr. Koro Mal | Member | Associate Professor |
| Dr. Imdad Ali Ansari | Co-ordinator | Assistant Professor |
| Dr. Majid Shaikh | Member | Registrar |
| Department of Dematology | | |
| Prof. Abdul Manan Bhutto | Member | Professor |
| Dr. Irfan Ali Shaikh | In-charge | Assistant Professor |
| Dr. Dileep Kumar | Co-ordinator | Senior Demonstrator |

### 3rd Phase

| Name | Designation | Department |
| --- | --- | --- |
| Program Team for MBBS (Surgery) | | |
| Prof. K. Das | Professor(Chairman) | Surgery |
| Dr. Saleem Shaikh | Associate Professor (Co-ordinator) | Surgery |
| Dr. Shabir Shaikh | Assistant Professor (Member) | Surgery |
| Dr. Ayesha | Senior Registrar (Member) | Surgery |
| Program Team for MBBS (Medicine) | | | |
| Prof. Aftab Hussain Shah | Professor (Chairman) | Medicine Unit-II |
| Dr. Mumtaz Hussain Chhutto | Assistant Professor (Co-ordinator) | Medicine Unit-I |
| Dr. Kamlesh Kumar Ahuja | Assistant Professor (Member) | Medicine Unit-II |
| Dr. Sheikh Muhammad Khalid | Senior Registrar (Member) | Medicine Unit-III |
| Program Team for MBBS (Gynae/Obst:) | | |
| Prof. Fouzia Kashif | Professor (Chairman) | Gyn/Obs |
| Dr. Tanveer Fatima | Senior Registrar (Co-ordinator) | Gyn/Obs |
| Dr. Fouzia Adeeb | Senior Registrar (Member) | Gyn/Obs |
| Dr. Najia Bhatti | W.M.O (Member) | Gyn/Obs |
| Program Team for MBBS (ENT) | | |
| Prof. Gulzar Ahmed Shaikh | Professor (Chairman) | ENT |
| Dr. Atta Muhammad Siddique | Assistant Professor (Co-ordinator) | ENT |
| Dr. Liaquat Darghai | Assistant Professor (Member) | ENT |
| Program Team for MBBS (Ophthalmology) | | |
| Prof. Shahid Jamal Siddique | Professor (Chairman) | Ophthalmology |
| Dr. Partab Rai Nagdev | Associate Professor (Co-ordinator) | Ophthalmology |
| Dr. Dur-e-Akhtar Dargahi Shaikh | Assistant Professor (Member) | Ophthalmology |
| Dr. Noor Ahmed Shaikh | Senior Registrar (Member) | Ophthalmology |
| Program Team for MBBS (Paediatric Medicine) | | |
| Prof. Khurshid Ahmed Abbasi | Professor (Chairman) | Paeds Medicine |
| Dr. Arbab Ali Junejo | Associate Professor (Co-ordinator) | Paeds Medicine |
| Dr. Shankar Lal | Assistant Professor (Member) | Paeds Medicine |

### 4th Phase

| Name | Designation | Department |
| --- | --- | --- |
| Program Team for Anatomy (MBBS) (GMMMC Sukkur) | | |
| Dr. Abdullah Khilji (Chairman) | Assistant Professor | Anatomy |
| Dr. Nadeemuddin Shaikh (Coordinator) | Senior Lecturer | Anatomy |
| Dr. Farooq Ahmed Mughal (Member) | Senior Lecturer | Anatomy |
| Program Team for Biochemistry (MBBS) (GMMMC Sukkur) | | | |
| Dr. Arshad Hussain Laghari (Ph.D) (Chairman) | Assistant Professor | Biochemistry |
| Dr. Abdul Hakeem Faisal (Coordinator) | Demonstrator | Biochemistry |
| Dr. Rehana Siddiqui (Member) | Demonstrator | Biochemistry |
| Program Team for Physiology (MBBS) (GMMMC Sukkur) | | |
| Dr. Akhtar Hussain Samo (Chairman) | Assistant Professor | Physiology |
| Dr. Aijaz Ali Pathan                (Coordinator) | Senior Lecturer | Physiology |
| Dr. Irfan Ahmed Shaikh | Senior Lecturer | Physiology |
| Program Team for Pharmacology (MBBS) (GMMMC Sukkur) | | |
| Prof. Nazir Ahmed Shah (Chairman) | Professor | Pharmacology |
| Dr. Allah Jewayo(Coordinator) | Demonstrator | Pharmacology |
| Dr. Ajeet Kumar | Demonstrator | Pharmacology |
| Program Team for Forensic Medicine (MBBS) (GMMMC Sukkur) | | |
| Prof. Zawar Hussain Khichi (Chairman) | Professor | Forensic Medicine |
| Dr. Zameer Hussain Ghanghro (Coordinator) | Lecturer | Forensic Medicine |
| Dr. Jalees Fatima        (Member) | Lecturer | Forensic Medicine |
| Program Team for Community Medicine (MBBS) (GMMMC Sukkur) | | |
| Dr. Aijaz Hussain Memon (Chairman) | Professor | Community Medicine |
| Dr. Syed Ashfaque Hussain Shah (Coordinator) | Senior Demonstrator | Community Medicine |
| Dr. Ghulam Rasool Ghumro (Member) | Senior Demonstrator | Community Medicine |

# Assessment Teams

### 1st Phase

| Course | Assessment Teams |
| --- | --- |
| MBBS (Undergraduate course) | |
| MBBS (Biochemistry) | 1. Prof. Dr. Hafeez-ur-Rehman (Sbuject Specialist) Chairman Biochemsitry, LUMHS, Jamshoro  2. Dr. Safdar Ali Shaikh, Associate Professor Physiology, SMBBMU, Larkana  3. Dr. Shahid Hussain Soomro, Assistant Professor Anatomy, SMBBMU Larkana |
| MBBS (Anatomy) | 1. Prof. Dr. Muhammad Aslam Channa, (Subject Specialist), Chairman of Anatomy Department, Shaheed Mohtarma Benazir Bhutto Medical College Lyari Karachi.  2. Dr. Amar Lal Dodani, Assistant Professor Physiology SMBBMU Larkana.  3. Mr. Dost Muhammad Kalhoro, Assistant Professor Biochemistry, SMBBMU Larkana. |
| MBBS (Physiology) | 1. Prof. Touseef Ahmed (Subject Specialist), Professor of Physiology, Zia-u-din Medical University Karachi.  2. Prof. Dr. Zafar Ali Pirzada, Professor Biochemistry, SMBBMU, Larkana  3. Dr. Shaista Abro, Assistant Professor Gyn/Obs, SMBBMU Larkana |
| Postgraduate course | |
| M.S Ophthalmology | 1. Dr. Ashok Kumar (Subject Specialist), Assoiate Professor Eye, LUMHS, Jamshoro  2. Dr. Shabnam Naz Shaikh, Assistant Professor Gyn/obs, SMBBMU Larkana |
| Diploma in Child Health (DCH) | 1. Prof. Muhammad Akbar Nizamani, (Subject Specialist), Chairman Paediatrics Department, LUMHS, Jamshoro  2. Prof Partab Rai Nagdev, Associate Professor Ophthalmology, SMBBMU Larkana  3. Prof. Rafia Baloch (Chairperson), Professor Gyn/Obs, SMBBMU, Larkana |
| Diploma In Gynae/Obs (DGO) | 1. Prof. Khairunisa (Subject Specialist), Chairperson Peoples Medical College Nawabshah  2. Prof. Khurshid Ahmed Abbasi, Professor Paeds Medicine, SMBBMU, Larkana  3. Dr. Shahid Jamal Siddique, Associate Professor Ophthalmology, SMBBMU, Larkana |

### 2nd Phase

|  |  |
| --- | --- |
| Course | Assessment Teams |
| MBBS (Undergraduate course) | |
| MBBS (Pharmacology) | 1) Prof. Nazir Ahmed Solangi  Professor Pharmacology, Liaquat National Medical College, Karachi.   Email: [snaiqra@gmail.com](mailto:snaiqra@gmail.com)   Cell No: 0300-3331300   2) Dr. Kanwal Kumar  Associate Professor (Chairman)  Forensic Medicine, SMBB Medical University, Larkana.   3) Prof. Niaz Muhammad Shaikh  Chairman, Community Medicine, SMBB Medical University, Larkana. |
| MBBS (Forensic Medicine) | 1) Dr. Ghulam Sarwar Pirzada  Associate Professor, Chairman, Department of Forensic Medicine, Peoples University of Medical & Health Sciences, Nawabshah.  Email: [drpirzada\_110@yahoo.com](mailto:drpirzada_110@yahoo.com)  Cell No: 0342-3760749   2) Dr. Barkat Ali Shaikh  Associate Professor, Pharmacolgy, SMBB Medical University, Larkana.   3) Dr. Akbar Ali Soomro  Associate Professor, General Pathology, SMBB Medical University, Larkana. |
| MBBS (General Pathology) | 1) Prof. Anwar Ali Akhwand  Head of Department General Pathology, Al-Tabri Medical College, Memon Goth, Karachi.  Email: [anwaraliakhund@yahoo.com](mailto:anwaraliakhund@yahoo.com)  Cell No: 0300-3221179   2) Prof. Ghulam Qadir Kaheri   Professor, Forensic Medicine, SMBB Medical University Larkana.   3) Dr. Saeed Ahmed Shaikh   Assistant Professor, Community Medicine, SMBB Medical University, Larkana |
| MBBS (Community Medicine) | 1) Prof. Hussain Bux Kolachi   Dean of faculty Community Medicine, LUMHS, Jamshoro.   Email: [kolachi58@hotmail.com](mailto:kolachi58@hotmail.com)   Cell No: 0333-2654685   2) Dr. Zawar Hussain Khichi  Associate Professor, Forensic Medicine, SMBB Medical University Larkana.   3) Dr. Imdad Ali Ansari  Assistant Professor, General Medicine, SMBB Medical University Larkana. |
| Postgraduate course | |
| M.D General Medicine | 1) Prof.  Bekharam Devrajani   Department of General Medicine, LUMHS Jamshoro   Email: [devrajani62@msn.com](mailto:devrajani62@msn.com)   Cell No: 0321-3143345   2) Prof. Ghulam Murtaza Pathan   Chairman, General Pathology, SMBB Medical University, Larkana.   3) Dr. Irfan Ali shaikh   Assistant Professor, Incharge Department of Dematology, Sukkur. |
| D. Derm (Dermatology) | 1) Prof. Dolat Rai Bajaj   Department of Dematology, LUMHS, Jamshoro   Email: [doulat01@yahoo.com](mailto:doulat01@yahoo.com)   Cell No: 0333-3076504   2) Prof. Aftab Hussain Shah   Chairman, General Medicine, SMBB Medical University, Larkana   3). Dr. Partab Rai Nagdev   Associate Professor, Ophthalmology, SMBB Medical University, Larkana. |

### 3rd Phase

|  |  |
| --- | --- |
| Course | Assessment Teams |
| MBBS (Undergraduate course) | |
| **Surgery** **(MBBS)** | 1. Prof. Abdul Razak Shaikh       Professor of Surgery LUMHS Jamshoro.      Cell No:       Email: 2. Prof. Dr. Aftab Hussain Shah         Professor of Medicine Unit II, SMBBMU Larkana 3. Dr. Shankar Lal         Assistant Professor Department of Pediatric Medicine Unit I, SMBBMU Larkana 4. Dr.Najia Bhatti         WMO Department of Gynae/Obst: SMBBMU Larkana |
| **Medicine (MBBS)** | 1. Prof. Bekharam Devrajani         Department of   General Medicine, LUMHS, Jamshoro      Cell No: 0321-3143345     Email: [devrajani62@msn.com](mailto:devrajani62@msn.com) 2. Prof. Dr. Khurshid Ahmed Abbasi     Chairman Department of Pediatric Medicine Unit I, SMBBMU Larkana 3. Prof. Fouzia Kashif Tebani         Associate Professor Department of Gynae/Obst: Unit II, SMBBMU Larkana 4. Dr. Shabir Shaikh     Assistant Professor Department of Surgery Unit III, SMBBMU Larkana |
| **Gynae/ Obst: (MBBS)** | 1. Prof. RubinaMemon     Department of Gynae/Obst: Nawabshah     Cell No:       Email: 2. Prof. K Das         Chairman Department of Surgery Unit III, SMBBMU Larkana 3. Dr. Partab Rai Nagdev         Associate Professor Department of Ophthalmology, SMBBMU Larkana |
| **ENT (MBBS)** | 1. Dr. Ashok Kumar         Associate Professor Khairpur Medical College Khairpur     Cell No: 0333-3596135     Email:dr\_ashok1973@yahoo.com 2. Dr. Kamlesh Kumar Ahuja         Assistant Professor Department of Medicine Unit II, SMBBMU Larkana 3. Dr. Noor Ahmed Shaikh     Senior Registrar Department of Ophthalmology, SMBBMU Larkana |
| **Ophthalmology (MBBS)** | 1. Prof. Khan Muhamamd Nangrejo   Professor & Chairman Department of Ophthalmology  PUMHS, Nawabshah, ShaheedBenazirabad  Cell No: 0300-3218551  Email: khannangrejo@hotmail.com2. Dr. Arbab Ali Junejo      Associate Professor Department of Pediatric Medicine Unit I, SMBBMU Larkana 3. Dr. SaleemShaikh      Associate Professor Department of Surgery Unit III, SMBBMU Larkana 4. Dr. Ayesha      Senior Registrar Department of Surgery Unit III, SMBBMU Larkana |
| **Pediatric Medicine (MBBS)** | 1. Prof. Salma Shaikh     Dean Faculty of Pediatric Medicine, LUMHS, Jamshoro     Cell No:       Email: 2. Prof. Shahid Jamal Siddique     Chairman Department of Ophthalmology, SMBBMU Larkana 3. Dr. Fouzia Adeeb     Senior RegistrarDepartment of Gynae/Obst: Unit II, SMBBMU Larkana 4. Dr. Sheikh Muhammad Khalid         Senior Registrar Department of Medicine Unit II, SMBBMU Larkana |

## QEC Team

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/employees/images/1561006894.jpg)
  

#

*Director*

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/employees/images/1551851506.jpg)
  

#

*Assistant Director*

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/employees/images/1494492719.jpg)
  

#

*P.A to Director*

# Assessment Team Visits

### 3rd Phase

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1465452469.JPG)

# [Assessment Team Visit to department of surgery](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-department-of-surgery-11-04-2016 "Assessment Team Visit to department of surgery")

Apr 11, 2016

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1465452353.jpg)

# [Assessment Team Visit to department of Gynae](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-department-of-gynae-02-03-2016 "Assessment Team Visit to department of Gynae")

Mar 02, 2016

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/no-image.jpg)

# [Assessment Team Visit to department of Medicine](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-department-of-medicine-26-01-2016 "Assessment Team Visit to department of Medicine")

Jan 26, 2016

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/no-image.jpg)

# [Assessment Team Visit to ENT Department @ Anwar Paracha Hospital Sukkur](https://www.smbbmu.edu.pk/beta/index.php/news/details/visit-to-ent-department-anwar-paracha-hospital-sukkur "Assessment Team Visit to ENT Department @ Anwar Paracha Hospital Sukkur")

Jan 07, 2016

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/no-image.jpg)

# [Assessment Team Visit to department of Opthalmology](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-department-of-ophthalmology-30-12-2015 "Assessment Team Visit to department of Opthalmology")

Dec 30, 2015

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1465452133.jpeg)

# [Assessment Team Visit to department of Paediatric Medicine](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-department-of-paediatric-medicine-14-11-2015 "Assessment Team Visit to department of Paediatric Medicine")

Nov 14, 2015

### 2nd Phase

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1453357721.JPG)

# [Assessment Team Visit to department of Community Medicine](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-comunity-medicine-department-15-03-2014 "Assessment Team Visit to department of Community Medicine")

Mar 15, 2014

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1453358171.JPG)

# [Assessment Team Visit to department of Dermatology](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-department-of-dermatology-28-02-2014 "Assessment Team Visit to department of Dermatology")

Feb 28, 2014

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/no-image.jpg)

# [Assessment Team Visit to department of general medicine](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-department-of-general-medicine-28-02-2014 "Assessment Team Visit to department of general medicine")

Feb 28, 2014

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1453358859.JPG)

# [Assessment Team Visit to department of Pathology](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-department-of-pathology-19-02-2014 "Assessment Team Visit to department of Pathology")

Feb 19, 2014

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1453358946.JPG)

# [Assessment Team Visit to department of Pharmacology](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-pharmocology-department-17-02-2014 "Assessment Team Visit to department of Pharmacology")

Feb 17, 2014

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1453358424.JPG)

# [Assessment Team Visit to department of Forensic Medicine](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-forensic-medicine-department-05-02-2014 "Assessment Team Visit to department of Forensic Medicine")

Feb 05, 2014

### 1st Phase

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1453102241.JPG)

# [Assessment Team Visit to department of Physiology](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-department-of-physiology-04-02-2013 "Assessment Team Visit to department of Physiology")

Feb 04, 2013

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1453098973.JPG)

# [Assessment Team Visit to department of Biochemistry](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-biochemistry-department-08-11-2012 "Assessment Team Visit to department of Biochemistry")

Nov 28, 2012

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1453101410.JPG)

# [Assessment Team Visit to department of Gynae](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-gynae-department-17-11-2012 "Assessment Team Visit to department of Gynae")

Nov 17, 2012

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1453102081.JPG)

# [Assessment Team Visit to department of Paediatric](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-paediatric-department-17-11-2012 "Assessment Team Visit to department of Paediatric")

Nov 17, 2012

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1453098587.JPG)

# [Assessment Team Visit to department of Anatomy](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-anatomy-department-25-10-2012 "Assessment Team Visit to department of Anatomy")

Oct 25, 2012

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/news/images/new_1453101644.JPG)

# [Assessment Team Visit to department of Opthalmology](https://www.smbbmu.edu.pk/beta/index.php/news/details/assessment-team-visit-to-ophthalmology-department-07-11-2012 "Assessment Team Visit to department of Opthalmology")

Jul 11, 2012

## Downloads

| HEC Manual For QEC | | |
| --- | --- | --- |
| 1 | QEC Activity Calendar | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/activity-calendar-17521568610.pdf) |
| 2 | HEC Self Assessment Manual | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1-hec-self-assessment-manual-1492068343.pdf) |
| 3 | Quality Assurance Manual for the HEIs | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/2-hec-quality-assurance-manual-for-higher-education-in-pakistan-1492068343.pdf) |
| 4 | Performance Evaluation Standards for the HEIs | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/3-performance-evaluation-standards-for-heisgdg-1492068343.pdf) |
| 5 | Plagiarism Policy | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/4-plagiarism-policy-1492068180.pdf) |
| 6 | Turn it Policy | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/5-turnitin-policy-1492068180.pdf) |
| 7 | Standard Operation Procedure | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/6-standard-operating-procedure-1492068180.pdf) |
| 8 | MPhil/PHD Criteria | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/7-mphil-phd-criteria-1492068180.pdf) |
| 9 | Plagiarism Notification | [Download](https://www.smbbmu.edu.pk/beta/index.php/news/downloadFile/8-Notification_1492067968.jpg) |
| 10 | Little Book Of Plagiarism | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/9-little-book-of-plagiarism-1492067968.pdf) |
| 11 | Plagiarism Notification | [Download](https://www.smbbmu.edu.pk/beta/index.php/news/downloadFile/8-Notification_1492067964.jpg) |
| 12 | Little Book Of Plagiarism | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/9-little-book-of-plagiarism-1492067964.pdf) |

| Quality Assurance Forms | | |
| --- | --- | --- |
| 1 | Student Course Evaluation Questionnaire | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-1-student-course-evaluation-questionnaire-1492070163.pdf) |
| 2 | Faculty Course Review Report | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-2-faculty-course-review-report-1492070163.pdf) |
| 3 | Survey Of Graduating Students | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-3-survey-of-graduating-students-1492070163.pdf) |
| 4 | Research Student Progress Review Form | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-4-research-student-progress-review-form-1492070163.pdf) |
| 5 | Faculty Survey | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-5-faculty-survey-1492070024.pdf) |
| 6 | Survey Of Department Offering PHD | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-6-survey-of-department-offering-phd-1492070024.pdf) |
| 7 | Alumni Survey | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-7-alumni-survey-1492070024.pdf) |
| 8 | Employer Survey | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-8-employer-survey-1492070024.pdf) |
| 9 | Faculty Resume | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-9-faculty-resume-1492070024.pdf) |
| 10 | Teacher Evaluation Form | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-10-teacher-evaluation-form-1492070024.pdf) |

© 2026 Shaheed Mohtarama Benazir Bhutto Medical University. All rights reserved.', '{"contact":{"email":"qec@smbbmu.edu.pk","phone":"+92 74 9410 703 · EXT 188","location":"Admin Block, Main Campus, Larkana"}}'::jsonb),
('directorate-of-medical-education', 'Introduction', '# Introduction The Department of Medical Education is back-bone of Medical Institute. In 2008 Pakistan Medical & Dental Council sent directions to all Public & Private medical colleges in this country to set up…', '# Directorate of Medical Education

# Introduction

The Department of Medical Education is back-bone of Medical Institute. In 2008 Pakistan Medical & Dental Council sent directions to all Public & Private medical colleges in this country to set up Department of Medical Education.  
The major function of DME is to help prepare the teaching staff with necessary skills to undertake effectively their role as medical Teacher. Other well-known functions are: Curriculum development, service provision, assessment and ensuring the accreditation of medical colleges.  
The scope of its activities includes undergraduate and postgraduate education. The activities may be extended to other healthcare professionals.  
The Director of Department of Medical Education provides academic leadership for the department and his/her responsibilities include promotion of staff, collaboration, fostering career development of the staff and establishing local, regional and international links.  
The Department of Medical Education was established in 2013. Prof. Riaz Ahmed Shaikh was the first Incharge of DME. Later on Prof. Aftab Hussain Shah, Prof. Abdul Hamid shaikh, and Prof. Bashir Ahmed Shaikh took the charge of Director DME for variable period

# Director Message

![](https://www.smbbmu.edu.pk/beta/uploads/employees/images/thumbs/no-image.png)

# Vision And Mission

VISION STATEMENT

Sustaining medical education is not a minor under taking. Keeping in view the institutional needs and resources, DME is intended to help in capacity building of teaching faculty, designing and revision of curricula to meet the current and emerging needs of Medical Education and in Promoting Research and supporting Medical Students

MISSION STATEMENT:

DME is putting all the efforts to meet its vision. In this context, DME is conducting and facilitating various workshop, seminars, symposia and hands on training to train staff in Medical pedagogy, clinical teaching, student assessment & program evaluation in collaboration with various departments and to train medical students in group dynamics, small group learning activities & PBL.

 DME is also striving to help in development and monitoring of curriculum by providing appropriate design and innovations and is assisting curriculum committees in instructional methods, clinical teaching and student assessment.  It is also promoting medical research and providing necessary peer support for medical teachers to contribute positively to our institute.

## Team

![Featured image 1](https://www.smbbmu.edu.pk/beta/uploads/employees/images/no-image.png)
  

#

*Director*

## Vision & Mission

**Vision :** 
  

The vision of Department of Medical Education SMBB Medical University is to provide educational/instructional/training services to the students & faculty of the institute in order to achieve the mark of excellence in the field.
Also, we intend to be a “reference point” and “stand-alone” as Leader of Health Professions Education and Faculty Professional Development among all public and private medical institutes.

  
 **Mission :** 
  

The mission of Department of Medical Education is to:

1. Promote innovation, and integration in order to provide quality Medical Education to the students of SMBBMU.
2. Bring curriculum reforms
3. Promote the of culture of collaborative research
4. Provide platform for comprehensive Faculty Professional Development to achieve excellence in the field of Medical Education.
5. Bring reforms in the assessment and evalution of the Medical Education Programs.

## Workshops

## Downloads

|  |  |  |
| --- | --- | --- |
| 1 | Application Form | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/chpe-form-17480011360.pdf) |
| 2 | Application Form | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/chpe-form-17307923770.pdf) |
| 3 | Application Form | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/form-17147199670.pdf) |
| 4 | Application Form | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/form-16700505710.pdf) |
| 5 | Notice for Workshops | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/notice-of-workshops-16541080670.pdf) |
| 6 | OSCE Template | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/osce-template-16795973341.pdf) |
| 7 | Refund Claim Form | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/refund-claim-form-ok-16029354070.pdf) |
| 8 | MBBS Learning Outcomes | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/mbbs-learning-outcome-16795977050.pdf) |
| 9 | Workshop Form | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/workshop-registration-form-16043905590.pdf) |
| 10 | BDS Learning Outcomes | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bds-learning-outcomes-16795978090.pdf) |
| 11 | BCQ Proforma | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bcq-submission-proforma-16144163370.pdf) |
| 12 | DPT Learning Outcomes | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/dpt-learning-outcomes-16795978820.pdf) |
| 13 | Pharmacy Learning Outcomes | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/pharmacy-learning-outcomes-16795978821.pdf) |
| 14 | BSN & PostRN Learning Outcomes | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/bcon-learning-outcome-bsn-bscn-postrn-16795979310.pdf) |
| 15 | OSPE Template | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/ospe-template-16795973340.pdf) |

## Organogram

![](https://www.smbbmu.edu.pk/beta/images/organogram.jpg)

© 2026 Shaheed Mohtarama Benazir Bhutto Medical University. All rights reserved.', '{"contact":{"email":"dme@smbbmu.edu.pk","phone":"+92 74 9410 703 · EXT 192","location":"Academic Block, Main Campus, Larkana"}}'::jsonb),
('policies-page', 'Policies', '| | | | | --- | --- | --- | | [Anti-Plagiarism Policy of HEC](https://www.smbbmu.edu.pk/beta/index.php/news/downloadFile/DOC-20250606-WA0019_250606_172809_page-0001_17496365390.jpg) |…', '# Policies

|  |  |  |
| --- | --- | --- |
| [Anti-Plagiarism Policy of HEC](https://www.smbbmu.edu.pk/beta/index.php/news/downloadFile/DOC-20250606-WA0019_250606_172809_page-0001_17496365390.jpg) | [Download](https://www.smbbmu.edu.pk/beta/index.php/news/downloadFile/DOC-20250606-WA0019_250606_172809_page-0001_17496365390.jpg)  | |
| [Diversity and Non-Discrimination Policy](https://smbbmu.edu.pk/policies/diversity-non-diversity-policy) | [View](https://smbbmu.edu.pk/policies/diversity-non-diversity-policy)  | |
| [Official Residences Allotment Policy](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/allotment-policy.pdf) | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/allotment-policy.pdf)  | |
| [Student Council Policy](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmu-sc-policy-16841259850.pdf) | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmu-sc-policy-16841259850.pdf)  | |', '{}'::jsonb),
('scholarship-financial-aid-policy', 'Introduction', '# Introduction Shaheed Mohtarma Benazir Bhutto Medical University, Larkana by realizing the continuous rise in educational expenses, took the initiatives and has established a separate and fully functional "Students…', '# Student Financial Aid Office (SFAO)

# Introduction

Shaheed Mohtarma Benazir Bhutto Medical University, Larkana by realizing the continuous rise in educational expenses, took the initiatives and has established a separate and fully functional "Students Financial Aid Office" in August 2017 to support the meritorious as well as needy students by offering fee waivers and providing them financial support through the help of Higher Education Commission, various government agencies, donor agencies, philanthropist organizations, Alumni associations etc.

The theme of establishment of this office was to elevate the socio-economic position of the needy & deserving students by providing access to quality education through Need-based and Merit Scholarships/ Financial Assistances and interest free educational loans (Qarz-e-Hasna).

The main objective of this office is to ensure that no deserving student should leave university without a degree only because of financial constraint/difficulty.

# The Committee

|  |  |
| --- | --- |
| **Vice Chancellor** | Chairperson |
| **Concerned Principal & Director** | Member |
| **Registrar** | Member |
| **The Director Finance** | Member |
| **The In-charge SFAO** | Member & Secretary |

# Scholarships

### Merit Scholarship:

1. Every year merit scholarships shall be awarded proportionately to meritorious students of all constituent colleges on the basis of result of the Professional MBBS / BDS/Pharm.D. University Examination.
   Distribution of scholarship shall be as follows:
   - CMC 10 scholarships
   - GMMMC 4 scholarships
   - BADC 2 scholarships
   - Pharmacy department 2 scholarships
2. The value of the scholarships will be as follows:   
   (a) Students standing at first position Rs.1500 per month   
   (b) Students standing at 2nd & 3rd positions Rs.1200 per month to each student (c) Students standing at 4th to 10th position Rs.1000 per month to each student (iii) These merit scholarships shall be given irrespective of any other scholarship being received by the student.
3. In case of a tie on last winner of scholarship e.g. having equal marks, the award of Merit Scholarship will be given to the student having better academic record/progress in previous professional examinations of the university.

### Freeships:

1. Eligibility.
     
   a) High academic percentage.   
   b) Fee concession shall not be applicable on students admitted under UAEP, overseas Pakistani, and Foreign National category.   
   c) Low income family background on actual information basis. To be certified from concerned Mukhtiarkar and countersigned by SDM.
2. Remission of the whole or half of the tuition fees may be allowed by the Principal of constituent college to the students belonging to the tagged districts. The total number of freeship will not exceed ten percent of number of students in each batch on the college roll.
3. Remission of fees means exemption from paying tuition fees only, full or half as the case may be. The student who are granted full or half remission of tuition fees shall be required to make full payments for all other subscriptions/funds.
4. Application for remission shall be submitted by the students on the date to be fixed by the Head of Institution. The application should be accompanied by certificate from the Deputy Commissioner or Mukhtiarkars of district/taluka to which the student belongs, stating the financial circumstances of the applicant''s parent / guardian.
5. The grant of such remission will rest with the Head of the institutions and will depend upon the circumstances of a student with regard to his/her studies. Absence from or failure in a professional examination, breach of discipline, neglect of studies or reprehensible conduct shall entail the loss of the concession.
6. Remission will be granted on yearly basis subject to the satisfactory progress and failure will not be awarded free ship for that year.
7. Student receiving stipends/endowment scholarships will not be eligible for Free-ship concession.
8. Students admitted under UEAP shall not be eligible for free ship.
9. Those who have already got 50% concession on basis of their parent as Teacher of SMBBMU Larkana shall not be eligible for free ship.
   Note: As per resolution No: 22.03 passed in 22nd syndicate meeting of SMBBMU held on 8th March 2014, the children of employees of SMBBMU admitted in SMBBMU during their service time shall be given benefit of 50% concession in fees upto completion of their study period.

### HEC Need Based Scholarship:

To provide opportunities to talented but financially disadvantaged students and empower them to acquire a high quality education at SMBB Medical University, Larkana, HEC has funded need based scholarships for deserving candidates for which following eligibility criteria is devised:

- Financial assistance & scholarships are available for study at Undergraduate level in SMBB Medical University, Larkana.
- Students need to compete for securing admission at the SMBB Medical University, Larkana as per admission policy of the university and be enrolled in Undergraduate programs.
- Students in financial need who are already enrolled in SMBB Medical University, Larkana are also eligible to apply.
- The eligibility of a candidate is linked to his/her financial needs as assessed by the Institutional Scholarship Award Committee. The financial background of the family of the applicant will be kept in view in this regard.
- The number of slots will be decided by the SMBB Medical University, Larkana.
- Funding for slots will be ensured by HEC for the complete duration of the program. In case any students drop out, they will be replaced by other candidates on the waiting list.
- The SMBB Medical University, Larkana will decide whether to include or exclude any discipline keeping in view its grant, program cost, and number of allocated slots, etc.
- Considering the allocated grant, the SMBB Medical University, Larkana may adjust the total number of scholarships to an extent in order to cover the tuition fees.
- In addition to the tuition fee, every grantee will be paid Rs.6000/- stipend per month for the complete program.

### Sindh Endowment Fund Scholarship

Education and literacy department, Government of Sindh award these scholarships on following eligibility criteria:

- Applicant should hold the domicile of Sindh province
- It is necessary for candidate to be enrolled in SMBB Medical University, Larkana in relevant session.
- Those candidates who parents or guardians yearly income should not more than Rs. 750,000/- They should bring attestation certificate from the concerned assistant commissioner revenue for their income.
- 5% quota is reserved for the children of Government Primary, Secondary and Higher Secondary school teachers.
- 2% quota is reserved for the children of Sindh Secretariat.

### Ehsas / BISP Scholarship

### Zakat Need Cum Merit Scholarship

### SANA fame Scholarship

### Sindh Indigenous Scholarship for PG

### HEC Gligit Scholarship

### HEC FATA / Balochistan Scholarship

### Minority Scholarship

### Khairpur District Scholarship

### Baitul-Mal Scholarship

### Diya Scholarship

### Nest Scholarship

### Allama Iqbal HEC Scholarship for Afghan Students

### Punjab Endowment Scholarship

### National Endowment Scholarship

### Brother/Sister Concession:

Brother and sister or two brothers or two sisters studying in the same Institution. Only junior student shall be the beneficiary of 50% of tuition fees.

### Employee Sons/Daughters

The children of employees of SMBBMU admitted in SMBBMU during their service time shall be given benefit of 50% concession in fees upto completion of their study period.

© 2026 Shaheed Mohtarama Benazir Bhutto Medical University. All rights reserved.', '{}'::jsonb),
('student-resources', 'Students Resources', '[Fee Payment](https://finex.smbbmu.edu.pk/web/fees/online) [Downloads](https://www.smbbmu.edu.pk/beta/downloads) [Prospectus Postgraduate](https://www.smbbmu.edu.pk/beta/financialaids)…', '# Students Resources

  
   

[Fee Payment](https://finex.smbbmu.edu.pk/web/fees/online)

[Downloads](https://www.smbbmu.edu.pk/beta/downloads)

[Prospectus Postgraduate](https://www.smbbmu.edu.pk/beta/financialaids)

[Scholarships](https://www.smbbmu.edu.pk/beta/financialaids#scholarship)

[Examination](https://www.smbbmu.edu.pk/beta/announcements/examination)

[Examination Certificate Fees Challan](https://www.smbbmu.edu.pk/beta//announcements/details/examination-certificate-fees-challan-03-11-2024)', '{}'::jsonb),
('downloads-page', 'Downloads', '| | | | | --- | --- | --- | | 1 | Application Form for Postgraduate Students | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmul-form-for-p-15729553181.pdf) | | 2 | Challan for…', '# Downloads

|  |  |  |
| --- | --- | --- |
| 1 | Application Form for Postgraduate Students | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmul-form-for-p-15729553181.pdf) |
| 2 | Challan for Postgraduate Students | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/challan-of-controller-postgraduate-15729553180.pdf) |
| 3 | Application Form for Postgraduate Students | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmul-form-for-p-15729553181.pdf) |
| 4 | Challan for Postgraduate Students | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/challan-of-controller-postgraduate-15729553180.pdf) |
| 5 | Medicine Log Book | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/log-book-medicine.pdf) |
| 6 | Application Form for Postgraduate Students | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmul-form-for-p-15729553181.pdf) |
| 7 | Challan for Postgraduate Students | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/challan-of-controller-postgraduate-15729553180.pdf) |
| 8 | Student Course Evaluation Questionnaire | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-1-student-course-evaluation-questionnaire-1492070163.pdf) |
| 9 | Faculty Course Review Report | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-2-faculty-course-review-report-1492070163.pdf) |
| 10 | Survey Of Graduating Students | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-3-survey-of-graduating-students-1492070163.pdf) |
| 11 | Research Student Progress Review Form | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-4-research-student-progress-review-form-1492070163.pdf) |
| 12 | Faculty Survey | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-5-faculty-survey-1492070024.pdf) |
| 13 | Survey Of Department Offering PHD | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-6-survey-of-department-offering-phd-1492070024.pdf) |
| 14 | Alumni Survey | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-7-alumni-survey-1492070024.pdf) |
| 15 | Employer Survey | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-8-employer-survey-1492070024.pdf) |
| 16 | Faculty Resume | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-9-faculty-resume-1492070024.pdf) |
| 17 | Teacher Evaluation Form | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-10-teacher-evaluation-form-1492070024.pdf) |
| 18 | HEC Self Assessment Manual | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1-hec-self-assessment-manual-1492068343.pdf) |
| 19 | Quality Assurance Manual for the HEIs | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/2-hec-quality-assurance-manual-for-higher-education-in-pakistan-1492068343.pdf) |
| 20 | Performance Evaluation Standards for the HEIs | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/3-performance-evaluation-standards-for-heisgdg-1492068343.pdf) |
| 21 | Plagiarism Policy | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/4-plagiarism-policy-1492068180.pdf) |
| 22 | Turn it Policy | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/5-turnitin-policy-1492068180.pdf) |
| 23 | Standard Operation Procedure | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/6-standard-operating-procedure-1492068180.pdf) |
| 24 | MPhil/PHD Criteria | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/7-mphil-phd-criteria-1492068180.pdf) |
| 25 | Plagiarism Notification | [Download](https://www.smbbmu.edu.pk/beta/index.php/news/downloadFile/8-Notification_1492067968.jpg) |
| 26 | Little Book Of Plagiarism | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/9-little-book-of-plagiarism-1492067968.pdf) |
| 27 | Plagiarism Notification | [Download](https://www.smbbmu.edu.pk/beta/index.php/news/downloadFile/8-Notification_1492067964.jpg) |
| 28 | Little Book Of Plagiarism | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/9-little-book-of-plagiarism-1492067964.pdf) |', '{}'::jsonb),
('contact-page', 'Contact Us', '###### Vice Chancellor Secretariat Tel: [+92-74-9410724](tel:92749410907), +92-74-9410908 | Fax: +92-74-9410910, +92-74-4752411 ###### Registrar Office Tel: [+92-74-9410907](tel:92749410907) | Fax: +92-74-4752408 ######…', '# Contact Us

###### Vice Chancellor Secretariat

Tel: [+92-74-9410724](tel:92749410907), +92-74-9410908 | Fax: +92-74-9410910, +92-74-4752411

###### Registrar Office

Tel: [+92-74-9410907](tel:92749410907) | Fax: +92-74-4752408

###### Directorate Of Admissions

Tel: [+92-74-4752760](tel:92744752760) | Fax:+92-74-9410511', '{}'::jsonb),
('annual-report', 'Annual Report', '| | | | | --- | --- | --- | | [Annual Report 2023-24](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-report-2023-24-17822370580.pdf) |…', '# Annual Report

|  |  |  |
| --- | --- | --- |
| [Annual Report 2023-24](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-report-2023-24-17822370580.pdf) | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-report-2023-24-17822370580.pdf)  | |
| [Annual Report 2024-25](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-report-2024-25-17579302060.pdf) | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-report-2024-25-17579302060.pdf)  | |
| [Annual Report 2023](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-report-2023-17497274680.pdf) | [Download](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/annual-report-2023-17497274680.pdf)  | |', '{}'::jsonb),
('affiliated-colleges', 'Affiliated Colleges', '| S# | College / Institute Name | Remarks | | --- | --- | --- | | Public Sector | | | | --- | --- | --- | | 1 | College of Nursing (F) (Govt.) Larkana. | | | 2 | College of Nursing (M) (Govt.) Larkana. | | | 3 | College…', '# Affiliated Colleges

| S# | College / Institute Name | Remarks |
| --- | --- | --- |
| Public Sector | | |
| --- | --- | --- |
| 1 | College of Nursing (F) (Govt.) Larkana. |  |
| 2 | College of Nursing (M) (Govt.) Larkana. |  |
| 3 | College of Nursing (M) (Govt.) Jacobabad. |  |
| 4 | College of Nursing (F) (Govt.) Khairpur. |  |
| 5 | College of Nursing (F) (Govt.) R.B.U.T. Shikarpur. |  |
| 6 | College of Nursing (F) (Govt.) Sukkur. |  |
| Private Sector | | |
| 7 | Lareb Mustafa Institute of Nursing and Allied Health Sciences, Gambat. |  |
| 8 | Sindhu Institute of Nursing, Khairpur Mir''s. |  |
| 9 | Imam Institute of Nursing and Allied Health Sciences, Jacobabad. |  |
| 10 | Zaib-un-Nisa Institute of Nursing and Allied Health Sciences, Ghotki. |  |
| 11 | Moomal Institute of Physiotherapy and Allied Health Sciences, Hyderabad. |  |
| 12 | SHAAF Institute of Modern Sciences, Larkana. |  |
| 13 | Duaa Institute Medical & Allied Health Sciences, Hyderabad. | De-affiliated w.e.f. 2023 |
| 14 | Illahi Bux Institute of Nursing, Nawabshah, SBA. |  |
| 15 | Bhittai Institute of Nursing, Nawabshah, SBA. |  |
| 16 | Shaheed Molai Khan Institute of Nursing, Shikarpur. |  |
| 17 | National Institute of Allied Health Sciences, Qasimabad, Hyderabad. |  |
| 18 | Sindh Institute of Health and Technology, Khairpur, Sindh. |  |
| 19 | Leaders Institute of Medical and Health Sciences, Khairpur. |  |
| 20 | Visionary Institute of Nursing and Allied Health Sciences, Sukkur. |  |
| 21 | Manzoor Institute of Nursing & Allied Health Sciences, Jacobabad. |  |
| 22 | Adam College of Nursing and Midwifery, Hyderabad. |  |
| 23 | Larkana Institute of Nursing and Allied Health Sciences, Larkana. |  |
| 24 | Institute of Medical & Technology (IMT), Sukkur. |  |
| 25 | Mehmood Institute of Nursing and Allied Health Sciences, Sanghar. |  |
| 26 | Sindh Institute of Cardiovascular Diseases, Sukkur. |  |
| 27 | Sindh Institute of Cardiovascular Diseases, Larkana. |  |
| 28 | EduCareer Sindh Institute (Pvt.) Ltd., Sukkur. |  |
| 29 | Rohri Institute of Sukkur & Allied Health Sciences, Rohri. |  |
| 30 | Nova Institute of Modern Studies (Pvt.) Ltd., Islamabad. | De-affiliated 2023 |
| 31 | Larkana Institute of Health & Emerging Sciences, Larkana. | De-affiliated 2024 |
| 32 | Bhittai College of Nursing & Allied Health Sciences, Mirpur Khas. | De-affiliated 2022 |', '{}'::jsonb),
('postgraduate-admissions', 'Admissions', 'You form has been submitted successfully # Post Graduate [Download Application Form](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmul-form-for-p-15729553181.pdf) [Download…', '# Thank You!

You form has been submitted successfully

# Post Graduate

  

[Download Application Form](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmul-form-for-p-15729553181.pdf)
[Download Challan](https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/challan-of-controller-postgraduate-15729553180.pdf)

# Admissions

**PROGRAMS**

 

DEGREE PROGRAM (4-5 YEARS)

**MS SURGERY & ALLIED**

- General Surgery
- Ophthalmology
- Obsterics & Gynaecology
- Orthopaedics
- Paediatrics Surgery
- Urology
- Nuerosurgery\*

**MD MEDICINE & ALLIED**

- General Medicine
- Paediatrics

**PhD**

- Biochemistry

**M.PHIL(02 Years)**

- Microbiology
- Biochemistry
- Physiology
- Pharmacology

**MSPH**

**M.S(Nursing)**

**DIPLOMA PROGRAM (02 YEARS)**

- Gynae & Obs: (DGO)
- Ophthalmology (DO)
- Child Health (DCH)
- Psychiatry (D.P.M)
- Diploma in Cardiology (Dip-Card)
- Clinical Neurology (DCN)
- Dermatology (D.Derm)
- Diag Radiology (DMRD)

**C.P.S.P TRAINING COURSES**

**FCPS-II   MEDICINE ALLIED**

- General Medicine
- Paediatrics
- Cardiology
- Dermatology
- Neurology
- Gastroenterology
- Psychiatry
- Pulmonology

**FCPS-II SURGERY ALLIED**

- General Surgery
- Obst: Gynae
- Ophthalmology
- Paeds Surgery
- Orthopedics
- Urology
- Nuerosurgery
- Aneshthesiology(GMMMC)
- Radiology(GMMMC)

# Admission Schedule

|  |  |  |  |
| --- | --- | --- | --- |
| **UNIVERSITY COURSES** | | | |
| 1 | Date of Inviting Applications | Monday | 28-10-2024 |
| 2 | Last date for submission of applications for PhD, MD, MS, M.Phil, Diploma & MSN | Friday | 15-11-2024 |
| 3 | Entry test for Degree courses | Tuesday | 26-11-2024 |
| 4 | Entry test for Diploma courses | Thursday | 28-11-2024 |
| 5 | Start Of Courses / training of FCPS-II  Start Of Courses / training of university courses | Wednesday | 01-01-2025 |
| **FCPS-II Training** | | | |
| 1 | Last date for submission of applications for FCPS-II training | Monday | 15-11-2024 |
| 2 | Entry test of eligible candidates of FCPS-II training | Thursday | 05-12-2024 |
| 3 | The interview of Basic Medical Sciences | Monday | 23-12-2024 |
| 4 | The interview of FCPS-II training in Surgery & Allied | Tuesday | 24-12-2024 |
| 5 | The interview of FCPS-II training in Medicine & Allied | Thursday | 26-12-2024 |

# Eligibility Criteria

**MSN**
  
**Qualification Category - I**

- 10 Years of schooling (Matric/FA/F.Sc.)
- 03 Years Diploma in Nursing
- 01 Year Diploma in Midwifery or any Post Basic Specialty diploma registered with PNMC.
- 01-year experience as RN for admission in Post RN BSN/BSM Degree.
- 02 Years Post RN BSN/BSM Degree program as specified by PNC and HEC vide Notification No. 8(61)/A&A/2018/HEC/5799, dated 26.04.2018 and registered with PNMC.
- 01 Year experience as RN after Post RN BSN (clinical includes inpatient and outpatient in primary and tertiary care, as well as teaching and research) for admission in MSN degree

**OR**  
**Qualification Category-II**

- 12 Years schooling (Matric + FSc Pre Medical)
- 04 Year Generic BSN Nursing Degree registered with PNMC.
- 01-year internship (bedside care)
- 01-year experience as RN after GBSN (clinical includes inpatient and outpatient in primary and tertiary care) (excluding 01-year Internship) for admission in MSN.

**Note:** PNMC-MIS Online Pre-registration is a must for all Inducted students in the above professional educational programs.
  
  
**MSPH**

- BSPH
- MBBS
- MD
- BDS
- DPT
- Pharm-D
- DVM
- BSC Paramedics-4 years
- BS in Social Sciences (Sociology/Psychology/Anthropology)
- BS in Environmental Sciences
- BS and equivalent/Nutrition

# Important Instructions

**GENERAL INSTRUCTIONS**

- The application form along with challan form can be obtained from Sindh Bank, VIP Road branch Larkana OR application form can be downloaded from website of SMBBMU, www.smbbmu.edu.pk. After paying challan at sindh bank, the receipt and complete application form should be submitted at the Directorate of Postgraduate Studies, SMBBMU @ CMC Larkana.
- There shall be entry test for selection of candidates for FCPS-II in those disciplines, in which the application exceed the numbers of available seats
- Venue & Time For Entry Test: / Part-I MD/ MS Shall be announced With Admit Cards.
- Only those candidates who qualify written entry test / Part-I MD/MS shall be called for interview. Selection shall be on the basis of merit against availability of number of seats. The decision of Postgraduate Committee in interview shall be final.
- No TA/DA shall be paid to the candidates, for appearing in entry test / part-I MD/MS interview.
- Postgraduate Directorate reserves the right of any modification in the schedule/courses (due to unavoidable circumstances).
- All those employed in Government Service / Semi Government / Autonomous Bodies or other University of the country should apply through proper channel otherwise their applications will not be entertained, however they can send advance copy with relevant documents.
- The Postgraduate selection committee reserves the rights to cancel any admission. However, the candidates shall have their rights to appeal with competent Authority within a per period of 02 weeks.

**INSTRUCTIONS FOR FCPS-II CANDIDATES**

- The candidates who wish to take FCPS-II training, should apply on prescribed form before closing date.
- No application for start of fresh training shall be entertained after interview.
- The option of type of course and unit / supervisor once given in interview shall be final and shall not be changed after interview and the mutual change of unit shall not be allowed after final selection in interview.

# Fees Schedule

|  |  |
| --- | --- |
| A) Entry Test | |
| Diploma/CPSP Program | 10,000 |
| University Degree Program | 25,000 |
| Prospectus Fee | 5,000 |
| B) Admission Fee | |
| PhD | 37,500 |
| Other University Degree Course | 30,000 |
| Diploma Courses | 20,000 |
| FCPS-II Courses | 20,000 |
| C) Tution Fee Per Year | |
| PhD | 150,000 |
| Univesrity Degree Courses | 100,000 |
| Diploma Courses | 30,000 |
| FCPS-II | 30,000 |

# Updates

|  |  |
| --- | --- |
| [Admission in Postgraduate Courses for the Session January 2026](https://www.smbbmu.edu.pk/beta/index.php/news/details/admission-in-postgraduate-courses-for-the-session-january-2026-10-28-2025) | 28-10-2025 |
| [Corrigendum for the Admission to Postgraduate Courses for Session July-2025](https://www.smbbmu.edu.pk/beta/index.php/news/details/corrigendum-for-the-admission-to-postgraduate-courses-for-session-july-2025-06-05-2025) | 05-06-2025 |
| [Admission to Postgraduate Courses for the Session July-2025](https://www.smbbmu.edu.pk/beta/index.php/news/details/admission-to-postgraduate-courses-for-the-session-july-2025-05-25-2025) | 25-05-2025 |
| [Admissions for Postgraduate Courses for Session January 2025](https://www.smbbmu.edu.pk/beta/index.php/news/details/admissions-for-postgraduate-courses-for-session-january-2025-10-31-2024) | 31-10-2024 |
| [Postgraduate interview schedule for the session January 2023 at SMBB Medical University Larkana](https://www.smbbmu.edu.pk/beta/index.php/news/details/postgraduate-interview-schedule-for-the-session-january-2023-at-smbb-medical-university-larkana-01-10-2023) | 10-01-2023 |
| [Schedule for the entry test of M.SC, MSPH & Diploma/ MCPS Courses December 2022 at SMBB Medical University Larkana.](https://www.smbbmu.edu.pk/beta/index.php/news/details/schedule-for-the-entry-test-of-msc-msph-diploma-mcps-courses-december-2022-at-smbb-medical-university-larkana-12-28-2022) | 28-12-2022 |
| [Schedule for entry test for the PH.D and MPHIL course December 2022 at SMBB Medical University Larkana](https://www.smbbmu.edu.pk/beta/index.php/news/details/schedule-for-entry-test-for-the-phd-and-mphil-course-december-2022-at-smbb-medical-university-larkana-12-28-2022) | 28-12-2022 |
| [Schedule for entry test MD / MS PART-I December 2022 at SMBB Medical University Larkana](https://www.smbbmu.edu.pk/beta/index.php/news/details/schedule-for-entry-test-md-ms-part-i-december-2022-at-smbb-medical-university-larkana-12-28-2022) | 28-12-2022 |
| [Schedule for entry tests FCPS-II Training Programs December 2022 at SMBB Medical University Larkana](https://www.smbbmu.edu.pk/beta/index.php/news/details/schedule-for-entry-tests-fcps-ii-training-programs-december-2022-at-smbb-medical-university-larkana-12-28-2022) | 28-12-2022 |
| [Applications on prescribed forms are invited from interested IN-SERVICE / PRIVATE Candidates for admissions to Training/Residency programs (as given below) for the Session January 2023 at SMBBMU, Larkana.](https://www.smbbmu.edu.pk/beta/index.php/news/details/pplications-on-prescribed-forms-are-invited-from-interested-in-service-private-candidates-for-admissions-to-trainingresidency-programs-as-given-below-for-the-session-january-2023-at-smbbmu-larkana-11-30-2022) | 30-11-2022 |
| [Announcement if Result of Post-Graduate Entry Test June, 2022 (Session July 2022) at SMBB Medical University Larkana](https://www.smbbmu.edu.pk/beta/index.php/news/details/announcement-if-result-of-post-graduate-entry-test-june-2022-session-july-2022-at-smbb-medical-university-larkana-07-27-2022) | 27-07-2022 |
| [Call for Interviews of Successful candidates of Post-Graduate Entry Test June 2022 (Session July 2022) at SMBB Medical University Larkana](https://www.smbbmu.edu.pk/beta/index.php/news/details/call-for-interviews-of-successful-candidates-of-post-graduate-entry-test-june-2022-session-july-2022-at-smbb-medical-university-larkana-07-27-2022) | 27-07-2022 |
| [Postponed of Postgraduate Entry test for the July 2022 Session SMBB Medical University, Larkana.](https://www.smbbmu.edu.pk/beta/index.php/news/details/postponed-of-postgraduate-entry-test-for-the-july-2022-session-smbb-medical-university-larkana-06-27-2022) | 27-06-2022 |
| [Admissions of Postgraduate Courses for the session of July 2022 at SMBB Medical University, Larkana.](https://www.smbbmu.edu.pk/beta/index.php/news/details/admissions-of-postgraduate-courses-for-the-session-of-july-2022-at-smbb-medical-university-larkana-05-30-2022) | 30-05-2022 |
| [Notice for Interviews of FCPS-II for Session January 2021-22](https://www.smbbmu.edu.pk/beta/index.php/news/details/notice-for-interviews-of-fcps-ii-for-session-january-2021-22-12-22-2021) | 22-12-2021 |

# Contact Us

Admission Cell, Shaheed Mohtarma Benazir Bhutto Medical University  
 Larkana, Sindh, Pakistan
  
**Email:** [admissions@smbbmu.edu.pk](mailto:admissions@smbbmu.edu.pk)
  
**Tel:** [+92-74-4752760](tel:+92-74-4752760)

© 2026 Shaheed Mohtarama Benazir Bhutto Medical University. All rights reserved.', '{}'::jsonb)
on conflict (slug) do update set title=excluded.title, standfirst=excluded.standfirst, body=excluded.body, meta=excluded.meta;

-- 05_downloads.sql
insert into downloads (title, file_url, category, file_size_kb, page_slug) values
('Application Form for Postgraduate Students', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/smbbmul-form-for-p-15729553181.pdf', 'Forms & Proformas', 138, NULL),
('Challan for Postgraduate Students', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/challan-of-controller-postgraduate-15729553180.pdf', 'Fee Challans', 65, NULL),
('Medicine Log Book', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/log-book-medicine.pdf', 'Academics', 1090, NULL),
('Student Course Evaluation Questionnaire', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-1-student-course-evaluation-questionnaire-1492070163.pdf', 'Forms & Proformas', 84, NULL),
('Faculty Course Review Report', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-2-faculty-course-review-report-1492070163.pdf', 'Forms & Proformas', 189, NULL),
('Survey Of Graduating Students', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-3-survey-of-graduating-students-1492070163.pdf', 'Forms & Proformas', 122, NULL),
('Research Student Progress Review Form', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-4-research-student-progress-review-form-1492070163.pdf', 'Forms & Proformas', 115, NULL),
('Faculty Survey', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-5-faculty-survey-1492070024.pdf', 'Forms & Proformas', 121, NULL),
('Survey Of Department Offering PHD', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-6-survey-of-department-offering-phd-1492070024.pdf', 'Forms & Proformas', 148, NULL),
('Alumni Survey', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-7-alumni-survey-1492070024.pdf', 'Forms & Proformas', 51, NULL),
('Employer Survey', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-8-employer-survey-1492070024.pdf', 'Forms & Proformas', 122, NULL),
('Faculty Resume', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-9-faculty-resume-1492070024.pdf', 'Forms & Proformas', 225, NULL),
('Teacher Evaluation Form', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/proforma-10-teacher-evaluation-form-1492070024.pdf', 'Forms & Proformas', 139, NULL),
('HEC Self Assessment Manual', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/1-hec-self-assessment-manual-1492068343.pdf', 'Quality Assurance', 629, NULL),
('Quality Assurance Manual for the HEIs', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/2-hec-quality-assurance-manual-for-higher-education-in-pakistan-1492068343.pdf', 'Quality Assurance', 813, NULL),
('Performance Evaluation Standards for the HEIs', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/3-performance-evaluation-standards-for-heisgdg-1492068343.pdf', 'Quality Assurance', 425, NULL),
('Plagiarism Policy', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/4-plagiarism-policy-1492068180.pdf', 'Policies', 219, NULL),
('Turn it Policy', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/5-turnitin-policy-1492068180.pdf', 'Policies', 221, NULL),
('Standard Operation Procedure', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/6-standard-operating-procedure-1492068180.pdf', 'Policies', 241, NULL),
('MPhil/PHD Criteria', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/7-mphil-phd-criteria-1492068180.pdf', 'Policies', 453, NULL),
('Little Book Of Plagiarism', 'https://bdsatrlrmfefxyielppw.supabase.co/storage/v1/object/public/pdfs/9-little-book-of-plagiarism-1492067968.pdf', 'Policies', 217, NULL);
