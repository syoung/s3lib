cv

<entry [Fri 2013:02:01 15:26:05 EST] REFERENCES>

Stuart Young References
-----------------------

Jennifer Clarke
Assistant Professor, Division of Biostatistics
Department of Epidemiology and Public Health
Room 1051 Clin Research Bldg
1120 NW 14th Street
Miami, FL 33136
jclarke@med.miami.edu
work 305-243-3022 
mobile 786-402-7255

Dale J Hedges PhD
Research Asst Professor
College of Medicine
339 BRT
460 W 12th Avenue
Columbus OH 43210
Dale.Hedges@osumc.edu
work 614-688-1580
mobile 614-736-1339

Dr. John Gilbert
Professor, Faculty
Dr. John T. Macdonald Foundation Department of Human Genetics
Room 510 Biomed Resrch Bldg
1501 NW 10 Ave
Miami, FL 33136
jgilbert@med.miami.edu
work 305-243-2282
mobile 305-989-8149


    
</entry>
<entry [Fri 2013:01:04 20:27:13 EST] INTERVIEW TECHNIQUE>


http://www.joelonsoftware.com/articles/fog0000000073.html


For programming questions, I ask candidates to write a small function in C. Here are some typical problems I would ask:

Reverse a string in place
Reverse a linked list
Count all the bits that are on in a byte
Binary search
Find the longest run in a string
atoi
itoa (great, because they have to use a stack or strrev)
You don't want to give them any problems that take more than about 5 lines of code; you won't have time for that.

Let's look at a couple of these in detail. #1: reverse a string in place. Every candidate I've ever interviewed in my life has done this wrong the first time. Without exception, they try to allocate another buffer and reverse the string into that buffer. The trouble is, who allocates the buffer? Who frees the buffer? In giving this question to dozens of candidates I found out an interesting fact. Most people who think that they know C really do not understand memory or pointers. They just don't get it. It's amazing that these people are working as programmers, but they are. With this question, here are some ways to judge the candidate:

Is their function fast? Look at how many times they call strlen. I've seen O(n^2) algorithms for strrev when it should be O(n), because they are calling strlen again and again in a loop.
Do they use pointer arithmetic? This is a good sign. Many "C programmers" just don't know how to make pointer arithmetic work. Now, ordinarily, I wouldn't reject a candidate just because he lacked a particular skill. However, I've discovered that understanding pointers in C is not a skill, it's an aptitude. In Freshman year CompSci, there are always about 200 kids at the beginning of the semester, all of whom wrote complex adventure games in BASIC for their Atari 800s when they were 4 years old. They are having a good ol'; time learning Pascal in college, until one day their professor introduces pointers, and suddenly, they don't get it. They just don't understand anything any more. 90% of the class goes off and becomes PoliSci majors, then they tell their friends that there weren't enough good looking members of the appropriate sex in their CompSci classes, that's why they switched. For some reason most people seem to be born without the part of the brain that understands pointers. This is an aptitude thing, not a skill thing – it requires a complex form of doubly-indirected thinking that some people just can't do.
For #3, you can see how well they learned the bitwise operators in C.... but this is a skill, not an aptitude, so you can help them with these. The interesting thing is to watch them write a subroutine that counts all the bits in a byte, then ask them to make it much, much faster. Really smart candidates will create a lookup table (after all, it's only got 256 entries) that they only have to create once. With good candidates, you can have a really interesting conversation about the different space/speed tradeoffs. Press them further: tell them you don't want to spend any time building the lookup table during initialization. Brilliant candidates might even suggest a caching scheme where bits are counted the first time they are used, and then stored in a lookup table so they don't have to be counted if they are used again. Really, really brilliant candidates will try to devise a way to compute the table using some kind of a shortcut taking advantage of the patterns that occur.

When you watch somebody write code, here are some techniques that may be helpful:

