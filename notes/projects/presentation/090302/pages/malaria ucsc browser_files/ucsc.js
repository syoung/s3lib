//
// Copyright (c) 2006 by Conor O'Mahony.
// For enquiries, please email GubuSoft@GubuSoft.com.
// Please keep all copyright notices below.
// Original author of TreeView script is Marcelino Martins.
//
// This document includes the TreeView script.
// The TreeView script can be found at http://www.TreeView.net.
// The script is Copyright (c) 2006 by Conor O'Mahony.
//
// You can find general instructions for this file at www.treeview.net.
//

USETEXTLINKS = 1
STARTALLOPEN = 0
USEFRAMES = 0
USEICONS = 0
WRAPTEXT = 1
PRESERVESTATE = 1

//
// The following code constructs the tree.  This code produces a tree that looks like:
// 
// Tree Options
//  - Expand for example with pics and flags
//    - United States
//      - Boston
//      - Tiny pic of New York City
//      - Washington
//    - Europe
//      - London
//      - Lisbon
//  - Types of node
//    - Expandable with link
//      - London
//    - Expandable without link
//      - NYC
//    - Opens in new window
//

foldersTree = gFld("", "demoFrameless.html")
  foldersTree.treeID = "Frameless"
  
  aux1 = insFld(foldersTree, gFld("<b>All Academics</b>", "category.asp?Cat=Group%20Academics"))
    aux2 = insFld(aux1, gFld("Arts", "category.asp?Cat=pr_arts"))
	 insDoc(aux2, gLnk("S", "Art", "category.asp?Cat=pr_art1"))
	 insDoc(aux2, gLnk("S", "Film and Digital Media", "category.asp?Cat=pr_film"))
	 insDoc(aux2, gLnk("S", "History of Art and Visual Culture", "category.asp?Cat=pr_arthistory"))
     insDoc(aux2, gLnk("S", "Music", "category.asp?Cat=pr_music"))
	 insDoc(aux2, gLnk("S", "Theater Arts", "category.asp?Cat=pr_theater"))
	aux2 = insFld(aux1, gFld("Engineering", "category.asp?Cat=pr_engineering"))
      insDoc(aux2, gLnk("S", "Applied Mathematics and Statistics", "category.asp?Cat=pr_appliedmaths"))
      insDoc(aux2, gLnk("S", "Biomolecular Engineering", "category.asp?Cat=pr_biomolecular"))
	  insDoc(aux2, gLnk("S", "Computer Engineering", "category.asp?Cat=pr_computerengineering"))
	  insDoc(aux2, gLnk("S", "Computer Science", "category.asp?Cat=pr_computerscience"))
	  insDoc(aux2, gLnk("S", "Electrical Engineering", "category.asp?Cat=pr_electricalengineering"))
	  insDoc(aux2, gLnk("S", "Technology and Information Management", "category.asp?Cat=pr_technologyim"))
    aux2 = insFld(aux1, gFld("Humanities", "category.asp?Cat=pr_humanities"))
      insDoc(aux2, gLnk("S", "American Studies", "category.asp?Cat=pr_americanstudies"))
      insDoc(aux2, gLnk("S", "Feminist Studies", "category.asp?Cat=pr_feministstudies"))
	  insDoc(aux2, gLnk("S", "History", "category.asp?Cat=pr_history"))
	  insDoc(aux2, gLnk("S", "History of Consciousness", "category.asp?Cat=pr_historyconsciousness"))
	  insDoc(aux2, gLnk("S", "Language Program", "category.asp?Cat=pr_languageprogram"))
	  insDoc(aux2, gLnk("S", "Linguistics", "category.asp?Cat=pr_linguistics"))
      insDoc(aux2, gLnk("S", "Literature", "category.asp?Cat=pr_literature"))
	  insDoc(aux2, gLnk("S", "Philosophy", "category.asp?Cat=pr_philosophy"))
	  insDoc(aux2, gLnk("S", "Writing Program", "category.asp?Cat=pr_writingprogram"))
	aux2 = insFld(aux1, gFld("Physical & Biological Sciences", "category.asp?Cat=pr_physbiosciences"))
      insDoc(aux2, gLnk("S", "Astronomy and Astrophysics", "category.asp?Cat=pr_astronomyastrophysics"))
      insDoc(aux2, gLnk("S", "Chemistry and Biochemistry", "category.asp?Cat=pr_chemistrybiochemistry"))
	  insDoc(aux2, gLnk("S", "Earth Sciences", "category.asp?Cat=pr_earthsciences"))
	  insDoc(aux2, gLnk("S", "Ecology and Evolutionary Biology", "category.asp?Cat=pr_ecology"))
	  insDoc(aux2, gLnk("S", "Environmental Toxicology", "category.asp?Cat=pr_toxiocology"))
	  insDoc(aux2, gLnk("S", "Mathematics", "category.asp?Cat=pr_mathematics"))
      insDoc(aux2, gLnk("S", "Molecular, Cell, and Developmental Biology", "category.asp?Cat=pr_molecularcell"))
	  insDoc(aux2, gLnk("S", "Ocean Sciences", "category.asp?Cat=pr_oceansciences"))
	  insDoc(aux2, gLnk("S", "Physics", "category.asp?Cat=pr_physics"))
  	  insDoc(aux2, gLnk("S", "Science Communication Program", "category.asp?Cat=pr_sciencecommunication"))
  aux2 = insFld(aux1, gFld("Social Sciences", "category.asp?Cat=pr_socialsciences"))
      insDoc(aux2, gLnk("S", "Anthropology", "category.asp?Cat=pr_anthropology"))
      insDoc(aux2, gLnk("S", "Community Studies", "category.asp?Cat=pr_communitystudies"))
	  insDoc(aux2, gLnk("S", "Economics", "category.asp?Cat=pr_economics"))
	  insDoc(aux2, gLnk("S", "Education", "category.asp?Cat=pr_education"))
	  insDoc(aux2, gLnk("S", "Environmental Studies", "category.asp?Cat=pr_environmentalstudies"))
	  insDoc(aux2, gLnk("S", "Latin American and Latino Studies", "category.asp?Cat=pr_latinamerican"))
      insDoc(aux2, gLnk("S", "Politics", "category.asp?Cat=pr_politics"))
	  insDoc(aux2, gLnk("S", "Psychology", "category.asp?Cat=pr_psychology"))
	  insDoc(aux2, gLnk("S", "Sociology", "category.asp?Cat=pr_sociology"))
  aux1 = insFld(foldersTree, gFld("<b>All Audience Areas</b>", "category.asp?Cat=Audience"))
    aux2 = insFld(aux1, gFld("Prospective Students", "category.asp?Cat=au_prospectivestudents"))
	aux2 = insFld(aux1, gFld("Undergraduate Students", "category.asp?Cat=au_undergraduatestudents"))
	aux2 = insFld(aux1, gFld("Graduate Students", "category.asp?Cat=au_graduatestudents"))
	aux2 = insFld(aux1, gFld("Parents of Students", "category.asp?Cat=au_parentsstudents"))
	aux2 = insFld(aux1, gFld("Alumni", "category.asp?Cat=au_alumni")) 
	aux2 = insFld(aux1, gFld("Donors", "category.asp?Cat=au_donors"))
	aux2 = insFld(aux1, gFld("Faculty", "category.asp?Cat=au_faculty"))
    aux2 = insFld(aux1, gFld("Staff", "category.asp?Cat=au_staff"))
