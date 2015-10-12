compendia


<entry [Sat 2013:09:28 04:07:29 EST] >

Hi Peter,

I'm going to try to give justice to your questions but if there is anything that is not clear or if you have any further questions please don't hesitate to let me know. 

* What inspired you to pursue a degree in bioinformatics?

When I did my undergraduate Biological Sciences in the UK ('86-'89) I realized that we didn't have the data or the techniques to answer the really fundamental genomic questions. I knew that it would come but I didn't know when. I also knew that we were going to have to use computers to do it. I remember a debate with one of my professors ('Sir' Alec Jeffries before the knighthood) about 'junk DNA' and how frustrating it was not being able to find out. So, after I graduated, I chose a career in journalism to expand my horizons and prepare for a future career when the genome data would be available. When I saw the Human Genome project coming to fruition I knew the time was right so I came to the US to do my MS and PhD in Bioinformatics.

* Do you have experience developing NGS variant calling algorithms?

I haven't worked on what I would call a 'first-pass' variant caller, i.e., one that produces variant calls solely from primary genome alignment data but I have developed a methodology for verifying variants called by different tools. My key premise for taking this approach is that researchers and clinical labs often want different things - specificity versus sensitivity. I wrote a pipeline to map NA18507 chromesome 22 and generate an ROC curve for the different callers verified by overlap with dbSNP. This allows the user to choose the variant caller based on the kind of error they are willing to tolerate and the depth of sequence they have available.


* What were some of the key challenges with aqua, and how did you overcome them?  Which problems were you unable to overcome, and why?

Agua is intended for bioinformaticians, researchers who can't use bioinformatics tools and labs that don't have supercomputing clusters. In the beginning, one thorny problem I wanted to fix was how to allow highly flexible access to the data. In the end, I abstracted away the data control into a group-based system that avoided the lack of scalability of the common solution, i.e., trying to overload ACLs or Linux user groups. Because Agua is web enabled, I had to also overcome issues of web latency, server timeouts during actions and a lack of 'server push'. So I converted Agua to run as a daemon to minimize the time lag caused by module loading and I implemented a message queue to provide server push and instant updates on the client of events on the server. I also had integration problems with StarCluster and JBrowse, Agua's main dependencies which provide key functionality (ad-hoc cloud clusters and genomic browsing). Using disciplined software development techniques helped me manage and minimize the risk associated with supporting these dependencies.


* Tell me more about your improving genomic annotation using machine learning? What data are you annotating, and what annotations are you adding?  What machine learning techniques are you using, and why?

I used decision trees to define groups of protein motif signatures in the whole SwissProt protein collection. The signature groups corresponded highly with shared function, as defined by Swissprot annotation. My algorithm can be uuseful as a second filter after sequence homology analysis. It also helps our understanding of the biological processes because decision trees are intuitive and easy to interpret. This approach can also be applied in meta-genomics where only small DNA fragments are available.


* Why have you changed jobs so frequently this year?

I would prefer to develop my career in a stable environment but sometimes you can't predict what will happen in your work situation. I joined Illumina in February but quickly realized it wasn't a good fit with my direct supervisor. I did my best and achieved my goals but in the end I felt it was best to move on. I can provide you with the contact information of several people who I worked with directly and know the quality of my work. I have been with Annai Systems for about two months. Before that, I worked as a consultant for over a year after doing a three year postdoc at the University of Miami.


* Are you willing to relocated to Ann Arbor, Michigan?

Yes.

* Are you available to start immediately?

Yes.



Best regards,

Peter



On Fri, Sep 27, 2013 at 4:36 PM, Stuart Young <stuartpyoung@gmail.com> wrote:
Hi Peter,

Thanks again for sparing the time - I really enjoyed our conversation. Those are great questions - I will reply to you late tonight as I'm currently on the road.

Best regards,

Stuart



Hi Peter,

Thanks again for sparing the time - I really enjoyed our conversation. Those are great questions - I will reply to you late tonight as I'm currently on the road.

Best regards,

Stuart



"Wyngaard, Peter" <Peter.Wyngaard@lifetech.com> wrote:
Dear Stuart,

Thanks again for taking the time to talk yesterday,  I enjoyed our conversation.  I have a few followup questions, please find them below.  I've followed up with Samantha, and asked her to begin the process of scheduling a visit to Ann Arbor in the next two weeks.

* What inspired you to pursue a degree in bioinformatics?

* Do you have experience developing NGS variant calling algorithms?

* What were some of the key challenges with aqua, and how did you overcome them?  Which problems were you unable to overcome, and why?

* Tell me more about your improving genomic annotation using machine learning? What data are you annotating, and what annotations are you adding?  What machine learning techniques are you using, and why?

* Why have you changed jobs so frequently this year?

* Are you willing to relocated to Ann Arbor, Michigan?

* Are you available to start immediately?


Best regards,

Peter


Dear Stuart,

Thanks again for taking the time to talk yesterday,  I enjoyed our conversation.  I have a few followup questions, please find them below.  I've followed up with Samantha, and asked her to begin the process of scheduling a visit to Ann Arbor in the next two weeks.

* What inspired you to pursue a degree in bioinformatics?

* Do you have experience developing NGS variant calling algorithms?

* What were some of the key challenges with aqua, and how did you overcome them?  Which problems were you unable to overcome, and why?

* Tell me more about your improving genomic annotation using machine learning? What data are you annotating, and what annotations are you adding?  What machine learning techniques are you using, and why?

* Why have you changed jobs so frequently this year?

* Are you willing to relocated to Ann Arbor, Michigan?

* Are you available to start immediately?


Best regards,

Peter




</entry>