Always reassure them that you understand that it's hard to write code without an editor, and you will forgive them if their paper gets really messy. Also you understand that it's hard to write bug-free code without a compiler, and you will take that into account.
Some signs of a good programmer: good programmers have a habit of writing their { and then skipping down to the bottom of the page and writing their }s right away, then filling in the blank later. They also tend to have some kind of a variable naming convention, primitive though it may be... Good programmers tend to use really short variable names for loop indices. If they name their loop index CurrentPagePositionLoopCounter it is sure sign that they have not written a lot of code in their life. Occasionally, you will see a C programmer write something like if (0==strlen(x)), putting the constant on the left hand side of the == . This is a really good sign. It means that they were stung once too many times by confusing = and == and have forced themselves to learn a new habit to avoid that trap.
Good programmers plan before they write code, especially when there are pointers involved. For example, if you ask them to reverse a linked list, good candidates will always make a little drawing on the side and draw all the pointers and where they go. They have to. It is humanly impossible to write code to reverse a linked list without drawing little boxes with arrows between them. Bad programmers will start writing code right away.
Inevitably, you will see a bug in their function. So we come to question 5: Are you satisfied with that code? You may want to ask, "OK, so where's the bug?" The quintessential Open Ended Question From Hell. All programmers make mistakes, there's nothing wrong with that, they just have to be able to find them. With the string functions, they'll almost always forget to null-terminate the new string. With almost any function, they are likely to have off-by-one errors. They will forget semicolons sometimes. Their function won't work correctly on 0 length strings, or it will GPF if malloc fails... Very, very rarely, you will find a candidate that doesn't have any bugs the first time. In this case, this question is even more fun. When you say, "There's a bug in that code," they will review their code carefully, and then you get to see if they can be diplomatic yet firm in asserting that the code is perfect... In general, it's always a good idea to ask the candidate if they are satisfied with their answer before moving on. Be Regis.

Part 6: the design question. Ask the candidate to design something. Jabe Blumenthal, the original designer of Excel, liked to ask candidates to design a house. According to Jabe, he's had candidates who would go up to the whiteboard and immediately draw a square. A square! These were immediate No Hires. In design questions, what are you looking for?

Good candidates will try to get more information out of you about the problem. Who is the house for? As a policy, I will not hire someone who leaps into the design without asking more about who it's for. Often I am so annoyed that I will give them a hard time by interrupting them in the middle and saying, "actually, you forgot to ask this, but this is a house for a family of 48-foot tall blind giraffes."
Not-so-smart candidates think that design is like painting: you get a blank slate, and you can do whatever you want. Smart candidates understand that design is a difficult series of trade-offs. A great design question: design a trash can for a city street corner. Think of all the trade offs! It has to be easy to empty, but impossible to steal; it has to be easy to put things into, but hard for things to fly out of on a windy day; it has to be solid, yet inexpensive; in some cities, it has to be specially designed so that terrorists can't hide a bomb in it.
Creative candidates will often surprise you with an interesting, non-obvious answer. One of my favorite questions is Design a Spice Rack for Blind People. Inevitably, candidates will put Braille somewhere on the spice bottles, and it usually winds up being on top of the lid for various reasons which you'll discover after you've asked this question 100 times. I had one candidate who decided that it would be better to put the spices in a drawer, because it is more comfortable to scan Braille with your fingertips horizontal than vertical. (Try it!) This was so creative it surprised me -- in dozens of interviews, I had never heard that answer. And it really took a major creative "leap" outside of the bounds of the problem. On the strength of that answer alone, and no negatives, I hired the candidate, who went on to be one of the best program managers on the Excel team.
Look for closure. This is part of Get Things Done. Sometimes candidates will drift back and forth, unable to make a decision, or they will try to avoid hard questions. Sometimes they will leave difficult decisions unanswered and try to move on. Not good. Good candidates have a tendency to try to naturally keep things moving forward, even when you try to hold them back. If the conversation ever starts going around in circles, and the candidate says something like "well, we can talk about this all day, but we've got to do something, so let's go with decision X" that's a really good sign.

    
</entry>
<entry [Fri 2013:01:04 20:25:08 EST] CYBERCODERS INTERVIEW TIPS>

