eclipse



<entry [Thu 2013:04:18 10:12:19 EST] INSTALLED ECLIPSE ON syoung-dev>

1. DOWNLOAD Eclipse IDE for Java EE Developers, 227 MB
(NB: ECLIPSE CLASSIC 4.2.2 DOES NOT HAVE WEB TOOLS)
http://www.eclipse.org/downloads/

cd /home/syoung/software/eclipse
wget http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/junosr2
tar xvfz eclipse-jee-juno-SR2-linux-gtk-x86_64.tar.gz



2. INSTALL PAPYRUS

Help->Install Modeling Components
If you only have downloaded the "plain" Eclipse Classic go to


and install "Papyrus" that should get you started with UML.

share|improve this answer
answered Jan 20 '12 at 10:46

ShiDoiSi
3,8591128
Thanks ShiDoiSi, I install Papyrus and can draw kinds of diagrams. but I can't generate code. Could you tell me how can I generate code? – omid nazifi Jan 21 '12 at 8:28


@omidnazifi After you have the .uml-file, run the "EMF Generator Model" wizard and import the UML model. With that, you will be able to generate Java classes from your model. – ShiDoiSi Jan 21 '12 at 15:46

Insert Eclipse Indigo update site in

Help --> Install new Software --> Modelling. There you will see one category named as modelling.Expand it & choose UML & then follow the procedure.

Download mdt-uml2tools-Update-incubation-I201103290512.zip from UML2Tools downloads page (0.10.0 Integration Builds section) and instal with Eclipse Indigo Sr2 - Modeling Tools package. It installs without any problem. Refer Message 687758 at Eclipse Forum for details.


2. DOWNLOAD PLUGINS

ECLIPSE FOR MOBILE DEVELOPERS
ECLIPSE MODELLING TOOLS (uml2)
EUCALYPTUS PRIVATE AND HYBRID CLOUD SOFTWARE (JAVA)







</entry>