aux1 = insFld(foldersTree, gFld("<b>All Activities</b>", "category.asp?Cat=Activity Type"))
    aux2 = insFld(aux1, gFld("Administration", "category.asp?Cat=pr_administration"))
	aux2 = insFld(aux1, gFld("Admissions", "category.asp?Cat=pr_admissions"))
	aux2 = insFld(aux1, gFld("Awards & Honors", "category.asp?Cat=pr_awardshonors"))
	aux2 = insFld(aux1, gFld("Events", "category.asp?Cat=pr_events"))
	aux2 = insFld(aux1, gFld("Gifts & Grants", "category.asp?Cat=pr_giftsgrants"))
	aux2 = insFld(aux1, gFld("Library", "category.asp?Cat=pr_library"))
	aux2 = insFld(aux1, gFld("Partnerships", "category.asp?Cat=pr_partnerships")) 
	aux2 = insFld(aux1, gFld("Research", "category.asp?Cat=pr_research"))
	aux2 = insFld(aux1, gFld("Sports", "category.asp?Cat=pr_sports"))
    aux2 = insFld(aux1, gFld("Alumni News", "category.asp?Cat=pr_alumninews"))
	aux2 = insFld(aux1, gFld("Donor News", "category.asp?Cat=at_donornews")) 
	aux2 = insFld(aux1, gFld("Student News", "category.asp?Cat=pr_studentnews"))
	aux2 = insFld(aux1, gFld("Other Campus News", "category.asp?Cat=pr_othernews"))
   