CyberCoders Interview Tips

Telephone Interview

Research - Prior to the phone call, research their website at length.

Why are you Interviewing? - Know the reason why you would like to work at the company

Laundry List - Have a list of accomplishments and pertinent skills in front of you and know why are you a fit for the job. If you can not articulate this you may not get to the face to face interview.
Privacy Please - Schedule the interview at a time and number where you can be alone and talk freely. Land lines are better than mobile phones whenever possible.
Resume at the Ready - Be sure to have your resume in front of you so you can follow along with your background as they ask you questions.
Be Honest - Answer questions as directly as possible. If you do not know, say so. Be candid, friendly, cheerful and courteous. Confident but not cocky. If you sense that the other person wants to do lots of talking – let them. People like others who are interested in hearing them talk!
Next Step? - At the end of the interview, try to get a face to face interview. Ask what is the next step before hanging up the call.
Address Weaknesses - If you can, find out from the interviewer what they feel your strong points and weaknesses may be. This way, in the face to face interview you can reemphasize the strong points and address any perceived weaknesses.


Face-to-face interview

Be Prepared - Prior to your visit, educate yourself about the company – go through their website and write down several questions that come to mind. Look them up on Google. Know the reason why you'd like to work at the company. People notice when you have knowledge of their company and/or products.
Know Your Directions - Make sure the directions you received are accurate. Nothing says, "I'm not prepared" like getting lost on the way to an interview. Arriving 20 minutes early is a way to ensure you will not be late. Just wait outside the office until 3 minutes before the interview, then make your grand entrance…exactly on time.

PRACTICE – Practice your interview skills - that means answering the interview questions out loud to yourself as if you were in the interview. Running through your answers a few times builds confidence and assures yourself you will come across as articulate, efficient and prepared.
5 Resume Copies - Take at least 5 copies of your resume - you'll be prepared if they do not have copies.
Take Notes - You may want to bring a 'notepad or PDA' to take notes and write down your top 3 questions.
Dress Code - Know the office dress code – look sharp and professional. Being overdressed is always better than being underdressed. Unless they state that you should come in wearing business casual, both men and women should always opt for the traditional business suit as their interview attire.
Confidence - Firm handshake upon arrival and positive attitude throughout.
Be enthusiastic and friendly. Listen more than you talk (no single factor is more important in determining success in an interview).
Eye Contact - Look people in the eye when talking or listening to them.
Just Listen - No single thing you can do will affect the interview more than just being a good listener. Listen to questions asked of you. Answer them fully and directly. Do not talk too much. Never over sell your skill set.
Salary - If present salary is asked, furnish accurate information – including bonuses and commissions. They may ask for a W2 later, so you don't want to "enhance" any numbers! If they ask you what salary you want, the only acceptable answer at this point is "I am open to any fair and reasonable offer".
Nothing Negative - Do not criticize or come across as negative about your present or past employers or co-workers. Stay professional and avoid personal information unless it's "polite" conversation.
Ask for the job! - Let the interviewer know that you are interested and excited at the prospect of working for them and ask what the next step will be.
Send a thank you letter - If you are working with a recruiter, send a thank you letter to the recruiter so they can pass it along to the client for you. Otherwise, ask for their card so you can follow up with a thank you letter via email. The thank you email can often be the deal maker or breaker on getting the position.
Some Questions You May Hear in the Interview:
Tell me about yourself. They're looking for a concise, descriptive, and informative summary of more current and relevant career information, not long past, personal information.
Why do you want to work at XYZ Company? This is where your website and company history homework pays off. Give examples of specifics that you have found on their site, OR past projects that you enjoyed that apply.
What is your proudest accomplishment/ What are your greatest strengths? This is your turn to brag a bit, but not to the point of being arrogant.At least 2 examples, offer references that can attest to your work, etc. The more specifics you can offer, the better you look. Bring up sales numbers, deadlines, $$ Savings, whatever is measurable and speaks well of your efforts.
What would you classify as an area of improvement, and how would you go about achieving those improvements? Try to pick something that isn't a "DEAL KILLER" meaning something that IS NOT a job requirement, and that is not easily improved upon. Lots of folks choose something that is indirectly related to the role so that it doesn't affect your interview success. For example: "I realize this position requires a great deal of systems reporting experience and you work with system "x". I do have considerable experience with reporting, but up to now, there has not been a requirement for me to learn "system x". I can pick it up very quick as I do with all systems. At this time, I would have to say an area of improvement would be the learning curve on your particular software system."
What is the Salary you are looking for? It is always best to leave the door open and answer with something such as, "I would be happy to see your best offer. I am fairly flexible when it comes to the compensation since I am looking at everything including the company, the position, the growth potential, the benefit package, etc. Salary is just one piece of the pie and if you think I would be a good fit for the position, I am SURE we can come up with a figure that works for both of us!"
Why you are leaving? Be honest, very concise and direct, but don't slam your employer or boss. They want to hear that you are leaving on good terms (for everyone, not just you!) since it can easily be them on the other end of the equation if they hire you.
Why should we hire you for the position? Summarize, detail, sell yourself, and ask for an offer! Give technical reasons why you are the best candidate over personality reasons.

