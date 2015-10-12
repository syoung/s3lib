  if (TransMenu.isSupported()) {
  TransMenu.updateImgPath('kash_transmenu/' );
    var ms1 = new TransMenuSet(TransMenu.direction.down, 0, 0, TransMenu.reference.bottomLeft);
  TransMenu.subpad_x = 0;
  TransMenu.subpad_y = 0;
  
  document.getElementById("menu1").onmouseover = function() {
  ms1.hideCurrent();
  }
                  
    
    
       
	        var tmenu_products = ms1.addMenu(document.getElementById("menu_products"));
           	tmenu_products.addItem("Novoalign", "../main/page.php?s=novoalign", 0, 0);
    
    
    
             
      
		tmenu_products.addItem("NovoalignMPI", "../main/page.php?s=novoalignmpi", 0, 0);
    
    
    
             
      
		tmenu_products.addItem("Novobarcode", "../main/page.php?s=novobarcode", 0, 0);
    
    
    
             
      
		tmenu_products.addItem("NovoalignCS", "../main/page.php?s=novoaligncs", 0, 0);
    
    
    
             
      
	                 
    
    
       
	                 
    
    
       
	        var tmenu_support = ms1.addMenu(document.getElementById("menu_support"));
           	tmenu_support.addItem("Support Forums", "../wiki/tiki-forums.php", 0, 0);
    
    
    
             
      
	        var tmenu_documentation = ms1.addMenu(document.getElementById("menu_documentation"));
           	tmenu_documentation.addItem("Novoalign", "../main/page.php?s=doc_novoalign", 0, 0);
    
    
    
         var tmenu_documentation_0 = tmenu_documentation.addMenu(tmenu_documentation.items[0]);

         		tmenu_documentation_0.addItem("Novoalign User Guide", "../wiki/tiki-index.php", 0, 0);
    					tmenu_documentation_0.addItem("Novoalign Reference Manual", "../main/page.php?s=doc_novoalign_refmanual", 0, 0);
    					tmenu_documentation_0.addItem("Novoalign FAQ", "../wiki/tiki-view_faq.php?faqId=1", 0, 0);
    					tmenu_documentation_0.addItem("Novoalign Release Notices", "../wiki/tiki-view_forum.php?forumId=5", 0, 0);
    			            
            
            
		    
      
		tmenu_documentation.addItem("Novoalign MPI", "../main/page.php?s=doc_novoalignmpi", 0, 0);
    
    
    
         var tmenu_documentation_1 = tmenu_documentation.addMenu(tmenu_documentation.items[1]);

         		tmenu_documentation_1.addItem("Novoalign MPI User Guide", "../main/page.php?s=novoalignmpi_userguide", 0, 0);
    			            
            
            
		    
      
		tmenu_documentation.addItem("Novobarcode", "../main/page.php?s=doc_novobarcode", 0, 0);
    
    
    
         var tmenu_documentation_2 = tmenu_documentation.addMenu(tmenu_documentation.items[2]);

         		tmenu_documentation_2.addItem("Novobarcode User Guide", "../main/page.php?s=novobarcode_userguide", 0, 0);
    			            
            
            
		    
      
	        var tmenu_aboutus = ms1.addMenu(document.getElementById("menu_aboutus"));
           	tmenu_aboutus.addItem("Company Information", "../main/page.php?s=company_info", 0, 0);
    
    
    
             
      
		tmenu_aboutus.addItem("Collaborators and Licensed Users of Novocraft Products:", "../main/page.php?s=collaborators", 0, 0);
    
    
    
             
      
		tmenu_aboutus.addItem("Citations", "../wiki/tiki-view_articles.php", 0, 0);
    
    
    
             
      
		tmenu_aboutus.addItem("testing 123", "../main/page.php?s=test", 0, 0);
    
    
    
             
      
	                 
    
    
       
	      
  TransMenu.renderAll();
  }
  init1=function(){
  TransMenu.initialize();
  }
  if (window.attachEvent) {
  window.attachEvent("onload", init1);
  } else {
  TransMenu.initialize();			
  }