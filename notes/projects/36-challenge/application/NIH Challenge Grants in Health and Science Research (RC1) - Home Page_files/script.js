function changeheight()
{
if (document.getElementById('toc'))
{
var height = document.body.clientHeight;
height = height - 208;
document.getElementById('toc').style.height = height+ 'px';
}
else
{
var height = document.body.clientHeight;
height = height - 117;
document.getElementById('contentarea').style.height = height+ 'px';
}
}
function search()
{

var selval;
selval="";
  
  for (i=0;i<document.forms[0].checkbox.length;i++)
	{
	if (document.forms[0].checkbox[i].checked)
	{
		if (selval == "")
		{
			selval=document.forms[0].checkbox[i].value;
		}
		else
		{
			selval=selval + "," + document.forms[0].checkbox[i].value;
		}
	}
}

 
   for (i=0;i<document.forms[0].radiobutton.length;i++)
	{
	if (document.forms[0].radiobutton[i].checked)
	{
		user_input = document.forms[0].radiobutton[i].value;
	}
	}	
	selval1=document.forms[0].select2.value;
	year=document.forms[0].select1.value;
	
	if(selval=="All" && selval1=="ninds" && user_input=="last30days")
	{
	location.href="ninds_sfo.htm";
	}
		if(selval=="RFA" && selval1=="nidcr" && user_input=="last30days")
	{
	location.href="nidcr_sfo.htm";
	}
		if(selval=="Notices" && selval1=="all" && user_input=="last6months")
	{
	location.href="all_notices_sfo.htm";
	}
		if(selval=="All" && selval1=="nci" && user_input=="inactive")
	{
	location.href="nci_sfo.htm";
	}
		if(selval=="All" && selval1=="all" && user_input=="All")
	{
	location.href="search_all_sfo.htm";
	}
	   if(selval=="All" && selval1=="all" && user_input=="inactive" && year=="2003")
	{
	location.href="search_all_sfo_2003.htm";
	}
}
function chkdd()
{
	ddval=document.forms.f2.select.value;
	if (ddval=="SF424(R&R)" || ddval=="PHS398" || ddval=="PHS2590")
	{ 
    location.href="formdeadlines.htm";
	}
	if (ddval=="PHS416-1" || ddval=="PHS416-9")
	{ 
	 location.href="form_fellowship.htm";
	 }
	if (ddval=="PHS2006-2(SBIR)" || ddval=="PHS2006-2(STTR)" || ddval=="Topics(pdf)" || ddval=="Topics(MSWord)")
	{ 
    location.href="form_sbir_grants.htm";
	}
	if (ddval=="PHS2006-1(PDF)" || ddval=="PHS2006-1(MS Word)")
	{ 
    location.href="form_sbir_contracts.htm";
	}
	if (ddval=="PHS2271(PDF)" || ddval=="PHS2271(MSWord)" || ddval=="PHS416-5(PDF)" || ddval=="PHS416-5(MSWord)" || ddval=="PHS416-7(PDF)" || ddval=="PHS416-7(MSWord)" || ddval=="PHS6031(PDF)" || ddval=="PHS6031(MSWord)" || ddval=="PHS6031-1(PDF)" || ddval=="PHS6031-1(MSWord)")
	{ 
    location.href="training_forms.htm";
	}
	if (ddval=="PHS3734(PDF)" || ddval=="PHS3734(MSWord)")
	{ 
    location.href="forms_acg.htm";
	}
	if (ddval=="HHS568(PDF)" || ddval=="HHS568(MSWord)" || ddval=="SF-269(PDF)" || ddval=="SF-269A(PDF)")
	{ 
    location.href="form_grant_closeout.htm";
	}
	if (ddval=="OtherForms")
	{ 
    location.href="other_federal_forms.htm";
	}
}