Sales positions: In certain sales position, you may be asked to perform a sample sales pitch for the product, and once again, this is where your preparation and website/company/product research will shine.
Questions you may want to ask (choose 1 or 2)
Why is this position open?
Where do you see the company in 5 years?
What makes you successful, and different from your competitors?
How long have you (the interviewer) been here, and what do you like most about your position, and the company?
What qualities would your ideal candidate have? Listen and make sure you later bring out some of the qualities you have which match what you heard)
How do you feel my qualifications match your needs?
    
</entry>
<entry [Thu 2013:01:03 06:06:44 EST] GENERIC BIOINFORMATICS COVER LETTER>


COVER LETTER

10218 Twin Lakes Drive
Coral Springs, FL 33071
Tel: 305-781 2286
stuartpyoung@gmail.com

Dear Sir/Madam,

Thank you for spending the time to consider my application. I hope you will find that my qualifications meet your requirements and that you will see that I have a demonstrated commitment to excellence in bioinformatics software development and a passion for solving life sciences problems.

I have a PhD in Bioinformatics and four years of post-doctoral experience in bioinformatics software development focusing on Next-generation sequencing analysis, Cloud computing and bioinformatics workflows. During my PhD, I developed novel machine learning techniques for genomic annotation and metagenomic annotation. I also created generic tools for generating new organism genomic databases that leverage the existing organism databases and mitigate their inherent constraints. To sustain the demands of large-scale sequence assembly and annotation pipelines, I built from scratch and maintained a 32-blade Mac XServer cluster and ran massively parallel jobs using the Sun Grid Engine (SGE) scheduler.

During my three years of PostDoc training, I worked with TeraByte-scale data sets using a variety of computational techniques and languages (Perl, C, R, Python, Java, etc.) and high performance computing clusters of 1000+ nodes to create a variety of NextGen data analysis tools and pipelines including expression and DNA analysis workflows, SNP prediction, quality control and visualization tools.

My most significant achievement in software design and implementation is Agua (www.aguadev.org), an open-source workflow platform for the Amazon EC2 (Elastic Compute Cloud) that makes massively parallel NextGen sequence analysis accessible to anyone with a credit card and Internet access. Agua demonstrates my ability to proactively seek out and implement solutions to urgent problems concerning bioinformatics in the Cloud age. I considered the unmet need for bioinformatics capacity and standardized workflows and acted to fill that gap by providing an open-source resource to the research community. Agua allows non-bioinformaticians to run the major Next-generation bioinformatics tools, and manage and share complex bioinformatics analyses in the Amazon Cloud using an intuitive drag-and-drop interface.

In addition to providing a framework for standardized bioinformatics workflows, Agua also implements a much-needed methodology for workflow discovery, citation and data provenance. Agua is also unique in that it incorporates a genomic viewer – JBrowse (www.jbrowse.org) – that allows Google Maps-style real-time browsing of genomic features on human chromosomes. Agua is aimed at all researchers in data-driven and computation-intensive disciplines. To this end, I integrated StarCluster from MIT (www.stardev.org) into Agua for creating and managing ad-hoc clusters in the Amazon EC2 Cloud with a generalized workflow model to support any combination of applications.

Alongside developing Agua, I designed and built the University of Miami's first NextGen analysis pipelines and data management infrastructure. A major part of my work involved verifying and evaluating the results of the leading commercial and open-source assemblers, SNP callers, expression analyzers and other sequence analysis tools. This required a thorough knowledge of the biology, sequencing technologies and the particular strengths and weaknesses of the different software tools. I worked with diverse teams of researchers to successfully devise and execute software test plans to ensure the reliability and credibility of analysis results.

In addition to my bioinformatics research experience, I also taught bioinformatics courses for two years during my graduate studies and PostDoc training. I began teaching Informatics as a Teaching Assistant during my MS Bioinformatics at Indiana University Bloomington. As a PostDoc, I taught a graduate bioinformatics course on bioinformatics tools at the University of Miami. I also trained undergraduate and graduate students in software development and mentored graduate students in software development. I enjoyed teaching bioinformatics and I believe an applied, project-based approach is particularly rewarding for motivated students. 

Lastly, having worked on many large and small bioinformatics projects throughout my nine years of graduate research and five years of postgraduate study, I have ample experience of interacting with scientists to determine their bioinformatics needs and propose and implement solutions in a variety of contact settings such as presentations, group project meetings and consultations. I am also proficient in database management (MySQL, PostgreSQL) and Linux system administration.

Thank you for taking the time to consider my application. If you need any further information, please do not hesitate to contact me. I am looking forward to hearing from you.

Yours sincerely, 


Stuart Young

    
</entry>
<entry [Sat 2012:12:22 03:14:50 EST] DETAILED JOB DESCRIPTIONS AND ACHIEVEMENTS>

06/2011-Present: Bioinformatics Consultant, Cloud Dynamics Consulting, Miami, FL

Work Description
NextGen bioinformatics consulting including software development, sequence analysis algorithms, pipeline construction, Cloud deployment, websites and data visualization.

Accomplishments
Completed beta release of Agua cloud workflow platform, significantly augmenting its functionality with the addition of an automated upgrade system, GitHub synchronization using a novel generic workflow annotation format, improved web application responsiveness, a streamlined user interface and an integrated package management system based on the proposed Open Package Schema.

Skills: bioinformatics & stats, software, pipelines, web & cloud admin


06/2008-05/2011: Post Doctoral Research Associate, University of Miami, 1120 NW 14th St, Miami, FL 33136. Tel: 305-284-2211

Work Description
Provide bioinformatics analysis support including experimental design consultation, selection and explanation of tools, scripting, data management, computational cluster provision, hypothesis testing, collation and presentation of results. Design and implement new algorithms for testing sequence assembly, expression and variation analysis tools. Act as a primary interface for new internal clients seeking guidance and/or consultation regarding bioinformatics tools and services. Provide outreach to internal departments including teaching, training, seminars, talks and a monthly journal club. Assess the quality and efficacy of commercial software tools, liaise and negotiate with vendors and suppliers. Develop in-house tools when necessary or appropriate. 

Accomplishments
Designed and built the University of Miami's first NextGen analysis pipelines and data management infrastructure to improve efficiency and ensure the integrity of the sequence data. 
Conducted pioneering high-throughput NextGen bioinformatics analyses for the Hussman Institute for Human Genomics (HIHG), Center for the Cure for Paralysis, Department of Cardiology and other groups in the University of Miami. 
Developed bioinformatics tools for experiment optimization (desired depth of coverage, expression, etc.) and analysis of complex data sets. 
Invented the Agua (Automated Genomics Utilities Agent) cloud workflow platform for NextGen sequencing bioinformatics in the Amazon Elastic Compute Cloud (EC2) to enable researchers to conduct sequencing experiments. Released pre-alpha version of Agua cloud workflow platform.

Skills: Bioinformatics, workflow design, genomics databases, sequencing algorithms


01/2005-05/2008: Research Assistant, North Carolina State University, Bioinformatics Research Center, Raleigh, NC 27695. Tel: 919-515-2535

Work Description
Provide microarray bioinformatics support for Drosophila genetic experiments. Create bioinformatics pipeline for Expressed Sequence Tag (EST) annotation, including constructing the sequence database and building a website with sequence search and data visualization. Provide bioinformatics support to scientists at the University of Miami's Rosenstiel School for Marine and Atmospheric Studies.

Accomplishments
Developed the Incremental Mismatch Probability (IMP) statistical algorithm to improve gene annotation using a frequentist approach to mismatched gene annotations based on sequence homology alignment. The IMP score can be used to filter out the vast majority of spurious BLAST matches caused by false annotations in existing biological databases. Created InterPro Motif Annotation Trees (IMAT), a highly accurate machine learning protein function prediction algorithm using InterPro motif signature analysis for use with less characterized 'model' genomes and metagenomics. Constructed an Expressed Sequence Tag (EST) analysis pipeline and website with graphical display of alignment matches. Implented EST pipeline for marine species Fundulus heteroclitus, Aplysia (Sea Hare) and Karenia brevis (Red Tide). Built from scratch, installed and maintained a 32-blade Mac XServer cluster and ran massively parallel jobs using the Sun Grid Engine (SGE) scheduler for the EST analysis pipeline.

Skills: bioinformatics, databases, statistics, pipelines, linux & cluster admin, web design


2003-2004: Teaching Assistant, Indiana University, 107 S. Indiana Ave, Bloomington, IN 47405, USA
. Tel: 812-855-4848
Work Description
Teach undergraduate and graduate students Informatics, hold labs, write, administer and mark exams for a class of 120 students.

Accomplishments
Received excellent teacher evaluations from the students. Motivated several students to change major to Informatics. Helped struggling students pass the course and maintain their grade average.

Skills: Teaching, bioinformatics, mentoring


08/2000-07/2002: Freelance Journalist (Business Week Magazine, other publications)
Work Description
High-Tech beat journalist covering Taiwanese and Chinese microchip, computer hardware, software, biotechnology and security hardware manufacturers.

Accomplishments

Wrote extensively on Taiwan's chip manufacturers, including developments in the CPU and memory sectors. Covered Taiwanese companies at the annual high-tech industry fair CeBit in Germany and technology trade fairs in Taiwan. Organized high-tech factory tours which raised awareness among Taiwan-based foreign journalists to Taiwan's emerging role as a high quality high-tech producer and resulted in dozens of stories in the international media.

Skills: Journalist, communications, languages (Mandarin, Japanese), biotechnology


08/1999-07/2000: High-Tech Beat Reporter, Taipei Times, 399 Ruigang Rd, Taipei, Taiwan


Work Description

Cover high-technology industries in Taiwan. Acting head of business section, covering daily economics and business-related news.


Accomplishments

Rallied morale in a disenchanted team, bolstered staff retention and improved coverage of economic and business news.

Skills: Journalism, business, economics, languages (Mandarin)


08/1996-07/1997: News Reporter, Reuters Japan, 5-3-1 Akasaka, Minato-ku, Tokyo, Japan

Work Description
Cover all major international stories relating to Japan, including economics, finance, visiting dignitaries, major international sports events and other general news.

Accomplishments
Broke the Pokemon story to the world; wrote the first foreign press story on the world's first electronic pet toy, which was picked up by all the major international press organizations and TV networks. Did an exposé on Japan's still-legal child porn industry. Conducted news interviews in Japanese for Reuters TV on whale hunting and oil trade talks. Sole foreign reporter covering Japanese Foreign Ministry during hostage crisis at japanese ambassador's residence in Peru. Covered trial of AUM Shinrikyou founder Shoko Asahara charged with murders in Tokyo subway poison gas attack. 

Skills: Journalism, investigative research, language (Japanese)


08/1995-07/1996: Coordinator for Intl. Relations, Shiojiri City Hall, Nagano-ken, Japan
Work Description
Led a team of four local government functionaries and a dozen active volunteers to prepare for the Nagano Winter Olympics. Also helped build relationships between the city council and foreigners living in the area around the city of Shiojiri. This was particularly important because the population of foreigners living in the local area was growing rapidly due to the presence of large factories, e.g., Seiko Epson. Promoted intercultural exchange and trained volunteers for the Nagano Winter Olympics. 

Accomplishments
Created and produced 'Shiojiri Global', Japan's first trilingual community magazine (English, Portuguese and Chinese). The magazine featured information for foreigners about local city council services, legal help, free language courses, cultural tips, etc. Also set up the city's first free Japanese language courses for foreigners. Promoted outreach to the large Brazilian community, helping them expand their cultural activities. Founded traditions that continue to this day in the city, including the annual Burns Night celebration (haggis, whisky and Scottish country dancing). Saved a cat hit by a car and became a local celebrity.

Skills: Leadership, project management, languages (Japanese), intercultural communication

    
</entry>
<entry [Sat 2012:12:22 03:10:27 EST] RESUME - ADDED PERSONAL INTERESTS, CLEANED UP TEXT FORMATTING>

RESUME

Stuart Young
stuartpyoung@gmail.com
+1-305-781-2286

IN BRIEF

Expert in bioinformatics pipelines/software engineering, cloud computing, data visualization and NextGen sequence analysis seeking interesting and challenging full time position (remote or localized) in dynamic organization.

SUMMARY

5 years post-doc experience working in multidisciplinary teams on NextGen sequencing (assembly, variation and expression), algorithm development (machine learning, alignment, annotation, etc.), data visualization, pipeline design, cloud computing, gene annotation, protein function and metagenomics.
9 years project management experience supporting the bioinformatics needs of life science researchers, solving complex problems, writing software and meeting deadlines.
9 years administering Linux systems, Bash/Perl/Python scripting, database administration (MySQL, PostgreSQL, Oracle), installing and maintaining packages, and running and using scheduling systems (PBS, LSF and SGE).
Diverse life experience and goal-oriented aptitude for multitasking and managing uncertainty.
Excellent communication skills, customer-oriented with proven ability to lead teams and motivate others.
Biology background and deep commitment to solving life science problems.

WORK EXPERIENCE

Research experience: Conceived, designed and built the Agua (Automated Genomics Utilities Agent) cloud workflow platform for NextGen sequencing bioinformatics and other scientific analysis in the Amazon Elastic Compute Cloud (EC2). Designed and built the University of Miami's first NextGen analysis pipelines and data management infrastructure. Conducted high-throughput NextGen sequencing analysis for the Hussman Institute for Human Genomics (HIHG), Center for the Cure for Paralysis, Department of Cardiology and other groups in the University of Miami. Also developed bioinformatics tools for experiment optimization (desired depth of coverage, expression, etc.) and analysis of complex data sets. Selected and evaluated the leading-edge alignment, visualization and other bioinformatics tools. Additional tasks included developing machine learning techniques for gene annotation and statistical analysis of next generation data. Current research interests encompass NextGen assembly, transcriptomics, data visualization, SNP analysis and systems biology.

Teaching experience: Trained life sciences researchers on the selection and use of bioinformatics tools and taught bioinformatics for one year to undergraduate and post-graduate students at the University of Miami. Also taught one year of Informatics to undergraduate and graduate students at Indiana University Bloomington. Also ran a journal club at the University of Miami (Next-generation Sequencing) and organized Bioinformatics tools training seminars (GeneGo, Nexus, Genomatix, etc.) for faculty and research staff.

EDUCATION 

1986-1989: Bsc Biological Sciences, University of Leicester, England
1991-1995: MA Arabic and French, University of Edinburgh, Scotland
1999-2003: MBA Technology Management, Open University, England
2002-2003: MS coursework, Applied Biosciences, Keck Graduate Institute, CA, USA
2003-2004: MS Bioinformatics, Indiana University, Bloomington, IN, USA
2005-2008: PhD Bioinformatics, North Carolina State University, NC, USA

EMPLOYMENT

1995-1996: Coordinator for Intl. Relations, Shiojiri City Hall, Nagano-ken, Japan
1996-1997: News Reporter, Reuters Japan, Tokyo, Japan
1999-2000: High-Tech Beat Reporter, Taipei Times, Taipei, Taiwan
2000-2002: Freelance Journalist, Business Week Magazine, other publications
2003-2004: Teaching Assistant, Indiana University, Bloomington, IN, USA
2005-2008: Research Assistant, North Carolina State University, Raleigh, NC, USA
2008-2011: Post Doctoral Research Associate, University of Miami, FL, USA
2011-Now:  Bioinformatics Consultant, Cloud Dynamics Consulting, FL, USA

OTHER EXPERIENCE/PROFESSIONAL MEMBERSHIPS

1998-1989	Cultural Secretary, International Students Society, Univ. of Leicester
1987-1988	President, Scientists Society, Univ. of Leicester
2003-2004	Indiana University Teaching Assistantship

Honors
1998-1999	Johns Hopkins Academic Scholarship (Hopkins-Nanjing Center)
2004-2008	Ronald McNair Scholar
2005-2008	UNC Genomics Scholar  

PUBLICATIONS

The Agua Cloud Workflow Tool and Genomic Viewer. Young S. & Gilbert J., in publication.
IMAT:Interpro motif annotation motifs for protein functional prediction. Young, S., in publication.
Incremental mismatch probability filter improves BLAST annotation accuracy. Young S., in publication.
Improved genomic annotation using machine learning. Young S.,in publication.
Next generation sequence assembly comparison and integration. Young S., Khuri S., Tsinoremas N., Zuchner S., Hedges D, poster presented at the Nature Miami Winter Symposium, Miami Beach Jan 25-28, 2009.
Agua: A NextGen workflow tool and genome viewer. Young S., Tsinoremas N., poster presented at the Statistical Challenges in Genome Resequencing conference, Newton Institute, Cambridge, UK July 6-12, 2010.
Agua: An Amazon-Cloud NextGen Bioinformatics Platform. Young S., Tsinoremas N., Gilbert J., poster presented at the Advances in Genome Biology and Technology conference, Marco Island Feb 2-6, 2011.

SKILLS

Programming languages – Perl, Python, Java, C/C++, PHP, Javascript (dojo/JQuery, d3.js), Bash, Ruby
Operating systems – Linux (Ubuntu, CentOS, Gentoo, MacOSX) and Windows (7, Vista, XP, 2000, 98) 
Languages – Chinese, Japanese, French, Dutch, Arabic, Spanish and Portuguese

PERSONAL INTERESTS

Life science technologies and trends, Web 2.0, data visualization, Cloud computing, languages (computer and otherwise), healthy living and fitness. 

    
</entry>

