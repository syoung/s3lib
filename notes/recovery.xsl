recovery


<entry [Sat 2012:10:27 05:47:50 EST] TESTDISK ATTEMPT USING PARTED MAGIC>

GET PARTITIONS ON DISK

fdisk -l

Disk /dev/sda: 320.1 GB, 320072933376 bytes
255 heads, 63 sectors/track, 38913 cylinders, total 625142448 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x000765db

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *   625137345   625153409        8032+  83  Linux

Disk /dev/sdb: 16.0 GB, 16008609792 bytes
255 heads, 63 sectors/track, 1946 cylinders, total 31266816 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1              32    31266815    15633392    c  W95 FAT32 (LBA)

CHECK IF SUPERBLOCK IS OK

fsck.ext4 -v /dev/sda
e2fsck 1.42.6 (21-Sep-2012)
ext2fs_open2: Bad magic number in super-block
/sbin/e2fsck: Superblock invalid, trying backup blocks...
/sbin/e2fsck: Bad magic number in super-block while trying to open /dev/sda

The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>


GET SUPERBLOCKS ON /dev/sda


root@PartedMagic:~# mke2fs -n /dev/sda
mke2fs 1.42.6 (21-Sep-2012)
/dev/sda is entire device, not just one partition!
Proceed anyway? (y,n) y
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
19537920 inodes, 78142806 blocks
3907140 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=0
2385 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
	4096000, 7962624, 11239424, 20480000, 23887872, 71663616


TRIED e2fsck -b <BLOCK NUMBER> WITH ALL OF THE ABOVE BUT KEPT GETTING THIS ERROR

e2fsck -b 71663616 /dev/sda
e2fsck 1.42.6 (21-Sep-2012)
e2fsck: Invalid argument while trying to open /dev/sda

The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>

TRIED dumpe2fs TO NO AVAIL:

root@PartedMagic:~# dumpe2fs /dev/sda
dumpe2fs 1.42.6 (21-Sep-2012)
dumpe2fs: Bad magic number in super-block while trying to open /dev/sda
Couldn't find valid filesystem superblock.
root@PartedMagic:~# dumpe2fs /dev/sda1
dumpe2fs 1.42.6 (21-Sep-2012)
dumpe2fs: Bad magic number in super-block while trying to open /dev/sda1
Couldn't find valid filesystem superblock.


LOOKED BACK AT fdisk -l OUTPUT AND SAW THAT IT HAD /dev/sda1 IN IT, SO RETRIED mke2fs:

mke2fs -n /dev/sda1
mke2fs 1.42.6 (21-Sep-2012)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
Stride=0 blocks, Stripe width=0 blocks
320 inodes, 2548 blocks
127 blocks (4.98%) reserved for the super user
First data block=1
Maximum filesystem blocks=2621440
1 block group
8192 blocks per group, 8192 fragments per group
320 inodes per group

TRIED TESTDISK:

TestDisk 6.14-WIP, Data Recovery Utility, May 2012
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63
Current partition structure:
     Partition                  Start        End    Size in sectors

No ext2, JFS, Reiser, cramfs or XFS marker
 1 * Linux                38913   0  1 38913 254 63      16065
 1 * Linux                38913   0  1 38913 254 63      16065


Quick Search

TestDisk 6.14-WIP, Data Recovery Utility, May 2012
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63
     Partition               Start        End    Size in sectors
>* Linux                    0  32 33 38442 123 17  617576448



ENTER

TestDisk 6.14-WIP, Data Recovery Utility, May 2012
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63

     Partition                  Start        End    Size in sectors

 1 * Linux                    0  32 33 38442 123 17  617576448


DEEPER SEARCH

STOPPED SEARCH, REPEATED AND GOT TO SCREEN BEFORE QUICK SEARCH WITH OPTION TO 'add partition'

ADD PARTITION


TestDisk 6.14-WIP, Data Recovery Utility, May 2012
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63

  No partition         38442 123 18 38912 254 63    7558849

Enter the starting cylinder (0-38912) :38442



SET STARTING CYLINDER AT 1:


TestDisk 6.14-WIP, Data Recovery Utility, May 2012
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63
     Partition               Start        End    Size in sectors
>* Linux                    0  32 33 38442 123 17  617576448
 D Linux                    1 123 18 38912 254 63  625113514



SET STARTING CYLINDER AT 4805 (ASSUMES 40GB FOR OS IN 320GB DISK)


RAN DEEPER SEARCH, WHICH FOUND THESE PARTITIONS:

lILNUX			0	32	33	38442	123	17	617576448
Linux			1952	0	1	9640	113	33	123514872
Linux			22848	0	1	53601	232	7	494061568



AT END OF DEEPER SEARCH GET ONLY THIS:

TestDisk 6.14-WIP, Data Recovery Utility, May 2012
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63

The harddisk (320 GB / 298 GiB) seems too small! (< 440 GB / 410 GiB)
Check the harddisk size: HD jumpers settings, BIOS detection...

The following partition can't be recovered:
     Partition               Start        End    Size in sectors
>  Linux                22848   0  1 53601 232  7  494061568



RETURN

TestDisk 6.14-WIP, Data Recovery Utility, May 2012
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63
     Partition               Start        End    Size in sectors
>D Linux                    0  32 33 38442 123 17  617576448
 D Linux                 1952   0  1  9640 254 63  123523785


WHERE THE FIRST LINE IS THE INSTALLATION OF 12.10 AND THE SECOND LINE HAS NO FILES ON SELECTING 'p'


NO LUCK



</entry>
<entry [Sat 2012:10:27 05:15:33 EST] DD PARTITION RECOVERY>


http://www.forensicswiki.org/wiki/Ddrescue#Partition_recovery

Partition recovery

Kernel 2.6.3+ & ddrescue 1.4+
'ddrescue --direct' will open the input with the O_DIRECT option for uncached reads. 'raw devices' are not needed on newer kernels. For older kernels see below.
First you copy as much data as possible, without retrying or splitting sectors:
ddrescue --no-split /dev/hda1 imagefile logfile
Now let it retry previous errors 3 times, using uncached reads:
ddrescue --direct --max-retries=3 /dev/hda1 imagefile logfile
If that fails you can try again but retrimmed, so it tries to reread full sectors:
ddrescue --direct --retrim --max-retries=3 /dev/hda1 imagefile logfile
You can now use ddrescue (or normal dd) to copy the imagefile to a new partition on a new disk. Use the appropriate filesystem checkers (fsck, CHKDSK) to try to fix errors caused by the bad blocks. Be sure to keep the imagefile around. Just in case the filesystem is severely broken, and datacarving tools like testdisk need to to be used on the original image.


    
</entry>
<entry [Sat 2012:10:27 04:09:34 EST] TESTDISK DEEPER SEARCH>

http://www.dedoimedo.com/computers/linux-data-recovery.html 


AFTER DEEPER SEARCH, DO p TO SEE FILES

IF NO FILES,

    Press q for Quit to go back to the previous display.




</entry>
<entry [Sat 2012:10:27 03:19:36 EST] TESTDISK IN FRENCH>

http://forum.pcastuces.com/imprimer.asp?s=102819&f=1


Imprimer la page | Fermer la fenêtre
Utilisation de TestDisk en détails
Source : Forum PC Astuces
Adresse du sujet : http://forum.pcastuces.com/sujet.asp?f=1&s=102819
Imprimé le : 27/10/2012
Sujet : 
Auteur : romsk
Sujet : Utilisation de TestDisk en détails
Envoyé le : 16/07/2006 01:26
Message :
Testdisk est un logiciel précieux que chacun devrait avoir en bibliothèque au cas où… un grand bravo au passage à son développeur Christophe Grenier à qui vous pouvez adresser vos remerciements (et contributions) si son logiciel (qu'il met gratuitement à la disposition de tous) vous a rendu service... Pour l’avoir personnellement utilisé quelques fois il me semble qu'un pas à pas détaillé manque un peu, certaines manips n'étant pas vraiment intuitives. Aussi, pour compléter mes sujets sur les partitions disparues, le MBR et les secteurs de boot, il m’a semblé intéressant de détailler l’utilisation de ce logiciel qui s’avère parfaitement adapté à ces manips et de vous expliquer les différentes fenêtres et procédures à effectuer. 

téléchargement de la dernière version 6.7 pour Windows NT/XP/2000/2003 --&gt; http://www.cgsecurity.org/testdisk-6.7-WIP.win.zip
Une version "Ms-Dos" (à mettre sur disquette bootable) est également disponible pour les cas où le démarrage de l’ordi est impossible --&gt; http://www.cgsecurity.org/testdisk-6.7-WIP.dos.zip 
TestDisk (mais pas forcément la dernière version) est également inclus dans d’autres utilitaires tels Slax-LFI (voir récupération de données sous linux dans ma signature) et Ultimate Boot CD eux aussi très précieux...
Informations complémentaires --&gt; http://www.cgsecurity.org/

1ère notion à retenir = prudence... Testdisk manipule en effet les partitions, secteurs de boot, MBR, géométrie du disque dur (configuration CHS), et par là même toute erreur peut compliquer voire rendre impossible toute récupération de données ultérieures 

2ème notion qui en découle = strictement aucun risque tant qu’on ne fait qu’explorer les partitions et le DD. Le danger potentiel vient de la fonction [ Write ] qu’il ne faut utiliser qu’en connaissance de cause (être sûr de ses manips) 

3ème notion = logiciel facile d’utilisation : les seules touches à utiliser sont les flèches haut bas droite et gauche, la touche entrée ainsi que certaines touches du clavier (A, P, T, D,...) en fonction des options qui apparaissent à l’écran

4ème point = pour mieux comprendre les explications et explorer vos propres DD, téléchargez testdisk et ouvrez votre propre fenêtre de testdisk . Tout au long du topic les fenêtres de testdisk seront représentées en rouge.


A) Ouverture de TestDisk : explorer vos DD...

après avoir téléchargé le fichier .zip, il faut le dézipper dans un répertoire (que vous nommerez testdisk) dans lequel vous trouverez testdisk mais également photorec qui est un logiciel de récupération de fichier.
pour lancer testdisk il suffit d'aller dans le sous-répertoire win et de de double-cliquer sur testdisk_win.exe présent dans ce répertoire.
1) au démarrage TestDisk explore en 2 ou 3 secondes les données du BIOS et/ou de l'OS puis une 1ère fenêtre s'affiche vous proposant de créer un "logfile" qui permettra de résumer les données de récupération si vous souhaitez ultèrieurement demander de l'aide à C. Grenier (il suffira de lui envoyer ce logfile) : donc quand vous êtes sur "create" faites entrée (ça crèe automatiquement le logfile dans le répertoire win de testdisk) et vous passez à la fenêtre suivante où va s'afficher une liste des disques durs retrouvés sur votre ordi ainsi que des unités externes et des clés USB éventuellement branchées (il faut brancher DD externe et/ou clé USB avant de démarrer testdisk) :

Select a media (use Arrow keys, then press ENTER):
Disk /dev/hdc - 708 MB / 675 MiB
Disk /dev/sda - 120 GB / 111 GiB
Disk /dev/sdb - 120 GB / 111 GiB

[Proceed ] [ Quit ]

Note: Disk capacity must be correctly detected for a successful recovery.
If a disk listed above has incorrect size, check HD jumper settings, BIOS
detection, and install the latest OS patches and disk drivers.

les disques apparaissent sous forme Linux : les disques durs IDE sont /dev/hda (IDE 1 maître), /dev/hdb (IDE 1 esclave), /dev/hdc (IDE 2 maître), ou /dev/hdd (IDE 2 esclave). Les disques durs SATA commencent habituellement à /dev/hde ou /dev/sda. Les périphériques SCSI et USB commencent toujours à /dev/sda
Ici il y a 2 SATA (et/ou SCSI ou périphérique USB) et un DD IDE de 708 MB configuré en maître sur le port IDE secondaire.
le message en bas d’écran explique que la taille donnée par testdisk pour les DD doit parfaitement correspondre à la taille réelle des DD car dans le cas contraire la récupération ne pourra pas marcher. 
Si cette taille diffère (par exemple un DD de 120 Go reconnu comme seulement 32 Go) il faut vérifier les paramètres de détection du DD dans le BIOS ainsi que le cavalier présent sur le DD. Si le disque dur est détecté à seulement 130 Go (alors qu’il en fait 160 ou 200), il faut vérifier qu’on ait bien le SP1 installé (ou SP2) et activer le mode LBA 48 bits dans la BdR .

puis on explore le DD de son choix : par les flèches haut bas mettre en surbrillance le DD que l’on veut explorer, par les flèches droite gauche mettre en surbrillance [Proceed] pour scanner le DD en question, puis valider le choix en appuyant sur la touche Entrée. 

2) S’ouvre alors une nouvelle fenêtre qui va permettre de choisir le type de table de partition que l’on possède :

Disk /dev/sda - 120 GB / 111 GiB

Please select the partition table type, press ENTER when done..
[ Intel ] Intel/PC partition
[ Mac ] Apple partition map
[ None ] Non partioned media
[ Sun ] Sun Solaris partition
[ XBox ] XBox partition

Note: Do NOT select 'None' for media with only a single partition. It's very rare for a drive to be 'Non-partitioned'.

par les flèches haut bas sélectionner [Intel] (sauf exception) et appuyer sur Entrée : ceci vous amène dans la fenêtre de menu principal de Testdisk où figurent les différentes commandes et options :

Disk /dev/sda - 120 GB / 111 GiB - CHS 14593 255 63

[ Analyse ] Analyse les différentes partitions du DD et cherche des partitions perdues
[ Advanced ] permet de récupérer et réparer les secteurs de boot des partitions
[ Geometry ] modifier la géometrie du disque
[ Options ] modifier les options
[ MBR Code ] écrire le MBR de TestDisk sur le premier secteur du DD
[ Delete ] effacer la table de partition du MBR
[ Quit ] revenir à la sélection de DD

Note: Correct disk geometry is required for a successful recovery. ‘Analyse’ process may give some warnings if it thinks the logical geometry is mismatched.

À noter en haut de cette fenêtre que Testdisk explore la géométrie du DD (ici 14593 cylindres, 255 têtes et 63 secteurs par piste), et en cas d'anomalie il peut y avoir des messages d’alerte dont il faudra tenir compte pour la récupération de vos partitions disparues. cette géométrie est importante à considérer dans certaines étapes ultèrieures et est à comparer notamment aux coordonnées CHS des partitions que testdisk va retrouver. 


B) Les différentes options du menu...

1) Menu Analyse : explore la structure et l’arborescence des partitions du DD puis permet de rechercher d’éventuelles partitions perdues. 

Disk /dev/sda - 120 GB / 111 GiB - CHS 14593 255 63
Current partition structure:
Partition...........Start.............End...........Size in sectors
1 * FAT32........0..1..1....1010..254..63....16241652 [NO NAME]
2 P Linux.....1011..0..1....1023..254..63.......208845 [/boot]
3 E ext LBA..1024..0..1..14592..254..63..217985985
5 L Linux.....1024..1..1....3573..254..63....40965687 [md0]
X extended..3574..0..1....4210..254..63....10233405
6 L Linux.....3574..1..1....4210..254..63....10233342 [md1]
X extended..4211..0..1..14592..254..63..166786830
7 L Linux.....4211..1..1...14592..254..63..166786767

*=Primary bootable P=Primary L=Logical E=Extended D=Deleted
[Proceed ] [ Backup] 

Cette fenêtre affiche les caractéristiques des partitions :
* le nombre de partitions détectées : ici 6 partitions (2 principales et 1 étendue contenant elle-même 3 partitions logiques). A noter qu’il n’y a pas de partition n°4 car dans cet exemple le MBR ne contient que 3 descripteurs de partition (2 principales fat32 et linux et 1 étendue LBA)
* le type de partition : *=partition principale bootable P=partition principale L=partition logique E=partition étendue D=partition supprimée (lorsque testdisk en détecte une)
à noter que ces indications (*, P, L, E) ne sont pas des commandes utilisables, mais seulement un descriptif.
* le type de fichier pour chaque partition (Linux, FAT, étendue…),
* la localisation physique de la partition sur le DD sous forme CHS (début et fin de chaque partition)
* la taille de chaque partition exprimée en nombre de secteurs (1 secteur = 512 octets)

A ce stade TestDisk a vérifié que chaque valeur est dans les limites autorisées, c'est à dire aucune valeur de secteur &lt; 1, ni &gt; au nombre de secteurs par tête. Les entrées de partition sont lues en utilisant le début logique et la taille logique exprimés en secteurs, et TestDisk vérifie que ces valeurs logiques correspondent bien aux informations stockées sous forme CHS. TestDisk vérifie également que la table des partitions ne comporte pas de partition se terminant après la fin du disque, et qu'aucune partition ne se chevauche. 
Pour chaque partition, TestDisk lance quelques contrôles de base spécifiques au type de système de fichiers, il contrôle le secteur de boot, la présence du nombre magique (0xAA55) dans le MBR et chacune des partitions étendues. Cette phase est très rapide car les contrôles sont minimaux.
[Backup ] permet de sauvegarder sous la forme d'un fichier texte la table de partition que vous affiche testdisk (au cas où vos manips ultèrieures vous effaceraient ces données). ce fichier texte s'appelle backup.log et est créé lui aussi dans le répertoire win de testdisk. si vous utilisez cette option "backup", proceed est ensuite automatiquement exécuté et vous passez à la fenêtre suivante.

En appuyant sur [Proceed ] TestDisk va rechercher d’éventuelles partitions « perdues » sans se servir des résultats de l'étape précédente. Pour ce, il recherche notamment les adresses de début de partition possible, la présence d'une en-tête de système de fichiers (FAT, secteur d'initialisation NTFS,...). Si une partition est découverte TestDisk l’ajoute à la liste des partitions existantes : 

Disk /dev/sda - 120 GB / 111 GiB - CHS 14593 255 63

Partition.............Start............End............Size in sectors
* FAT32............0..1..1....1010..254..63...16241652 [NO NAME]
P Linux.........1011..0..1....1023..254..63......208845 [/boot]
D Linux.........1024..1..1....3573..254..63...40965687
D Linux RAID..1024..1..1....3573..254..63...40965687 [md0]
D Linux.........3574..1..1....4210..254..63...10233342
D Linux RAID..3574..1..1....4210..254..63...10233342 [md1]
L Linux..........4211..1..1..14592..254..63..166786767

Structure: Ok. Use Up/Down Arrow keys to select partition.
Use LEFT/RIGHT Arrow keys to CHANGE partition characteristics:
*=Primary bootable P=Primary L=Logical E=Extended D=Deleted
Keys A: add partition, L: load backup, T: change type, P: list files,
ENTER: to continue

Là encore « *=Primary bootable P=Primary L=Logical E=Extended D=Deleted » ne sont pas des commandes mais des descriptifs du statut de chaque partition. On peut cependant les modifier (et on doit le faire lorsqu'on trouve des partitions perdues) en se positionnant sur la partition de son choix et en utilisant les flèches droite gauche (« D » permet d’effacer une partition indésirable ou que l’on pense erronée, mais on pourra toujours la récupérer par la suite en relançant testdisk car en réalité ça n’efface que le descripteur de partition).

Par contre « Keys A: add partition, L: load backup, T: change type, P: list files » sont des commandes très utiles :
- A : permet de créer une nouvelle partition si l’on constate un trou entre les coordonnées CHS de 2 partitions (alternative à la fonction « Search »). On y reviendra plus loin dans les exemples de récupération.
- L : permet de récupérer une éventuelle sauvegarde de la table de partition qu'on aurait pensé à faire précédemment (fonction "backup" vue au dessus). Si testdisk n’en trouve pas (cas le plus fréquent car on est hélas jamais assez prévoyant), rien ne s'affiche sous la ligne "choose the backup you want to restore:" et l'on revient à la fenêtre précédente en appuyant sur la touche entrée.
- T : permet de changer le type de partition (FAT, NTFS, Linux...) si on pense qu’il y a une erreur sur telle ou telle partition (très rare qu'on ait à utiliser cette commande)
- P : permet de lister les répertoires et fichiers présents sur une partition, et ainsi non seulement de confirmer qu’on a récupéré la bonne partition (et de se rassurer quand on voit les données importantes qu’on voulait récupérer) mais également, dès ce stade, de copier les données à récupérer sur n'importe quelle autre partition ou disque dur :

* FAT32 0 1 1 1010 254 63 16241652 [NO NAME]
Use left arrow to go back, right arrow to change directory, c to copy, q to quit 
Directory /

dr-xr-xr-x.....0...0..............0 14-Feb-2005 22:41 WINDOWS
dr-xr-xr-x.....0...0..............0 14-Feb-2005 22:41 WINDOWS
-r--r--r--.....0...0...805306368 20-Jul-2005 10:35 PAGEFILE.SYS
dr-xr-xr-x.....0...0..............0 14-Feb-2005 22:41 WINDOWS
-r--r--r--......0...0.........4952 28-Aug-2001 15:00 Bootfont.bin
-r--r--r--......0...0.......251712 3-Aug-2004 22:59 NTLDR
-r--r--r--......0...0.........47564 3-Aug-2004 22:38 NTDETECT.COM
-r--r--r--.....0...0...........212 14-Feb-2005 22:51 BOOT.INI
dr-xr-xr-x.....0...0..............0 14-Feb-2005 22:47 Documents 

chaque ligne commencant par -r est un fichier, celles commençant par dr sont des répertoires.
on peut explorer les répertoires en se positionnant dessus et en faisant fleche droite (ou entrée), on revient au répertoire parent en se positionnant sur la 2ème ligne (qui se termine par .. au lieu d'un nom de fichier ou répertoire) et en faisant fleche droite (ou entrée)
si on veut sauvegarder (copier) un répertoire (et tous les fichiers et sous-répertoires qu'il contient) sur une autre partition (ou DD), il faut se positionner dessus puis cliquer sur "c". sur la fenêtre qui s'ouvre il est demandé si on veut copier les données dans le répertoire win de testdisk (par défaut : cliquer sur "Y" pour confirmer), ou si on veut copier les données sur n'importe quel autre support : se mettre sur la 2ème ligne (qui se termine par ..) fleche droite (ou entrée) autant de fois qu'on veut pour remonter dans les répertoires parents jusqu'à sélectionner une autre partition ou disque dur puis cliquer sur "y". lorsque le répertoire ou fichier est copié, "copy done!" s'affiche.
Une fois l'exploration et/ou copie de vos répertoires et fichiers effectuée, il faut cliquer sur "q" et on revient à la fenêtre précédente : il suffit alors de cliquer sur la touche entrée pour passer à l'étape suivante de recherche de partitions perdues :

Disk /dev/sda - 120 GB / 111 GiB - CHS 14593 255 63

Partition............Start.............End............Size in sectors
1* FAT32..........0..1..1....1010..254..63....16241652 [NO NAME]
2P Linux.......1011..0..1....1023..254..63.......208845 [/boot]
3E ext LBA...1024..0..1...14592..254..63..217985985
5L Linux.......1024..1..1....3573..254..63....40965687 [md0]
6L Linux.......3574..1..1....4210..254..63....10233342 [md1]
7L Linux.......4211..1..1...14592..254..63..166786767

[ Quit ] [Search! ] [ Write ] Return to main menu

- Quit : Quitter le programme de TestDisk sans faire aucun changement (si on a un doute)

- Search! : Le premier balayage rapide peut avoir manquer quelques partitions. Si celle que l’on recherche n’est pas dans la liste, appuyer sur « Search » : ceci va permettre de lancer une nouvelle recherche en utilisant d’autres critères (secteur backup de l'initialisation FAT32, NTFS backup, initialisation superblock,…) et testdisk va relancer une recherche approfondie cylindre par cylindre. Cette étape est plus longue pouvant prendre 20 à 40 minutes selon la taille du DD à explorer. Il est important de bien vérifier le statut de chaque partition quand la recherche est terminée : en effet, si une partition perdue est retrouvée par « Search », elle va apparaitre « D » (qui signifie Deleted = effacée) et il faut, pour la récupérer, utiliser les flèches droite gauche pour mettre le statut correct : * (principale bootable), P (principale non bootable), L (logique) ou E (étendue). A noter qu’on ne peut pas faire n’importe quoi et en cas d’erreur on va voir s’afficher le message « structure : bad » qui signifie qu’on a mal configuré le statut d’une des partitions (c'est le plus souvent un problème de chevauchement des coordonnées CHS des partitions). Si par contre la configuration est correcte on verra « Structure: Ok » (ce qui signifie que tout est correct, c'est à dire, aucune partition primaire entre deux partitions étendues, une seule (ou aucune) partition amorçable (bootable), aucune partition qui utilise le même espace disque (pas de chevauchement). 
Puis on appuie sur la touche entrée et on revient à la fenêtre précédente où il faudra confirmer les modifications par la touche « Write ».

- Write : Valide et écrit les changements qui ont été faits (si on est sûr des modifications apportées) : TestDisk demande alors de confirmer : "Write partition table, confirm ? (Y/N)" : taper Y...

- Extd Part : En cas de partition logique, cette option permet de décider si la partition étendue doit employer tout l'espace disque disponible ou seulement l'espace minimum exigé.

A noter qu’en cas de mauvaise manipulation sur la partition système (modifier le statut bootable de la partition, supprimer la partition, supprimer son secteur de boot…), l’ordinateur pourrait ne pas redémarrer avec divers messages d’erreur du genre « hal.dll manquant ou endommagé,… ». Or dans ce cas précis une réparation via la console de récupération n’est pas garantie : d’où l’intérêt d’avoir testdisk version DOS sur disquette bootable ou un liveCD de Slax-LFI pour « réparer » d’éventuelles erreurs via testdisk.


2) Menu Advanced : permet de récupérer et réparer les secteurs de boot des partitions :

Disk /dev/sda - 120 GB / 111 GiB - CHS 14593 255 63

...Partition...........Start.............End............Size in sectors
1* FAT32............0..1..1....1010..254..63....16241652 [NO NAME]
2P Linux.........1011..0..1....1023..254..63.......208845 [/boot]
3E ext LBA......1024..0..1...14592..254..63..217985985
5L Linux RAID..1024..1..1....3573..254..63....40965687 [md0]
X extended.....3574..0..1....4210..254..63....10233405
6L Linux RAID..3574..1..1....4210..254..63....10233342 [md1]
X extended.....4211..0..1...14592..254..63..166786830
7L Linux.........4211..1..1...14592..254..63..166786767

[ Type ] [ Boot ] [ Quit ]
Sélectionnez la partition que vous souhaitez modifier (flèche haut bas) et choisissez la commande à effectuer :

- « Type » permet de modifier le système de fichier (NTFS, FAT 32, Linux,…), exactement comme la commande « T » du menu « analyse » (là aussi, commande peu utilisée)

- « Boot » permet de modifier ou de recréer le secteur de boot de la partition (« boot » n’est accessible que pour les partitions principales et logiques, pas pour les partitions étendues). Lorsqu’on clique dessus, une nouvelle fenêtre s’ouvre :

Disk /dev/sda - 120 GB / 111 GiB - CHS 14593 255 63
Partition............Start..............End..........Size in sectors
1 * FAT32........0..1..1....1010..254..63...16241652 [NO NAME]
Boot sector
OK
Backup boot sector
OK
Sectors are identical.

[ Quit ] [ List] [Rebuild BS] [ Dump ] [Repair FAT]

Dans cet exemple le secteur de boot et sa copie de sauvegarde ont tous les deux le statut « OK » et les secteurs sont identiques : il n’y a donc à priori aucun problème de ce côté là et on peut avoir besoin de faire "repair FAT" (ou repair MFT).

Les options de commandes visibles sur la dernière ligne diffèrent selon la structure du secteur de boot :

- « List » permet de vérifier les fichiers et répertoires présents sur la partition, et comme avec la commande "P" du menu analyse, permet de sauvegarder (copier) les données retrouvées sur une autre partition ou DD (par la commande "c")...
- « Org. BS » permet de faire une sauvegarde du secteur de boot lorsque la copie de sauvegarde existante n’est pas bonne (copie du secteur de boot sur le secteur de sauvegarde). Cette commande n’apparaît que si les 2 secteurs sont différents.

- « Backup BS » permet de restaurer le secteur de boot à partir de la copie de sauvegarde lorsque le secteur de boot n’est pas bon (copie de la sauvegarde du secteur de boot sur le secteur de boot). Cette commande n’apparaît que si les 2 secteurs sont différents.

- « Dump » permet d’éditer sous forme hexadécimale le secteur de boot et sa copie de sauvegarde (sauf dans les FAT16 où il n’y a pas de copie de sauvegarde) pour vérifier quels sont les octets qui diffèrent de manière à savoir, en cas d’hésitation, s’il vaut mieux cliquer sur « Org. BS » ou plutôt « Backup BS ». Cette commande apparaît toujours, même lorsqu’il n’y a aucun problème. 

- « Rebuild BS » permet de reconstruire le secteur de boot. Cette commande apparaît toujours, même lorsqu’il n’y a aucun problème. La manip diffère selon que la partition soit NTFS ou FAT :

Pour les partitions NTFS, la procédure est automatique (TestDisk essaie de localiser la MFT, évalue sa taille, calcule la taille du cluster, lit la taille de l'Index Allocation Entry dans l'index du répertoire root, et en utilisant toutes ces valeurs, il peut fournir un nouveau secteur de boot) et à la fin de la procédure un secteur de boot "extrapolé" est proposé. Il peut y avoir un message d’alerte du genre « extrapolated boot sector and current boot sector are different » , mais ça ne signifie pas pour autant que le secteur de boot reconstruit ne soit pas valable : on a d’ailleurs la possibilité de vérifier si nos fichiers sont à nouveau accessibles (commande « List ») avant de confirmer et écrire le nouveau secteur de boot (« Write »). Par contre un message du genre « Warning : extrapolated boot sector have incorrect values » n’est pas glop et il vaut mieux reprendre à zéro...

Pour les partition FAT, Testdisk recherche d’abord la Table d’Allocation des Fichiers sur la partition et affiche les fichiers trouvés grâce à cette FAT : si ce sont bien les fichiers qu’on cherchait il faut confirmer par « Y(es) » et testdisk affiche alors le secteur de boot reconstruit à partir de la FAT. Là aussi on peut « lister » les fichiers de la partition avant de confirmer qu’il s’agit du bon secteur de boot avec la commande « write ».
Si on est pas sûr que testdisk ait trouvé la bonne FAT (fichiers retrouvés différents de ce qu’on attendait ou carrément absents), il faut taper « N(o) » et testdisk va alors chercher le « cluster root » puis proposer un « extrapolated boot sector ». Là encore attention à l’éventuel message warning... et « lister » les fichiers avant d’écrire ce nouveau secteur (« write »).

- « Repair FAT » répare, dans une partition FAT, la table d’allocation des fichiers (qui pointe vers tous les fichiers et répertoires de la partition). TestDisk compare les deux copies de la FAT. Si les deux FAT ne sont pas identiques ou s'ils contiennent des erreurs, TestDisk utilise la copie de FAT qui a le moins d'erreurs et supprime les erreurs évidentes. Cette commande apparaît toujours (sauf s’il existe une différence entre le secteur de boot et sa copie de sauvegarde), même lorsqu’il n’y a aucun problème. C’est une commande signalée comme « dangereuse » par testdisk (fichiers irrécupérables sur la partition si la FAT est corrompue), mais si on l’utilise quand même et qu’il n’y a aucun problème décelé, Testdisk le signale par le message « FAT seems OK, nothing to do » (la FAT semble OK, il n’y a rien à faire)

- « Repair MFT » répare la table principale des fichiers (Master File Table) dans une partition NTFS (la MFT au sein d’une partition NTFS correspond à la FAT dans une partition FAT). Cette commande apparaît toujours, même lorsqu’il n’y a aucun problème. Là aussi, prudence avec cette commande. Si tout va bien testdisk signale simplement « MFT is OK ».

3) Menu Geometry : Ce menu permet de modifier les valeurs CHS lues par Testdisk lorsque des erreurs évidentes sont visibles (mais il n’affecte pas le DD lui même). attention toutefois car si après avoir modifié les valeurs de geométrie du disque on valide par « Write » mais qu'on s'est trompé dans les valeurs, on risque de ne plus pouvoir récupérer nos données par la suite : à n’utiliser donc que dans des circonstances très précises et avec beaucoup de précaution car ça peut interdire définitivement l’accès aux données récupérées.

Disk /dev/sda - 120 GB / 111 GiB - CHS 14593 255 63, sector size=512

Because these numbers change the way that TestDisk looks for partitions
and calculates their sizes, it's important to have the correct disk geometry.
PC partitionning programs often make partitions end on cylinder boundaries.

A partition's CHS values are based on disk translations which make them
different than its physical geometry. The most common CHS head values
are: 255, 240 and sometimes 16.

[ Cylinders ] [ Heads ] [ Sectors ] [Sector Size] [ Ok ]

Done with changing geometry

Si la géométrie du DD ne correspond pas à celle qui a été utilisée lors de la création de la table de partition, on voit apparaître lors de l’analyse un message d’erreur du type : Bad sector count, Bad relative sector or Bad ending head. Dans ce cas il faut essayer de changer le “nombre de têtes” dans “geometry” jusqu’à ce que Testdisk retrouve toutes les partitions, en testant d’abord la valeur de 255 (et à défaut 240, voire 16, 32, 64 ou 128). dans d'autres cas il faudra rajouter un cylindre pour retrouver la dernière partition...

4) Menu Options : habituellement pas utilisé
- Expert mode: ajoute qques fonctionnalitées. (par defaut: No) 
- Cylinder Boundary: les Partitions sont alignées sur les fins de cylindre (defaut: Yes, mais il peut être utile de mettre No en cas de chevauchement, notamment lorsqu'une partition finit en fin de cylindre alors que la suivante débute au milieu de ce même cylindre : voir le cas de zigues) 
- Allows partial last Cylinder: autorise l'utilisation partielle du dernier cylindre (defaut: No, mais il peut être utile sous Vista de mettre Yes, car Vista ne crèe plus les partitions sur les limites de cylindre mais au Mo près, et si on laisse No la dernière partition peut ne pas apparaitre) 
- Ask Partition Table order: permet de modifier l’ordre des entrées (defaut: No) 
- Halt on errors: (defaut: Yes) 
- Dump: Dumps essential sectors (default: No) 
- Ok : Save Option changes and return to main Menu. 

5) Menu MBRCode : à n’utiliser que lorsque toutes les autres solutions ont échoué et qu’on n’arrive plus du tout à booter. Cette commande réécrit le secteur de boot du MBR et sa signature 0xAA55 (comme le ferait la commande fdisk /mbr) mais en écrivant un MBR « version Testdisk « 
ce nouveau MBR (version Testdisk) va rechercher lors du démarrage un quelconque secteur de boot dans la 1ère partition. Si échec un menu va s’afficher du type : 

TestDisk
1234F:

Appuyer successivement sur les touches 1, 2, 3 et 4 : ceci indiquera au MBR qu’il doit essayer de booter sur n’importe quel secteur de boot qu’il pourra trouver respectivements dans les 1ère, 2ème, 3ème ou 4ème partition.
Si on a la chance d’arriver enfin à booter il faudra ensuite reconstruire le MBR conformément à sa structure initiale (avant que les problèmes ne surviennent) : attention de ne pas se tromper pour ne pas risquer de perdre à nouveau sa table de partition…

6) Menu Delete : efface les 64 octets de la table de partition du MBR (en écrivant des zéros), mais sans toucher au secteur de boot du MBR ni à sa signature 0xAA55. A éviter... c’est en fait la commande opposée à MBRcode qui, elle, réécrit le MBR sans toucher aux 64 octets de la table de partition.



C) Quelques exemples de récupération par Testdisk :...


Si le secteur de boot est endommagé, les données ne sont plus accessibles. Windows affichera par exemple "The drive is not formatted, do you want to format it now ?" (Le volume n'est pas formaté, souhaitez-vous le formater maintenant ?) 

Lancer TestDisk &gt; sélectionner le DD à explorer &gt; entrée &gt; sélectionner « intel » &gt; entrée &gt; sélectionner « Analyse » &gt; entrée &gt; « Proceed » &gt; entrée : souvent à ce stade on ne retrouve pas la partition perdue &gt; entrée &gt; « Search » &gt; entrée : dans la nouvelle fenêtre qui apparaitra (après 10 à 20 minutes de scan) il faut vérifier le statut de chaque partition (*, P, L, E, D) et éventuellement modifier par les flèches droite gauche les erreurs visibles (notamment pour les partitions retrouvées qui ont souvent le statut « D » et qu'il va falloir mettre en "P" ou en "L" en évitant que les partitions ne se chevauchent) &gt; entrée &gt; « Write » &gt; entrée &gt; confirmer par « Y ».
Pour chaque partition retrouvée, un message d’alerte peut s’afficher du genre « Partition sector doesn't have the endmark 0xAA55 » ou « Boot sector bad » : 

5L FAT32.....383..1..1......3736..254..63.......53881947
Boot sector
test_FAT :
Partition sector doesn't have the endmark 0xAA55
Backup boot sector
OK
First sectors (Boot code and partition information) are not identical.
Second sectors (cluster information) are not identical.
Third sectors (Second part of boot code) are not identical. 

dans ce cas là il faut aller dans le menu advanced &gt; se mettre sur la partition en question &gt; boot : et regarder le statut de boot sector et de backup boot sector.
* si BS bad et backup BS ok, il faut faire "backup BS"
* si BS ok et backup BS bad il faut faire "org BS"
* si les 2 sont bad, il faut faire "rebuild BS" 
* si les 2 sont OK mais différents, il faut faire "Dump" pour voir en quoi ils diffèrent et voir ainsi s'il vaut mieux faire "backup BS" ou "org BS" (voire "rebuild BS")
* si les 2 sont OK et identiques mais que les données ne sont toujours pas accessibles, c'est que le problème se situe en aval et il y a de fortes chances que la FAT (ou la MFT) soit corrompue. Dans ce cas la commande "list" échoue en renvoyant un message d'erreur du genre "can't open filesystem. filessystem seems damaged" et il faut tenter un "repair FAT" (ou un repair MFT) : hélas ça ne marchera pas toujours et vous risquez de vous retrouver en face d'un autre message d'erreur du genre "MFT and MFT mirror are bad, failed to repair them". dans ce cas on peut essayer de retrouver la bonne MFT (encore que j'y suis pas encore arrivé...) ou sinon essayer de récupérer les données grâce à un logiciel de récupération. voir les cas de zud et bok2000 ainsi que la solution qu'a trouvé FL04 avec getdataback...
une autre cause fréquente de plantage de partition sont les problèmes de géométrie : 
* souvent dans ce cas on est alerté par un message du genre "warning: incorrect number of head/cylinder...". il faut alors vérifier, sur la ligne du haut, le descriptif CHS du DD &gt; aller dans le menu geometry pour modifier head (le plus souvent) &gt; write &gt; retourner dans le menu analyse &gt; proceed (&gt; +/- search si proceed ne retrouve rien) &gt; entrée &gt; write &gt; aller dans le menu advanced vérifier BS et backup BS &gt; puis quitter testdisk et redémarrer le PC pour voir si la partition est revenue... attention de laisser testdisk ouvert entre chaque manips (geometry &gt; analyse &gt; advanced) sinon il faudra tout recommencer.
* dans d'autres cas la dernière partition n'est plus accessible alors qu'on la voit dans search : il faut alors vérifier le cylindre de fin de la partition et celui du DD (normalement supèrieur de 1 ou 2 unités par rapport au cylindre de fin de partition), et si le nombre de cylindre est identique, alors il faut, dans le menu geometry, mettre un nombre de cylindres augmenté d'une unité (puis write &gt; proceed &gt; advanced...). Sous Vista, comme expliqué plus haut, il faut aller dans le menu option mettre yes à "allows partial last cylinder".
un dernier cas de figure est l'impossibilité de retrouver une partition malgré search (avec par exemple un trou entre 2 partitions) : dans ce cas il faut recréer la partition manquante en cliquant sur la touche "A" dans proceed &gt; puis rentrer successivement les valeurs adéquates de début de partition (cylinder head sector) et de fin de partition (cylinder head sector) &gt; type : entrée &gt; fleche de direction pour choisir le bon type de partition (NTFS, FAT,...) &gt; entrée &gt; done &gt; write ou OK &gt; menu advanced &gt; boot : vérifier BS et backup BS...
n'hésitez pas si vous avez des questions (et/ou copies d'écran pour conseils )
(dernière mise à jour le 17 juin 2007)
Réponses : 
Auteur : Bricolot
Réponse le : 18/07/2006 07:52
Message :
Bonjour et FELICITATIONS à toi Romsk, pour ce topic qui va servir à bien d'astuciens dans l'avenir. Chapeau bas pour ton travail mis au service de tous. Bonne journée.[hello]
Auteur : Coriolan
Réponse le : 18/07/2006 08:08
Message :
Bonjour romsk, Beau travail! Bravo ! [chinois]
Auteur : romsk
Réponse le : 18/07/2006 09:39
Message :
[hello] et merci, et comme je crois qu'il a toute sa place dans les récupérations de partition, notamment raw, je vais éditer mon tuto sur les partitions perdues pour y inclure ce précieux testdisk...
Auteur : triode94
Réponse le : 18/07/2006 17:15
Message :
Bonjour Romsk. Excellent travail très utile. Félicitations.
Auteur : butch001
Réponse le : 19/07/2006 13:34
Message :
Salut Romsk, Je reviens vers toi suite à diférents échanges sur le poste 'Partition disparue (passée en RAW) : TUTO'. Rappel: Mon disque comporte 2 partitions. La première (Système) est OK, la seconde est RAW (initialement NTFS). Après moulte tentatives de trucs et astuces lisiblent sur les différents forums, rien à faire, je ne parviens pas à récupérer ma partition. J'ai découvert, hier, ton nouveau post sur Testdisk, et repris mes tentatives de récupération. Voici ce que dit Testdisk après la phase d'Analyse: Disk /dev/sda - 122 GB / 114 GiB - CHS 14946 255 63 Current partition structure: Partition Start End Size in sectors 1 * HPFS - NTFS 0 1 1 2610 254 63 41945652 [SYSTEME] Invalid NTFS boot 2 P HPFS - NTFS 2611 0 1 14945 254 63 198161775 2 P HPFS - NTFS 2611 0 1 14945 254 63 198161775 Quand penses-tu? Puis en lançant Proceed, voici ce que dit Testdisk: Disk /dev/sda - 122 GB / 114 GiB - CHS 14946 255 63 Partition Start End Size in sectors * HPFS - NTFS 0 1 1 2610 254 63 41945652 [SYSTEME] STRUCTURE: OK La partition endommagée n'apparait plus !! Puis en continuant (Enter), puis Search!, Testdisk ne retrouve jamais ma partoche endommagée. Ceci est étrange qu'il la trouve au début, puis la pert ensuite ! Quand penses-tu? Salutations. BUTCH001
Auteur : romsk
Réponse le : 19/07/2006 15:05
Message :
salut butch001,
butch001 a écrit : Disk /dev/sda - 122 GB / 114 GiB - CHS 14946 255 63 Current partition structure: Partition Start End Size in sectors 1 * HPFS - NTFS 0 1 1 2610 254 63 41945652 [SYSTEME] Invalid NTFS boot 2 P HPFS - NTFS 2611 0 1 14945 254 63 198161775 2 P HPFS - NTFS 2611 0 1 14945 254 63 198161775
j'en pense qu'il te manque 63 secteurs dont le 1er correspond probablement à cet "invalid NTFS boot", et je vois 2 solutions que tu peux alternativement tester sous Testdisk : - soit ta partition perdue est une partition logique au sein d'une partition étendue et tu devrais avoir : 1 * HPFS - NTFS 0 1 1 2610 254 63 41945652 [SYSTEME] 2 E extended LBA 2611 0 1 14945 254 63 198161775 5 L HPFS - NTFS 2611 1 1 14945 254 63 198161712 - soit ta 2ème partition est une partition principale et tu devrais avoir : 1 * HPFS - NTFS 0 1 1 2610 254 63 41945652 [SYSTEME] 2 P HPFS - NTFS 2611 1 1 14945 254 63 198161712 Comme Testdisk refuse de te retrouver ta partition on va la créer : Lance TestDisk > sélectionne le DD à explorer : entrée > sélectionne « intel » : entrée > sélectionne « Analyse » : entrée > « Proceed » : entrée , et là tu appuies sur "A" et dans la nouvelle fenêtre qui va s'ouvrir tu vas successivement rentrer 7 données avant de faire "done" : * cylinder : tu mets 2611 * Head : 1 * Sector : 1 * cylinder : 14945 * Head : 254 * Sector : 63 * Type : tu vas sur la 2ème ligne > entrée : et tu tapes "07" (sans les guillemets) * Done > entrée et dans la fenêtre où tu reviens tu te mets sur la nouvelle partition et tu fais flèche droite gauche pour la mettre en "L" > entrée > « Write » : entrée > confirmer par « Y ». puis tu fermes testdisk, tu redémarres l'ordi et tu regardes ce que ça donne... si ça marche pas on va essayer de créer une partition principale plutôt que logique : si tu retrouves la partition logique que tu viens de créer tu la supprimes en utilisant les flèches droite gauche et en la mettant sur "D", puis tu recrées une nouvelle partition par "A" : la procédure et les chiffres à rentrer sont exactement les mêmes mais tout à la fin tu mets "P" et non pas "L" > entrée > « Write » : entrée > confirmer par « Y ». puis tu fermes testdisk, tu redémarres l'ordi et tu regardes ce que ça donne...
Auteur : butch001
Réponse le : 19/07/2006 22:30
Message :
Romsk, Désolé pour l'orthographe de (Qu'en) Quand penses-tu?, j'ai un peu honte ! Il doit y avoir beaucoup d'autres fautes, mais celle-ci est énorme. Bref J'ai suivi tes instructions à la lettre, en commençant par créer une partition "principale" et en redemarrant la machine: Rien a changé (identique à mon post d'aujourd'hui, 13h34)! J'ai ensuite créé une partition "logique", et, après redémarrage de la machine, voici ce que voit testdisk (après analyse): Disk /dev/sda - 122 GB / 114 GiB - CHS 14946 255 63 Current partition structure: Partition Start End Size in sectors 1 * HPFS - NTFS 0 1 1 2610 254 63 41945652 [SYSTEME] 2 E extended LBA 2611 0 1 14945 254 63 198161775 Invalid NTFS boot 5 L HPFS - NTFS 2611 1 1 14945 254 63 198161712 5 L HPFS - NTFS 2611 1 1 14945 254 63 198161712 Puis après un proceed: Disk /dev/sda - 122 GB / 114 GiB - CHS 14946 255 63 Partition Start End Size in sectors * HPFS - NTFS 0 1 1 2610 254 63 41945652 [SYSTEME] Il pert à nouveau la partoche. Qu'est-ce qui te fais dire qu'il manque 63 secteurs? Pourquoi la partition est repérée au début, puis disparait ensuite?
Auteur : romsk
Réponse le : 19/07/2006 22:53
Message :
butch001 a écrit : Disk /dev/sda - 122 GB / 114 GiB - CHS 14946 255 63 Current partition structure: Partition Start End Size in sectors 1 * HPFS - NTFS 0 1 1 2610 254 63 41945652 [SYSTEME] Invalid NTFS boot 2 P HPFS - NTFS 2611 0 1 14945 254 63 198161775 2 P HPFS - NTFS 2611 0 1 14945 254 63 198161775
ce qui me fait dire que t'as perdu qqpart 63 secteurs c'est ce que je t'ai mis en bleu : normallement il n'y a que les partitions étendues qui commencent à "Head 0" car y figure leur table de partition propre sur le 1er secteur et les 62 autres secteurs sont cachés, inaccessibles (1 tête = 63 secteurs) par contre partitions principale ou logique commencent toujours à "head 1" : donc dans ton cas avoir "head 0" alors qu'elle est affichée comme une partition principale est une anomalie (et du coup il faut aussi corriger le nombre total de secteur de la partition, c'est pour ça que je t'ai fait passer "size" de ...775 à ...712 (en fait il faut tenir compte de ces 63 secteurs). * as-tu bien fait write et yes avant de fermer testdisk ? * t'es sûr que de la mettre en partition principale ne marchait pas ? toujours avec write et yes ? * et puis j'ai oublié de te dire qu'en cas de secteur de boot corrompu, il faut, après avoir rajouté ta partition dans le menu analyse, aller aussi dans le menu advanced pour traiter tout de suite le secteur de boot corrompu avant de fermer testdisk et redémarrer l'ordi... * ensuite ne t'arrête pas au proceed, refais search pour voir s'il retrouve cette partition qu'on vient de créer : normallement ça devrait marcher... (sauf si c'est une principale qui a disparu et non pas une logique). donc si search ne te retrouve pas ta partition tu recommences à zéro, tu recrées ta partition logique et tu vas traiter tout de suite après le secteur de boot avant de quitter testdisk * concernant donc cette histoire d'invalid ntfs boot, va dans le menu "advanced" pour voir comment il reconnait le secteur de boot et sa copie de sauvegarde : statut bad ou OK de l'un et/ou de l'autre ? que montre "dump" qui permet de comparer ces secteurs de boot ?
Auteur : butch001
Réponse le : 20/07/2006 21:03
Message :
Bonsoir Romsk, Oui, j'ai bien fait write et yes! Non, en partition principale ça ne marche pas! Même en fait faisant search, il ne retrouve pas la partition! Comment traiter le secteur de boot?? Voici ce que montre "dump": Disk /dev/sda - 122 GB / 114 GiB - CHS 14946 255 63 5 L HPFS - NTFS 2611 1 1 14945 254 63 198161712 Boot sector Backup boot sector 0000 ff011300 01020000 ........ eb529000 00000000 .R...... 0008 00000005 20000000 .... ... 00000000 02080000 ........ 0010 23020000 00101400 #....... 00000000 00f80000 ........ 0018 a9001200 01010000 ........ 3f00ff00 730a8002 ?...s... 0020 00000001 00000000 ........ 00000000 80008000 ........ 0028 01050000 00000005 ........ 6eb5cf0b 00000000 n....... 0030 15000000 be043e32 ......>2 00000c00 00000000 ........ 0038 625cbc06 43170a32 b\..C..2 56fbbc00 00000000 V....... 0040 eb030000 01050000 ........ f6000000 01000000 ........ 0048 00000005 15000000 ........ e2ef4ea4 2c4fa474 ..N.,O.t 0050 be043e32 625cbc06 ..>2b\.. 00000000 fa33c08e .....3.. 0058 43170a32 01020000 C..2.... d0bc007c fbb8c007 ...|.... 0060 7615debc 7a010000 v...z... 8ed8e816 00b8000d ........ 0068 605e0000 00000000 `^...... 8ec033db c6060e00 ..3..... Et voici ce qu'il dit avant (Boot): Disk /dev/sda - 122 GB / 114 GiB - CHS 14946 255 63 Partition Start End Size in sectors 5 L HPFS - NTFS 2611 1 1 14945 254 63 198161712 Boot sector Bad Backup boot sector Bad Sectors are not identical. A valid NTFS Boot sector must be present in order to access any data; even if the partition is not bootable. Voila pour ce soir. Merci pour ton aide.
Auteur : romsk
Réponse le : 20/07/2006 22:47
Message :
boot sector bad, backup boot sector bad, la seule solution dans advanced est de cliquer sur rebuild BS > OK > write ou yes ou valid (je sais plus) > puis tu quittes testdisk et tu redémarres PS : pour le dump il vaut mieux une capture d'écran qu'une retranscription (et fais 2 ou 3 captures après avoir bougé dans le dump avec les fleches haut bas pour ne pas en rater) PPS : je part en vacance pour 3 semaines tout à l'heure à 2 heures du matin : donc soit à tout de suite, soit à dans 3 semaines [triste] (sauf si je trouve un ordi là où je serai [bigsmile])
Auteur : butch001
Réponse le : 20/07/2006 22:59
Message :
Ouais, j'ai déja tenté le rebuild BS, mais sans résultat positif. Le traitement du secteur boot (dont tu me parlais hier), c'est juste le rebuild BS ? Au passage, avec Easy Recovery, je trouve 3 partittions: premiere Secteur demarage: 63 Secteur fin: 41945714 seconde Secteur demarage: 41945715 Secteur fin: 41945778 troisieme Secteur demarage: 41945778 Secteur fin: 240107489 Est-ce normal que le secteur de fin de la seconde soit le même que le secteur de début de la troisième? Si tu ne réponds pas, alors passes de bonnes vacances !
Auteur : romsk
Réponse le : 21/07/2006 01:49
Message :
Ouais, j'ai déja tenté le rebuild BS, mais sans résultat positif : bon ben va falloir trouver autre chose Le traitement du secteur boot (dont tu me parlais hier), c'est juste le rebuild BS ? oui pour l'instant (faut voir ce que montre EditHexa, voir plus bas...) Au passage, avec Easy Recovery, je trouve 3 partitions : Est-ce normal que le secteur de fin de la seconde soit le même que le secteur de début de la troisième ? en réalité ta 2ème "partition" n'en est pas une, elle ne fait que 63 secteurs et correspond donc au secteur de boot (de la partition étendue) qu'on cherche à réparer suivi de ses 62 secteurs cachés A mon avis à ce stade il faut aller voir comment apparaissent ces 63 secteurs avec EditHexa et notamment le secteur 41945715 qui comporte la table de partition de la partition étendue, mais aussi le secteur 41945778 qui correspond au secteur de boot de ta partition disparue (il y a une option "recherche" dans EditHexa qui permet d'aller directement sur le secteur de ton choix dans ton DD...) A dans 3 semaines [bierre] [fete]
Auteur : butch001
Réponse le : 21/07/2006 08:33
Message :
Alors ces vacances, bien passées ? Pour mon souci, j'ai réussi à récupérer certaines données grace à Easy Recovery ! Du bonheur. Par contre, je n'ai toujours pas formaté la partition defectueuse. Je sens que l'on est à 2 doigts de résoudre le pr oblème. Je la conserve bien au chaud, en attendant ton retour de vacances. Je pense que le cas est intéressant et formateur ! A tout de suite. BUTCH001
Auteur : Le Filou
Réponse le : 21/07/2006 08:59
Message :
[hello]Bonjour à toutes et tous, [help]Au risque de passer pour un ignorant (ce que je suis assurément par rapport à d'autres Astuciens), je n'ai pas compris comment s'installe TestDisk.[confus] Merci de pardonner ma nullité, et surtout merci de répondre à ma question.[merci] [bigsmile]Bonne journée à toutes et à tous, [smile]Filou[smile]
Auteur : _chupa_
Réponse le : 21/07/2006 20:13
Message :
salut test disk ne s'installe pas. tu dezipe le dossier sous c par exemple ou sur ton buereau. ensuite tu entre dedans, tu ouvres le dossier win et dble clique testdisk_win j'espere pas avoir dis de connerie :)
Auteur : Le Filou
Réponse le : 21/07/2006 20:19
Message :
[hello]Bonsoir ....Chupa...., [bigsmile]OK, j'ai préféré attendre une réponse avant de faire quoi que ce soit, je m'en occuperai donc demain matin, car ce soir, je suis écrasé par la chaleur..... [merci]Merci pour ta réponse, ....Chupa...., et bonne soirée, [smile]Filou[smile]
Auteur : romsk
Réponse le : 17/08/2006 00:51
Message :
salut butch001, alors t'en es où ? peut être 3 idées supplémentaires : - quand, après modifs, tu arrives dans le menu analyse et que tu vois ta partition étendue créée et ta partition logique correctement redimensionnée, clique sur "save" au lieu de "proceed" pour voir si ça ne fixerait pas les modifs... - fais un CHKDSK /F /R pour t'assurer que tu n'as pas de secteur défectueux (peut être que ton secteur de boot est situé sur des clusters défectueux ?), et passe également ton DD au logiciel constructeur qui va bien - une fois que tu as fais la manip de recréer la partition étendue et modifier la partition logique, fais write, quitte testdisk et va voir ce que montre PTEDIT (maintenant qu'on a recréé le descripteur de partition et indiqué sur quel secteur se trouvait le secteur de boot de ta partition logique)
Auteur : Jean-Pierre 33
Réponse le : 17/08/2006 14:52
Message :
Bonjour, Suite à une restauration système sur C: ma partition D: a disparu. J'ai essayé différents softs de récupération de données montés sur un disque externe pour ne pas trop modifier la structures des clusters de C: mais sans grands résultats. Un ami m'a conseillé TestDisk et il m'a dit qu'il fallait créer au préalable une partition D: plus grande que la précédente avec "Partition Magic" là pas de problème la partion D: est de 10 Go plus grande que la précedente.J'ai ensuite installé Testdisk et après une galère pas possible pour que les boots sectors soient identiques j'ai maintenant un bad root cluster qui apparaît et de ce fait je n'ai plus d'accès à D: J'espère que je vais pouvoir récupérer toutes mes données car j'avais sur D: une centaine de photos de mon petit fils et un montage vidéo sous Ulead presque terminé. Pour une meilleure vision du prôblème je tiens à ta disposition le fichier tesdisk.log qui sera plus précis que mon discours. Merci d'avance pour tes précieux conseils Cordialement Jean-Pierre 33
Auteur : romsk
Réponse le : 17/08/2006 16:08
Message :
salut jean-pierre33, à mon sens t'as été un peu trop vite : testdisk t'aurait récupéré ta partition disparue sur l'espace libre existant (comme PTEDIT), mais en récréant une partition D: tu as du écraser certains secteurs de l'ancien D: notamment le secteur de boot ce qui risque de compliquer le problème... peux-tu m'envoyer ton log (en MP pour ne pas trop rallonger ce post) ainsi qu'une copie d'écran de ta gestion des disques et de ce que montre PTEDIT32 qui permettra d'y voir plus clair pour les coordonnées CHS et les nombres de secteurs (pour PTEDIT regarde dans ma signature "les partitions disparues") PS : as-tu aggrandi ton D: aux dépends de C: où d'autres partitions ?
Auteur : Romano91
Réponse le : 22/08/2006 00:51
Message :
Bonjour ! A la suite d'un message poster ici : [url]http://forum.pcastuces.com/sujet.asp?SUJET_ID=294156[/url] J'ai telechargé le logiciel testdisk, et voici ce qu'il m'affiche après l'accès à ce disque dur. [img width=650 height=487]http://rox91.free.fr/diskdurdefect.JPG[/img] J'avoue que je suis un peu perdu avec ce logiciel, et que j'aimerais avoir votre aide... Dans l'attente de vos réponses, merci d'avance ! [smile]
Auteur : XXe Ciel
Réponse le : 22/08/2006 08:33
Message :
Je voulais juste au passage m'associer à tous ceux et celles qui ont déjà pris le temps de féliciter Romsk pour son travail de précision et sa disponibilité à nous venir en aide dans ce domaine qui dépasse largement mes connaissances... [bierre][hello]
Auteur : sjerome74
Réponse le : 22/08/2006 09:03
Message :
Ha oui je viens de voir ce post et franchement j'espère ne pas avoir de partition perdu hi hi hi, même si romsk et une bête de ce sujet[clindoeil] Chapeau bas romsk.[bierre]
Auteur : romsk
Réponse le : 22/08/2006 11:44
Message :
salut Romano91, je suis étonné par le nombre de têtes qui apparait (16) alors que d'habitude c'est plutot 255 ou 240, mais bon comme t'as pas de message d'erreur du genre "bas sector count" ou autre (et que "16" fait partie des options qu'on peut voir), on va en rester pour l'instant au message qui apparait, à savoir le secteur de boot de la partition qui semble corrompu... va dans le menu "advanced" > entrée > flêche droite pour te mettre sur "boot" > entrée et fais nous une copie d'écran (et merci à enki et à sjerome74 pour leur soutien [hello])
Auteur : Romano91
Réponse le : 22/08/2006 17:06
Message :
Bonjour Romsk! Voici comme tu me l'as demandé la capture d'écran. [img width=650 height=487]http://rox91.free.fr/diskdurdefect2.JPG[/img] Qu'en pense tu ?
Auteur : romsk
Réponse le : 22/08/2006 18:04
Message :
intéressant car cette fois testdisk a vu que le nombre de têtes cloche... on pourrait remplacer le boot sector qui est "bad" par le backup boot sector qui est "ok", mais ça ça va écrire sur le DD alors que simplement modifier la geométrie dans un premier temps, ça n'écrira rien d'irréversible... donc va sur le menu geométrie > entrée > flêches gauche tu te positionnes sur "cylinders" > entrée > tape 19929 > entrée > tu te retrouves sur "heads" > entrée > tape 255 > entrée > flêche droite pour aller sur "ok" > entrée > "write" > entrée > redémarre et reviens nous dire ce que ça donne...
Auteur : Romano91
Réponse le : 22/08/2006 18:20
Message :
Aussi bizarre que ça peut l'être, tout était déjà comme tu me le dis (Cylinder en 19929 et Heads en 255.) Etrange. Pourtant, alors que j'ai lu ton post, ça m'a rappelé que dans PTEDIT, j'avais été intrigué par la case head de mon disque dur deffectueux. Voici un screenshot. [img width=650 height=487]http://rox91.free.fr/diskdurdefect3.JPG[/img]
Auteur : romsk
Réponse le : 22/08/2006 18:35
Message :
[confus] redémarre l'ordi et regarde si tu vois à nouveau ton DD. dans le cas contraire retourne voir testdisk et PTEDIT ce que ça donne (de même que dans PTEDIT clique sur 07 puis sur boot record et fais une copie d'écran du secteur de boot qui va apparaitre)
Auteur : Romano91
Réponse le : 22/08/2006 18:47
Message :
En fait je peut voir mon disque dur grâce à une manip que j'ai fais dans le gestionnaire des disques (il me le voyait en non alloué au début, j'espère que ma manip n'a pas tout fait merder). Dans PTEDIT, au début, il y'avait marquer 55 à la place de 07 dans le type. Je l'ai changé avant de montrer les screens de testdisk. Le problème est que je n'ai pas accès à Boot Record quand je clic sur 07, alors qu'avec mes autres disques dur je peut. On m'a également dit que si je faisais un formatage rapide en NTFS de mon disque dur, les fichiers étaient effacés mais toujours présents physiquement. Es-ce que ce ne serait pas une solution de formater en rapide, puis de récuperer mes fichiers avec Easy Recovery ? Bien entendu, je ne compte pas essayer si ce n'est pas possible.
Auteur : romsk
Réponse le : 22/08/2006 20:56
Message :
En fait je peut voir mon disque dur grâce à une manip que j'ai fais dans le gestionnaire des disques (il me le voyait en non alloué au début, j'espère que ma manip n'a pas tout fait merder) : de quelle manip tu parles ? et quand l'as-tu faite ? Dans PTEDIT, au début, il y'avait marquer 55 à la place de 07 dans le type. Je l'ai changé avant de montrer les screens de testdisk : intéressant car 55 est un code de type installé par EZ-DRIVE qui, je crois, est un gestionnaire de boot qui s'installe dans le MBR pour modifier la géométrie des disques et dépasser les limitations du BIOS, ce qui expliquerait certaines choses... Le problème est que je n'ai pas accès à Boot Record quand je clic sur 07, alors qu'avec mes autres disques dur je peut : ce qui signifie que ton secteur de boot de la partition est corrompu, ce qu'on savait puisque testdisk a dit "boot sector bad"... On m'a également dit que si je faisais un formatage rapide en NTFS de mon disque dur, les fichiers étaient effacés mais toujours présents physiquement. Es-ce que ce ne serait pas une solution de formater en rapide, puis de récuperer mes fichiers avec Easy Recovery ? Bien entendu, je ne compte pas essayer si ce n'est pas possible. : c'est exact (le formatage rapide n'efface que la table d'allocation des fichiers), mais que se passe t'il si easy recovery marche pas ??? de toute façon c'est toujours une manip que tu pourras faire plus tard si rien d'autre ne marche... mais t'as pas répondu à mes questions : * as-tu redémarré l'ordi pour voir si tu vois à nouveau ton DD. * sinon que montre maintenant testdisk comme geométrie (a t'il bien intégré 19929 - 255 - 63 ?) et comme secteur de boot dans advanced ? et PTEDIT ? selon tes réponses on pourra, entre autre, aller réparer le secteur de boot avec tesdisk, ou encore remettre 55 dans PTEDIT et refaire testdisk, etc...
Auteur : Romano91
Réponse le : 22/08/2006 21:38
Message :
Tout d'abord je tenais à te dire que c'est un réel plaisir d'être aider par toi. Tu es clair et très précis dans tes explications La manip que j'ai faite pour pouvoir voir mon disque dur, est que j'ai fais comme si je voulais créer une partition. Je l'ai fais avant de voir toutes tes explications avec testdisk et ptedit. Pour Easy Recovery, j'ai déjà fais un test pour mon disk dur, et mes fichiers sont accessibles, je peut, au pire, pouvoir les copier sur un autre disque dur (mais bon, 150 go à copier... Je n'ai pas de disque dur de dispo, et mes amis non plus.) J'ai en effet redémarrer mon ordi, et non, cela n'a rien changé. Pour mon disque dur il me marque : 163 GB / 152 GB - CHS 317632 16 63, sector size=512 Dans PTEDIT j'ai dans "Ending" : Cyl 1023 Head 15 Sector 63 Je ne comprends pas tout...
Auteur : romsk
Réponse le : 22/08/2006 21:58
Message :
...c'est un réel plaisir ... partagé [bigsmile] La manip que j'ai faite pour pouvoir voir mon disque dur, est que j'ai fais comme si je voulais créer une partition : jusqu'où t'es allé ? t'as créé une partition ? non, cela n'a rien changé : CHS 317632 16 63, sector size=512 alors retourne dans testdisk > geometry > mets les valeurs > ok > write > redémarre...
Auteur : Romano91
Réponse le : 22/08/2006 23:53
Message :
Je crois que j'ai créer une partition, enfin je ne suis pas sûr. En tout cas mes fichiers sont quand même accessibles par Easy Recovery (j'ai fais le test après). Au risque de passer pour quelqu'un de stupide, je ne trouve pas la fonction "write". Voici un screen de ce que ça me donne : [img width=650 height=487]http://rox91.free.fr/diskdurdefect4.JPG[/img] Egalement, je n'avais pas vu que dans Head j'avais 16 au lieu de 255 et dans Cylinder 19930 au lieu de 19929... (Cylinder change à chaque fois que je relance testdisk, tant que je n'ai pas fais "write", comme tu me demande de faire.)
Auteur : romsk
Réponse le : 23/08/2006 00:07
Message :
en réalité, y'a peut être pas "write" quand on modifie la géométrie... par contre, une fois que tu l'as modifiée avec les bonnes valeurs (comme sur ta capture d'écran), va tout de suite sur le menu "advanced" > boot > et regarde si le secteur de boot est bon ou s'il est toujours bad : si bad il faut corriger le secteur de boot tout de suite (et valider par write ou valid ou ok...) avant de fermer testdisk. PS : on reprendra ça demain si tu veux bien [dormir]
Auteur : Romano91
Réponse le : 23/08/2006 00:48
Message :
Voici ce que me donne testdisk : [img width=650 height=487]http://rox91.free.Fr/diskdurdefect5.JPG[/img] Bien, on reprendra demain. Bonne nuit ! [smile]
Auteur : romsk
Réponse le : 23/08/2006 06:46
Message :
fleche droite sur "backup BS" > entrée > write si demandé > quit > redémarre
Auteur : Romano91
Réponse le : 23/08/2006 14:42
Message :
Ca marchhhhhheeee !!! Romsk président !!! [fete] Un grand, grand, grand merci. C'est plutôt rare de voir quelqu'un autant s'interesser à un problème. Je laisse les screens sur mon ftp, si ça peut aider quelqu'un à résoudre le même problème ! Merci encore, merci, merci ! [amour]
Auteur : romsk
Réponse le : 23/08/2006 15:30
Message :
[top] content pour toi romano91 [trinquer3] [fete]
Auteur : dragondivin
Réponse le : 28/08/2006 00:20
Message :
Bonsoir, alors avant toute chose je voudrais présiciser que c'est la seconde fois que je rencontre ce pb de disque (externe) qui passe en RAW! la 1ère fois remonte à Août 2005 ou là pour résoudre se soucie, j'ai due investir dans un nouveau DD de capacité équivalante et fais l'utilisation de "Getdataback For Ntfs v2.31" pour récupérer mes données avant de le formaté! et coincidance ou pas, mais un an plus tard (je parirais sur le jour pour jour) c'est à dire dans la soiré du 27/08, le RAW est revenu hanté le même disque! je tenais à te remercier Romsk pour avoir pensé à créer ce topic et comme écrivait Romano91 c'est vraiment très clair et présit dans tes explication! malheureusement pour moi le pb demeur! je m'explique; procédure: - choix du disque: Disk /dev/sda - 200 GB / 186 GiB Disk /dev/sdb - 203 GB / 189 GiB Disk /dev/sdc - 300 GB / 279 GiB celui qui intéresse est le dernier à 300Go (sdc) -Proceed -Intel -Analyse .......partition..................start............end........size in sectors 1..*.HPFS.-.NTFS.........0...1..1..36482..254..63....586099332 -Proceed .......partition..................start............end........size in sectors 1..*.HPFS.-.NTFS.........0...1..1..36482..254..63....586099332 -Entrer .......partition..................start............end........size in sectors 1..*.HPFS.-.NTFS.........0...1..1..36482..254..63....586099332 -Write -Y -Ok ensuite je reviens à l'écran des choix Disk /dev/sdc - 300 GB / 279 GiB - CHS 36483 255 63 et je continue avec: -Advanced .......partition..................start............end........size in sectors 1..*.HPFS.-.NTFS.........0...1..1..36482..254..63....586099332 -Boot .......partition..................start............end........size in sectors 1..*.HPFS.-.NTFS.........0...1..1..36482..254..63....586099332 Boot sector OK Bachup boot sector OK Sectors are identical et la je quitte 4 fois! résultat? j'ai toujours ce RAW qui lui colle à la peaux, des données que je ne peux me permèttre de perdre et je suis dans une situation telle que je ne peux pas non plus racheter un autre disque pour sauver ce qu'il y a sur celui-ci! alors que faire? es-ce que je me suis trompé dans la procédure? manque t'il qqch? si vous pouviez répondre à ces questions et résoudre mon pb je vous en serais redevable pour longtemps!
Auteur : romsk
Réponse le : 28/08/2006 06:47
Message :
salut dragondivin, celui qui intéresse est le dernier à 300Go (sdc) : t'es sûr déjà que c'est bien celui ci ?... analyse - Proceed - entrée - write... : tu n'as qu'une seule partition sur ce DD ? t'as pas fait search ? menu Advanced - boot... : ça confirme que ton problème de RAW ne vient apparemment pas de là... t'es bien en RAW dans propriétés du disque ? fais déjà analyse > search... fais aussi une copie d'écran de PTEDIT (partitions disparues dans ma signature) et du secteur de boot avec PTEDIT (y'a parfois des discordances avec testdisk...)
Auteur : dragondivin
Réponse le : 28/08/2006 17:07
Message :
oui Romsk, c'est bien celui-ci... j'avais aussi fais le analyse > search sans savoir à quoi y servait mais y'a bien une seule partition puisque c'est un disque de stokage! (tous mes DD externe et pas ont une partition unique sauf le système ou il y a 2 partitions). je voudrais bien te faire une capture mais je ne sais pas comment l'importée à mon post! alors je vais le transcrire: Hard Disk [ Drive 3 (286181 MB) ] 36483 cyl, 255 heads, 63 sectors per track partition Table at Sector 0 (cyl 0, head 0, sector 1) : ..........................Starting........................Ending.........................Sectors .....Type....Boot....Cyl....Head....Sector.......Cyl.......Head....Sector....Before....Sectors 1...[07].....[80].....[0]....[1].......[1]..........[1023]...[254]....[63].......[63].......[586099332] 2...pour le reste y'a zéro partout quand je fais Set Type y me montre que je suis bien en NTFS alors que dans les propiété du DD je suis en RAW et aucun espace n'est alloué alors que j'ai 200Go de données dessus et que je peux les voir avec un logiciel de récupération des données! maintenant avec Boot Record: 1. Jump......................EB5290 (hex)....13. Hidden Sectors....................63 2. OEM Name...............NTFS..............14. Total Sectors (>32MB)..........0 3. Bytes per Sector.......512................15. Unused..............................80008000 (hex) 4. Sectors per Cluster....8...................16. Total NTFS Qectors.............586099331 5. Reserved Sectors......0...................17. MFT Start Cluster................786432 6. Number ot FATs........0...................18. MFT Mirror Start Cluster.......36631208 7. Root Dir Entries.........0...................19. Cluster per FRS...................246 8. Total Sectors...........0...................20. Cluster per Index Block.........1 9. Media Descriptor.......F8.................21. Serial Number......................F2E45F2DE45EF379 (hex) 10. Sector per FAT.......0...................22. Checksum..........................0 (hex) 11. Sector per Track.....63.................23. Signature...........................AA55 (hex) 12. Number of Heads.....255 moi je ne vois rien de particulier, tout me semble correcte! je voudrais savoir ce que tu en pense Romsk.
Auteur : romsk
Réponse le : 28/08/2006 18:20
Message :
en tout cas BRAVO, t'as fait ça très bien [chinois], mais t'aurais moins perdu de temps à rechercher sur le forum comment faire une capture d'écran [clindoeil] (clic sur rechercher tout en haut et tape "capture d'écran", tu trouveras le topic de MJo 54 très bien fait...) pour en revenir à ton problème, tu es un exemple de plus que RAW peut être lié à différents problèmes : dans ton cas ça ne semble pas être un problème de partition disparue (search t'a rien trouvé de plus), ni de table de partition (normale dans PTEDIT), ni de secteur de boot (normal dans testdisk ainsi apparemment que pour PTEDIT à ce que je vois...) * commence par faire un chkdsk de ton drive 3 (vérifie la lettre qui lui est attribuée dans la gestion des disques, appelons-le "X") : démarrer > exécuter > tape "cmd" > tape "chkdsk X: /F /R" * si ça marche pas peut être un MFT corrompu ? (je dis bien peut être car on est sûr de rien pour les passages en RAW...) : retourne dans testdisk > menu advanced > boot > positionne toi sur "repair MFT" : entrée --> si la MFT est OK un message va te le signaler... * si ça ne donne rien, ben j'ai pas vraiment d'autre idée pour l'instant (je continue à explorer le sujet et toutes les expériences personnelles sont les bienvenues [clindoeil]) peut être un problème de BdR (je vais bientôt me pencher là dessus) ? peut être essayer de le sortir de son boitier externe et le mettre en esclave sur un port IDE à l'intérieur de ton PC (ça peut suffire parfois...) edit : je serais quand même curieux de voir à quoi ressemble le MBR de ce drive 3 : télécharge Edithexa sur internet > installe le et ouvre le > clique sur la 3ème case (je crois) en haut à gauche pour montrer tes lecteurs > clique sur ton drive 3 : et fais une copie d'écran du tableau qui va apparaitre (correspond au MBR de ton drive 3)
Auteur : dragondivin
Réponse le : 28/08/2006 21:48
Message :
tu doit avoir raison pour la MFT! car quand j'ai fais le repair MFT, il me dit qu'elle est conrrompu et de lancer chkdsk! l'ennui c'est que chkdsk fait un abandon et donne se message : impossible de déterminer la version et l'état du volume capture MBR [img width=650 height=520]http://img102.imageshack.us/img102/941/capturembral5.jpg[/img]
Auteur : dragondivin
Réponse le : 28/08/2006 21:58
Message :
la 1ère capture est faite en sélectionant le DD concérné dans la partie lecteurs logiques! celle qui suit est faite en le sélectionant dans la partie supports physiques! [img width=650 height=520]http://img211.imageshack.us/img211/2923/capturembrphyslg4.jpg[/img]
Auteur : romsk
Réponse le : 28/08/2006 23:27
Message :
ta 1ère capture correspond au secteur de boot de la partition, c'est la 2ème qui correspond au MBR du DD en question : et tout a l'air effectivement correct... si ce n'est la signature disque de 1B8 à 1BB (ligne 1B0, colonnes 8 à B)qui n'a pas les 2ème et 4ème octets identiques comme on le voit d'habitude ? va voir dans la BdR > déroules la clé HKEY_LOCAL_MACHINE\SYSTEM\ControSet001\Enum\Storage\Volume > et regardes si tu trouves une ou plusieurs clés contenant ....Signature61297E61Offset... A part ça MBR et secteur de boot semblent OK... * dans un 1er temps essaye de mettre ton DD externe sur une nappe IDE directement branchée sur la CM, chkdsk marchera peut être mieux. * si pas de meilleur résultat fais un chkdsk sous la console de récupération en bootant sur le CD d'XP (des fois ça marche mieux car XP n'étant pas lancé il y a moins de problèmes) * si aucun moyen de faire un chkdsk on essayera d'aller changer la MFT avec PTEDIT pour voir
Auteur : dragondivin
Réponse le : 29/08/2006 00:25
Message :
je ne trouve une seule clé! mais es-ce qu'il y aurais des modifications à apporter sur certaines de ces valeurs? le teste du DD en interne je le ferais un peu plus tard car je ne peux rebooter pour le moment! [img width=650 height=520]http://img179.imageshack.us/img179/3392/baseregistresq7.jpg[/img]
Auteur : romsk
Réponse le : 29/08/2006 06:43
Message :
regarde aussi dans HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\STORAGE\RemovableMedia, et dans HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\USBSTOR. (mais c'est vrai qu'en USB ou Firewire ça complique les choses)
Auteur : laparade
Réponse le : 29/08/2006 10:45
Message :
Quel boulot tu fais, romsk !! Chapeau et MERCI !
Auteur : dragondivin
Réponse le : 29/08/2006 11:45
Message :
C'est vrais merci encore Romsk! je suis retourné dans la BdR et je n'ai vu aucune clé qui serais en double, d'ailleur je suis incapable de déchiffré quoi que ce soit! http://img201.imageshack.us/img201/7384/capturebdrfx1.jpg
Auteur : romsk
Réponse le : 29/08/2006 12:10
Message :
[hello] merci laparade [smile] (faudra bien qu'on arrive à trouver ce que c'est ce raw...) une corruption de la BdR est, je pense, une des pistes notamment avec cette histoire de signature disque qu'on doit retrouver normallement dans les clés que j'ai indiquées et qui, comme par hasard, n'apparaissent pas chez dragondivin [idee] (à suivre...) dans l'immédiat met le donc en "interne" (je veux dire dans le PC [chut] [bigsmile])
Auteur : Pokkara
Réponse le : 07/09/2006 20:52
Message :
Tout d'abord 1000 MERCIS pour ce tuto et vos posts qui m'on bien aidé à me sentir moins seul [pleurer]
Si le secteur de boot est endommagé, les données ne sont plus accessibles. Windows affichera "The drive is not formatted, do you want to format it now ?" (Le volume n'est pas formaté, souhaitez-vous le formater maintenant ?) Lancer TestDisk > sélectionner le DD à explorer > entrée > sélectionner « intel » > entrée > sélectionner « Analyse » > entrée > « Proceed » > entrée : souvent à ce stade on ne retrouve pas la partition perdue > entrée > « Search » > entrée : dans la nouvelle fenêtre qui apparaitra (après 10 à 20 minutes de scan) il faut vérifier le statut de chaque partition (*, P, L, E, D) et éventuellement modifier par les flèches droite gauche les erreurs visibles (notamment pour les partitions retrouvées qui ont souvent le statut « D ») > entrée > « Write » > entrée > confirmer par « Y ». Pour chaque partition retrouvée, un message d’alerte peut s’afficher du genre « Partition sector doesn't have the endmark 0xAA55 » ou « Boot sector bad » : 5L FAT32.....383..1..1......3736..254..63.......53881947 Boot sector test_FAT : Partition sector doesn't have the endmark 0xAA55 Backup boot sector OK First sectors (Boot code and partition information) are not identical. Second sectors (cluster information) are not identical. Third sectors (Second part of boot code) are not identical. il faut alors utiliser la fonction « Backup boot sector » (si la copie de sauvegarde est OK) ou « Rebuild BS » (s’il n’y a pas de copie de sauvegarde valide)...
C'était exactement le problème que j'avais sur mon Samsung 160Go plein de rush video, de mp3, de photos et de logiciels divers à avoir sous la main... J'ai suivi mot pour mot cette procédure : même messages d'erreur, utilisation de "Backup BS", puis write. Je n'avais qu'une seul partition NTFS de 160Go, avec LBA activé. Donc, je me croyais sorti d'affaire... Au premier reboot - sous W2K SP4 - chkdsk s'est lancé automatiquement et a affiché pendant 15 minutes des messages de type "Suppression du segment d'enregistrement de fichier orphelin". En tout près de 7640 messages (!). De retour dans Windows, le disk (:E) est bien reconnu mais : - je retrouve seulement 4 des repertoires d'origine et 46 fichiers (sur plusieurs milliers) - j'ai 11 file00xx.chk inutilisables. - soit un total de 8Go utilisés (alors que le disk était plein de 140Go de données). En lançant "GetDataBack for NTFS 1.03" (disk endommagé en slave, boot sur un autre disk sain), après 40 minutes de scan il "retrouve" exactement la même arborescence de fichiers! Avec "PC Inspector File Recovery" j'ai un message "Access violation at adress xxxxx in module 'Filerecovery.exe'" et il ne scan rien. Je suis perdu. Est-ce que mon backup de BS était defectueux? Est-ce que j'aurais du faire un "rebuild/reconstruct BS" dans testdisk? Puis-je relancer testdisk avec d'autres option ou recherches plus approfondies? Y-a-t-il un moyen de revenir en arrière (avant le chkdsk qui a tout cassé)? Pourquoi File recovery m'affiche un message d'erreur? Je n'ose pas supprimer le disk dans le gestionnaire de périph Windows (pour que Windows le "retrouve" dans un bon état). Autre précisions : - le disk s'est "cassé" tout seul = Windows a affiché un message alors que je ne l'utilisait même pas (j'étais sur C: en train de surfer). - je n'ai rien écrit dessus depuis le crash. Mes 140Go sont donc bien là mais comment les récupérer?! Merci pour votre aide.
Auteur : romsk
Réponse le : 10/09/2006 23:23
Message :
salut Pokkara, p'têt bien qu'il y a pas mal de secteurs défectueux sur ce disque pour expliquer un tel nettoyage par chkdsk ? tu devrais déjà vérifier ce DD avec le logiciel constructeur qui va bien (ou à défaut HD-tune) Au premier reboot chkdsk s'est lancé automatiquement... : c'est effectivement ce qui se passe habituellement ...et a affiché pendant 15 minutes des messages de type "Suppression du segment d'enregistrement de fichier orphelin". En tout près de 7640 messages... : ça c'est pas glop [triste]. ça signifie que ta structure de fichiers a été modifiée en profondeur (notamment MFT corrompue ++), en gros qu'il n'y avait plus de correspondance entre les noms de fichiers et les données censées correspondre, et dans ce cas chkdsk supprime les noms "orphelins". mais je pense qu'effectivement les fichiers eux mêmes doivent toujours être qqpart sur ta partition et qu'un logiciel de récupération doit pouvoir te les récupérer ? mais lequel ?? Est-ce que mon backup de BS était defectueux? Est-ce que j'aurais du faire un "rebuild/reconstruct BS" dans testdisk? : non, le backup BS est certainement la meilleure option lorsqu'elle est possible et le rebuild BS doit rester la solution ultime... Puis-je relancer testdisk avec d'autres option ou recherches plus approfondies? je sais pas si ça peut marcher, mais pourquoi pas essayer (au point ou tu en es...) : refais search puis advanced et boot et tente un rebuild BS ? Y-a-t-il un moyen de revenir en arrière (avant le chkdsk qui a tout cassé)? pas sûr... il te reste plus qu'à essayer d'autres logiciels de récupération style stellar phoenix ou r-studio par exemple, ou faire appel à des sociétés spécialisées dans la récupération de données si celles ci sont précieuses, mais c'est cher je crois [triste] tiens nous au courant
Auteur : Pokkara
Réponse le : 11/09/2006 22:35
Message :
Hello again! [smile] 65536 mercis pour tes suggestions Romsk! "refais search puis advanced et boot et tente un rebuild BS" J'ai refais 3 search, puis tenté le rebuild... sans succès. R-Studio Le scan fut effrayant : tout plein de "unrecognized" sur le disque; un vrai gruyère... Mais, mais, au milieu d'un immense désordre (4 partitions, avec des vieux trucs en FAT12!) il a retrouvé tous mes fichiers (à première vue). Ces derniers sont classés dans des répertoires en fonction de leur extension, sans le nom des fichiers, ni leur date. Un test sur une photo jpeg < 64kb me montre que les données sont nickel! [fete] Ai-je néanmoins une chance de retrouver plus d'infos à propos des fihciers avec d'autres outils? (nan, si j'ai bien tout compris). CONCLUSIONS 1/ Il faut faire des backups! [dent] 2/ Pour les MP3, grace aux tags je vais m'éviter de rescanner tous mes CDs [clindoeil] Il faut taguer ses MP3! 3/ Pour les photos, j'aurais du renseigner les champs de métadonnées EXIF avec des dates, voire des descriptions. Je ne l'ai pas fait hélas. J'ai commencé à cherché sur le net des outils pour taguer les jpeg automatiquement. ACDSee (livré avec mon Pentax Optio) permet de mettre une date sur plusieurs photos. D'autres outils (http://www.flickr.com/forums/help/2343/) semblent permettre de faire un peu plus. Je prévois désormais d'attribuer à mes photos une description qui corresponde aux noms des répertoires dans lesquels je les classe (sous la forme "2006-05 Vacances ski"). Ainsi, en cas de crash, je pourrai rapidement reconstituer mes données. 4/ Sinon, je vais regarder du côté des outils (simples, pas Ghost) de backup/restore des données HD (table de partoche, MBR, etc) pour faire des sauvegardes automatiques régulières vers un autre disque/PC. Je vous tiens informé si j'avance là-dessus. Bonne chance à tous et surtout ne perdez pas espoir!
Auteur : romsk
Réponse le : 11/09/2006 22:48
Message :
[bierre] content pour toi si t'as pu récupérer tout ou partie de tes données... quant à tes conclusions elles sont pleines de bon sens : 1) surtout la 1ère qu'on ne rappelle jamais assez souvent [langue] 2) et la 4ème que j'ai prévu de mettre en topic prochainement [clindoeil]
Auteur : zouzou_42
Réponse le : 10/10/2006 17:43
Message :
Boujour et oui c encore moi dsl. Je test maintenant avec testdisk et j'obtiens ceci: http://img145.imageshack.us/img145/9751/sanstitre2iw7.png En vous remerciant.@+
Auteur : romsk
Réponse le : 10/10/2006 22:10
Message :
décidément faut que tu fasses tes copies d'écran plus grosses [clindoeil] (fais les en jpg pas png...)
Auteur : zouzou_42
Réponse le : 11/10/2006 19:03
Message :
Salut j'éspère que cette fois c la bonne. En tout cas merci et a bientot. [URL=http://imageshack.us][img width=650 height=322]http://img279.imageshack.us/img279/3775/sanstitre2fm1.png[/img][/URL]
Auteur : liamneil
Réponse le : 24/10/2006 11:42
Message :
Bonjour romsk, bonjour à tous ! [hello] D'abord bravo pour cet excellent topic. [bierre] J'ai choisi d'exposer mon problème ici, mais si il faut le changer de place, dites le moi. Lors d'une restauration malheureuse de mon système avec True image 9, la partition C a bien été restaurée, mais toute les autres ont disparu (sauf la partition de sécurité gérée par true image). J'avai vu le topic de romsk, sans penser qu'un jour j'en aurais besoin, je me suis donc plongé dedans et j'ai obtenu ceci [img width=650 height=399]http://img86.imageshack.us/img86/6788/24102006bisij9.jpg[/img] Avant de valider quoi que ce soit, j'aimerais l'avis de romsk ou d'une autre personne qui s'y connaisse un peu. J'ai bien les 6 partitions logiques supplémentaires qui avaient disparu. Mon incertitude porte sur le chiffre 280 703 745, qui ne peut pas être une taille de partition puisque mon DD fait 150 Go. [nonnon] Merci de votre aide Liam.
Auteur : romsk
Réponse le : 24/10/2006 13:13
Message :
salut liamneil, le "280 703 745" correspond à la taille de la partition étendue renfermant toutes tes partitions logiques (= somme de toutes les partitions logiques), et si tu rajoute ce chiffre aux "40 965 687" secteurs de ta partition système, tu retrouves bien tes 150 Go... donc tu peux faire "write" et ça devrait être bon, mais avant de fermer testdisk va vérifier dans advanced > boot que les secteurs de boot des différentes partitions retrouvées soient OK... (puis redémarre l'ordi)
Auteur : liamneil
Réponse le : 24/10/2006 15:50
Message :
Salut romsk
romsk a écrit : 
salut liamneil, le "280 703 745" correspond à la taille de la partition étendue renfermant toutes tes partitions logiques (= somme de toutes les partitions logiques), et si tu rajoute ce chiffre aux "40 965 687" secteurs de ta partition système, tu retrouves bien tes 150 Go... donc tu peux faire "write" et ça devrait être bon, mais avant de fermer testdisk va vérifier dans advanced > boot que les secteurs de boot des différentes partitions retrouvées soient OK... (puis redémarre l'ordi)
Quel rapidité ! [bierre] Bon, je vais faire comme tu dis et je te tiens au courant. Déjà, un grand merci pour ce sujet qui est vraiment super abordable, même pour un néophyte comme moi. Tout l'esprit de ce forum est résumé par ta démarche : tout le monde apporte sa contribution à la hauteur de ses compétences, et elles sont souvent très élevées, bien plus que chez certains vendeurs de matériel informatique qui ne cherchent pas forcément à avoir une relation intelligente avec leurs clients. Par la suite, j'irai cliquer dans tes liens, question de découvrir un peu plus de choses, je suis sûr que c'est intéressant. Cordialement. Liam.
Auteur : liamneil
Réponse le : 24/10/2006 17:56
Message :
[hello] Salut romsk [hello] Salut à tous ! Tout va bien, j'ai tout retrouvé ! ça n'était sans doute pas aussi évident au départ, mais là, je dois dire que c'est encore mieux que de la récupération de données (opération qui m'a coûté 125 € par le passé, toujours pour la même raison d'ailleurs, : true image qui décide de faire l'impasse sur les partitions ! A ce détail près que cette fois là, il m'avait aussi empêché d'accéder au system C, en supprimant hal.dll. La totale). Donc, adieu true image, avec les économies de faites j'ai acheté Norton save and restore (technologie Ghost 10). Je ne fais pas de pub, car je n'ai pas encore pu apprécier la qualité de ce logiciel. En tout cas, s'il ne fonctionne pas mieux que le précédent, je pourrai toujours avoir recours à testdisk, et là : chapô à Mister Grenier, ainsi qu'à romsk pour son aide précieuse. Liam.
Auteur : romsk
Réponse le : 24/10/2006 18:42
Message :
[bierre] content pour toi liamneil, et surtout, comme tu le dis, un grand bravo à christophe Grenier (vous pouvez d'ailleurs lui envoyer vos remerciements sur son site, ça lui fera certainement plaisir [clindoeil])
Auteur : niob
Réponse le : 24/10/2006 20:43
Message :
[bierre][url="http://forum.pcastuces.com/sujet.asp?page=-1&SUJET_ID=126033&REP_ID=1976772"]TestDisk & PhotoRec 6.5[/url]
Auteur : liamneil
Réponse le : 24/10/2006 20:59
Message :
salut niob
niob a écrit : 
[bierre][url="http://forum.pcastuces.com/sujet.asp?page=-1&SUJET_ID=126033&REP_ID=1976772"]TestDisk & PhotoRec 6.5[/url]
C'est vrai, j'ai vu que photo rec se trouvait dans le dossier Testdisk. Sais-tu à quoi il sert?
Auteur : niob
Réponse le : 24/10/2006 21:16
Message :
liamneil a écrit : C'est vrai, j'ai vu que photo rec se trouvait dans le dossier Testdisk. Sais-tu à quoi il sert?
scanne le disk pour trouver les fichier effacé/perdu ...
PhotoRec will try to locate the following files [X] png Portable/JPEG/Multiple-Image Network Graphics [X] 7z 7zip archive file [X] asf ASF, WMA, WMV: Advanced Streaming Format used for A [X] au Sun/NeXT audio data [X] bkf MS Backup file [X] bmp BMP bitmap image [X] bz2 bzip2 compressed data [X] crw Canon Raw picture [X] ctg Canon catalog [X] cwk AppleWorks [ ] dbf DBase 3, prone to false positive [X] FAT subdirectory [X] djv DjVu [X] doc Microsoft Office Document (doc/xls/ppt/vis/...) [X] dsc Nikon dsc
Auteur : liamneil
Réponse le : 25/10/2006 10:25
Message :
salut Niob, S'il est aussi efficace que testdisk, je l'adopte ! Merci.
Auteur : romsk
Réponse le : 25/10/2006 16:03
Message :
photorec s'adresse plutôt aux photos perdues sur cartes mémoires et testdisk aux partitions ou DD non reconnus...
Auteur : zitoni
Réponse le : 27/10/2006 18:57
Message :
Bonjour romsk bonjour aux autres. Pour commencer bravo pour cet excellent topic. Lors d'une tentative de fusion des deux partition ce trouvant sur mon 2ème Disque Dur, le mal nommé Partition Magic a arrêté sont travail suite à une erreur qu'il a rencontré (mismatch ou quel que choses y ressemblant je ne me rappel plus précisément). Depuis ca "hier" donc l'une de ces 2 partition est inaccessible (la 1ere est toujours accessible j'arrive a booter sur sont OS "W XP" et la 2ème faisais environ 230GO et inaccessible). J'ai essayé de récupérer les données mais la majorité est corrompus. J'ai essayé de me servir de Testdisk , je dois avouer que je mis suis perdu. J'ai fait les screenes suivant: [img width=650 height=327]http://img110.imageshack.us/img110/6742/testdisk01ef0.jpg[/img] [img width=650 height=328]http://img120.imageshack.us/img120/7272/testdisk02fu7.jpg[/img] [img width=650 height=327]http://img109.imageshack.us/img109/388/testdisk03en8.jpg[/img] Quand à PTEDIT32 il ne ce lance pas. [img]http://img46.imageshack.us/img46/5512/testdisk04se0.jpg[/img] Y as t-il un espoir de récupérer la partition inaccessible. Merci de votre aide. Zitoni.
Auteur : romsk
Réponse le : 28/10/2006 00:39
Message :
salut zitoni, quand tu es sur cet écran : [img width=650 height=327]http://img109.imageshack.us/img109/388/testdisk03en8.jpg[/img] - met toi d'abord sur la 2eme ligne > fleche droite gauche pour transformer le "P" de début de ligne en "E" - puis tu te mets sur la 3eme ligne et tu tapes "P" pour vérifier que tes fichiers soient bien retrouvés - si c'est le cas tu fais entrée > write > va dans le menu advanced > met toi sur la partition retrouvée et met toi sur "boot" avec les fleches droite gauche : si tout semble OK quitte testdisk et redémarre l'ordi, si problème dans le secteur de boot fais une copie d'écran...
Auteur : zitoni
Réponse le : 28/10/2006 03:02
Message :
Et bien en faite je n'arrive pas à transformer le "P" de début de ligne en "E". je ne sais pas trop comment je suis arrive à ce résultat (j'espère ne rien avoir fait l'irréversible car depuis hier je touchais à TestDisk): [img width=650 height=324]http://img226.imageshack.us/img226/4251/testdisk05md0.jpg[/img] [img width=650 height=325]http://img226.imageshack.us/img226/1848/testdisk06ek4.jpg[/img] Sur la partition bootable et sur la partition primaire en faisant "P" pour vérifier que mes fichiers soient bien retrouvés TestDisk me dit: Can't open filesystem. Pourtant dans mon explorateur je vois toujours ma 1ère partition très bien les fichiers qui se trouvent et j'arrive à booter dessus.Pour l'autre partion je la vois enfin mais j'y vois aucun fichier elle me semble vide. Dans le menu advanced > quand je me mets sur les partitions sur "boot" j'obtiens ça: [img width=650 height=327]http://img49.imageshack.us/img49/517/testdisk07cm3.jpg[/img] [img width=650 height=327]http://img120.imageshack.us/img120/4495/testdisk08wx6.jpg[/img] Merci d'avoir répondu aussi rapidement romsk. zitoni.
Auteur : plaky
Réponse le : 28/10/2006 09:18
Message :
Salut, alors d'abord comme les autre: chapeau bas t'as l'air de tres bien maitriser le sujet! bon allé j'y vais de ma petites question a moi qui m'interesse: Voila j'ai une clé USB Dane Elec 512Mo pour ne pas les citer, et comme tu l'auras deviner elle s'est mise en RAW ce qui fait que le gestionaire de disque la voir bien avec sa taille mais "illisible" lorsque je vais sur la bibliothéque de media amovible elle apparait comme étant "inactf" Là commence mes reel souci, je m'xplique: PTEDIT32 ne peut pas lire les info => toutes les case sont a zero! et TESTDISK me reconnais bien le media il l'analyse et trouve...ZERO partition Lorsque je lance une deuxieme analyse je me retrouve avec des trucs du genre : read error 1/2/1 pas moyen de changer la geometrie de la partition! (je voulais juste verifier que les premier secteur etaient pas morts) Pas moyen de reecrire une MBR sur la clé=> Writh error donc voila sachant que la question est purement academique pour moi (ayant racheter une autre clé plus grande et moins cher et n'ayant pas de données ultra sensible sur ma clé) Donc 1) y a t'il moyen de remettre la clé sur "actif" dans le gestionnaire de disque? 2) y a t'il moyen de recuperer ma clé pour en faire autre chose qu'un pendantif ( la mode des puces punaisé sur les pulls etant passer depuis un moment je ne voudrais pas faire du reviveul avec les clés USB)! lol ps: tien? testdisk ne me reconnais meme plsu les disque, ca s'amelore!
Auteur : romsk
Réponse le : 28/10/2006 16:15
Message :
zitoni a écrit : 
Et bien en faite je n'arrive pas à transformer le "P" de début de ligne en "E". [img width=650 height=324]http://img226.imageshack.us/img226/4251/testdisk05md0.jpg[/img]
ben je comprend pas ce que tu dis puisqu`on voit bien que tu l`as mise en "E" [confus] refais STP analyse > proceed : copie d`ecran, puis search : copie d`ecran...
Auteur : romsk
Réponse le : 28/10/2006 16:26
Message :
salut plaky, PTEDIT32 ne peut pas lire les info => toutes les case sont a zero! : ce qui indique a priori que le MBR (ou en tout cas le descripteur de partition) est corrompu et TESTDISK me reconnais bien le media il l'analyse et trouve...ZERO partition : y compris en faisant search 2 ou 3 fois de suite ? Lorsque je lance une deuxieme analyse je me retrouve avec des trucs du genre : read error 1/2/1 .... Pas moyen de reecrire une MBR sur la clé=> Writh error : peut etre bien que ta cle est effectivement naze ? fais une copie d`ecran de ce que montre PTEDIT et testdisk (on essayera sous PTEDIT de remettre les bonnes valeurs dans le descripteur de partition). essaye aussi de regarder comment apparait le MBR de cette cle avec EditHexa (dans ma signature)
Auteur : liamneil
Réponse le : 28/10/2006 17:13
Message :
Salut à tous, Salut romsk, Je suis sur le site de CGSECURITY et je constate qu'une nouvelle version de testdisk existe, la 6.5 du 22 octobre. Je l'ai téléchargée, pour voir les différences, mais tu peux peut-être nous en dire plus? Merci
Auteur : zitoni
Réponse le : 28/10/2006 19:20
Message :
Voici les 2 copies d'écrans: [img width=650 height=328]http://img131.imageshack.us/img131/3373/testdisk09kl9.jpg[/img] [img width=650 height=327]http://img112.imageshack.us/img112/2817/testdisk10ec8.jpg[/img] Pour la première partition j'ai le choix entre "D", "P" et "*" . Pour la deuxième partition j'ai le choix entre "D", "P" et "*" . Pour la troisième partition j'ai le choix entre "D", "P", "*" et "L". C'est étonnant pour la seconde partition il ne me propose pas le choix "E".
Auteur : plaky
Réponse le : 29/10/2006 09:25
Message :
Alors pour ce que dit PTEDIT32: [img]http://img246.imageshack.us/img246/865/sanstitre1ww9.gif[/img] [img]http://img172.imageshack.us/img172/1132/sanstitre2sx7.gif[/img] Pour ce qui est de TestDisk-6.5: [img width=650 height=326]http://img169.imageshack.us/img169/770/sanstitre3df6.gif[/img] A la premiere recherche: [img width=650 height=325]http://img148.imageshack.us/img148/1788/sanstitre4ab0.gif[/img] Voila le message d'erreur que j'obtient ( X fois): [img]http://img291.imageshack.us/img291/2578/sanstitre5zu3.gif[/img] en deuxieme analyse j'ai ca: [img]http://img145.imageshack.us/img145/4627/6gz2.gif[/img] a la troisieme recherche: [img]http://img155.imageshack.us/img155/7328/8cx3.gif[/img] Quand j'essais de copie une MBR voila ce que j'ai: [img]http://img169.imageshack.us/img169/8302/9pf5.gif[/img] Bon je vais me battre avec Hexa edit et je mets le resultat dans le post suivant ( faut laiser une peu respirer les autres! [bigsmile])
Auteur : plaky
Réponse le : 29/10/2006 10:57
Message :
RE, Donc voila le resultat de Hexaedit ( je sens qu'on vas jouer un requiem pour ma clé!): [img width=650 height=487]http://img139.imageshack.us/img139/1450/10lo8.gif[/img] Je sais pas pourquoi je me retrouve avec une 'errur de redondance cyclique"! lol la redondance cyclique ne m'a jamais porter chance donc:Tous etant a 0 je pense que ca veux dire que.... l'est morte de sa mort final ma clé? ( au passage là je ne me fait plus d'illusion adieux les données qui étaient dessus)
Auteur : romsk
Réponse le : 29/10/2006 13:57
Message :
zitoni a écrit : [img width=650 height=327]http://img112.imageshack.us/img112/2817/testdisk10ec8.jpg[/img] ...C'est étonnant pour la seconde partition il ne me propose pas le choix "E".
oui et non : en realite c`est pas genant car quand tu vas mettre la 3eme en "L", il va te mettre automatiquement la 2eme en "E"... donc met le 1ere en "*", laisse la 2eme em "D" et met la 3eme en "L" > puis fait entree > write > va dans le menu advanced > selectionne la partition en "L" > boot : copie d`ecran [hello] liamneil, je regarderai cette nouvelle version 6.5 pour voir ce qu`elle apporte de plus... plaky je la sent mal barree ta cle : on dirait bien qu`il y a des secteurs defectueux... peut etre un coup d`HDD regenerator ? (je sais pas si ca marche avec les cles USB...), mais ca ne reglera pas ton probleme de MBR qui a ete completement efface et vu que testdisk refuse de t`en reecrire un... je ne pense pas que fixmbr puisse ecrire sur une cle, et je ne crois pas que fdisk /mbr fera mieux... sinon, sous edithexa essayer de copier le MBR du DD et le mettre sur le 1er secteur de ta cle puis il ne restera plus qu`a rentrer le descripteur de partition ??? mais je pense que le plus simple est effectivement de prendre l`option pendentif [bigsmile]
Auteur : plaky
Réponse le : 29/10/2006 14:14
Message :
Bon...Ben... je cvais tester ca et puis... PAix a son âme ce fut une bonne clé! Encore une fois merci et chapeau romsk! Pour ceux qui aurait le meme souci : voila c'est fini, on vas pas se dire au revoir comme sur le quai d'une gare......
Auteur : liamneil
Réponse le : 29/10/2006 14:42
Message :
Salut romsk, salut à tous,[hello]
romsk a écrit : 
[hello] liamneil, je regarderai cette nouvelle version 6.5 pour voir ce qu`elle apporte de plus... plaky je la sent mal barree ta cle : ...... mais je pense que le plus simple est effectivement de prendre l`option pendentif [bigsmile]
Ben certaines clés sont très jolies et avec la baisse des prix ça devient un bijou très abordable [bigsmile] Désolé plaky [rougir] J'aurais pas aimé que ça m'arrive, je crois que le bijou en question serait passé par le trou des ... plutôt que de me le mettre autour du cou ! [feroce]
Auteur : zitoni
Réponse le : 29/10/2006 15:04
Message :
Voici la copie d'écran du menu advanced > de la partition en "L" > boot : [img width=650 height=326]http://img143.imageshack.us/img143/7790/testdisk11nt2.jpg[/img]
Auteur : romsk
Réponse le : 29/10/2006 15:34
Message :
liamneil a écrit : ...le bijou en question serait passé par le trou des ...
j`avais effectivement egalement pense a l`option suppositoire, mais bon, on va pas rajouter la douleur a la peine [bigsmile] zitoni : status OK, sectors identiques, tout a l`air bon... quitte testdisk, redemarre l`ordi et [fete]...
Auteur : zitoni
Réponse le : 29/10/2006 15:49
Message :
romsk : j'ai redémarré l'ordi la partition est visible dans l'explorateur quand j'essaye de voir sont contenu j'ais le message suivant : [img]http://img91.imageshack.us/img91/3053/inaccessibleqz2.jpg[/img]
Auteur : romsk
Réponse le : 29/10/2006 15:55
Message :
demarrer > executer > tape "cmd" > a l`invite tape "chkdsk J: /F /R" et regarde ce que ca donne...
Auteur : zitoni
Réponse le : 29/10/2006 16:08
Message :
Après avoir taper cette commande cela donne ceci : [img width=650 height=150]http://img193.imageshack.us/img193/4199/chkdskfh6.jpg[/img]
Auteur : romsk
Réponse le : 29/10/2006 16:53
Message :
refait la même commande sous la console de récupération (en bootant sur le CD d'XP) et sans spécifier "J:" (ça analysera tout le DD)
Auteur : plaky
Réponse le : 29/10/2006 17:48
Message :
Cher amis, ayons une pensé pour une pauvre clé USB de 512Mo! En effet aujourd'huis a 17h44 ( heure de paris dans les bouches du rhone) celle ci a eté declarer definitivement morte par son propriétaire du fait d'une erruer de redondance cyclique recurente enmpechant toutes ecriture de quelque info que se soit y compris avec HexaEdit. Nous aurons une pensée pour elle, qui, je l'espere se trouve maintenant dnas un monde meilleur! voila c'est dit romsk: j'ai tenter les solucs dont tu m'a parler HD regenerator ne veux pas ecrire ailleur que sur A: ( moi jue veux pas le payer tu me diras donc....) Quand a copier le secteur de boot d'un Disque dure ben tu peu ecrire ce que tu veux a l'ecran de toutes façon " erreur de redondance cyclique" tu peu pas sauvegarder sur la clé! ouinnnnnnnnn!![pleurer] ( et meme si elle est profiler je refuse d'en faire les usages qui ont eté suggeré! j'ai ma dignité!
Auteur : zitoni
Réponse le : 29/10/2006 18:22
Message :
J'ai eu quels que petit soucis avec le commande de récupération elle me demandais mon pass Administrateur ... je ne dois plus m'en souvenir car mon pass ne lui plaisais pas, j'ai tenter de l'installer sous XP ça n'as pas marché car la version actuellement installer est plus récente (passage au sp2 oblige) que celle présente sur mon cd. Finalement et lançant la console de récupération sur mon 2eme xp qui lui ne possède pas de pass cela a marcher. Par-contre la "chkdsk /F /R" n'as pas marché seul les paramètre /P et /R étaient disponible. En tapant "chkdsk /P /R" chkdsk a travailler et ma dit avoir trouver trouver et réparer quels que erreurs.
Auteur : romsk
Réponse le : 29/10/2006 23:51
Message :
...elle me demandais mon pass Administrateur : c'est toujours comme ça, et habituellement lorsqu'on n'a pas de mot de passe il suffit de taper sur la touche entrée pour passer à l'invite de commande ..."chkdsk /P /R" chkdsk a travailler et ma dit avoir trouver trouver et réparer quels que erreurs : est-ce que ça a changé qqch ??? sinon je vois pas d'autre option que d'essayer de réparer la MFT sous testdisk (menu advanced > boot > repair MFT)
Auteur : zitoni
Réponse le : 30/10/2006 05:08
Message :
chkdsk a travailler et ma dit avoir trouver trouver et réparer quels que erreurs : est-ce que ça a changé qqch ??? <== Malheureusement cela na rien changer. La réparation de la MFT sous testdisk (menu advanced > boot > repair MFT) n'as pas put ce faire: MTF and MTF mirror are bad. Failed to repair then. Je peux donc effacé cette partition de ma mémoire. En tout cas merci beaucoup de ton aide tes topiks concernant les Disques Durs sont excellants j'ai appris pleins de choses et à l'avenir je sauvegarderai mes MBR et EBR et les secteurs de boot.
Auteur : romsk
Réponse le : 30/10/2006 14:27
Message :
salut zitoni, peut etre bien que la fusion t`a endommage ta MFT, mais il reste quand meme 3 possibilites : - tente un rebuild BS dans le menu advanced > boot - tente d`autres logiciels de recuperation genre r-studio, getdataback ou autre - boot sur un liveCD linux genre kaella ou knoppix pour voir si tu peux recuperer tes donnees avant de tout reformater...
Auteur : zitoni
Réponse le : 30/10/2006 19:59
Message :
Salut Romsk, je vais tenter ces 3 possibilites: tente un rebuild BS dans le menu advanced > boo <== il n'y as eu aucun changement. tente d`autres logiciels de recuperation genre r-studio, getdataback ou autre <== j'avais deja tenter la recuperation avec getdataback les fichiers recuperes etaient corrompus, je tente avec r-studio il as l'air plus complex as prendre en main mais bon je vais m'accrocher. boot sur un liveCD linux genre kaella ou knoppix <== je vien de graver le liveCD de Knoppix je tenterai apres avoir essaye r-studio. merci pour tes conseils [clindoeil]
Auteur : Elias90
Réponse le : 30/10/2006 22:07
Message :
Bonjour, Je tient tout t'abord à féliciter tous ceux qui travaillent sur ce forum et qui nous permettent de réparer nos ordinateurs.[hello] Voilà en faite si j'ai voulu poster un message dans cette rubrique c'est parce que je suis confronté à un problème de RAW... Mais le plus ennuyant c'est qu'il ne concerne pas comme dans la plupart des cas un disque dur ou une clé USB mais un Lecteur CD/DVD. Du jour au lendemain mon lecteur a arrété de fonctionné. J'ai lu les explications données sur une bonne centaine de poste mais ça na rien changé. En plus j'ai une chose "bizarre" qui se produit avec mon lecteur cd parce parfois quand je vais dans les propriétés à "système de fichiers" il est écrit "RAW" et parfois "Inconnu"[confus]. Si vous avez besoins de plus d'infos concernant mon problème demandez les moi. Merci d'avance pour votre aide [bigsmile]
Auteur : yetix
Réponse le : 30/10/2006 22:23
Message :
Bonjour, J'ai lu avec beaucoup d'attention les nombreux post de ce topic sur l'utilisation de testDisk mais les diverses opération n'ont pas réussi à résoudre mon problème. J'ai un disque de 120 Go qui etait en dynamique, je l'ai repassé en disque basique et depuis il est en raw et je ne peux plus rien faire avec. J'ai essayer le formatage de bas niveau qui n'a rien donnée ainsi que diverse solution de ce topic mais rien n'y fait. Si je tente un chkdsk on me dis que le disque est en raw et qu'il n'ai pas possible d'executer chkdsk, lorsque que j'essay de la formater avec le gestionnaire de disque j'ai l'erreur suivante "l'assistant ne c'est pas terminé corectement" et pour terminé avec test disk j'ai l'ecran suivant: [img width=650 height=290]http://www.yetix.com/image/disc1.jpg[/img] Merci d'avance à celui qui pourra me venir en aide pour retrouver un disque opérationel ...
Auteur : romsk
Réponse le : 30/10/2006 23:27
Message :
salut yetix,
yetix a écrit : J'ai un disque de 120 Go qui etait en dynamique, je l'ai repassé en disque basique...
c`est le meilleur moyen de perdre toutes ses donnees, mais j`imagine que tu le faisais en connaissance de cause ? si j`ai bien compris, ton probleme n`est plus de recuperer des donnees mais de reformater ton DD. vu les problemes que tu decrits windows aura probablement des difficultes a te recuperer ton DD, mais je serais bien etonne qu`en bootant sur une disquette genre win98 (contenant fdisk) ou mieux sur la disquette constructeur (quelle est la marque de ton DD ?) tu n`arrives pas a formater ce DD [confus] salut elias90, ben ecoute c`est la 1ere fois que j`entends parler de lecteur CD qui passerait en RAW [confus] : sauf erreur de ma part ce probleme ne concerne que les unites de stockage, et dans ton cas ce sont probablement les CD qui doivent etre reconnus RAW, non ? peut etre un signe que ton lecteur est fatigue... moi je commencerai par en essayer un autre (ca coute pas cher) et/ou essayer ce lecteur CD sur un autre ordi...
Auteur : Elias90
Réponse le : 30/10/2006 23:47
Message :
... moi je commencerai par en essayer un autre (ca coute pas cher) et/ou essayer ce lecteur CD sur un autre ordi...
OK jvai esseyer d'en dégoter un autre et je te dis quoi. Merci pour ta réponse et si tu as du nouveau sur ce genre de pb fais moi signe[smile]
Auteur : yetix
Réponse le : 31/10/2006 00:13
Message :
Merci pour ta réponse rapide romsk, oui ce qui m'interesse c'est juste de pouvoir réutiliser le disque sur windows, le disque est un seagate, j'ai essayer d'effectuer un formatage de bas niveau avec l'utilitaire du fabriquant mais le disque est resté en RAW. Je ne sais plus quoi y faire :(
Auteur : romsk
Réponse le : 31/10/2006 02:53
Message :
et t'as essayé avec une disquette win98 ? et avec la version DOS sur disquette de disc wizard ? (http://www.seagate.com/support/disc/drivers/discwiz.html) ceci dit, testdisk montre apparemment un problème de geométrie qui pourrait expliquer tout ou partie de tes problèmes : si ni win98 ni la version DOS de disc wizard ne fonctionnent, regarde ce que j'explique en 1ère page pour remettre, dans le menu geometry, le nombre de têtes qui va bien, à savoir 255 (probablement)
Auteur : yetix
Réponse le : 31/10/2006 10:42
Message :
Bonjour :) Et bien j'ai essayer avec win98 et la version DOS de disc wizard (le formatage de bas niveau a bien duré 5 heures) mais je ne peu toujours pas formater le disque sur windows, j'ai bien mis le nombre De têtes à 255 mais le formatage reste impossible. [img width=650 height=345]http://www.yetix.com/image/disc2.jpg[/img] J'ai l'impression que le probleme vient du secteur de boot.
Auteur : romsk
Réponse le : 31/10/2006 13:21
Message :
tu as bien utilisé l'option "zero fill drive (full)" comme décrite ici ? --> http://www.seagate.com/support/kb/disc/faq/ata_llfmt_what.html si c'est le cas ton histoire est incompréhensible (et notamment ton secteur de boot est effacé depuis belle lurette, ce que tu peux d'ailleurs vérifier avec EditHexa...) peut être essayer un autre logiciel de formatage bas niveau ? essaye de voir ce que ça donne en mettant avec testdisk d'autres valeurs de têtes genre 240 notamment ? sinon ton DD est-il sous garantie ? edit : tu n'oublies pas, j'espère, qu'avant de formater il faut initialiser le disque par un clic droit dans la gestion des disques, puis le partitionner, puis le formater ?
Auteur : yetix
Réponse le : 31/10/2006 13:35
Message :
Helas non le disque n'est plus sous garantie, ce que je n'arrive pas à comprendre c'est qu'il fonctionnais bien avant que je le repasse en disque de base. La seul fois ou le formatage rapide a réussi et le formatage normal a échouer est juste a près le formatage de bas niveau. Le message d'erreur que j'ai quand j'essay de le formater avec windows est le suivant: [img width=650 height=427]http://www.yetix.com/image/disc3.jpg[/img] Voici ce qu'un cdkdsk me donne: [img width=650 height=387]http://www.yetix.com/image/disc4.jpg[/img] je pense qu'il va faloir que je me résigne a acheter un autre disque dur ...
Auteur : romsk
Réponse le : 31/10/2006 14:34
Message :
s`il apparait toujours comme sain et actif dans le gestion des disques et que chkdsk y trouve un systeme de fichiers raw c`est que, pour x raisons, le formatage bas niveau ne s`est pas fait normallement... d`ailleurs, tel qu`il apparait dans la gestion des disques, on aurait envie de faire un clic droit > supprimer le lecteur logique : t`as essaye ? sinon essaye un autre logiciel genre loformat ou killdisk (t`as plus grand chose a perdre), et/ou regarde comment apparaissent les 1er secteurs avec edithexa (dans ma signature), et si il existe encore des donnees sur le(s) premier(s) secteur(s) met des 00 partout avec Edithexa secteur apres secteur... tu peux aussi essayer de faire toutes ces manips, notamment le formatage, en le mettant dans un autre ordinateur, ce qui pourrait d`ailleurs etre la solution...
Auteur : yetix
Réponse le : 31/10/2006 14:47
Message :
Oui je peux créer et suprimer la partition sur le disque,j'ai essayer de la mettre en lecteur logique, partition etendu, les partition se cré sans problème mais j'ai toujours le meme problème. Impossible d'effectuer le formatage. Je suis en train de passer Kill Disk, je te dis ce que ca donne dès que c'est terminé :)
Auteur : yetix
Réponse le : 31/10/2006 15:39
Message :
Bon et bien Disk Kill c'est exécuté avec succès mais j'ai toujours mon problème de disque en RAW et impossible de formater ... Je sent que ce disque ne va pas tarder a rejoindre le recyclage .... Voici ce que Partition Table Editor me donne après la passage de disk kill: [img width=650 height=427]http://www.yetix.com/image/disc5.jpg[/img] Le formatage de bas niveau à donc fonctionné.
Auteur : romsk
Réponse le : 31/10/2006 16:31
Message :
est-ce que les 1er secteurs sont bien remplis de 00 avec Edithexa ? essaye, dans la gestion des disques, option > analyser les disques de nouveau... peut etre un probleme de BdR : as-tu une sauvegarde erunt a remettre ? essaye de le deconnecter et d`intervertir la connection IDE (il est bien IDE ?) avec le disque 4, sinon essaye le sur un autre ordi...
Auteur : yetix
Réponse le : 31/10/2006 16:48
Message :
Et bien voici ce que me donne winhex pour ce disque: [url]http://www.yetix.com/image/disc6.jpg[/url] Par contre je n'ai aucune sauvegarde erunt a remettre (c'est quoi au juste ?). Non ce n'est pas un disque IDE mais c'est un disque SATA. Je l'ai testé sur une autre machine et c'est pareille, sur une machine différente j'ai testé formatage de bas niveau mais le résultat est le meme. Le gestionnaire de disque reproduit exactement les meme erreur de formatage.
Auteur : romsk
Réponse le : 31/10/2006 17:35
Message :
remplace les quelques FF qu'on voit par des 00 (et enregistre les modifications) et vérifie que tes secteurs suivants soient tous également remplis de OO, notamment les secteurs 62, 63, ...
Auteur : yetix
Réponse le : 31/10/2006 18:07
Message :
Je viens de passer tout les secteur du disque à 00, j'ai à nouveau suprimé et recréé la partition, (j'ai essayer en lecteur logique et en parttion principal) mais toujours cette erreur de formatage. Mon cas est il désespéré ? [boom]
Auteur : romsk
Réponse le : 31/10/2006 21:17
Message :
ben écoute je vois pas grand chose d'autre à rajouter à tout ce que je t'ai déjà proposé, donc pour moi OUI ton cas est désespéré [triste]
Auteur : zitoni
Réponse le : 31/10/2006 22:49
Message :
Salut romsk, tente d`autres logiciels de récupération genre r-studio <== ha l'idée qui tue ... j'en avais essayé plusieurs des logiciels de récupérations (getdataback, easyrecovery ect...) mais aucun ne m'avais récupéré les données dans leurs états originel. Tout bonnement excellentissime[birthday]. Un grand merci a toi romsk grâce a toi je peux récupérer toutes mes données. [chinois] Longue vie à romsk [bierre] [fete] [merci]
Auteur : romsk
Réponse le : 01/11/2006 12:48
Message :
yohhh, content pour toi zitoni [bigsmile]
Auteur : clemboul
Réponse le : 01/11/2006 18:07
Message :
Bonjour a tous ! Je suis confronté à un probleme de disque dur. J'ai un disque dur de 200 Go partitionné en deux partitions (une partition système de 50Go environ et le reste est une partiton de données). Lorsque je veux acceder à la partition la plus importante (donnée) un message s'affiche. "Le disque dans le lecteur D n'est pas formaté. Voulez vous le formaté maintenant." Dans les propriétés je peux voir que la partition est passé en mode RAW. J'ai pu utiliser TestDisk grâce precieux renseignements de romsk (Merci au passage !). Lorsque je lance un [Search!] j'obtient le resultat suivant : [img width=650 height=328]http://img149.imageshack.us/img149/7926/1nn4.jpg[/img] Je vois ma partition principale ainsi que deux autres partitions [img width=650 height=328]http://img441.imageshack.us/img441/6852/2up0.jpg[/img] avec un "NTFS found using backup sector!, 147GB / 137GiB" [img width=650 height=328]http://img441.imageshack.us/img441/5615/3ae7.jpg[/img] avec un NTFS, 126GB / 117 GiB Je voudrais savoir quel partiton doit etre modifiee ? Celle de 126GB ou celle de 147GB sachant que j'ai un disque de 200. Es ce que je doit modifier le type ou charger une restauration ?
Auteur : romsk
Réponse le : 01/11/2006 19:00
Message :
salut clemboul, t'as déjà bien travaillé je vois... [chinois] c'est manifestement la 2ème partition qui correspond à ta partition de données disparue, puisque c'est celle qui colle à la partition système (6374/6375). d'autre part c'est apparemment une partition logique au sein d'une partition étendue puisqu'elle commence à head 0... et donc il va falloir bidouiller un peu pour la retrouver : - laisse la 1ère partition (système) telle quelle sans y toucher, - ne touche pas non plus aux 2 autres lignes (on va simplement se servir des données qui s'y trouvent pour recréer ta partition logique) - appuie sur la touche "A" > et dans les cases successives rentre les données suivantes : cylinder : 6375 head : 1 sector : 1 cylinder : 24320 head : 254 sector : 63 type : entrée > entrée > tape "07" > entrée : done > entrée > met toi sur la partition que tu viens de créer > fleche droite gauche pour afficher "L" en tout début de ligne > entrée > write > va dans le menu advanced > met toi sur cette partition créée > boot : copie d'écran...
Auteur : clemboul
Réponse le : 01/11/2006 19:25
Message :
Merci pour la rapidite de ta reponse romsk.[smile] Je vais essayer ce que tu m'a dit. mais j'aimerais d'abord savoir a quoi correspond ce message "NTFS found using backup sector!, 147GB / 137GiB" ? Voila le screenshot : [img width=650 height=328]http://img48.imageshack.us/img48/7959/4xg0.jpg[/img]
Auteur : romsk
Réponse le : 01/11/2006 20:28
Message :
clemboul a écrit : j'aimerais d'abord savoir a quoi correspond ce message "NTFS found using backup sector!, 147GB / 137GiB" ?
pour retrouver les partitions disparues, testdisk se sert de divers algorithmes et entre autre va rechercher les copies des secteurs de boot que l'on trouve dans chaque partition : c'est le message qu'il te met ("partition NTFS retrouvée à partir de la copie du secteur de boot") le problème est que, dans ton cas, il t'a retrouvé une partition étendue mais pas la partition logique qu'elle contient, et c'est pour ça que je t'ai fait recréer cette partition logique... à ce stade fait "rebuild BS" et quand il t'a reconstruit un secteur de boot "extrapolé" fait "list" pour vérifier si tu as bien tes fichiers dans cette partition avant de faire "write"...
Auteur : clemboul
Réponse le : 02/11/2006 15:57
Message :
Un rebuild BS me redonne exactement la même chose que précédement !?!
Auteur : romsk
Réponse le : 02/11/2006 18:11
Message :
la 6375 0 1 ???
peux-tu faire une copie d'écran de ça ?
si c'est le cas retourne sur le dernier tableau de testdisk montrant tes 3 partitions > laisse la 1ère en "*" et le 3ème en "D", mais essaye de mettre la seconde (6375 0 1) en "E" par les fleches droite gauche > entrée > write > menu advanced > boot : copie d'écran
Auteur : neronboss
Réponse le : 02/11/2006 18:19
Message :
s ke kelkun pe maider svp mon ordi sallume detect mon dd pui s ne fait plus rien merci pr vos rp
Auteur : neronboss
Réponse le : 02/11/2006 18:26
Message :
merci pr vos reponse c simpa
Auteur : clemboul
Réponse le : 02/11/2006 19:03
Message :
Voici le screenshot (avant tes conseils) :
Voici le screenshot :
[IMG]http://img85.imageshack.us/img85/5861/5yl0.jpg[/IMG]
Auteur : romsk
Réponse le : 02/11/2006 19:31
Message :
donc retourne sur le dernier tableau de testdisk montrant tes 3 partitions > laisse la 1ère en "*" et le 3ème en "D", mais essaye de mettre la seconde (6375 0 1) en "E" par les fleches droite gauche > entrée > write > menu advanced > boot : copie d'écran
neronboss : p'tet k t trmpé 2 forhum, eisaie sui de SMS ou ouvr 1 ottre taupik :-(
Auteur : clemboul
Réponse le : 02/11/2006 19:45
Message :
Voici ce que j'obtient en retournant dans le menu precedant (en avant toutes modifications )
La seconde est deja en "E" (6375 0 1)
La troisieme est en "L"
[IMG]http://img162.imageshack.us/img162/3015/6jo8.jpg[/IMG]
Auteur : romsk
Réponse le : 02/11/2006 22:10
Message :
la partition en "E" que tu me montres est celle qui s'est automatiquement créée lorsqu'on a fait la partition logique 6375 1 1...
en réalité lorsque je te disais de passer la seconde partition en "E", je parlais de ce tableau (obtenu après search) :

ton histoire est vraiment étonnante car la structure de partition que tu montres est tout à fait conforme à ce qu'elle devrait être et pourtant le rebuild BS ne marche pas ?!
essayes dans un 1er temps de refaire "rebuild BS" 2 ou 3 fois de suite, et si ça ne donne rien et que tu te retrouves toujours devant le même écran de secteur bad, retourne dans le menu analyse > proceed > search x 2 voire 3 fois de suite > si tu obtiens autre chose : copie d'écran, si tu as le même aspect que l'écran ci-dessus : mets la 2ème partition en "E" (mais je suis pas sûr que ça marche) > write > puis advanced > boot : copie d'écran...
Auteur : clemboul
Réponse le : 03/11/2006 16:22
Message :
Je ne peux pas mettre la deuxieme en Extended "E".
Je n'ai que les choix suivant :
primary bootable"*",
primary "P",
deleted "D".
Auteur : Franck_13
Réponse le : 03/11/2006 17:43
Message :
Bonjour à tous,
comme chacun d'entre nous je viens de perdre l'accès à ma clef USB et biensure je m'en remets à TestDisk pour essayer de réparer
et voici le résultat
TestDisk 6.4, Data Recovery Utility, June 2006
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org
Disk /dev/sdb - 2023 MB / 1929 MiB - CHS 246 255 63
Current partition structure:
Partition Start End Size in sectors
1 P FAT32 0 0 33 246 74 20 3956640 [PNY ATTACHE]
Warning: Bad ending cylinder (CHS and LBA don't match)
No partition is bootable
Est ce que quelqu'un sait comment résoudre ce problème ?
Le pire c'est que j'arrive à listes les fichiers à travers TestDisk !!
D'avance merci et bon week end
Franck 

*=Primary bootable P=Primary L=Logical E=Extended D=Deleted
[Proceed ] [ Save ]
Try to locate partition
Auteur : Inconscient
Réponse le : 03/11/2006 18:16
Message :
Bonjour Romsk, tout d'abord je tire mes révérences pour toutes ces explications sur testdisk !
Ensuite je dois absolument parler de mon problème, apparament le même que tout le monde .....
En résumé, mon disque dur externe de 400go comptant pas moins de 205 go de données est passé en RAW
(2 parttions au lieu d'une seule) a cause d'une ENORME ERREUR impardonnable de ma part.
Contexte : Afin de réinstaller windows et repartitionner (sur DD intern 80 go) j'ai suivi la procédure habituelle ( reboot + cd
windows). ERREUR FATALE : j'ai oublié de débrancher l'externe, et je l'ai malencontreusement partitionner !!!! (pas de
formattage cependant) .
A présent, sous windows , j'ai a la place du DD 400go (1 partition), 2 part K: et J: que je dois formater (selon windows lol).
J'ai donc utiliser TestDisk après avoir verifier la presence de ttes mes données sur le DD grace a "EasyRecovery", j'ai fais un
fichier texte avec screencopy pour que tu vois ou jen suis.
La question est , ou puis je tenvoyer ce fichier ???
PS : ces 205 go, en aucun cas je ne dois les perdre, il y a de la musique, du film, des données perso, du travail, mes comptes, etc etc ....
Je suis DESESPERE ..... je compte sur toi oooooooooo Romsk
Merci d'avance de la réponse
Auteur : romsk
Réponse le : 03/11/2006 18:23
Message :
clemboul a écrit :

Je ne peux pas mettre la deuxieme en Extended "E".

c'est bien ce que je pensais  (et c'est pour ça que je t'avais fait créer la partition logique en L...)
t'as fais 2 ou 3 rebuild BS ? et toujours sans résultat ? si c'est le cas essaye de mettre cette partition en "P" (puis write > advanced > boot) mais ça m'étonnerait que ça marche car en toute logique une partition principale commence à head 1 et pas head 0...
Salut franck_13,
je dirai à priori qu'il s'agit d'un problème de geométrie : va dans le menu geometry > à head tu mets 255 > write > menu advanced > boot : copie d'écran
Auteur : clemboul
Réponse le : 03/11/2006 18:34
Message :
Voici les changements :
Je n'est plus l'erreur "Error : size boot sector"
Et il me met Ok pour le status du backup boot sector !
Un message m'indicant que les changements prendront effet apres un redemarrage est egalement apparut.
[IMG]http://img282.imageshack.us/img282/5724/7uq7.jpg[/IMG]
Auteur : romsk
Réponse le : 03/11/2006 19:16
Message :
mouaaaaaais, je reste dubitatif...
essaye "backup BS" > list si disponible > write > quitte testdisk et redémarre
Auteur : clemboul
Réponse le : 03/11/2006 20:21
Message :
Lorsque j'essaye un backup BS il me demande :
Copy backup NTFS boot sector over boot sector, confirm ? (Y/N)
Auteur : romsk
Réponse le : 03/11/2006 20:29
Message :
ben oui clemboul, c'est le principe du backup BS... 
salut l'inconscient ()... désolé, j'avais sauté ton post...
j'aime pas bien le fichier texte (tu parles du logfile ?) que je trouve moins parlant que les copies d'écran : peux-tu faire menu analyse > proceed : copie d'écran, > puis serach : copie d'écran...
Auteur : Inconscient
Réponse le : 03/11/2006 20:34
Message :
romsk a écrit :

ben oui clemboul, c'est le principe du backup BS... 
salut l'inconscient ()... désolé, j'avais sauté ton post...
j'aime pas bien le fichier texte (tu parles du logfile ?) que je trouve moins parlant que les copies d'écran : peux-tu faire menu analyse > proceed : copie d'écran, > puis serach : copie d'écran...

En fait c un fichier AVEC les copies d'écran, bien détaillées ......
Bref, ca faisait une semaine que je me cassait la tête pour retrouver mes données , grace a TOI et tes explications sur TESTDISK, jai retrouvé ma partition de 400go ! suis aller ds la liste et retrouver TOUS MES DOSSIERS (200go de données)
Actuellement je les copie sur un autre support...... JE SUIS HEUREUX !!!!!!!!
MERCI MERCI MERCI MERCI MERCI MERCI MERCI ......
Je te redemanderais conseille pour rebooter mon DD par contre, une fois les données sauvées .....plus rien a craindre...
@++++++
Auteur : clemboul
Réponse le : 03/11/2006 20:34
Message :
Voila maintenant il me met OK egalement pour le boot sector !
Lorsque je demande a lister j'ai un beau :
Can't open filesystem.
Auteur : romsk
Réponse le : 03/11/2006 21:38
Message :
clemboul a écrit :

Je ne trouve pas par contre ou acceder a list ?

parce qu'il n'y en a probablement pas après backup BS (contrairement à rebuild...), ce dont j'étais plus sûr...
ben write > quitte > redémarre...
bien content pour toi inconscient ()
Auteur : clemboul
Réponse le : 03/11/2006 22:05
Message :
Apres le redemarrage voici ce que j'obtient lorsque je veux acceder a ma partition !
[IMG]http://img519.imageshack.us/img519/6038/8fz6.jpg[/IMG]
Auteur : romsk
Réponse le : 04/11/2006 11:23
Message :
salut clemboul,
maintenant que t'en es là essaye un "chkdsk /F /R", et si ça donne rien retourne dans advanced > boot > et fait "repair MFT".
si ça donne toujours rien on essayera de faire avec edithexa ce que testdisk a refusé de te faire, c'est à dire restaurer le secteur de boot sur la partition logique que je t'avais fais faire au début...
Auteur : clemboul
Réponse le : 04/11/2006 13:26
Message :
Voici ce que j'obtient lorsque je tente de faire un CHKDSK
[IMG]http://img293.imageshack.us/img293/1265/9pw0.jpg[/IMG]
J'ai egalement fait un CHKDSK complet mais il n'analyse pas la partition en question.
Lorsque je fais un REPAIR MFT il me met :
MFT and MFT mirror are bad. Failed to repair them.
Edit : J'ai vu que Zitoni avait eu le même probleme que moi. Il a reussit à recuperer ses donnees grace à R-Studio. Je vais donc en faire de même et essayer de recuperer les miennes...
Auteur : romsk
Réponse le : 05/11/2006 09:55
Message :
les logiciels de récupération sont une très bonne idée puisque ton soucis numéro 1 est de récupérer tes données, et si r-studio ne donne pas satisfaction tu peux aussi essayer easy recovery, PC recovery, getdataback, etc... Tu peux aussi essayer de booter sur un live CD de linux genre kaella ou knoppix qui pourrait tout à fait "voir" tes données et te permettre de les copier sur une autre partition ou autre DD...
mais quand t'auras récupérer tes données, on pourra essayer, si t'as du temps, ce que je te propose avec edithexa car je serai curieux de voir ce que ça donne 
Auteur : clemboul
Réponse le : 05/11/2006 12:44
Message :
Tu penses qu'avec EditHexa je vais pouvoir recuperer la partition ? Es tu sur du resultat avec EditHexa ?
Car je vais avoir du mal a recuperer les 100Go il faudra que je grave plein de dvd...
Auteur : romsk
Réponse le : 05/11/2006 15:19
Message :
clemboul a écrit :

Tu penses qu'avec EditHexa je vais pouvoir recuperer la partition ? peut être
Es tu sur du resultat avec EditHexa ? non 
Auteur : guismo_77
Réponse le : 09/11/2006 23:10
Message :
Bonjour tout le monde, Ca fait maintenant près d'une semaine que je galère avec mes disques durs et j'ai l'impression que ce forum, et Romsk font de réels miracles... La config, c'est un disque 80 go en une partition (C) avec Windows XP, et un disque de 20 Go divisé en deux partitions égales de 10 Go (D et E) Les problèmes ont commencé lors d'un démarrage sous windows, scandisk s'est lancé sur le disque E et face aux multiples messages qui disaient quelque chose comme "entrée de fichier supprimée " on a relancé l'ordinateur un peu violemment par reset. Là on a passé le scandisk, l'ordi était hyper lent, et a rebooté tout seul. Lorsqu'il a eu fini de rebooter (2 fois), tout allait bien, mais plus de disque de 20 Go. J'ai libéré 20 Go sur C, gravé knoppix, lancé le live-Cd, et appliqué les conseils de C.Grenier, à savoir copier le disque. Comme ddrescue ne marchait pas, j'ai fait dd. Vu la lenteur j'ai laissé tourner pdt la nuit. Au petit matin, impossible d'avoir un affichage sur l'écran, à nveau reset, et là plus de démarrage possible sous windows. Avec knoppix, les deux disques sont sur le bureau (hda1 et hdb), mais ne peuvent être montés. J'ai beaucoup utilisé proceed et search avec testdisk. La dernière fois, il me trouvait 3 disques : hda, hdb et hdd. L'idée étant de retrouver windows (même si je commence à m'habituer à linux ;-), j'ai suivi les conseils de romsk en fin de première page du forum, puisque j'avais un disque hda qui semblait trop petit, un pbl de head/cylindre 255 ntfs =! de 16 fat, bref le même écran que celui qui était capturé. Le conseil était de faire rebootbs. Hda1 réapparait sous knoppix (d'ailleurs les dossiers de documents and setting ne sont pas ceux qui sont sous windows, et knoppix m'avait déjà affiché alors que C fonctionnait des dossiers différents) Pbl n° 1 : après nouveau démarrage, je n'ai pas de message d'erreur de chargement windows, mais aucun système ne se lance si je n'insère pas le live-cd. Y'a-t-il une manip que j'ai manqué ? Pbl n° 2 : si je relance testdisk, je ne trouve plus qu'un seul lecteur hdd, de 730 Mo Si proceed/analyse/ alors partition structure doesn't have the endmark 0xAA55 Bref je suis d'un naturel curieux en informatique, même si c'est pas mon boulot, mais là j'ai l'impression d'être arrivé au bout de ce que je pouvais comprendre... Et ca m'agace particulièrement d'avoir réparé au moins C, et de ne pas pouvoir m'en servir !! Voilà, je prie pour que romsk ou l'un de vous ait une solution et en tout cas je vous admire ! Dsl pour la longueur (j'ai un peu trop essayer de me débrouiller tout seul je crois) et l'absence de copie écran (pas habitué à linux) Guismo77
Auteur : romsk
Réponse le : 10/11/2006 09:27
Message :
salut guismo,
j'avoue que je suis un peu perdu dans ce que tu nous racontes au vu des manips déjà effectuées, notamment dans ce que te montre actuellement testdisk (quel DD apparait au démarrage de testdisk ? analyse > proceed > +/- search selon ce que trouve proceed ?) et des copies d'écran seraient utiles : voir le tuto de Mjo54 en bas de mon topic sur les partitions disparues... (ton Hdd de 730 Mo correspond je pense au live CD puisque celui ci étant bootable testdisk doit le reconnaitre comme un DD...)
Auteur : guismo_77
Réponse le : 10/11/2006 12:35
Message :
ok, j'ai retrouvé le topic de Mjo54, je m'en servirai dès ce soir avec je suppose un équivalent knoppix pour paint.
pour essayer de clarifier le pbl, je précise juste que :
les 2 disques apparaissent au démarrage (bios).
sur le bureau linux, j'ai hda1 et hdb. J'arrive à mounter et explorer hda1 (même si je m'étonnes un peu du contenu de certains dossiers), mais pas hdb.
Et, ce que je n'avais jamais lu jusqu'ici c'est qu'en lancant testdisk, il ne me trouve que hdd (qui n'est apparu que récemment avec hda et hdb). je ne me souviens plus du résultat du proceed mais je vous ferai une copie d'écran ce soir.
Il n'y a que le résultat de proceed sur hdd que tu souhaites comme copie écran ?
ce qui m'étonnes c'est de ne plus avoir le choix du disque dans testdisk alors que le disque hda est ouvert et mounté et que hdb apparait toujours sur le bureau.
J'ai lu qu'un vers ou virus pouvait mettre le bazar dans les partitions. J'ai fait un scan qui n'a rien donné lorsque j'étais encore sous windows avec le disque hda...
y'a-t-il aussi une manip à faire pour que le disque hda, une fois réparé, puisse permettre le lancement de windows ? je me suis limité à backupBS...
Merci en tout cas de ta réponse, déjà je comprend qui est hdd... 
Auteur : romsk
Réponse le : 10/11/2006 14:01
Message :
les 2 disques apparaissent au démarrage (bios) : c'est déjà bien...
sur le bureau linux, j'ai hda1 et hdb : en toute logique Hda1 correspond à ton C: (redimensionné à 60 Go ? as-tu formaté les 20 Go que tu dis avoir libéré ? dans ce cas tu devrais avoir un Hda2 ?? pourquoi avoir libéré 20 Go puisque t'as fait un liveCD ?) et Hdb à ton DD de 20 Go (mais tu devrais avoir Hdb1 et Hdb2 puisque tu dis avoir 2 partitions de 10 Go ?)
Il n'y a que le résultat de proceed sur hdd que tu souhaites comme copie écran ? ben non puisque pour moi c'est ton liveCD  : ce que tu veux récupérer c'est Hda et Hdb...
ce qui m'étonnes c'est de ne plus avoir le choix du disque dans testdisk alors que le disque hda est ouvert et mounté et que hdb apparait toujours sur le bureau : c'est, je pense, parce que tu l'as mounté que testdisk ne peux pas y accéder (y'a conflit d'accès)
J'ai lu qu'un vers ou virus pouvait mettre le bazar dans les partitions. J'ai fait un scan qui n'a rien donné lorsque j'étais encore sous windows avec le disque hda... : le mieux est de faire un scan anti-virus en bootant sur un CD genre Hirens boot CD qui comporte entre autre des anti-virus...
en réalité je pense que Linux n'a d'intérêt, dans ce genre de problème, que pour permettre de sauvegarder des données (si accessibles) sur un autre DD, mais pas pour récupérer un MBR ou des secteurs de boot de partitions corrompues (ce qui est peut être ton cas). En ce qui te concerne je crois que tu devrais :
- télécharger et graver Hirens boot CD pour passer un coup d'anti-virus et tester tes 2 DD avec les utilitaires présents sur le CD (et vérifie d'ailleurs s'il n'y a pas aussi un utilitaire de récupération de partition...)
- puis mettre testdisk sur disquette bootable (version DOS) et voir ce que t'arrives à faire comme ça (je pourrais pas te guider faute de copies d'écran réalisables sous DOS mais tu devrais y arriver avec mes 2 tutos ?). je me demande d'ailleurs s'il n'y a pas testdisk sur Hirens ?
- ou mettre tes 2 DD en esclave sur une autre machine pour utiliser testdisk sous Windows et pouvoir faire les copies d'écran si t'as des problèmes
Auteur : guismo_77
Réponse le : 10/11/2006 14:51
Message :
Merci encore de tes messages romsk, on se sent vraiment moins seul avec toi !
Je suis content qu'il y ait au moins quelque chose de positif dans ma situation (le bios) 
Pour ce qui est de libérer de la place, j'ai juste laisser + de 20Go d'espace libre sur hda, afin de pouvoir appliquer la copie dd (l'idée de départ était de réparer le disque hdb, le seul qui ne fonctionnait pas, en récupérant les données). Je n'ai fait que d'exécuter la commande dd dont traite C.Grenier (dd /dev/hdb /dev/hda il me semble).
C'est après ca que hda n'a plus répondu.
hda n'a jamais été partitionné. Il s'affichait avec une valeur correcte (76 Go il me semble) sous testdisk avant que je fasse le backupBS. hdb est en revanche partitionné, mais je n'ai jamais eu que hdb sur le bureau...
C'est vrai que je l'ai mounté, et que j'ai tenté la même chose avec hdb avant de ne plus voir que hdd dans testdisk.
J'ai bien noté tes conseils finaux, j'espère que les copies d'écran pourront éviter d'avoir recours à tout ca, mais sinon je me prépare un bon WE... 
Auteur : guismo_77
Réponse le : 10/11/2006 19:58
Message :
Hello Romsk, me voilà enfin devant l'ordi
alors j'ai fait reboot, les deux disques sont visibles dans le bios, linux les "affecte" correctement (et tu as raison hdd est le lecteur cd)
Sur le bureau de knoppix j'ai Hard Disk [Hda1] , Hard Disk [ Hdb ]
Je n'ai cliqué sur aucun des deux. J'ai lancé testdisk.
Il m'affiche :

Je sais, je pense que c'est pas terriblement cool comme nouvelle...
J'ai quand même lancé proceed/intel/analyse et ca donne (mais ca ne doit pas t'intéresser) :

Je retourne sur le bureau et je clique sur Hda1 :

je clique sur Hdb : I cannot mount device I could not determine the filesystemtype and none was specified.
Même si je n'arrive pas à résoudre le pbl du disque Hdb et que je dois le mettre à la poubelle, j'aimerai quand même comprendre pourquoi le disque A, qui contient le répertoire windows, l'autoexec, le config etc, ne me permet pas de lancer windows....
Est-ce parce que bien que le boot soit désormais correct, le disque n'est pas repéré comme disque "primary bootable". C'est vrai que une fois backupBS fait j'ai redémarré dans la foulé ... ?
Je maitrise les copies écran maintenant mais toujours pas testdisk et les disques durs ;-)
Auteur : romsk
Réponse le : 10/11/2006 20:43
Message :
guismo_77 a écrit :

...j'aimerai quand même comprendre pourquoi le disque A, qui contient le répertoire windows, l'autoexec, le config etc, ne me permet pas de lancer windows....
tout simplement parce que "le répertoire windows, l'autoexec, le config etc" sont nécessaires mais pas suffisants : il faut aussi un MBR correct, un secteur de boot fonctionnel, une MFT ad hoc...
mais je t'ai déjà dit ce que j'en pensais et tu devrais quitter linux... :
en réalité je pense que Linux n'a d'intérêt, dans ce genre de problème, que pour permettre de récupérer des données (si accessibles) sur un autre DD, mais pas pour réparer un MBR ou des secteurs de boot de partitions corrompues (ce qui est peut être ton cas). En ce qui te concerne je crois que tu devrais :
- télécharger et graver Hirens boot CD pour passer un coup d'anti-virus et tester tes 2 DD avec les utilitaires présents sur le CD (et vérifie d'ailleurs s'il n'y a pas aussi un utilitaire de récupération de partition...)
- puis mettre testdisk sur disquette bootable (version DOS) et voir ce que t'arrives à faire comme ça (je pourrais pas te guider faute de copies d'écran réalisables sous DOS mais tu devrais y arriver avec mes 2 tutos ?). je me demande d'ailleurs s'il n'y a pas testdisk sur Hirens ?
- ou mettre tes 2 DD en esclave sur une autre machine pour utiliser testdisk sous Windows et pouvoir faire les copies d'écran si t'as des problèmes
Auteur : guismo_77
Réponse le : 10/11/2006 21:44
Message :
Pour l'instant je suis sur linux parce que je suis bien obligé vu que j'ai plus aucun autre OS qui se lance...
Je vais essayer de récuperer hiren boot cd. J'ai vu que testdisk et autres logiciels dont tu parles dans d'autres topic sont dedans.
Juste pour info, pcq les antivirus je les reconnaitrait, quels programmes de vérification de disques dois-je lancer ? c'est pas ce qui manque sur le cd (http://homepage.ntlworld.com/hiren.thanki/bootcd.html)
Je sais que j'ai l'air un peu neu-neu mais je suis à des années lumières de mes domaines de compétence !

Auteur : romsk
Réponse le : 10/11/2006 23:27
Message :
c'est dans "hard disk tools" : choisis l'utilitaire qui correspond à la marque de tes DD...
ou éventuellement dans "testing tools" : test hard disk drive 1.0
Auteur : flyin
Réponse le : 15/11/2006 14:25
Message :
Bonjour,
J'ai moi aussi un probleme avec mon disque dur : il ne demarre plus, mais lorsque je le met en slave il est detecté comme un disque dur de 10mo ( 150 go normalement  ) et tous les fichiers qu'il contient sont illisibles avec des noms du genre " fïÏf┴ÙÙ.Éè " . De plus ce disque dur est detecté en FAT alors qu'il devrai etre en NTFS  . Je pense changer le type de systeme de fichier puis d'utiliser Rebuild BS .
J'ai l'impression que mon disque dur possede une partion en fat de 10mo et une autre illisibles pourtant je n'ai qu'une partion.
Je vais bientot vous envoyer des screens.
Aurevoir
EDIT:bon puisque je n'arrive pas a mettre des screnn sur le forum je v copier à la main un phrase qui m'intrigue, je suis dans la section advance puis boot :
1* fat32 lba ( je pense que c'est le partion de 150 go qui devrai etre en NTFS )
.... ( ces points remplaces une phrase )
....
ok
warning: valid FAT bootsector but not a FAT32 one!
backup boot sector
ok
...
...
...
Auteur : romsk
Réponse le : 15/11/2006 15:45
Message :
salut flyin et bienvenue sur le forum,
il est nécessaire, pour y voir clair, de savoir, entre autre, ce que te montre PTEDIT : regarde mon sujet sur les partitions disparues dans ma signature
1) tu trouveras, en bas de ce sujet le lien de MJo54, pour faire tes copies d'écran,
2) fais nous les copies d'écran qui vont bien, à savoir :
- gestion des disques
- ce que montre PTEDIT32 et, si accessible, le secteur de boot
- testdisk > proceed
Auteur : flyin
Réponse le : 15/11/2006 16:44
Message :

 
mode analyse

puis proceed

 
voici un autre screen mais cette fois ci avec le mode advance puis boot


Auteur : romsk
Réponse le : 15/11/2006 18:36
Message :
effectivement :
1) ton secteur de boot est bien daubé (et ne correspond d'ailleurs même pas à ce qu'on s'attendrait à trouver sur du FAT32) et testdisk confirme que FAT32 ne lui convient pas,
2) t'as un problème de géométrie du disque dur...
1) dans PTEDIT efface "0C" et tape "07" à la place > write > quitte PTEDIT
2) testdisk > menu geometry > dans "heads" tape 255, puis dans "sectors" tape 63 > "OK" : entrée > write si demandé > menu analyse > proceed : copie d'écran > ou si ça montre rien fais search : copie d'écran
Auteur : flyin
Réponse le : 15/11/2006 22:13
Message :
romsk a écrit :

effectivement :
1) ton secteur de boot est bien daubé (et ne correspond d'ailleurs même pas à ce qu'on s'attendrait à trouver sur du FAT32) et testdisk confirme que FAT32 ne lui convient pas,
2) t'as un problème de géométrie du disque dur...
1) dans PTEDIT efface "0C" et tape "07" à la place > write > quitte PTEDIT
2) testdisk > menu geometry > dans "heads" tape 255, puis dans "sectors" tape 63 > "OK" : entrée > write si demandé > menu analyse > proceed : copie d'écran > ou si ça montre rien fais search : copie d'écran

J'ai bien modifié ptedit, mais pour heads et sectors les valeurs étaient deja de 255 et 63 par defaut, puis pour l'analyse ça ma donné exactement le meme screen que le 3eme screen DOS juste avant ( avec la ligne verte ) . Dois je changer le type de cette ligne verte pour la mettre en ntfs sachant quel est en FAT ?
Juste a titre indicatif je met un imprime ecran de la fenettre de mon diquqe dur :

Auteur : romsk
Réponse le : 15/11/2006 22:51
Message :
fais search, éventuellement 2 ou 3 fois de suite
Auteur : flyin
Réponse le : 15/11/2006 23:16
Message :
avec search j'obtien
 

Auteur : romsk
Réponse le : 15/11/2006 23:30
Message :
1) t'es sur qu'elle était en NTFS et pas en FAT32 (notamment par le passé ?)
2) testdisk montre à nouveau un problème de geometry du DD : retourne voir dans le menu geometry...
3) ton histoire est vraiment zarbi et tu devrais déjà passé un bon anti-virus et des anti-spywares...
Auteur : lbdr
Réponse le : 16/11/2006 00:03
Message :
Bonjour romsk,
J'ai lu avec attention ton tuto (déjà merci) et toutes les réponses, et je vois que je ne suis pas la seule (ça me rassure lol) à galérer avec un disque externe qui passe tout seul en RAW. J'ai utilisé tesdisk comme tu l'as indiqué. Après avoir fait les menu analyse et advanced, ou rien ne cloche apparemment avec mon DD, j'ai voulu faire un repair mft, qui me dit volume is corrupt. You should run chkdsk. Or quand je lance le chkdsk, ça me dit: le type de fichier est NTFS. Impossible de déterminer la version et l'état du volume. Abandon de chkdsk.
Que dois-je donc faire alors?
Auteur : flyin
Réponse le : 16/11/2006 00:51
Message :
romsk a écrit :

1) t'es sur qu'elle était en NTFS et pas en FAT32 (notamment par le passé ?)
2) testdisk montre à nouveau un problème de geometry du DD : retourne voir dans le menu geometry...
3) ton histoire est vraiment zarbi et tu devrais déjà passé un bon anti-virus et des anti-spywares...
Lorsque j'ai acheté mon pc le système était en FAT32 puis un jour j'ai decidé de le convertir en NTFS mais sans perdre mes données, j'ai fait une manip pusi ça a marché. Il y a une semaine environ, j'avais quelques problemes avec ma nouvelle carte graphique j'ai essayé plusieur chose dont une option, presente sur mon CD de restauration system fourni avec mon pc, qui permettait de reparer je ne sais plus quoi sur le disque dur et je pense que le probleme vien de cette option que j'ai utilisé ( peu etre qu'elle était faite pour le systeme d'origine c'est a dire FAT32 ) . Mais juste avant le probleme le DD etait bien en NTFS.
Edit: Sais tu à quoi correspond le " FAT12 " que je voi souvent sur testdisk ( aparrement il fait environ 10mo ) ? il est aussi presant sur un des screens que j'ai presenté.
Edit:" une table d'allocation des fichiers enfin existe pour chaque partition, appelée FAT (File Allocation Table) pour les partitions FAT32, et MFT (Master File Table) pour les partitions NTFS. Ce n'est ni plus ni moins qu'un répertoire permettant de retrouver tous les fichiers stockés dans la partition. Si ce répertoire est effacé windows ne peut plus retrouver aucune des données stockées dans la partition : elles sont bien présentes mais inaccessibles (sauf pour certains logiciels de récupération de données) 
Voyons maintenant en détail chacun de ces éléments : " ( citation du sujet : MBR, FAT et secteur de boot : Explications... )
peu etre que je dois convertit ma table d'allocation en MFT car je pense qu'elle est en FAT.
" Si ce répertoire est effacé windows ne peut plus retrouver aucune des données stockées dans la partition : elles sont bien présentes mais inaccessibles " mes données sont presentent mais inaccessibles avec des nom bizar. 

Auteur : romsk
Réponse le : 16/11/2006 13:09
Message :
re flyin,
...j'ai essayé plusieur chose dont une option, presente sur mon CD de restauration system fourni avec mon pc, qui permettait de reparer je ne sais plus quoi sur le disque dur et je pense que le probleme vien de cette option que j'ai utilisé ( peu etre qu'elle était faite pour le systeme d'origine c'est a dire FAT32 ) .
effectivement ton problème vient surement de là, encore qu'il faudrait savoir exactement quelle "option" t'as utilisée avec ce CD de restauration...
je me suis trompé dans PTEDIT : une fois que t'as fait les modifs (0C en 07) c'était "save changes" qu'il fallait faire (et pas write) : t'as fait ça ? et tant que tu y est modifie également "head" et "sector" en mettant respectivement 254 à la place de 136 et 63 à la place de 38 > save changes > quitte PTEDIT et redémarre l'ordi pour voir ce que ça donne...
fais également un CHKDSK /F /R de ce DD...
Edit: Sais tu à quoi correspond le " FAT12 " que je voi souvent sur testdisk
FAT12 est, je crois, réservé aux disquettes mais on ne trouve jamais ce format sur une partition...
romsk a écrit :

... 3) ton histoire est vraiment zarbi et tu devrais déjà passé un bon anti-virus et des anti-spywares...
ça aussi il vaut mieux le faire
Edit : je viens de voir ton edit... on ne convertit pas une FAT en MFT hélas. de toute façon, dans un 1er temps, fait ce que je te propose au dessus.
salut lbdr et bienvenue sur le forum 
essaye un CHKDSK /F /R sous la console de récupération en bootant sur le CD d'XP...
essaye également l'onglet sécurité dont j'explique le fonctionnement là : http://forum.pcastuces.com/sujet.asp?page=-1&f=1&s=100275&REP_ID=2002224
Auteur : flyin
Réponse le : 16/11/2006 13:13
Message :
" modifie également "head" et "sector" en mettant respectivement 254 à la place de 136 et 63 à la place de 38 " mais head est a 255 et sector a 63 .
Edit : j'ai fais rebuild BS mais il m'est impossible d'aller dans list.
Auteur : romsk
Réponse le : 16/11/2006 15:40
Message :
flyin a écrit :


je te parle du tableau de PTEDIT du dessus : tout est revenu à 07, 254 et 63 ?
Auteur : flyin
Réponse le : 16/11/2006 16:48
Message :
voila je vien de mettre 254 et 63
Auteur : romsk
Réponse le : 16/11/2006 18:19
Message :
flyin a écrit :

voila je vien de mettre 254 et 63
et alors, ça donne quoi 
Auteur : flyin
Réponse le : 16/11/2006 19:41
Message :
malheureusement rien a changé 
Est ce que le commande MBRcode peut etre une solution car je pense avoir un probleme avec el secteur de boot.
Edit: le logiciel EasyRecovery detecte 2 partions pour mon disque dur, une en fat32 de 150go et une autre en fat12 de 10mo. Lorsqu'il en detecte une il ne detecte pas l'autre et inversement.
 
 
Donc la partion reconnu par Windows est la FAT12, car dans le poste de travail mon DD est detecté comme un FAT avec 10mo.
Pourtant je n'ai jamais crée 2 partitions
Edit: je vien d'apprendre que sur un disque dur, il y a un espace non partionné qui ce compte en mo et reservé au systeme, est ce que ma partion FAT12 correspond a ça? Si oui dois je supprimer cette partition ?
Sur Easy recovery j'ai remarqué que pour la partition FAT12 le secteur de demarage est le 63 et sur le FAT32 c'est le 69. J'émet plusieurs hypothèses peut etre que ça peu servir.
Auteur : romsk
Réponse le : 16/11/2006 23:18
Message :
un CD de restauration, comme son nom l'indique, restaure qqch en écrasant ce qui existait sur le DD... dans ton cas "l'option" que tu as choisie avec ce CD a probablement restaurer je sais pas quoi (cette FAT12 en l'occurence) en écrasant hélas ce qui avait à la place, notamment ce secteur 63 qui est le secteur de boot habituel d'une partition NTFS.
le MBRcode quant à lui ne restaure que l'exécutable du MBR, c'est à dire le 1er secteur absolu du DD = secteur 0, mais en aucun cas ne reconstruira le secteur de boot qui te manque.
vu que testdisk n'arrive pas retrouver ta partition NTFS, je vois 3 solutions :
* on essaye de récupérer la copie de ton secteur de boot NTFS > on le colle sur le secteur 63 > on rectifie le descripteur de partition du MBR et on voit ce que ça donne
* ou alors tu tentes les différents logiciels de récupération pour voir s'ils te retrouvent tes répertoires et fichiers, et une fois que t'as tout récupéré tu reformates tout et tu repart à zéro,
* et si les logiciels de récupération n'y arrivent pas on supprime dans la gestion des disques la partition existante et on recrée une partition NTFS occupant l'intégralité du disque en espérant que les logiciels de récupération retrouveront mieux tes fichiers
pour les 2 dernières options je ne pense pas pouvoir t'être vraiment utile, mais si tu veux qu'on tente la 1ère solution, télécharge et ouvre Edithexa (regarde ici son fonctionnement), puis affiche le MBR du DD malade comme expliqué au 1) et fais en une copie d'écran > puis comme expliqué au 2) utilise la navigation disque pour visualiser le dernier secteur affichable sur ce DD qui est égal au nombre total de secteur qu'on voit en bas à droite - 1 : copie d'écran
Auteur : flyin
Réponse le : 17/11/2006 00:38
Message :
Avanr de lire ton message j'ai essayé de changer le type la partition FAT12 en NTFS, dans géré sur poste de travail il n'y a plus une partion en FAT de 150go mais une partition non alloué de 150go + une partion FAT 16mo je croi que j'ai fais une betise 
Et dans ptedit je m'aperçoi que la case cycle est a 1 alors qu'avant elle était a 1023.
edit : aujourd'hui je essayer Edithexa
EDIT:Je vien d'utiliser Getdatadisk ntfs et il a reussi a recuperer mes données ( c'était le seul ) mais ce n'est qu'une demo, comment l'acheter car je n'ai pas tous compris ( c'est en anglais  ). Mais bizarment il n'a reussi à recuperer aucune images iso.
Je vais copier mes données recuperé puis a ce moment je ferai toutes les manipulations possible pour recuperer mon disque dur avec toutes les données dedans.
Auteur : romsk
Réponse le : 17/11/2006 09:28
Message :
Avanr de lire ton message j'ai essayé de changer le type la partition FAT12 en NTFS, dans géré sur poste de travail il n'y a plus une partion en FAT de 150go mais une partition non alloué de 150go + une partion FAT 16mo je croi que j'ai fais une betise
cette nouvelle partition de 150 Go est probablement apparue après avoir modifier PTEDIT comme je te l'indiquais et c'est normal (c'est bien la taille de ton DD non ?)
Et dans ptedit je m'aperçoi que la case cycle est a 1 alors qu'avant elle était a 1023.
ben remet 1023 et fait "save changes"
EDIT:Je vien d'utiliser Getdatadisk ntfs et il a reussi a recuperer mes données ( c'était le seul ) mais ce n'est qu'une demo, comment l'acheter car je n'ai pas tous compris ( c'est en anglais  ). Mais bizarment il n'a reussi à recuperer aucune images iso. Je vais copier mes données recuperé puis a ce moment je ferai toutes les manipulations possible pour recuperer mon disque dur avec toutes les données dedans.
essaye aussi r-studio
Auteur : lbdr
Réponse le : 17/11/2006 12:27
Message :
Re bonjour,
alors pour l'onglet de sécurité, sous windows XP Pro, c'est bien dans Affichage de Options des dossiers, mais il n'y a pas paramètres avancés. il y a juste la case Utiliser le partage de fichiers simples. Je suppose qu'il faut donc la cocher, ce que j'ai fait. Par contre, comment faire pour pour accéder à la console de récupération sous Windows XP?
Merci
A+
Auteur : flyin
Réponse le : 17/11/2006 13:25
Message :
romsk a écrit :

Avanr de lire ton message j'ai essayé de changer le type la partition FAT12 en NTFS, dans géré sur poste de travail il n'y a plus une partion en FAT de 150go mais une partition non alloué de 150go + une partion FAT 16mo je croi que j'ai fais une betise
cette nouvelle partition de 150 Go est probablement apparue après avoir modifier PTEDIT comme je te l'indiquais et c'est normal (c'est bien la taille de ton DD non ?)
Et dans ptedit je m'aperçoi que la case cycle est a 1 alors qu'avant elle était a 1023.
ben remet 1023 et fait "save changes"
EDIT:Je vien d'utiliser Getdatadisk ntfs et il a reussi a recuperer mes données ( c'était le seul ) mais ce n'est qu'une demo, comment l'acheter car je n'ai pas tous compris ( c'est en anglais  ). Mais bizarment il n'a reussi à recuperer aucune images iso. Je vais copier mes données recuperé puis a ce moment je ferai toutes les manipulations possible pour recuperer mon disque dur avec toutes les données dedans.
essaye aussi r-studio

En faite depuis la modification dans PTEdit avec la valeur " 07 ", test disk detectait non plus une partition en FAT12 et une en FAT32 de 150go mais une partion en FAT12 et une en NTFS ( le changement des valeur 254 et 63 n'avait rien changé ) .Mais depuis la modification de la partition FAT12 ( que j'ai fais sur un coup de tete  ) , testdisk ne decte plus qu'une partition en FAT12.
Edit:Lors d'un scan avec r - studio ( merci de me l'avoir conseillé il a l'air efficace ) en bas il y a des message qui revienne au sujet du MFT :

Auteur : romsk
Réponse le : 17/11/2006 15:18
Message :
flyin, que ta partition de 146 Go soit NTFS ou non allouée n'est pas très important, la manip que je te propose avec Edithexa pourrait régler ce problème (ou on refera appel à testdisk ou à PTEDIT).
pour ce que te montre r-studio, avais-tu fais une configuration RAID de ce DD avec un autre DD ??? ou un disque dynamique (au lieu de disque de base classique) ??? ceci expliquerait bien des choses...
lbdr, pour l'onglet sécurité est-ce que tu as fait le reste : "puis cliquer sur "Poste de Travail" > clic droit sur le disque dur RAW : option "Propriétés" > dans l'onglet "Sécurité", cliquer sur "Ajouter" > "Avancé" > "Rechercher" > cliquer sur le nom qui apparaît dans la colonne "Nom (RDN)" > valider en cliquant deux fois sur "OK" > toujours dans l'onglet "Sécurité", sélectionner le nom d'utilisateur > cocher "Autoriser" (en face de "Contrôle total" ) > "Paramètres avancés..." > cocher la case "Remplacer les entrées d'autorisations de tous les objets entrants par les entrées affichées ici et qui s'appliquent aux objets entrants" > valider en cliquant deux fois sur "OK" > redémarrer le PC et regarder si les données sont de nouveau accessibles…"
concernant la console de récupération, voir les différentes pages de http://www.pcastuces.com/pratique/windows/xp/console_recuperation/page4.htm
Auteur : flyin
Réponse le : 17/11/2006 15:48
Message :
non je n'ai jamais eu de disque dur en raid, j'ai acheté un nouveau disque dur des le debut de mon probleme.
J'ai recupéré toutes mes données avec r studio ( sauf mes muisques )
Je vais essayer la manip avec Edithexa je prefere recuperer toutes mes données sur mon disque dur d'origine.
En tout cas je te remerci infiniment pour toute le temps que tu a passé pour m'aider .
Auteur : lbdr
Réponse le : 17/11/2006 22:21
Message :
Re bonsoir,
Alors pour la suite, le problème c'est que dans poste de travail, clic droit sur le disque en Raw, options Propriétés, il n'y a pas d'onglet Sécurité. On peut y accéder ailleurs?
En ce qui concerne le chkdsk dans la console de récupération, voila le message qui s'affiche: il semble que le disque contiennent des problèmes irrécupérables.
Que faire maintenant?
Auteur : romsk
Réponse le : 17/11/2006 22:58
Message :
le problème c'est que dans poste de travail, clic droit sur le disque en Raw, options Propriétés, il n'y a pas d'onglet Sécurité. 
ben et ça tu l'as pas fait ??? sous XP pro : ouvrir le "Poste de Travail" > menu "Outils" > "Options des Dossiers..." > onglet "Affichage" > décocher l'option "Désactiver le partage de fichiers simple (recommandé)" dans la section "Paramètres avancés" > Valider les changements.
Ce n'est qu'après cette manip que tu pourras accéder à l'onglet sécurité...
chkdsk dans la console de récupération, voila le message qui s'affiche: il semble que le disque contiennent des problèmes irrécupérables.
alors là c'est pas glop : tu devrais tester ton DD avec le logiciel constructeur (quelle est la marque ?) ainsi que HD tune
Auteur : lbdr
Réponse le : 18/11/2006 13:37
Message :
Bonjour,
Ben le problème, comme je t'ai dit auparavant, c'est qu'il n'y a pas Paramètre avancés dans Affichage. Et il n'y a que l'option Utiliser le partage de fichiers simples, que je laisse donc coché je suppose.
Mon DD est un Maxtor Diamond Max 10.
Auteur : flyin
Réponse le : 18/11/2006 13:44
Message :
romsk a écrit :


pour les 2 dernières options je ne pense pas pouvoir t'être vraiment utile, mais si tu veux qu'on tente la 1ère solution, télécharge et ouvre Edithexa (regarde ici son fonctionnement), puis affiche le MBR du DD malade comme expliqué au 1) et fais en une copie d'écran > puis comme expliqué au 2) utilise la navigation disque pour visualiser le dernier secteur affichable sur ce DD qui est égal au nombre total de secteur qu'on voit en bas à droite - 1 : copie d'écran
1)

2)

Auteur : romsk
Réponse le : 18/11/2006 19:42
Message :
lbdr, bizarre pour l'onglet sécurité, mais bon... va sur le site maxtor et télécharge powermax pour tester ton DD
flyin, dans la navigation disque (ton 2ème tableau), au lieu de 63 met 306921824 : copie d'écran
Auteur : flyin
Réponse le : 18/11/2006 19:59
Message :

Auteur : romsk
Réponse le : 18/11/2006 21:10
Message :
hélas pour toi flyin, il devrait y avoir sur ta dernière copie d'écran la copie du secteur de boot de ton ancienne partition NTFS mais manifestement ce n'est pas ça... ton MBR par ailleurs me semble normal (si ce n'est le descripteur de partition qui ne montre que ta FAT12...) et je confirme que MBRcode dans ton cas ne servirait à rien.
je pense que ta manip avec le CD de restauration aura été fatale en écrasant une partie de ce qu'il y avait sur ce DD, mais peut être des logiciels de récupération pourront te récupérer des données ? à tester en commencant par r-studio (puis easyrecovery, PCrecovery, getdataback,...)
une fois que tu auras récupéré tout ce que tu peux, on essayera autre chose : en faisant exactement ce que je propose au 3) du sujet sur edithexa, regarde si tu trouves un secteur contenant le mot M.F.T.M.i.r.r.... car dans ce cas on pourrait essayer de formater en NTFS ta partition en précisant ensuite le cluster de la MFT dans le nouveau secteur de boot créé (mais je garantis rien...)
Auteur : flyin
Réponse le : 19/11/2006 16:31
Message :
Mes données ont été recuperé, grace a R-studio ( sauf mes musiques, quelques saves et images iso ).
Je pense que je vais abandonner la recuperation de mon disque dur d'origine, j'ai recupéré mes données principal je suis soulagé.
Romsk, je te remerci pour l'aide que tu ma apporté, tu a pris de ton temps pour le faire c'est tres gentil.
Auteur : lbdr
Réponse le : 20/11/2006 14:04
Message :
Bonjour tout le monde,
Je reviens sur le forum après près un week-end sans le net (vive Noos! lol). Je n'ai donc pu télécharger powermax sur le site de Maxtor, comme tu me l'as indiqué Romsk. Toutefois j'ai pu récupérer toutes mes données grâce à Get Data Back (que j'ai lancé en désespoir de cause). Merci beaucoup romsk pour tous tes conseils.
A bientôt sur le forum (pas trop rapidement j'espère lol).
Auteur : romsk
Réponse le : 20/11/2006 21:01
Message :
content pour toi lbdr, ainsi que pour flyin, l'essentiel étant d'avoir pu quand même récupérer vos données...
Auteur : Pikami
Réponse le : 23/11/2006 11:37
Message :
Bonjour,
J'ai bien parcourus tous le forum sur testdisk cependant je ne trouve pas la réponse à mon probléme.
J'explique :
Un DD MAXTOR de 160 GB m'a laché. (Quant l'ouvre apparait la fenêtre : Voulez vous formatez le DD ?)
C'est un disque amovible. (plus pratique que de le brancher directement dans ma tour)
et lorsque je lance le gestionnaire de disque voici ce que cela donne :
 
donc je lance testdisk

et je choisi dvb puis proceed > intel enter
(ah c'est pratique ils ont la même taille grrr, facile des les reconnaitre...) mais c'est bien dvb.
etj'obtiens ça :

puis Analyse
 
là il n'y a que 3 possibilités "*","D" et "P"
Le gros doute s'intalle que faire ? Pouvez vous m'aider siouplait ?
Auteur : romsk
Réponse le : 23/11/2006 14:53
Message :
salut pikami,
ta bonne partition c'est celle ci :
 
si ce n'est qu'il s'agirait plutôt d'une partition logique puisque commençant au cylindre 1 ? ça expliquerait en tous les cas les 8 Mo non alloués en début de disque : est-ce que, auparavant, tu avais déjà vu ces 8 Mo non alloués ? y-avait'il une partition cachée que tu as effacée ?
Dans un 1er temps va dans le menu advanced, et si tu retrouves la partition NTFS ci-dessus fais "boot" pour voir comment sont reconnus le secteur de boot et sa copie.
si tu ne la vois pas retourne dans le menu analyse > proceed > search (éventuellement 2 ou 3 fois de suite si tu la retrouves pas au 1er coup) > et quand tu la vois met la en "L" par les fleches droite gauche > write > menu analyse > boot : copie d'écran
Auteur : Pikami
Réponse le : 23/11/2006 19:49
Message :
Tous d'abord, merci pour ta réponse rapide !
La partition de 8 Mo a été effacer par erreur. Comment, ou, quant aucune idée...
C'est peut etre pour cela que le DD ne se lance pas.
voici se qu'il m'affiche aprés avoir fait un "boot" sur la bonne partition 

A partir de là
lorsque je reviens au menu précédent pour faire "analyse"
je n'arrive toujours pas a le mettre en "L", même en rélançant ... il n'y a que * et P en choix !
parcontre j'ai cet écran quant j'appuie sur "L".

Qu'est ce que cela veut dire ?
Auteur : romsk
Réponse le : 23/11/2006 22:33
Message :
La partition de 8 Mo a été effacer par erreur. Comment, ou, quant aucune idée...
ben non, c'est ce que je t'explique : si cette partition était une partition logique, c'est normal que t'ais ces 8 Mo non alloués...
comme t'arrives pas à la paramétrer en "L" on va modifier le MBR de ton DD et ça devrait être bon : regarde ici et fais une copie d'écran du MBR de ce DD comme expliqué au paragraphe 1)
Auteur : Pikami
Réponse le : 24/11/2006 10:37
Message :
romsk a écrit :

La partition de 8 Mo a été effacer par erreur. Comment, ou, quant aucune idée...
ben non, c'est ce que je t'explique : si cette partition était une partition logique, c'est normal que t'ais ces 8 Mo non alloués...
comme t'arrives pas à la paramétrer en "L" on va modifier le MBR de ton DD et ça devrait être bon : regarde ici et fais une copie d'écran du MBR de ce DD comme expliqué au paragraphe 1)
oki voici le screen

Auteur : romsk
Réponse le : 24/11/2006 12:57
Message :
   tu t'es trompé de DD, c'est le disque physique 2 qu'il faut choisir dans la case "support physique" (ton PC n'aurait plus redémarré...)
quand tu auras choisi le bon disque dur (si t'as un doute refais une copie d'écran), clique sur le "00" qui s'affiche à l'intersection de la ligne 1C0 et de la colonne 1 > tape "01" > clique sur la 4ème icone en haut à gauche (la disquette bleue) pour enregistrer la modification > confirme par ok > ferme > redémarre l'ordi et va voir dans l'explorateur windows tous tes fichiers retrouvés... 
Auteur : Pikami
Réponse le : 24/11/2006 15:49
Message :
rahh effectivement c'était le disque 1 lol
voici le bon DD

L'emplacement que tu as indiqué est-il toujours le même ? là ou le curseur est bleu à "01" ?
Je dois redemmarer le pc même si le DD où je veux récupérer les données est sur un disque amovible ?
Auteur : romsk
Réponse le : 24/11/2006 17:50
Message :
Je dois redemmarer le pc même si le DD où je veux récupérer les données est sur un disque amovible ?
non, c'est pas la peine.
le 01 bleu que tu me montres y était-il déjà ou est-ce que c'est toi qui vient de le mettre ?
montre moi, avec Edithexa, le secteur aux coordonnées CHS 0 1 1 ainsi que celui aux coordonnées 1 1 1 (en faisant comme expliqué au paragraphe 2) en utilisant l'onglet "outils disque")
Auteur : Pikami
Réponse le : 24/11/2006 18:26
Message :
le 01 bleu que tu me montres y était-il déjà ou est-ce que c'est toi qui vient de le mettre ?
montre moi, avec Edithexa, le secteur aux coordonnées CHS 0 1 1 ainsi que celui aux coordonnées 1 1 1 (en faisant comme expliqué au paragraphe 2) en utilisant l'onglet "outils disque")
Le 01 bleu était déja là. Je n'ai rien touché;
Voici le screen du CHS 0 1 1
 
et CHS 1 1 1

En espérant que se soit les bonnes manips.
Auteur : romsk
Réponse le : 24/11/2006 20:14
Message :
tes manips sont très bonnes et les 2 secteurs que tu montres correspondent précisément aux 2 partitions retrouvées par testdisk, celui du haut correspondant à ta partition de 41 624 351 secteurs (qui nous intéresse pas) et celui du bas à la partition qu'on cherche à faire réapparaitre de 320 143 256 secteurs (soit 150 Go et qques...). Donc côté secteur de boot tout semble effectivement OK...
le descripteur de partition de ton MBR est non moins juste et renvois aux bonnes coordonnées du secteur de boot (CHS 1 1 1), donc le problème ne vient pas de lui non plus.
Reste la MFT : quand tu es sur ce tableau (dans le menu advanced > boot), fais "repair MFT" :


Auteur : Pikami
Réponse le : 24/11/2006 23:34
Message :
Heu il me demande ça. Que dois je mettre ?
 

Auteur : romsk
Réponse le : 25/11/2006 07:42
Message :
ben "yes" 
Auteur : Pikami
Réponse le : 25/11/2006 10:49
Message :
humm (c'était évident mais vaut mieux etre sûr) ayeh ai fait Yes.
Il est donc sencé avoir réparer le MFT.
Et là ? (dsl chuis pas doué)
Car lorsque je relance une analyse j'ai toujours la partition "sauvegarde" qui est en mode
D, ou P ou *.

Auteur : romsk
Réponse le : 25/11/2006 11:11
Message :
c'est censé être terminé : va voir dans l'explorateur si tu retrouves tes données... si problème persiste refais un CHKDSK M: /F /R (démarrer > exécuter > cmd)
(PS : normal que la partition reste en "P" puisqu'on l'a laissée en "P"...)
(PPS : qu'est ce qu'il t'a affiché quant t'as fait "repair MFT" : "MFT seems OK" ? ou est-ce qu'il semble avoir réparé qqch ?...)
Auteur : Pikami
Réponse le : 25/11/2006 20:35
Message :
Ayeh ça marche !!
J'ai donc fait un "repair MFT" et redemarrer le pc.
Merci beaucoup romsk! 
Auteur : romsk
Réponse le : 26/11/2006 08:19
Message :
 content pour toi pikami 
Auteur : Nosol
Réponse le : 01/12/2006 19:12
Message :
Bonsoir,
Je voulais dire un grand merci à Romsk pour sa position dans ce forum trés attentive qui donne des réponses claires et éclairées :)
Je suis moi aussi tombé sur le probléme de changement de format en données brutes raw de mes deux disques dur principaux suite a une réinstall de windows xp pro. Le premier(données) étant reconnu comme defectueux dans partition magic mais accessible sous xp aprés quelques heures de travail je l'avoue. Par contre pour le deuxiéme (systéme&données) ce fut une tout autre histoire pas reconnu et pas accessible

D'autant qu'il n'ai (E:) vu que comme un disque < 130go comme sous les install de xp sans le sp1 ????
Aprés avoir lu les explications de Romsk je me suis lancé sur EditHexa pour trouver le mbr, absent, j'ai alors fait un fixmbr dans la console de recupération xp sous dos, pas mieux, je me suis mis sous Testdisk :
et là j'ai fais un write mbr sur les deux partitions logique de chacun de mes dd ayant un probléme et là aprés un redémarrage que du bonheur, retour de l'arborescence de tout mes fichiers et les deux dd n'apparaissent plus comme defectueux sous partition magique, que du bonheur!
J'étais vert pasque sur le disque dur qui ne répondais plus j'avais toutes mes photos et 100go de mp3 (les derniers:). Je tiens donc a dire un gros merci qui viens du fond du coeur celui là a romsk pour sa contribution a nous aide, chapeau bas...
Trés cordialement... 
Auteur : romsk
Réponse le : 01/12/2006 21:01
Message :
ben ça alors c'est gentil Nosol, ça me va droit au 
Auteur : DiUf_R
Réponse le : 05/12/2006 12:09
Message :
Bonjour et bravo à Romsk pour son aciduité à aider les personnes en galère avec leurs DD.
Voilà moi j'essai de refaire fonctionner un DD Maxtor 6E030L0.
J'ai réalisé un test avec MaxPower qui me renvoie une erreur et code d'erreur: ca9f687c.
Malgré différents formatages le problème demeure et j'aimerai savoir si testdisk pourrait résoudre mon problème.
J'ai donc lancé una analyse et durant celle, j'ai plusieurs messages de ce type:
Read error at 184/2/1 (lba=2956086)
J'aimerai juste savoir si cela signifie que mon DD est totalement mort ou si je dois persister dans mes recherches.
Merci par avance.
Auteur : romsk
Réponse le : 05/12/2006 12:21
Message :
salut diuf_r,
quand powermax signale des erreurs, testdisk ne peut plus rien car il s'agit habituellement de secteurs défectueux or testdisk ne fait que lire les données "lisibles" sur le DD...tu devrais par contre essayer HD-regenerator qui, lui, peut te "réparer" le DD (as-tu fait un chkdsk /F /R ?)
Auteur : DiUf_R
Réponse le : 05/12/2006 12:54
Message :
Merci de ta réponse rapide.
A la fin de l'analyse testdisk ne trouve aucune partition ce qui est normal mais par contre il indique structure : OK.
Mais je vais essayer HD regenerator.
Merci encore.
Auteur : flo88
Réponse le : 20/12/2006 07:50
Message :
Bonjour à tous, je viens de m'inscrire ici apres avoir lu pas mal de chose et pour pouvoir obtenir un coup de main de personnes qui aiment rendre service, je vais essayée d'etre claire mais bon...
Alors
j'ai un DD de 200go coupé en 2 :une partition C: de 10go et D: de 176 go (je crois a l'origine)
j'ai voulue avec partition magic agrandir mon C: de 10 à 20go opération réussie mais plantage de PMC
Donc à l'arrivée j'ai mon C: de 19.9go et plus de D (partition inconnue) et avec PMC et dans gestion de disque de windows.
J'utilise testdisk et je vois bien ma partition avec tous mes fichiers ensuite je ne sais pas ce que j'ai fait je crois "write" et la badaboum????je suis dans la panade...
Maintenant j'ai à nouveau mes 2 partions C: 19.9go et D:166go mais sans aucune données dessus, je n'ai pas formaté juste crée
J'ai refait testdisk mais je suis larguée et j'ai juste réussi à mettre la capture d'ecran sur un url mets pas sur cette page , voici l'adresse de la capture d'ecran
http://img135.imageshack.us/my.php?image=avantapresqd0.jpg
create-proced-intel-analyse sur: L HPFS NTFS-proced ; j'obtiend 4 lignes qui commencent D
Quelqu'un aurait'il un peu de temps à perdre pour me dire , voir m'expliquer pas à pas comment je peux récupérer mes données et surtout si c'est toujours possible, j'y connait pas grand chose, juste quelques bases....autrement j'ai une adresse msn que je peux communiquer pour plus de faciliter,tout en nottant ici le principal pour que d'autres en profite bien sur..
Voila j'espère que quelqu'un pourra m'aider merci d'avance et bonne journée
Auteur : romsk
Réponse le : 20/12/2006 11:25
Message :
salut flo88,
2 solutions :
* soit on rétablit ta config d'origine (10 et 176 Go) par le 1er tableau (en rétablissant les 2 premières lignes)
* soit on essaye de faire réapparaitre tes nouvelles partitions (19,9 et 166 Go) par le 2ème tableau (en rétablissant les 2ème et 4ème lignes)
compte tenu de ce que partition magic a planté (et qu'on sait pas trop ce qu'il a planté), je pense qu'il vaut mieux prendre la 1ère option (rétablir ton ancienne config) qui, si elle marche, te permettra de sauvegarder tes données > avant de défragmenter +++ en mode sans échec tes 2 partitions C: et D: > avant de refaire la manip de repartitionnement sous partition magic.
donc sur ton 1er tableau laisse les 1ère, 3ème et 4ème lignes telles qu'elles sont et positionne toi sur la 2ème ligne > fleche droite pour la faire apparaitre en "P" au lieu de "D" (c'était une partition principale ou une partition logique ?) > entrée > write > menu advanced > boot : copie d'écran
Auteur : flo88
Réponse le : 20/12/2006 16:49
Message :
romsk a écrit :

salut flo88,
2 solutions :
* soit on rétablit ta config d'origine (10 et 176 Go) par le 1er tableau (en rétablissant les 2 premières lignes)
* soit on essaye de faire réapparaitre tes nouvelles partitions (19,9 et 166 Go) par le 2ème tableau (en rétablissant les 2ème et 4ème lignes)
compte tenu de ce que partition magic a planté (et qu'on sait pas trop ce qu'il a planté), je pense qu'il vaut mieux prendre la 1ère option (rétablir ton ancienne config) qui, si elle marche, te permettra de sauvegarder tes données > avant de défragmenter +++ en mode sans échec tes 2 partitions C: et D: > avant de refaire la manip de repartitionnement sous partition magic.
donc sur ton 1er tableau laisse les 1ère, 3ème et 4ème lignes telles qu'elles sont et positionne toi sur la 2ème ligne > fleche droite pour la faire apparaitre en "P" au lieu de "D" (c'était une partition principale ou une partition logique ?) > entrée > write > menu advanced > boot : copie d'écran

Merci de me répondre, mais il y a un probleme c'est le 1er tesdisk mon 1er tableau et j'ai appuyé sur write donc apres cela je n'ai plus que le 2eme tableau avec que des D en debut de ligne et pour les 4, si c'est toujours possible il n'y a aucun probleme pour remettre les partitions comme au départ c'est à dire c:10go
mon 1er disque dur est coupé en 2 donc une pricipale et une logique (enfin je pense) la 2eme partie n'etait que des données (celle que j'ai perdu)ce DDest de 200go
et j'ai un autre DD de 320go qui affiche 298go
voici ce que j'ai maintenant: http://img128.imageshack.us/my.php?image=03kk5.jpg et c'est cette partition que j'aimerais récupérer
Auteur : romsk
Réponse le : 20/12/2006 21:41
Message :
quand tu es sur cette 3ème ligne, tape sur "P" et regarde si tu vois tous tes fichiers et répertoires (navigation dans les répertoires par les fleches de navigation, tape "Q" pour quitter) : si c'est bon on la rétablira, sinon il faudra en recréer une...
Auteur : flo88
Réponse le : 21/12/2006 00:16
Message :
romsk a écrit :

quand tu es sur cette 3ème ligne, tape sur "P" et regarde si tu vois tous tes fichiers et répertoires (navigation dans les répertoires par les fleches de navigation, tape "Q" pour quitter) : si c'est bon on la rétablira, sinon il faudra en recréer une...
Ha désolé "can't open filesystem.".
Je vois mes fichiers dans les 2 première lignes et dans la dernière mais pas dans la 3eme
je suis contente de voir qu'il y a quelqu'un qui est la pour m'aider et j'ai vu que tu avait beaucoup de remerciements dans ce post, j'espère que ce sera bon pour moi, bonne soirée
Auteur : romsk
Réponse le : 21/12/2006 06:31
Message :
alors sur ce tableau laisse les 1ère et 3ème lignes telles qu'elles sont > positionne toi sur la 2ème ligne > fleche droite pour la faire apparaitre en "*" > va sur la 4ème ligne > fleche droite gauche pour la mettre en "L" (puisque tu penses que c'était une partition logique) > entrée > write > menu advanced > boot : copie d'écran
Auteur : flo88
Réponse le : 21/12/2006 07:08
Message :
romsk a écrit :

alors sur ce tableau laisse les 1ère et 3ème lignes telles qu'elles sont > positionne toi sur la 2ème ligne > fleche droite pour la faire apparaitre en "*" > va sur la 4ème ligne > fleche droite gauche pour la mettre en "L" (puisque tu penses que c'était une partition logique) > entrée > write > menu advanced > boot : copie d'écran
Bonjour, je vois qu'on est matinal
la 2eme et 4eme ligne c'est ce que j'ai actuellement je ne sais pas la manip que l'on va faire mais j'aimerais récupérer ce qu'il y a dans la 1ere et 3eme ligne.
Je fais comme decrit au dessus et voila ce que j'obtiens:
http://img528.imageshack.us/my.php?image=04lr2.jpg et
http://img528.imageshack.us/my.php?image=05hq8.jpg
Auteur : romsk
Réponse le : 21/12/2006 08:57
Message :
y'a 2 raison pour ne pas récupérer la 3ème :
* d'une part ton message d'erreur "can't open filesystem"
* d'autre part les coordonnées CHS qui sont suspectes (une partition ne commence jamais au secteur 6 (CHS 1275 1 6)
puisque les secteurs de boot sur les 2ème et 4ème que tu viens de recréer semblent bons, vérifie si tu ne retrouves pas tes données...
Auteur : flo88
Réponse le : 21/12/2006 13:07
Message :
romsk a écrit :

y'a 2 raison pour ne pas récupérer la 3ème :
* d'une part ton message d'erreur "can't open filesystem"
* d'autre part les coordonnées CHS qui sont suspectes (une partition ne commence jamais au secteur 6 (CHS 1275 1 6)
puisque les secteurs de boot sur les 2ème et 4ème que tu viens de recréer semblent bons, vérifie si tu ne retrouves pas tes données...

je vois bien les données de mon C: actuel (je travail avec en ce moment)
mon ancien D n'affiche plus de données (176go) et c'est celui la que j'aimerais récupérer c'est celui qui: ""can't open filesystem" j'ai pas formaté
mon nouveau D que j'ai recréé et vide (166go),je n'y touche plus pour l'instant, je ne l'ai pas formaté, juste crée la partition pour le voir réaparaitre, j'ai du faire une co...rie peut-etre ?
Pourquoi il indique 6 c'est bizarre?
Auteur : romsk
Réponse le : 21/12/2006 14:28
Message :
ton C: actuel (resizé à 19,6 Go) correspond à la 2ème ligne (0 1 1 2549 254 63), et si tu veux garder cette partition tu ne peux pas récupérer ton ancien D: de 176 Go qui correspond à la partition de la 3ème ligne (1275 1 6 24319 254 63) car les coordonnées cylindre (que j'ai mises en gras) se chevauchent :
* donc soit tu rétablis 1er et 3ème ligne = revenir à ton C: de 10 Go et recréer le bon D: qui commence à 1275 1 1
* soit tu rétablis 2ème et 4ème ligne = garder ton C: aggrandis de 19,6 Go et tenter de réparer la MFT sous testdisk puisque tu vois pas tes données
tu as bien dis que sous testdisk tu voyais bien tous tes répertoires et fichiers sur la 4ème ligne quand tu tapes "P" (revérifie) ? dans ce cas on peut tenter le "repair MFT" dans le menu advanced > met toi sur la ligne du D: reconstruit (2550 1 1 24320 254 63) > boot > repair MFT...
Auteur : flo88
Réponse le : 21/12/2006 17:26
Message :
romsk a écrit :

ton C: actuel (resizé à 19,6 Go) correspond à la 2ème ligne (0 1 1 2549 254 63), et si tu veux garder cette partition tu ne peux pas récupérer ton ancien D: de 176 Go qui correspond à la partition de la 3ème ligne (1275 1 6 24319 254 63) car les coordonnées cylindre (que j'ai mises en gras) se chevauchent :
* donc soit tu rétablis 1er et 3ème ligne = revenir à ton C: de 10 Go et recréer le bon D: qui commence à 1275 1 1
* soit tu rétablis 2ème et 4ème ligne = garder ton C: aggrandis de 19,6 Go et tenter de réparer la MFT sous testdisk puisque tu vois pas tes données
tu as bien dis que sous testdisk tu voyais bien tous tes répertoires et fichiers sur la 4ème ligne quand tu tapes "P" (revérifie) ? dans ce cas on peut tenter le "repair MFT" dans le menu advanced > met toi sur la ligne du D: reconstruit (2550 1 1 24320 254 63) > boot > repair MFT...

OK, je refait un search et P sur la 4 eme ligne sur ce DD et ce que je voudrais c'est bien récupéré mes partitions de depart donc C: 10go et surtout mon D:176go donc il semble que c'est bien les lignes 1 et 3 (pour le C: je m'en fou un peu c'est juste le système d'exploitation)
Auteur : flo88
Réponse le : 21/12/2006 17:28
Message :
OK, je refait un search et P sur la 4 eme ligne sur ce DD et ce que je voudrais c'est bien récupéré mes partitions de depart donc C: 10go et surtout mon D:176go donc il semble que c'est bien les lignes 1 et 3 (pour le C: je m'en fou un peu c'est juste le système d'exploitation)
quand je fais P pour la 4 eme ligne je n'ai rien puisque depuis ma con...ie je ne l'ai plus utilisé
Auteur : romsk
Réponse le : 21/12/2006 18:40
Message :
ben alors qu'est-ce que tu disais à 00h16 ???
flo88 a écrit :

Je vois mes fichiers dans les 2 première lignes et dans la dernière mais pas dans la 3eme

dans ce cas y'a pas d'autre solution que de recréer ton D: précédent (et donc remettre aussi ton C: 10 Go). Donc va sur ce tableau :

met la 1ère ligne en "*" par les fleches droite gauche (et laisse les 3 autres en "D") > tape "A" > rentre successivement les valeurs suivantes : 1275, 1, 1, 23045, 254, 63, type : 07 > done : ok > fleche droite gauche pour mettre cette partition en "L" > write > va dans le menu advanced > et vérifie le secteur de boot pour les 2 partitions recréées : copies d'écran...
Auteur : flo88
Réponse le : 21/12/2006 21:44
Message :

Ha la situation s'agrave : je n'ai plus que 3 lignes
mon C: actuel de 20go
mon D:ancien de 176go ou je ne peux plus voir les fichiers
mon D: actuel de 166go ou il n'y a rien enfin si systeme volume information
comment ca se fait que je n'ai plus mon ancien C: ?
http://img238.imageshack.us/my.php?image=06dv1.jpg
Auteur : romsk
Réponse le : 21/12/2006 22:36
Message :
alors on va recréer les 2 :
laisse les 3 lignes en "D" > tape "A" > rentre successivement les valeurs suivantes : 0, 1, 1, 1274, 254, 63, type : 07 > done : entrée > fleche droite gauche pour mettre cette partition en "*" > tape "A" > rentre successivement les valeurs suivantes : 1275, 1, 1, 23045, 254, 63, type : 07 > done : entrée > fleche droite gauche pour mettre cette partition en "L" > entrée > write > va dans le menu advanced > et vérifie le secteur de boot pour les 2 partitions recréées : copies d'écran...
Auteur : flo88
Réponse le : 22/12/2006 14:06
Message :
romsk a écrit :

alors on va recréer les 2 :
laisse les 3 lignes en "D" > tape "A" > rentre successivement les valeurs suivantes : 0, 1, 1, 1274, 254, 63, type : 07 > done : entrée > fleche droite gauche pour mettre cette partition en "*" > tape "A" > rentre successivement les valeurs suivantes : 1275, 1, 1, 23045, 254, 63, type : 07 > done : entrée > fleche droite gauche pour mettre cette partition en "L" > entrée > write > va dans le menu advanced > et vérifie le secteur de boot pour les 2 partitions recréées : copies d'écran...

Bonjour à toi et je te remercie d'etre patient, donc j'ai effectuée ce que tu m'as dit au dessus et voila ce que ca donne :
http://img295.imageshack.us/my.php?image=08tj5.jpg
ça n'a pas l'air d'etre bon , qu'en penses tu ?
Auteur : romsk
Réponse le : 22/12/2006 14:19
Message :
fais "rebuild BS" sur le 2ème tableau que tu montres > fait "list" pour voir si tu retrouves les fichiers et répertoires de windows > et si c'est bon fait "write" (mais pas si tu vois pas tes fichiers et répertoires)
vérifie également le secteur de boot de la 2ème partition recréée (advanced > met toi sur la partition 5 en L > boot) > et mêmes manips si mêmes constatations (et fais une copie d'écran si t'as un doute)
Auteur : flo88
Réponse le : 22/12/2006 14:49
Message :
romsk a écrit :

fais "rebuild BS" sur le 2ème tableau que tu montres > fait "list" pour voir si tu retrouves les fichiers et répertoires de windows > et si c'est bon fait "write" (mais pas si tu vois pas tes fichiers et répertoires)
vérifie également le secteur de boot de la 2ème partition recréée (advanced > met toi sur la partition 5 en L > boot) > et mêmes manips si mêmes constatations (et fais une copie d'écran si t'as un doute)

AVANT DE FAIRE CE QUE TU VIENS DE ME DIRE je te montre que j'ai à nouveau 4 lignes:
http://img122.imageshack.us/my.php?image=09bq0.jpg
donc je fais comment maintenant? J'ai fait "rebuild BS" et "list":
http://img122.imageshack.us/my.php?image=10yy2.jpg
Auteur : romsk
Réponse le : 22/12/2006 15:32
Message :
j'comprend plus rien à ce que tu fabriques 
ça nous ramène à ce que je te proposais plus haut, c'est à dire : laisse les 4 lignes en l'état (la 1ère en "*" et les 3 autres en "D") > tape "A" > rentre successivement les valeurs suivantes : 1275, 1, 1, 23045, 254, 63, type : 07 > done : entrée > fleche droite gauche pour mettre cette partition en "L" > write > va dans le menu advanced > et vérifie le secteur de boot pour les 2 partitions : copies d'écran...
Auteur : flo88
Réponse le : 22/12/2006 18:53
Message :
bon j'ai été obligée de formater et reinstaller windows, j'ai subit un joli plantage, je suis désolée, car je dois m'absenter pour les fetes, donc je ne pourrait pas continuer l'opération ces jours -ci, des que je reviens on essaye de revoir ca ensemble si tu le veux bien..
EN ATTENDANT TRES BON NOEL
Auteur : romsk
Réponse le : 22/12/2006 19:00
Message :
flo88 a écrit :

bon j'ai été obligée de formater et reinstaller windows, j'ai subit un joli plantage,
ben alors qu'est-ce qui t'est arrivé ??? 
passe de bonnes fêtes et bonne année par avance 
Auteur : Rom
Réponse le : 23/12/2006 15:20
Message :
Bonjour,
J'ai un soucis avec un pc portable dont j'ai ouvert un post ici: http://forum.pcastuces.com/sujet.asp?f=1&s=116945
j'ai lancé testdisk via UBCD 3.4, et j'ai lancé une analyse et voila ce que j'obtient
Partition Start End Size in sector
1*FAT32LBA 0 1 1 3646 254 63 58588978
Bad sector count
j'ai alors choisi [Proceed] et depuis je suis sur:
Disk 80 - 30GB / 27GiB - CHS 3649 255 63
Analyse cylinder 0/3648: 00%
1*FAT32LBA 0 1 1 3646 254 49 58588978 [NO NAME]
Je voudrais savoir a quoi correspond le Bad sector count??
J'ai lu que l'on pouvais forcer le boot avec testdisk, quelle est la procedure??
Sinon je ne sais pas si le probleme vient du MBR ou d'un fichier windows defectueux, ou tout simplement du crash du disque (quoi qu'il est reconnu)
Merci par avance.
Auteur : romsk
Réponse le : 24/12/2006 00:02
Message :
"bad sector count" signifie "mauvais comptage de secteur" : ça signifie habituellement un problème de géométrie sur le DD... j'ai regardé ton sujet et ça m'inspire ceci :
1) cherche sur google quelle est la marque de ton DD > télécharge le logiciel de test du constructeur (qui se met habituellement sur disquette ou sur CD bootable) et teste ton DD et fait de même avec HD-tune
2) quelle capacité a ce DD ?
3) faute de pouvoir faire des copies d'écran vu ta panne et faute de pouvoir le mettre en esclave sur un autre PC vu que c'est un portable (encore que...), il faudrait que tu recopies tout ce que t'affiche testdisk (dont les caractéristiques de détection du DD) : si le problème de géométrie se confirme il faudra aller modifier la geométrie dans le menu "geometry" de testdisk
4) un liveCD de Kaella est très facile à créer et à utiliser pour explorer ton DD...
Auteur : Rom
Réponse le : 24/12/2006 17:34
Message :
Salut,
je n'ai pas trouver de logiciel de test pour mon disque, qui est un toshiba MK3021GAS, et hd-tune s'installe sur windows et j'ai pas acces a windows.
j'ai télécharger kaella et je l'ai charger ds le pc mais impossible de trouver le disque dur....
Pour testdisk, j'ai donnée quelque infos dans mon post plus haut, l'analyse s'arrete a 99% et le pc ce bloque, obligé de rdemarrer avec le bouton on/off.
De quelle infos tu aurais besoin sur testdisk??
Merci, a bientot
Auteur : romsk
Réponse le : 24/12/2006 19:31
Message :
J'ai télécharger kaella et je l'ai charger ds le pc mais impossible de trouver le disque dur.... : ça c'est pas bon signe...
Pour testdisk, l'analyse s'arrete a 99% et le pc ce bloque : pas bon non plus...
De quelle infos tu aurais besoin sur testdisk?? celles qui figurent sur la ligne Disk /dev/sdb ci dessous

Auteur : Rom
Réponse le : 26/12/2006 12:31
Message :
Salut romsk,
Voila les infos que j'ai:
current partition structure
Partition
1* FAT32LBA
Start
011
End
3646 254 63
Size in sector
58588992[NO NAME]
Bad sector count
Pour l'analyse:
Analyse cylinder 0/3648: 00% puis apres un certain temps bloque a 3647/3648: 99%
FAT32 LBA
011
3646 245 49
58588978 [NO NAME]
Je met tout a la ligne car c'est pas tres lisible sur une seule ligne.
Merci, bonnes fetes.
Auteur : Rom
Réponse le : 27/12/2006 19:10
Message :
eup 
Auteur : romsk
Réponse le : 28/12/2006 00:53
Message :
ça ressemble pas trop à un problème de géométrie vu les coordonnées CHS qu'il t'affiche comparé aux caractéristiques du DD.
par contre désolé pour toi, mais avec tes histoires de bruits dans le DD, de testdisk qui bloque et de linux qui ne voit pas ton DD, ça sentirait plutôt le "DD fatigué"  (l'est encore sous garantie ?...)
Auteur : Bigfx
Réponse le : 28/12/2006 17:33
Message :
Bonjour romsk,tout d'abord un grand merci pour ce topic qui m'a déjà bien aidé antérieurement pour un dd externe passé par magie en RAW.Cependant j'ai un nouveau pb mais je souhaite seulement une indication:aprés avoir fais une gaffe j'ai rebooté mon portable qui été en cour de formatage...Il y avait 4 partitions que testdisk detecte.Donc je voulais juste savoir les manip pour récupérer des données avec testdisk suite a un formatage (en l'éspèce incomplet)Mes partitions sont marqués comme deleted,faut-il juste les remettre en primary?
Merci si jamais tu trouve du temps pour répondre bone fêtes a tous!
Auteur : romsk
Réponse le : 28/12/2006 18:02
Message :
salut bigfx,
Mes partitions sont marqués comme deleted,faut-il juste les remettre en primary

ben en fait il faut les remettre comme elles étaient avant : la 1ère souvent en "*" (sauf si partition de données dans quel cas ça peut être mis en "P"), et les autres sont à mettre en "P" si tu n'avais fait que des partitions principales ou en "L" si c'était des partitions logiques. si tu sais pas met les en "P" et regarde ce que ça donne, partition par partition, en cliquant sur la touche P (qui va lister les fichiers et répertoires retrouvés dans la partition) > et si c'est bon fais write > menu advanced > et vérifie le secteur de boot de chaque partition...
Auteur : Bigfx
Réponse le : 28/12/2006 18:09
Message :
Merci c'est parfait,la je fait ce que je peux avec getdataback mais j'essaie dès que je peux.Effectivement vaut mieux mettre en "p" parce que tout a l'heure j'ai mis en "L" résultat boot impossible "table partition non valide" donc la je viens juste de réinstall xp.Merci beaucoup
Auteur : Noxcity
Réponse le : 30/12/2006 12:00
Message :
Bonjour à tous,
L'année 2006 fini bien mal pour moi...
Je posseède un DD de 160 Go et il n'est détécté qu'à 30 Go !
J'ai essayé de suivre des conseils de ce forum mais rien a faire le seul truc que je sais, c'est que sous test disk, il ne me voit q'une partition et que le nombre de head est de 16 au lieu de 255. Quand je vais le modifier dans le menu [Geometric], il ne prend pas en compte mes modifs.
Bref c'est bien le souk, je sais pas trop ce que j'ai fais comme manip (des conneries inutiles sans doute).
Je viens d'analyser la partition qu'il me trouve, il me met : "Can't find cluster size"
Je n'ai qu'une seule chose à dire : ' A l'aide '
Merci à tous
Matt
Auteur : romsk
Réponse le : 30/12/2006 14:10
Message :
salut noxcity,
difficile de te donner un avis comme ça : met des copies d'écran de la gestion des disques, de PTEDIT et de "boot record" pour commencer (comme expliqué dans mon sujet sur raw dans ma signature)...
t'avais une seule partition ? NTFS ? DD interne ou externe ? quelle marque ? tu l'as testé avec le logiciel constructeur ? t'as fait un CHKDSK ?
Auteur : Noxcity
Réponse le : 30/12/2006 14:40
Message :
Salut et Merci de ta réponse rapide.
Je t'explique plus en détail.
Avant le crash de ma bécane, ma configuration était la suivante :
DD Interne Hitashi 160 Go partitionné en 3 : 1 system environ 30 go (a priori celle à laquelle je peux accéder aujourd'hui) et deux autres de taille sensiblement identique. Le tout en NTFS.
Un crash m'empêche de booter sur le DD dur. Je fais plusieurs manips dont des CHKDSK et des fixmbr ; fixboot (méthode vu sur le net) via la console de récup. Depuis, impossible de voir mes deux partitions. J'ai formaté, modifier le systeme fichier jeter un oeil avec partition magic, rien n'y fait.
En recherchant, je suis tombé sur ce topic et tes explication, j'ai essayé de suivre de trois conseil mes les résultats ne changent rien. Je vais tenté de t'envoyer des copies d'écran de testdisk... ici, ici et ici (arf... apparament aucune trace de mes partitions !)
PS : J'ai effectué l'ensemble des tests avec le prog constructeur.
Merci à toi
Auteur : romsk
Réponse le : 30/12/2006 19:27
Message :
est-ce que ton logiciel constructeur indique à un moment quelconque la taille CHS de ton DD ? (ou sinon quel est le modèle exact de DD ? qu'indique par exemple everest ?) : ça devrait être CHS 19560 255 63 environ , mais ce calcul est approximatif et ce serait mieux d'avoir la taille exacte pour reconstruire la géométrie de ton DD (sinon on fera sans...)
Auteur : Noxcity
Réponse le : 30/12/2006 19:49
Message :
fAlors, sur le disque dur lui même il y a indiqué : CHS : 16383/16/63
LBA : 321.672.960 le MODEL : HDS722516VLAT80
la capacité est de : 164.7 Go (pas plus précise)
Voila ce que je peux te dire.
Auteur : romsk
Réponse le : 30/12/2006 21:37
Message :
CHS : 16383/16/63 est faux car on est loin des 164 Go...
par contre LBA : 321.672.960 est l'élément qu'il nous faut en approximation : donc lance testdisk > menu geometry > et rentre successivement 20023, 255, 63, 512 : OK > menu analyse > proceed > entrée > search (éventuellement 2 ou 3 fois de suite jusqu'à ce qu'il retrouve tes partitions) : copie d'écran
Auteur : Noxcity
Réponse le : 31/12/2006 13:11
Message :
Salut,
J'ai effectué les tests que tu as demandé, voici les résultats en images : à différents moments : 1 2 fin du test
C'est grave docteur ? Quelles manip je peux faire ?
Merci
Auteur : romsk
Réponse le : 31/12/2006 13:24
Message :
sur cette dernière copie d'écran il t'a apparemment retrouvé ta partition système > va dans le menu advanced > boot : copie d'écran
Auteur : Noxcity
Réponse le : 31/12/2006 13:40
Message :
Voilà ce que j'obtiens en allant dans le menu advanced : ici
Merci
Auteur : romsk
Réponse le : 31/12/2006 17:37
Message :
y'a un problème parce que tu passes de 0 1 1 4109 254 63 66027087 qui est une bonne partition,
à 0 1 1 4110 13 63 66027969 qui n'a pas des coordonnées CHS normales...
donc refais analyse > proceed > tape "A" et rentre successivement les données suivantes : 0, 1, 1, 4109, 254, 63, type 07 > done : entrée > fleche droite gauche pour mettre cette partition en "*" > write > menu advanced > boot : copie d'écran
Auteur : Noxcity
Réponse le : 31/12/2006 18:06
Message :
Je viens d'effectuer les manips : lorsque je mets la caractéristique "*" à la partition créee, il me fait ceci et donc derrièe, je ne peux pas faire write il me fait : partition non valide.
Autant pour moi je dois refaire les manipe depuis le début j'ai du redémarrer mon pc et il a perdu les modifs précédente. je renvoi dès que c'est fait.
-------------------
Alors je t'explique : j'ai fait ce que tu m'a demandé : à la fin j'ai fait Write il m'a demandé de redémarrer pour prendre en compte les changement. Ce que j'ai fait, en redémarrant il me remet un disque dur de 33 go et lorsque qu je vais dans boot, j'obtiens ceci. Mais quand je vais dans analyse il me met ceci.
J'ai repris depuis le début de tes explications (géometrie) de manière a effectuer les tests avec un dd à 160 Go j'ai donc refait jusqu'au Write voici la copie d'écran qui résulte du menu Boot : ici
Merci
Bon réveillon à Tous...
Matt
Auteur : romsk
Réponse le : 01/01/2007 10:49
Message :
bonne année noxcity 
c'est toujours 16 têtes qui figurent dans le secteur de boot (et sa copie) alors que le descripteur de partition du MBR a bien gardé la modif de 255...
je pense qu'un "rebuild BS" devrait réparer cette erreur > fais "list" pour vérifier que t'as bien accès à tous tes fichiers et répertoires de C: > et si c'est bon fais "write" > quitte testdisk et redémarre le PC pour aller vérifier ce que ça donne (on s'occupera des autres partitions après)
Auteur : flo88
Réponse le : 01/01/2007 11:27
Message :
Bonjour et bonne année à tous
Me voici revenue avec mon probleme: c'est à dire essayer de recupérer des données sur un disque dur ou il y a 2 partitions c: et d:
suite à une mauvaise manipulation j'ai perdue d: voici tesdisk: http://img258.imageshack.us/my.php?image=rsultatdu112006th3.jpg
donc c'est la 3 eme ligne que je voudrais récupérer, actuellement j'ai d: (que j'ai renommé d:puisqu'elle n'apparessait plus )mais sur laquelle je n'ai rien remis et je ne l'ai pas formatée.
merci d'avance 
Auteur : romsk
Réponse le : 01/01/2007 12:00
Message :
salut flo88 et bonne année,
puisque t'en es toujours au même point, ben tu vas reprendre au même point
Auteur : flo88
Réponse le : 01/01/2007 12:49
Message :
Merci de me répondre aussi vite et bonne année à toi aussi, alors j'ai fait ca:
met la 1ère ligne en "*" par les fleches droite gauche (et laisse les 3 autres en "D") > tape "A" > rentre successivement les valeurs suivantes : 1275, 1, 1, 23045, 254, 63, type : 07 > done : ok ; ensuite j'obtiens ceci:
http://img361.imageshack.us/my.php?image=02nj6.jpg
je dois faire quoi maintenant? Sachant que je veux récupérer la 4eme ligne:
D HPFS-NTFS 1275 1 6 24319 254 63 370217857
Auteur : romsk
Réponse le : 01/01/2007 13:04
Message :
ta capture d'écran est illisible et je t'ai déjà dit pourquoi ça me semblait pas une bonne idée de tenter de récupérer ta ligne 4... (ce qui est différent de récupérer tes données...)
Auteur : flo88
Réponse le : 01/01/2007 13:27
Message :
OK ce qui m'interresse c'est de récupérer mes données effectivement et ce lien est illisible?: http://img361.imageshack.us/my.php?image=02nj6.jpg
J'ai 5 lignes
j'ai donc ma 1er ligne avec * en vert ainsi que la 3eme L et les autres sont en D
Auteur : romsk
Réponse le : 01/01/2007 14:01
Message :
non ce lien est très bien et toutes les coordonnées affichées sont bonnes > va dans le menu advanced > boot pour chacune des 2 partitions : copies d'écran (PS : tu peux pas mettre tes copies d'écran en vision direct plutôt que de donner leurs liens ?)
Auteur : Rom
Réponse le : 01/01/2007 14:17
Message :
romsk a écrit :

ça ressemble pas trop à un problème de géométrie vu les coordonnées CHS qu'il t'affiche comparé aux caractéristiques du DD.
par contre désolé pour toi, mais avec tes histoires de bruits dans le DD, de testdisk qui bloque et de linux qui ne voit pas ton DD, ça sentirait plutôt le "DD fatigué"  (l'est encore sous garantie ?...)

Oui ca ressemble bien a un disque trés fatigué d'autant que les les "grattements" du disque se repetent cycliquement de la meme façon.
Je vais éssayer de voir combien coute la récup de données par une boite spécialisée.
Merci beaucoup.
Auteur : romsk
Réponse le : 01/01/2007 17:10
Message :
salut rom : En réalité t'as plus grand chose à perdre s'il n'est plus sous garantie...

mais avant d'en arriver aux sociétés de récupération, j'essayerai 2 choses :
* d'abord des logiciels de récupération
* et essaye quand même d'aller plus loin avec testdisk : tu nous dis qu'il montre, après proceed, les données suivantes :
Disk 80 - 30GB / 27GiB - CHS 3649 255 63 Partition Start End Size in sector 1*FAT32LBA 0 1 1 3646 254 63 58588978
ce qui semble bien correspondre à une partition unique FAT32 sur ton DD (est-ce le cas ?) : si c'est ça, alors va dans le menu advanced > boot : "copie d'écran"...
Auteur : flo88
Réponse le : 01/01/2007 17:16
Message :
alors j'ai fait un boot pour les deux partitions:

je ne sais pas si l'image s'affiche autrement je ne peux que mettre le lien:
http://img338.imageshack.us/my.php?image=bootvx1.jpg
je ne sais pas si c'est comme cela qu'il faut faire mais je n'arrive pas à mettre les images directement, je suis désolée...
est ce que tout est correct qu'en pense tu ? que dois faire?
Auteur : Rom
Réponse le : 01/01/2007 17:23
Message :
En faite j'avais mal chercher ds le live de la kaela et j'ai trouvé le disque.
J'ai pu copier tous mes fichiers importants sur une clé USB.
Est ce qu'il y'a un espoire pour mon disque???
Auteur : Noxcity
Réponse le : 01/01/2007 19:31
Message :
Salut, meilleurs voeux pour cette année 2007.
Romsk : J'ai fait ce que tu m'as dit, simplement, je ne peux pas vérifier si j'accède à mes fichiers puisque mon dur est formaté. Je vois simplement des lignes (3) dr-xr-xr-x. Donc si c'est ok je lance la procédure. J'attend ta reponse.
---------
Bon je l'ai fait puisque de toute façon j'avais pas d'autres alternatives.
J'ai redemarré il me détecte toujours 33 Go. Voici la copy d'écran Boot après le redemarrage : ici
Lorsque je refait la géometrie du disque et que je vais dans le menu boot, j'obtiens ceci (qui semble plus cohérent)
Est-ce que c'est normal que je doive à chaque fois refaire la geometrie ?
Quelles infos as tu besoin ?
Merci @ plus
Auteur : romsk
Réponse le : 01/01/2007 21:01
Message :
Flo88, ta 1ère partition (1 *) semble OK (fais « list » pour vérifier que t’ais bien tes fichiers et répertoires de windows…)Ta 2ème partition (5 L) par contre a un secteur de boot « bad » (même si les coordonnées CHS semblent bonnes) : fais « rebuild BS » > puis « list » pour vérifier si tes fichiers sont là avant de faire « write »
Rom, si t’as récupéré tous tes fichiers, le mieux serait de tenter un formatage bas niveau ? sans certitude…
Noxcity,
je ne peux pas vérifier si j'accède à mes fichiers puisque mon dur est formaté.
qu'est ce que c'est cette histoire ? ça a pas beaucoup d'importance sous testdisk...
Je vois simplement des lignes (3) dr-xr-xr-x
fleche droite gauche pour naviguer dans les répertoires et vérifier tes fichiers
Auteur : flo88
Réponse le : 01/01/2007 21:15
Message :
Je viens de faire ce que tu m'as demandé et voila le résultat:

sur la partition la je n'ai rien remis dessus
Auteur : romsk
Réponse le : 02/01/2007 08:56
Message :
romsk a écrit :

...fais « rebuild BS » > puis « list » pour vérifier si tes fichiers sont là avant de faire « write »
Auteur : flo88
Réponse le : 02/01/2007 09:43
Message :

voila je viens de faire write, je ne sais pas ce que je dois faire maintenant, je suis largée
merci tout de meme de suivre mon sujet
Auteur : romsk
Réponse le : 02/01/2007 09:49
Message :
tu veux vraiment pas faire "list" : bon ben tant pis... 
tant qu'on est là, fais maintenant "repair MFT" > puis tu fermes tesdisk > redémarre le PC et va voir si tes données sont là...
Auteur : flo88
Réponse le : 02/01/2007 10:07
Message :
j'ai fais list bien sur mais il n'y a rien dedans

Auteur : flo88
Réponse le : 02/01/2007 10:20
Message :
Je viens de faire ce que tu m'as dit et MIRACLE, allucinant tout est revenu, je ne sais pas comment te remercier, tous les qualificatifs que je connais ne suffiraient pas assez pour te remercier, j'ai rien compris mais tout est revenu.
SUPER SYMPA de ta part
BONNE CONTINUATION, Bonne année et tout plein de bonne chose pour toi
Auteur : romsk
Réponse le : 02/01/2007 10:58
Message :
 content pour toi flo88, et bonne année  
Auteur : Noxcity
Réponse le : 02/01/2007 11:34
Message :
Salut Romsk,
Voilà ce que j'ai quand je fais list (je savais pas que tu voulais les photos en lien direct).
 
et

Une question, est-ce normal qu'il faille à chaque fois reprendre mes manips du début, qu'il ne garde jamais la nouvelle géometrie ?
Merci à toi.
Auteur : romsk
Réponse le : 02/01/2007 17:20
Message :
Une question, est-ce normal qu'il faille à chaque fois reprendre mes manips du début, qu'il ne garde jamais la nouvelle géometrie : oui
je savais pas que tu voulais les photos en lien direct : ben bien sûr, c'est plus pratique... sauf que ta copie d'écran de list m'importe peu car c'est toi qui doit me dire si tu y vois tes fichiers et répertoires... t'as qu'à faire write > puis tu fais repair MFT > quitte testdisk et redémarre pour voir si ta nouvelle partition a été prise en compte et les différents répertoires de cette partition système accessible... si c'est bon on va voir maintenant pour récupérer tes 2 autres partitions.
Auteur : Noxcity
Réponse le : 02/01/2007 17:27
Message :
Bonsoir,
Je viens de faire ce que tu m'as demandé.
En redemarrant xp, il a voulu vérifier l'intégrité de mon disque dur j'ai refusé. (ne sachant si il fallait) Un fois sous windows, il me dit que mon disque est endommagé ou illisible.
Auteur : romsk
Réponse le : 02/01/2007 18:11
Message :
Noxcity a écrit :

En redemarrant xp, il a voulu vérifier l'intégrité de mon disque dur j'ai refusé
dommage il fallait dire oui (une chance sur deux) : c'est ça (chkdsk) qui permet de réparer les choses quand on a reconfiguré les partitions avec testdisk.
t'as qu'à essayer de faire un CHKDSK en invite de commande ou sous la console de récupération, sinon il te reste plus qu'à refaire les manips (et laisser windows vérifier ton DD au redémarrage s'il en a envie)
Auteur : Noxcity
Réponse le : 02/01/2007 18:25
Message :
Ok j'ai refais les manips, j'ai redemarré :
Mon disque du est encore perçu comme un DD de 30 Go. J'espère que c'est normal. Que puis-je faire maintenant ?
Merci
Auteur : romsk
Réponse le : 02/01/2007 18:28
Message :
ben non c'est pas normal. affiche ce que montre PTEDIT (raw dans ma signature) ainsi que "boot record" si accessible
Auteur : Noxcity
Réponse le : 02/01/2007 18:40
Message :
Aë, pourtant j'ai pas l'impression d'avoir oublié qq chose...

Auteur : Noxcity
Réponse le : 02/01/2007 19:16
Message :
J'ai refait les manips depuis le début et j'ai lancé un chkdsk /F/R
J'attend la fin mais dès le départ il m'indiqué ceci
Auteur : romsk
Réponse le : 02/01/2007 19:25
Message :
si le chkdsk ne donne rien, on reprend tout : ferme PTEDIT et ouvre testdisk > menu geometry > rentre successivement 20023, 255, 63, 512 : OK > menu analyse > proceed > tape "A" et rentre successivement les données suivantes : 0, 1, 1, 4109, 254, 63, type 07 > done : entrée > fleche droite gauche pour mettre cette partition en "*" > write > menu advanced > boot : copie d'écran et tu laisses testdisk ouvert
Auteur : phil5555
Réponse le : 02/01/2007 19:37
Message :
Bonsoir et meilleurs voeux à tout le monde
J'ai un soucis de ntfs passé en raw et oui encore un.... j'ai utilisé mon DD externe 250 giga non partitionné sur le portable d'un copain et depuis il ne fonctionne pas sur mon pc ....
Dans le gestionnaire de disque le volume n'est pas alloué j'ai crée une partition principale et pensant résoudre le pb mais que dalle .....
J"ai donc découvert ce topic essayer test disk et après search et proceed j'ai ceci
Sauvegarde est la partition crée aujourd'hui
Stockage est l'endroit ou se situe mes données
et maintenant je ne sais pas trop quoi faire .....
http://img359.imageshack.us/my.php?image=1rr9.jpg
Merci à celui qui pourra m'aider
Auteur : tony0093
Réponse le : 02/01/2007 20:24
Message :
Bonjour Romsk!
Je viens de faire une enorme connerie lors d'une reinstallation de windows et j'ai supprimé la partition d'un disque en pensant que je le faisait sur un autre...et mon DD est ainsi passé en RAW... enfin bref... j'aimerais recuperer cette partition... c'est un DD de 250 Go qui est je crois bien plein...
j'ai fais une analyse et un search avec testdisk et voilà ce qu'il me trouve:
( j'arrive à lister les 2 sans aucun pb, et pr info il me semble avoir supprimé la première de la liste et je sais pas, à ce moment là, ce que je dois faire: je veux pas faire une connerie et plus pouvoir revenir en arriere... STP J'ai vraiment besoin de ton aide !! )
voilà l' impr ecr:
http://img384.imageshack.us/my.php?image=impryy2.png
merci merci
Auteur : romsk
Réponse le : 02/01/2007 20:51
Message :
salut phil5555, met tes copies d'écran en image directe, c'est quand même plus simple à suivre...

si j'ai bien compris, sauvegarde ne t'intéresse pas, il n'y a que stockage que tu veux récupérer, c'est bien ça ??? dans ce cas sur le tableau de testdisk que tu montres, laisse la 1ère ligne en "D" et met la 2ème ligne en "*" en utilisant les fleches droite gauche > entrée : write > menu advanced > boot : copie d'écran (ne ferme pas encore testdisk)
Auteur : romsk
Réponse le : 02/01/2007 20:58
Message :
salut tony0093, toi aussi met tes copies d'écran directes 

tes deux partitions sont bien paramétrées, donc ne touche rien > fais entrée (write si demandé) > et toi aussi va dans le menu advanced > met toi sur la 1ère partition : boot et copie d'écran, et va aussi sur la 2ème : boot et copie d'écran
Auteur : phil5555
Réponse le : 02/01/2007 21:39
Message :
désolé romsk mais je n'ai pas l'habitude des forums... j' espère que ca va marche ce coup ci.
J'ai donc mis "*" sur ma partition stockage et "D" sur ma partition sauvegarde puis boot dans le menu et voila ce que j'obtiens
[url=http://imageshack.us][img=http://img131.imageshack.us/img131/1593/2ac6.jpg][/url]
Merci
Auteur : phil5555
Réponse le : 02/01/2007 21:40
Message :
désolé l'image ne passe toujours pas en direct...
Auteur : phil5555
Réponse le : 02/01/2007 21:58
Message :
Ca y est j'ai compris ...
Auteur : romsk
Réponse le : 02/01/2007 22:14
Message :
fais "dump" : copie d'écran, puis à la suite de dump fais "next" : copie d'écran
Auteur : phil5555
Réponse le : 02/01/2007 22:40
Message :
Voila
 


 
Auteur : Noxcity
Réponse le : 02/01/2007 22:43
Message :
SAlut Romsk,
Voilà les dernière news : CHKDSK a réparé des trucs mais rien ne change. J'ai donc fait ce que tu m'as demandé, à savoir, tout reprendre depuis le début.
Une fois que j'ai fait proceed>"a" j'obtiens ceci (toujours une seule partion, je sais pas si c'est bon ou pas cf. copie suivante) je ne peux donc pas mettre "*" car ca y est déjà.

Et voici la copie finale du boot

Merci de ta patience.
Auteur : romsk
Réponse le : 02/01/2007 23:05
Message :
phil5555, le boot sector est celui de ta partition stockage qu'on veut pas mais le backup semble bon : c'est donc "backup BS" qu'il faut faire > puis fais "repair MFT" > puis quitte testdisk, redémarre ton PC et va voir...
noxcity, ça a l'air bon et cette fois ci sans message d'erreur > fais "repair MFT" > quitte testdisk et redémarre le PC...
Auteur : Noxcity
Réponse le : 02/01/2007 23:17
Message :
Lorsque je fais repair mft, il me fait : Both seems ok but they don't match, use chkdsk ??
Auteur : phil5555
Réponse le : 02/01/2007 23:33
Message :
C'est bon ca marche !!! 
Merci beaucoup romsk
Auteur : romsk
Réponse le : 02/01/2007 23:35
Message :
et quand il te dit "use chkdsk ?", t'as une option pour répondre oui ? sinon ferme testdisk et redémarre le PC (en le laissant vérifier ce qu'il veut )
Auteur : Noxcity
Réponse le : 02/01/2007 23:39
Message :
C'est ce que j'ai fait mais il n'a pas réparer quoi que ce soit du coup j'ai lancé un CHKDSK par moi même mais il n'a rien réparé donc je redémarre sans bcp d'espoir je croise les doigts ...
Auteur : Noxcity
Réponse le : 02/01/2007 23:42
Message :
 rien a faire !
Auteur : romsk
Réponse le : 03/01/2007 08:55
Message :
Noxcity a écrit :

...Un crash m'empêche de booter sur le DD dur. Je fais plusieurs manips dont des CHKDSK et des fixmbr ; fixboot (méthode vu sur le net) via la console de récup. J'ai formaté, modifier le systeme fichier jeter un oeil avec partition magic, rien n'y fait.
désolé pour toi, noxcity, mais t'as peut être fait un peu trop de manips préalables qui maintenant empêchent la récupération... je pense que tu devrais concentrer tes efforts sur les logiciels de récupération et/ou une récup sous linux avec le liveCD de Kaella
 phil5555, content pour toi 
Auteur : Noxcity
Réponse le : 03/01/2007 11:25
Message :
ok merci de ta patience à bientot.
ciao
Auteur : Gab64
Réponse le : 04/01/2007 15:38
Message :
Bonjour à vous tous,
Je cherche une précision pour l'utilisation de TestDisk :
J'ai realisé les étapes suivante :
- Choix du disque ( [Proceed] )
- Choix du type de partition ( [Intel] )
- [Analyse] puis [Proceed]
le resultat affiché ressemble beaucoup à la table de partition que je souhaite retrouver. Cepandant, lorsque j'appuie sur Entrée il m'affiche une partition etendue de plus que je ne desire pas.
voici a quoi devrait ressembler ma table de partitions (ce que me propose TestDisk après Analyse et Proceed) ---- voici ce que me propose TestDisk (à l'ecran [Write])
1 * NTFS ---- 1 * NTFS
2 P Linux ---- 2 P Linux
5 L Linux Swap ---- 3 E extended LBA
6 L Linux ---- 5 L Linux Swap
---- 6 L Linux
Est-ce normal? ( Ma tentative Write n'a pas été fructueuse pour ma partition 6 linux)
Y'a t-il moyen de supprimer cette partition étendue manuellement?
Merci d'avance pour vos reponses
Auteur : romsk
Réponse le : 04/01/2007 20:06
Message :
salut gab64,
non le proceed ne te rajoute pas une partition étendue : il ne fait que la faire apparaitre (il y a toujours une partition étendue lorsque tu as des partitions logiques). donc ce que te montre proceed est normal.
réexplique nous ton problème : t'as perdu ta partition 6 linux ?
Auteur : Gab64
Réponse le : 04/01/2007 21:51
Message :
Désolé pour le retart dans ma réponse romsk,
En effet c'est bien ma partition 6 qui a un problème voici ce que me donne la première analyse :

et voici la solution proposée (avec une partition etendue... ;-) ) qui me parrait correcte :

J'ai fait plusieurs tentatives de réecriture de cette table de partitions, mais après redemarrage je retombe toujours sur le même problème.
Faut il que j'emploie une autre méthode pour réécrire ma table de partition?
Auteur : romsk
Réponse le : 05/01/2007 07:54
Message :
t'as 2 partitions linux (une principale = 2 et une logique = 6) ? tes copies d'écran sont claires mais je comprend toujours pas ce que tu veux faire...
Auteur : Gab64
Réponse le : 05/01/2007 10:06
Message :
J'ai un probleme avec ma partition etendue : sur la première capture d'ecran, entre la partition 5 et 6, il y a une X extended qui n'a rien a faire là.
TestDisk me propose ce qu'il faut (capture 2) mais n'arrive pas a écrire la table de partition comme il faut : redemarrage je me retrouve tjs avec cette partion X extended que je ne veux pas.
j'espère que c'est un peu plus clair...
Auteur : romsk
Réponse le : 05/01/2007 12:23
Message :
Gab64 a écrit :

J'ai un probleme avec ma partition etendue : sur la première capture d'ecran, entre la partition 5 et 6, il y a une X extended qui n'a rien a faire là.
je viens de t'expliquer que c'est normal : chaque partition logique est contenue dans une partition étendue, et t'auras autant de "X extended" que tu as de partition logique...
aussi je te repose ma question : quel est ton problème ?
Auteur : Gab64
Réponse le : 05/01/2007 18:28
Message :
mon problème est au demarrage de linux, au chargement du module pour mon disque sata voici mon dmesg
scsi 0:0:0:0: Direct-Access ATA Maxtor 6V200E0 VA11 PQ: 0 ANSI: 5
SCSI device sda: 398297088 512-byte hdwr sectors (203928 MB)
sda: Write Protect is off
sda: Mode Sense: 00 3a 00 00
SCSI device sda: drive cache: write back
SCSI device sda: 398297088 512-byte hdwr sectors (203928 MB)
sda: Write Protect is off
sda: Mode Sense: 00 3a 00 00
SCSI device sda: drive cache: write back
sda: sda1 sda2 sda3 < sda5<3>ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x0
ata1.00: (BMDMA stat 0x20)
ata1.00: tag 0 cmd 0xc8 Emask 0x9 stat 0x51 err 0x40 (media error)
ata1: EH complete
ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x0
ata1.00: (BMDMA stat 0x20)
.......(etc)
ata1.00: (BMDMA stat 0x20)
ata1.00: tag 0 cmd 0xc8 Emask 0x9 stat 0x51 err 0x40 (media error)
sd 0:0:0:0: SCSI error: return code = 0x08000002
sda: Current: sense key=0x3
ASC=0x11 ASCQ=0x4
end_request: I/O error, dev sda, sector 223801512
Buffer I/O error on device sda, logical block 27975189
donc je n'ai pas de sda6 disponible sous linux.
Auteur : romsk
Réponse le : 06/01/2007 19:17
Message :
1) je connais pas linux  (peut être ouvrir un topic dans le forum linux ?)
2) c'est exprès que t'as 2 partitions linux (la 2 et la 6) ?
3) est-ce que linux peut booter sur une partition logique (sda 6) ?
4) je vois pas à quoi correspond ce message d'erreur Buffer I/O error on device sda, logical block 27975189
5) ton autre message d'erreur au secteur 223801512 (end_request: I/O error, dev sda, sector 223801512) est plus intéressant : à 2 ou 3 secteurs près, il correspond en effet au secteur de boot de cette partition 6, mais là encore je sais pas comment est constitué un secteur de boot de partition linux... ceci dit, puisque tu vois pas ton sda 6 peut être est-ce la cause du problème ? va dans le menu advanced > met toi sur la ligne 6 linux > boot : copie d'écran...
Auteur : simipi
Réponse le : 06/01/2007 21:21
Message :
bonjour.
Evidemment, si je suis sur ce forum, c'est que j'ai un ENORME problème de disque dur. Et ma foi, je suis assez éberlué du temps que tu consacres, romsk, à dépanner les uns et les autres. :) Tes connaissances informatiques sont bien à la hauteur de ton dévouement. Ce n'est pas des compliements lancés en l'air, mais bien un sentiment que j'ai, depuis que j'ai parcouru d'une seule traite, les XXX pages qui composent ce sujet !ouf !
Donc voici mon problème.
J'ai eu sur un disque de stockage, un message "écriture décalé à échoué" suivi d'un mft abimé (je crois.)
dans gestion des disques de windows, le disque apparait en état "inconnu" et non initialisé, et la taille de 152,67 Go qui doit effectivement correspondre à la taille occupé.
J'ai osé lancer testdisk, d'abord en bootant sur une disquette. Bon, ça commence mal, "général protection fault".
j'ai pas insisté, et lancé testdisk sous windows.
les disques apparaissent bien (3), et je sélectionne celui qui me pose problème.
analyse et recherche de partition (3 fois). rien.
J'ai aussi essayé easyrecovery, mais là aussi, rien à faire.
J'ai pas osé faire autre chose, peur de faire une bétise.
Auteur : romsk
Réponse le : 07/01/2007 08:44
Message :
salut simipi,
DD externe ou interne sur nappe IDE ? "analyse et recherche de partition (3 fois). rien" : tu veux parler de search ?
un peu de boulot pour toi : peux-tu faire 4 copies d'écran ? une de la gestion des disques, une du secteur 0 (MBR) avec Edithexa (dans ma signature), une de ce que montre PTEDIT (RAW dans ma signature) et une du "boot record" si accessible sous PTEDIT...
Auteur : simipi
Réponse le : 07/01/2007 10:29
Message :
hello
merci de ta réponse, mais voilà, je n'y comprend plus rien. Je te situe l'historique, pour que tu comprennes ma situation.
mon matériel: tour antec, cm an7v8x-e 1G de ram proc athlon 3200, 1 dd sata sur lequel est le système, 2 dd ide.
Après 2 ans sans problème, j'ai commencé à avoir des soucis de plantage. Ménage réguilier en tout genre, n'a rien réparé. mon dd sata avait apparemment de gros soucis, et n'a meme pas passé le test constructeur.
Bref, je le renvoi, il est sous garantie, et en attendant, en rachete un autre. Je réinstalle donc tout le ssyteme sur le sata. disques ide débranchés.
Ensuite je les reconnecte, pas de soucis.
2 jours après le problème que j'ai soumis: message "ecriture décalé" et problème sur la mft de ce disque (il ne contient que des données.)
dans la gestion des disques i apparait comme non initialisé.
Je te soumet le problème. entre temps, message sur le disque C, le nouveau, erreur dans la mft, et fait un checkdsk dans lequel il corrige des erreurs. Pas de secteurs defectueux. Mais au démarrage, ca tourne pas rond. le système est ralenti. Je reboote, ca va mieux. mais il me la fait aussi 2 fois.
je pleure ....... ca continue.....
il me le fait 2 fois....
Ensuite, ton message me demandant des traces. Je rebranche donc le disque hs, et là, AAAAAAAAhh..... il réapparait dans le gestionnaire de fichiers.
Je me dépeche donc de backuper sur un disque externe. Ensuite, je ne sais pas trop quoi faire, mais je pense que mes problèmes ne sont peut etre plus à leur place dans ce thread.
Auteur : Gab64
Réponse le : 07/01/2007 14:27
Message :
Bonjour,
finalement j'ai réussi a faire des sauvegardes, mais malheuresement je n'ai plus assez de temps pour réparer mes partitions (reprise de cours). Merci pour ton aide romsk
bon dimanche!
Auteur : romsk
Réponse le : 08/01/2007 09:04
Message :
simipi : c'est effectivement souvent CHKDSK qui corrige ces problème de partition ou disque disparus (en perdant parfois au passage certaines données). si t'as récupéré tes données sauvegarde-les vite car tes problèmes ont l'air récurrents : nappe défectueuse ? problème hardware sur la carte mère ? je ne sais que te conseiller...
gab64 : ben bonne reprise 
Auteur : thug life 13500
Réponse le : 09/01/2007 22:29
Message :
salut romsk
je viens de recevoir ton lien car je suis totalementperdu pour essayer de récuperer ma partition D que mon mari a éffacé et je ne sais pas comment faire et j'ai surtout peur d'agrraver ma situation.j'ai réellement besoin d'aide.
st il possible de m'aider?
Auteur : romsk
Réponse le : 09/01/2007 22:48
Message :
ahhh ces maris, quelle plaie... thug life 13500 décrit nous ton problème et, mieux qu'un long discours, fais une copie d'écran de la gestion des disques ainsi que de (testdisk > menu analyse >) proceed 
Auteur : thug life 13500
Réponse le : 09/01/2007 23:14
Message :
TestDisk 6.5, Data Recovery Utility, October 2006
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org
Disk /dev/sda - 160 GB / 149 GiB - CHS 20673 240 63
Partition Start End Size in sectors
* HPFS - NTFS 0 1 1 20534 239 63 310489137 [HP_PAVILION]
P HPFS - NTFS 20535 0 1 20672 239 63 2086560
Structure: Ok. Use Up/Down Arrow keys to select partition.
Use Left/Right Arrow keys to CHANGE partition characteristics:
*=Primary bootable P=Primary L=Logical E=Extended D=Deleted
Keys A: add partition, L: load backup, T: change type, P: list files,
Enter: to continue
Auteur : romsk
Réponse le : 09/01/2007 23:52
Message :
ahhh ces femmes de maris qui effacent les partitions...
romsk a écrit :

...thug life 13500 décrit nous ton problème et, mieux qu'un long discours, fais une copie d'écran de la gestion des disques ainsi que de (testdisk > menu analyse >) proceed 
Auteur : thug life 13500
Réponse le : 09/01/2007 23:54
Message :
je sais pas comment on fais une copie d'ecran
Auteur : thug life 13500
Réponse le : 10/01/2007 00:00
Message :
je voulais faire une restaration du systeme mais n'ayant pas fais les cd mon mari a effacé la partition d.
maintenant je suis bloqué. si tu pouvais me dire comment faire les copie que tu me demandes je te les ferait avec joie
Auteur : romsk
Réponse le : 10/01/2007 00:09
Message :
thug life 13500 a écrit :

je sais pas comment on fais une copie d'ecran
voir le paragraphe 7 de ce magnifique tuto
Auteur : thug life 13500
Réponse le : 10/01/2007 00:17
Message :
je ne comprends pas comment enregistrer...j'ai qu'une envie c'est de tout jeter.
je laisse tomber.
merci quand meme.
Auteur : romsk
Réponse le : 10/01/2007 01:01
Message :
thug life 13500 a écrit :

Disk /dev/sda - 160 GB / 149 GiB - CHS 20673 240 63
Partition Start End Size in sectors
* HPFS - NTFS 0 1 1 20534 239 63 310489137 [HP_PAVILION]
P HPFS - NTFS 20535 0 1 20672 239 63 2086560
quand tu dis que ton mari a effacé la partition D:, tu veux parler de la partition de restauration de ton ordi HP ? dans quel cas ce devrait être celle que je t'ai mise en rouge dans testdisk... donc va dans le menu advanced de testdisk > met toi sur cette partition avec les fleches haut bas > boot : copie d'écran () ou recopie les données...
Auteur : thug life 13500
Réponse le : 10/01/2007 01:08
Message :
TestDisk 6.5, Data Recovery Utility, October 2006
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org
Disk /dev/sda - 160 GB / 149 GiB - CHS 20673 240 63
Partition Start End Size in sectors
2 P HPFS - NTFS 20535 0 1 20672 239 63 2086560
Boot sector
Status: OK
Backup boot sector
Status: OK
Sectors are identical.
A valid NTFS Boot sector must be present in order to access
any data; even if the partition is not bootable.

[ Quit ] [Rebuild BS][Repair MFT][ Dump ]
Return to Advanced menu
Auteur : thug life 13500
Réponse le : 10/01/2007 01:12
Message :
je veux bien parler de la partition de restauration de mon ordi
Auteur : thug life 13500
Réponse le : 10/01/2007 01:49
Message :

Auteur : romsk
Réponse le : 10/01/2007 07:01
Message :
oh la belle copie d'écran...  
mais y'a un problème : d'une part si c'est une partition de restauration elle devrait pas être en NTFS et d'autre part s'il l'a "effaçée" on ne devrait plus la voir dans le gestion des disques... qu'est ce qu'il a fait exactement ? et surtout quelles manips ont-elles été faites depuis, notamment as-tu créé une nouvelle partition ?
on va chercher une autre partition : dans testdisk > analyse > proceed > entrée > search (éventuellement 3 fois de suite...) pour voir s'il te retrouve une autre partition à cet emplacement...
Auteur : thug life 13500
Réponse le : 10/01/2007 11:12
Message :

c'est bien ma partition de restauration.
concernant les manipulations je ne sais pas du tout ce qui a été fait. ce que je peux dire c'est qu'avant quand je cliquer sur le disque d: il me disait "partition de restauration" et maintanant plus rien, le disque est vide.
Auteur : thug life 13500
Réponse le : 10/01/2007 11:13
Message :
mon mari a lancer le disque d'outil de reinstallation, ensuite l'ordinateur lui a demander éffacer la partition il a répondu oui
Auteur : romsk
Réponse le : 10/01/2007 12:10
Message :
ben search ne te retrouve apparemment pas d'autre partition que celle ci, et à mon avis c'est mal barré (quand il a validé l'effacement de la partition, le PC a apparemment bien fait le travail...). dans advanced > boot : tente un "repair MFT", mais à mon avis ça donnera rien (une partition de restauration n'est pas en NTFS...)
reste plus qu'à fouetter le mari 
PS : pourquoi veux-tu à nouveau faire une restauration ? si ton ordi est bien réinstallé depuis la manip de ton mari, t'as qu'à faire une image disque que tu sauvegardes précieusement sur un DVD ou DD externe et que tu n'auras plus qu'à réinstaller en cas de problème ultérieur...
Auteur : thug life 13500
Réponse le : 10/01/2007 18:12
Message :
le probleme c'est que la reinstallation na pas pu etre faite entierement du fait que je n'avait pas les cd de reinstallation.
je voulais le restaurer car j'avais des soucis avec certain logiciel et également avec mon graveur.
de plus je n sais pas qu'est une image disque
Auteur : romsk
Réponse le : 10/01/2007 19:01
Message :
je crois que tu peux récupérer tes CD de réinstallations auprès d'HP : contacte les pour leur poser la question.
(une image disque se fait par un logiciel spécialisé (ghost, pc cloneur, drive image...) qui fait une image de ton DD stocké sous la forme d'un fichier qu'il te suffit de restaurer, par le même logiciel, lorsque tu rencontre un gros problème : tu te retrouves en 5 minutes avec un PC comme neuf...)
Auteur : thug life 13500
Réponse le : 10/01/2007 19:05
Message :
je me suis renseigner auprès de hp et du fait que mon ordi n'est plus garanti, il faut payer 40 euros.
ca fout les boules....
merci quand meme de ton aide. c'est très sympa de ta part de m'avoir supporter.
et au fait bonne année.
Auteur : romsk
Réponse le : 10/01/2007 21:24
Message :
thug life 13500 a écrit :

...il faut payer 40 euros.
c'est ton mari qu'à cas payer 
(ou bien quitte à débourser un peu plus, pour 100 euros tu te rachètes un XP tout neuf à installer sur ton PC (si pas de problème de tatouage ?) et il te restera plus qu'à mettre à jour les drivers sur touslesdrivers.com ?)
en tout cas bon courage 
Auteur : simipi
Réponse le : 28/01/2007 20:08
Message :
hello romsk. me revoilà avec un nouveau problème ! 
J'ai installé windows xp ultimate edition, tout réinstallé sur un dd tout neuf en sata. tout était nikel, jusqu'a aujourdhui . je vais pour voir la messagerie outlook message d'erreur, et ensuite écran bleu.
Pas de message vraiment explicite si ce n'est de verifier ou desinstaller tout nouveau driver, etc.... ce n'est pas le cas. Je ne peux plus démarrer maintenant. En bootant normalement, la page de windows s'affiche une demi seconde puis écran bleu. En mode sans echec, pareil. Par test disk, je vois mes partitions; J'ai essayé de vérifier en lancant partition magique et en faisant verifier, et là, il me trouve pas mal d'erreur, entre autre taille de cluster.
Que puis je faire par testdisk pour verifier que tout est normal ? Je ne trouve plus le message ou je t'avais pratiquement posé la meme question. désolé.
Auteur : romsk
Réponse le : 29/01/2007 07:05
Message :
salut simipi,
tu peux toujours regarder ce que ça donne avec le menu analyse > proceed, mais testdisk ne peut pas tout résoudre... 
il serait par contre intéressant de connaitre la teneur de ton écran bleu, mais c'est un autre sujet...
Auteur : simipi
Réponse le : 29/01/2007 07:36
Message :
hello
Je vais faire ça ce soir, par contre, évidemment, je ne pourrais pas faire de copie d'écran, me servant de testdisk sous dos.
pour l'écran bleu, la 1ere partie sans code d'erreur style not equal etc..., décrit plutot une marche à suivre (si vous avez installé un logiciel , vérifiez si les drivers sont à jour, etc........).
J'ai testé mes barettes mémoires avec memtest, et vais passer seatools pour tester la fiabilité de mon dd seagate.
sinon, je ne comprend pas ce qui s'est passé, car depuis quelques semaines, tout marchait bien, et je n'ai rien fait de plus, si ce n'est d'installer juste avant un logiciel de visualisation d'image fastone, mais je ne vois pas le rapport.
dans testdisk je vois mes partitions ainsi que dans partition magique. Je vais faire l'analyse ce soir.
Auteur : romsk
Réponse le : 29/01/2007 08:54
Message :
tout marchait bien, et je n'ai rien fait de plus, si ce n'est d'installer juste avant un logiciel de visualisation d'image fastone, mais je ne vois pas le rapport
ben si, c'est peut être bien ça ton problème...
dans un 1er temps tu peux essayer de réparer XP en bootant sur le CD d'XP (et taper "R" à la 2ème fenêtre)
Auteur : MrTomato
Réponse le : 30/01/2007 11:46
Message :
je me permet de vous contacter suite a un probleme de disque dur externe devenu inacessible. Je vais tenter de résumer : 

os : windows xp pro 
disque : lacies D2 triple interface 250 Go (firewire usb2 et firewire800) 
systeme de fichier du DD : ntfs 
nombre de partition : 1 seule = a la taille du disque (enfin232 go je pense apres formatage) 
nom du disque et lettre attribuée : "gros truc" H (un petit doute sur la lettre mais de mémoire c'est ça) 

le disque contenait beaucoup de données précieuses archives de travaux etc....il est subitement devenu inacessible, visible dans un premier temps dans le poste de travail mais au format RAW...puis apres un redémarage il a disparu du poste de travail, mais demeure visible comme sain et non alloué dans gestion de l'ordinateur/gestion des disques... 

j'ai lancé testdisk mais ne sachant pas trop m'en servir je n'ai pas voulu aller plus loin que l'étape de recherche de partition...cf le screenshot


je joins également le log...


Mon Jan 29 19:19:24 2007
Command line: TestDisk

TestDisk 6.5, Data Recovery Utility, October 2006
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org
Windows version (ext2fs lib: 1.39, ntfs lib: 9:0:0, reiserfs lib: 0.3.1-rc8)
Using locale 'C'.
file_test_availability_win32(\\.\D:) GetFileSize err Fonction incorrecte.

file_test_availability_win32(\\.\D:) SetFilePointer err Fonction incorrecte.

Warning: can't get size for \\.\D:
file_test_availability_win32(\\.\E:) GetFileSize err Fonction incorrecte.

file_test_availability_win32(\\.\E:) SetFilePointer err Fonction incorrecte.

Warning: can't get size for \\.\E:
file_test_availability_win32(\\.\G:) GetFileSize err Fonction incorrecte.

file_test_availability_win32(\\.\G:) SetFilePointer err Fonction incorrecte.

Warning: can't get size for \\.\G:
file_read(4,1,buffer,156312449(9729/254/63)) seek err Invalid argument
file_read(5,1,buffer,321685559(20023/254/63)) seek err Invalid argument
file_read(6,1,buffer,488408129(30401/254/63)) seek err Invalid argument
Hard disk list
Disk /dev/sda - 80 GB / 74 GiB - CHS 9729 255 63, sector size=512
Disk /dev/sdb - 164 GB / 153 GiB - CHS 20023 255 63, sector size=512
Disk /dev/sdc - 250 GB / 232 GiB - CHS 30401 255 63, sector size=512

Disk /dev/sdc - 250 GB / 232 GiB
Partition table type: Intel

Analyse Disk /dev/sdc - 250 GB / 232 GiB - CHS 30401 255 63
Current partition structure:

Partition sector doesn't have the endmark 0xAA55

search_part()
Disk /dev/sdc - 250 GB / 232 GiB - CHS 30401 255 63
NTFS at 0/1/1
filesystem size 488392002
sectors_per_cluster 8
mft_lcn 786432
mftmirr_lcn 30524500
clusters_per_mft_record -10
clusters_per_index_record 1
D HPFS - NTFS 0 1 1 30400 254 63 488392002 [gros truc]
NTFS, 250 GB / 232 GiB
get_geometry_from_list_part_aux head=255 nbr=2
get_geometry_from_list_part_aux head=8 nbr=1
get_geometry_from_list_part_aux head=16 nbr=1
get_geometry_from_list_part_aux head=32 nbr=1
get_geometry_from_list_part_aux head=64 nbr=1
get_geometry_from_list_part_aux head=128 nbr=1
get_geometry_from_list_part_aux head=240 nbr=1
get_geometry_from_list_part_aux head=255 nbr=2

Results
* HPFS - NTFS 0 1 1 30400 254 63 488392002 [gros truc]
NTFS, 250 GB / 232 GiB


je soupçonne le logiciel "macdrive" de Mediafour d'être a l'origine de ce pb, ce logiciel m'a par le passé permis de lire des dd provenant de macintosh...cependant je ne sais pas exactement ce qui a pu se passer car je ne me souviens pas avoir effectué une quelconque opération... 

les données de ce disque sont tres précieuses et je ne voudrais pas agraver la situation, s'il n'existe pas de solution possible ou sure je suis pret a contacter une société spécialisée...aussi merci de me prévenir des risques de telle ou telle manipulation...
faut il que je tente une récuperation de données via un soft comme "stellar phoenix" "getdataback"ou "easy recovery " avant d'aller pus loin avec testdisk ? une tentative de récupération de données peut elle agraver la situation ?

d'avance un grand merci pour votre aide et votre travail.
Auteur : romsk
Réponse le : 30/01/2007 17:36
Message :
MrTomato a écrit :

...les données de ce disque sont tres précieuses et je ne voudrais pas agraver la situation, s'il n'existe pas de solution possible ou sure je suis pret a contacter une société spécialisée...aussi merci de me prévenir des risques de telle ou telle manipulation...
si c'est si précieux, alors tente au préalable un logiciel de récupération et essaye de récupérer le maximum de données : voir ici --> http://forum.pcastuces.com/sujet.asp?page=-1&f=1&s=100275&REP_ID=2044771

en effet testdisk peut donner de mauvaises surprises à cause du chkdsk qu'il demande parfois au redémarrage et qui peut effacer pas mal de "segments de fichiers orphelins" (ce qui signifie que la récupération de toute tes données n'est pas garantie à 100 %).
ceci dit habituellement ça se passe bien, et ta copie d'écran est plutôt de bonne augure...
une autre possibilité, avant de lancer testdisk, est de tenter une récup sous linux qui elle aussi est "safe" car elle se contente de copier les données sans modifier quoi que ce soit sur le disque source (je suis en train de terminer le tuto et pense le mettre en ligne ce soir ou demain )
donc dans ton cas très particulier de données très importantes à récupérer, je dirais dans l'ordre :
1) essayer un logiciel de récup,
2) s'il te manque des fichiers essayer sous linux
3) dès que t'as récupéré le maximum de données recontacte moi pour la manip sous testdisk
Auteur : MrTomato
Réponse le : 30/01/2007 18:16
Message :
ok merci pour ta réponse !
donc je vais tenter la récupération de fichiers, mais je ne pas trop vers quel logiciel me tourner...je ne sais pas quel est le plus efficace ...
"stellar phoenix" a l'air bien mais sur le site il ne précise pas si la récupération est possible sur un disque externe....
concernant testdisk, pour le moment je suis resté à l'étape mentionnée sur le screenshot, et j'ai laissé l'ordi tourner sans toucher a rien...bref je ne sais pas trop comment sortir de testdisk sans risque...je ferme le programme direct ou j'appuie sur entrer comme le programme le demande ?
dsl les risques me font devenir tres tres (trop ?) prudent...
Merci encore pour tous ces conseils ;)
Auteur : lop
Réponse le : 30/01/2007 18:58
Message :
enter continue la procédure sans risque
fermer avec la croix est sans risque
redémarre testdisk avec l'otion advanced puis passer sur boot et retiens les réponses
Auteur : MrTomato
Réponse le : 01/02/2007 00:57
Message :
bon je suis en train de tenter une récupération avec"stellar phoenix" ...Les fichiers sont bien apparus dans l'arborescence et j'ai donc lancé la copié des fichiers vers un autre dd externe...
L'interface graphique de stellar a l'air bloquée (fenetre toute blanche) mais le processus semble fonctionner car la place disponible sur le dd de destination reduit petit a petit....par contre c'est très lent ...c'est normal ?
a ce rythme je vais mettre 10 jours pour récupérer mes 250 Go !!
Auteur : romsk
Réponse le : 01/02/2007 06:55
Message :
alors à dans 10 jours... 
Auteur : Zouk
Réponse le : 05/02/2007 01:07
Message :
Bonjour à tous,
romsk,
Je tenais à te remercier pour ton tuto et toutes tes infos...grâce à toi j'ai sauvé...700 Go de données... (si si, je suis sérieux)
Tu ne peux pas imaginer la panique que j'ai eu quand j'ai vu mes partitions en "RAW".
Tu m'as seulement sauvé la vie ;-)
Vraiment, bravo pour ton tuto très complet et encore merci infinimement.
(Pour info, j'avais deux mega partition RAW à cause d'un soft de merde -lecture/ecriture NTFS sous windows98-, et le rebuild BS m'a sauvé...)
MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI MERCI
Auteur : nasso
Réponse le : 05/02/2007 01:43
Message :
Hello   , aprés mon cas du DD 300 gb Maxtor qui est pour le moment de coté   .
Je suis sur un autre cas > plantage net de la carte éléctonique d'un DD 250 GB , j'ai commander le meme DD afin de recup cette carte .Sa fait du ponion mais les donnée oblige .
Celle ci monté le DD démarre  mais pas reconnu sous windows et sous linux error probleme suivant ton tuto romsk  .La 1er chose a faire je pense c'est de lancer testisk .
Comme sous windows testdisk ne le reconnais pas aussi , j'ai lancer le cd boot Hiren's , ici testdisk le reconnais et m'affiche :
Disk 80 - 137GB/127 GIB CHS 16709 255 63
Partion start end Size in sectors 
*HPFS - NTFS 0 1 1 12747 254 63 204 796 557
puis les manipes / proceed / ok > mais pareils , alors j'essaye de refaire la géometrie je modif juste / Cylinders / et remplace par 30 513 pi ok .
Mais mais pourquoi j'ai mis ce nombre (30 513)  parce que lorsque j'ai fait /proceed/ dans le menu Analyse , a la fin du scann j'ai conclu qu'il m'avait retrouver ma partition
et la je fait write . Je reboot et testdisk m'affiche : Disk 80 - 8414 MB / 8024 MIB - CHS 1023 255 63  
Je sais que sans capture, comme sa c'est pas evident d'ou ma question est ce possible de prendre des captures depuis le systéme cd boot Hiren's   (je croi qu'on dis sa ss DOS)
Si non pas possible pour les captrures , je recopierai a la main   . Quelle devrais etre les valeurs a mettre dans Geometry ?
Merci romsk de ton aide 
Auteur : romsk
Réponse le : 05/02/2007 07:08
Message :
salut zouk, et content pour toi 
yoh nasso, je vois que t'es sur tous les fronts 
pour ce qui est du nombre de cylindre, un 250 Go correspond à 30300 - 30600 cylindres (selon les marques et modèles, certains font 249 Go et d'autres 251...), donc ton 30513 me semble très bien (et confirme que la partition que tu as entrevue semble la bonne). 
par contre lorsqu'on modifie la geométrie, il faut tout faire dans la foulée sans fermer testdisk : modifs dans geometry > menu analyse > proceed > save si retrouvée (ou search > write) > menu advanced > boot pour s'assurer qu'on a un bon secteur de boot...
pour les copies d'écran, sous Hiren's j'en sais rien, mais testdisk est sur Slax-LFI (linux dans ma signature) : il suffit de taper testdisk dans la Konsole et faire des copies d'écran avec KSnapShot (menu KDE > graphisme > KSnapShot)
Auteur : littleneo
Réponse le : 05/02/2007 19:38
Message :
Bonjour,
d'abord bravo romsk pour ton assiduité et ton altruisme... je parcoure depuis 2 bonnes heures ce post et vraiment t'es un mec bien et ça redonne foi en l'humanité ! bon par contre j'ai pas trouvé (ou loupé) une situation comparable a la mienne. simple mais un peu zarb.
donc hier soir j'ai paumé un 160Gb plein a mort en NTFS sous windows 2000  :
2000 me sort le "voulez vous formatez ce disque ?" quand je clique dessus depuis l'explorer.
du coup je suis tres content quand testdisk 6.5, lancé sous 2000 et pas en dos, voit beaucoup de choses :

c'est le disque sdc surligné. apres [proceed] -> [intel] -> [analyse], ça donne :

ce qui semble bien ? en fait j'ai déjà changé le type de la partition, qui initialement était marqué P partition principale non bootable. j'ai fais 2 3 fois la manip ( P, *, p, et maintenant *, et reboot entre chaque modifs) mais le disque est tjrs pas accessible depuis fenetre2000.
avec [L], je vois bien tous mes fichiers, enfin je crois. je me ballade sans pb dans l'arborescence et tout semble y etre. je tente d'en récupérer un [c]
 
et c'est niquel !! il vient de finir, le fichier est OK et frodon va bien !!
a priori l'erreur vient bien de la mbr. il y a aussi une erreur sur un des secteurs :

chkdsk depuis windows de panne tout seul.
bon, je viens de faire un [MBR Code ] rewrite mbr.... je reviens
Auteur : littleneo
Réponse le : 05/02/2007 20:05
Message :
bon ça change rien... j'ai aussi demandé a zinzin2000 de ne pas utiliser ce dd pour le pagefile.
peut-etre que puisque ce disque est plein à mort, windows echoue.. ?
je cherche une appli capable d'effacer des fichiers sur ce disque inacessible par win et lisible par testdisk peut-etre ça ?
ou alors je fais une fausse manip ? j'ai pas essayé encore le "fix mirror FTP" qui m'effraie un peu, et pasque tout a l'air accessible..
en + j'ai pas de place pour backupper...
qu'est-ce que je peux faire ? (chekdisk semble dire no pb et windows m'affiche meme pas le nom du disk et me propose de formater..)
Auteur : romsk
Réponse le : 05/02/2007 21:02
Message :
salut littleneo,
en fait j'ai déjà changé le type de la partition, qui initialement était marqué P partition principale non bootable. j'ai fais 2 3 fois la manip ( P, *, p, et maintenant *, et reboot entre chaque modifs) mais le disque est tjrs pas accessible depuis fenetre2000 : normal, ça n'a pas d'importance p ou *... (ça n'est important que pour les partitions système)
a priori l'erreur vient bien de la mbr : pas sûr (la preuve mbrcode marche pas) : ça peut venir du secteur de boot qui est corrompu, et c'est peut être bien ton problème. t'as utilisé que le menu analyse : quand tu vois que ta partition est là après proceed, il faut aller dans le menu advanced > boot pour vérifier le statut du secteur de boot (OK ou bad) et faire, selon les cas, backupBS ou rebuildBS > write > fermer testdisk et regarder le résultat...
je cherche une appli capable d'effacer des fichiers sur ce disque inacessible par win et lisible par testdisk : sous linux (dans ma signature) ça devrait pas poser de problème (en mode graphique, et après avoir utilisé ntfs-3g pour mettre cette partition ntfs en lecture/écriture)
j'ai pas essayé encore le "fix mirror FTP" qui m'effraie un peu : c'est quoi cette option ?
Auteur : littleneo
Réponse le : 05/02/2007 22:54
Message :
a priori l'erreur vient bien de la mbr : pas sûr (la preuve mbrcode marche pas) : ça peut venir du secteur de boot qui est corrompu, et c'est peut être bien ton problème. t'as utilisé que le menu analyse : quand tu vois que ta partition est là après proceed, il faut aller dans le menu advanced > boot pour vérifier le statut du secteur de boot (OK ou bad) et faire, selon les cas, backupBS ou rebuildBS > write > fermer testdisk et regarder le résultat...

la ligne qu'il met "a valid NTFS boot..." c'est une info générale ou bien il y a une erreur ??
j'ai essayé de le "forcer" en effaçant les fichiers log et en choisissant "no-log" au lancement du prog, ça marche pas il compare qd meme si je lance un rebuild :

je peux rien faire a priori.
j'ai pas essayé encore le "fix mirror FTP" qui m'effraie un peu : c'est quoi cette option ? quand je choisis [repair MFT] il me propose : Fix MFT mirror ? (Y/N)
je l'ai téléchargé tout a l'heure chez CG. a la limite ce serait ptet mieux que je me serve de ta version ? et heu.. quelle différence tu fais entre MBR et secteur de boot ? enfin je vais regarder.
Auteur : littleneo
Réponse le : 06/02/2007 12:20
Message :
youps désolé pour la derniere question.. j'ai lu hier soir une partie des 3 metres de posts sur les disques durs dans ta signature. (tu fais des trucs sur wiki, ou O'Reilly ? tu devrais  )
je m'y remet
Auteur : romsk
Réponse le : 06/02/2007 12:38
Message :
bon ben ton secteur de boot semble bon ("a valid NTFS boot..." est effectivement une info générale), et le rebuild le reconstruit apparemment à l'identique...
je l'ai téléchargé tout a l'heure chez CG. a la limite ce serait ptet mieux que je me serve de ta version ? non, je crois que c'est moi qui devrait regarder cette nouvelle version qui me semble plus complète...
reste plus que le [repair MFT] : il me propose : Fix MFT mirror ? (Y/N) : valide par y
Auteur : littleneo
Réponse le : 06/02/2007 13:26
Message :
mon disque/partition panné est le sdc / disque physique 3. l'unique partition qui s'y trouve correspond a E:/, en NTFS.

la partition logique (j'ai sélectionné E) :

le master boot record du disque physique 3 :

je continue mes lectures. 
Auteur : romsk
Réponse le : 06/02/2007 14:31
Message :
secteur de boot et table de partition du MBR semblent correct, par contre l'exécutable du MBR me semble bien daubé avec tous ces 00 qui n'ont rien à faire là... tant que tu es sous edithexa sauvegarde le MBR comme je l'explique dans ma signature, puis ouvre testdisk et va refaire un MBR propre par le menu "MBRcode" > puis tu vérifies que tout soit toujours d'aplomb dans le menu analyse et dans le menu advanced > puis tu fermes testdisk, redémarre ton PC et va voir ce que ça donne...
Auteur : littleneo
Réponse le : 06/02/2007 14:44
Message :
j'ai refais ce que tu m'as dit, mais avant de redemarrer j'ai comparé le nouveau et l'ancien mbr, c'est le même.. en fait j'avais déjà écrasé le mbr avec celui de testdisk. bon je reboote sait-on jamais.
Auteur : romsk
Réponse le : 06/02/2007 16:40
Message :
ça explique donc ce drôle de MBR ("façon testdisk") : dans le doute fais quand même un fixboot et fixmbr sous la console de récupération comme expliqué ici --> http://forum.pcastuces.com/sujet.asp?page=-1&f=1&s=100275&REP_ID=2116844
Auteur : littleneo
Réponse le : 07/02/2007 04:50
Message :

JOIE ET BONHEUR 

j'ai tellement plus confiance en windows que j'avais même pasfait un chkdsk  c'était ça en fait, le chkdsk que tu préconises juste au dessus..quelques trous dans mon maxtor (hum) 2-3 applis perdus au final, mais tout est là.
du reste j'ai grace a toi appris plein de trucs et rafraichit d'indispensables bases qui pourrissaient depuis un vieux 386.. jvais me refaire une panoplie de secouriste grace a toi et ces précieuses pages. mon disk a quelques clusters endommagés.. c'est un pti claquage de footing ou c'est le début de la fin ? je dois tout backupper et le vendre sous ebay ? [joke]
ça me fait penser que j'ai deux disks conséquents laissés pour morts dans l'armoire...
 VOTEZ RSK !! 
Auteur : romsk
Réponse le : 07/02/2007 08:55
Message :
content pour toi littleneo 
c'est vrai que mes sujets sont un peu longs, mais le chkdsk figure quand même dans le 1er paragraphe de mon truc sur les partitions disparues... 
j'y indique également le lien pour hdd-regenerator que tu peux utiliser pour essayer de réparer tes secteurs défectueux, mais bon, ça reste un maxtor... (si t'arrives pas à t'en débarasser sur e-bay tu peux aussi l'offrir à ta belle-mère )
Auteur : littleneo
Réponse le : 08/02/2007 01:18
Message :
non non c'est tres bien qu'ils soient longs tes posts.. 
j'enchaine, j'ai fusillé ma mobo ce matin.. enfin bref c'est réglé, j'ai récupéré une p43200. du coup j'ai aussi 2 AMD (XP 2100 et 2600 100mhz) et de la ram < 200Mhz a mettre sur ebay.. a moins que je trouve une carte socket462. chui preneur.
quel silence maintenant. out ce ventilo surbruyant a potentiometre fluo pour geek.. et surtout je viens de reconditionner un WD 40 gigas, qui a déjà bien tourné sa bosse.. je suis épaté par le silence et l'absence de "gragrat " / maxtor. ça chauffe un peu quand même..
je veux bien essayer l'appli / secteurs defectueux (quand y aura plus une vis qui traine dans le bureau,) mais est-ce que ça signifie que c'est le debut de la fin pour ce disque, ou est-ce que par ex. un format low-level peut le remettre d'aplomb, ou est-ce que c'est rien.. ?
Auteur : romsk
Réponse le : 08/02/2007 06:58
Message :
très bien aussi le formatage bas niveau... 
Auteur : pat5978
Réponse le : 08/02/2007 21:50
Message :
Bonjour à tous
Grosse galére pour moi aussi, je test Kubuntu et j'ai planté un DD.
Je lance test disk sur la partition qui pose pb et je fais analyser voilà ce que j'obtiens "no partition is bootable"
je sais pas quoi faire pensez-vous que je puisse réparer ma bêtise
Un grand merci pour votre aide
Auteur : romsk
Réponse le : 08/02/2007 22:31
Message :
salut pat,
on manque d'info : l'idéal serait une copie de la gestion des disques (en nous indiquant quelle partition a disparu) et de ce que montre testdisk
Auteur : pat5978
Réponse le : 09/02/2007 13:58
Message :


Voilà :-)
j'attend votre diagnostic avec impatience
Auteur : romsk
Réponse le : 09/02/2007 16:05
Message :

sur cet écran fait proceed, et s'il ne retrouve pas de partition fais entrée > search : copie d'écran
Auteur : pat5978
Réponse le : 09/02/2007 18:52
Message :

J'ai passé l'am à récupérer mes données j'ai perdu des choses mais romsk, un grand merci j'attend ta réponse je sais pas quoi faire là
:-)
Pour info il y une partition linux sur ce DD
Auteur : littleneo
Réponse le : 09/02/2007 18:55
Message :
très bien aussi le formatage bas niveau... [ROMSK]
si je pouvais mon ami.. mais comme dirai l'autre dans le sens de la vie, "j'ai les gencives qui baigne".. !!
en fait c'est en cours, enfin bientot : mon IBM 10 Gig c'est mystérieusement transformé en excelstor 80Gb sata neuf et vierge, et une carte wifi.. pour pas un rond.. bizarre.. .. des ptis bonheurs dans le malheur.
chui tombé la-dessus aussi, alternative a fdisk (ok dos 6.22). supporte les partoches linux, resizing, propose un bootloader etc..
http://www.ranish.com/part/
a+
Auteur : romsk
Réponse le : 09/02/2007 22:10
Message :
pat5978 a écrit :

J'ai passé l'am à récupérer mes données j'ai perdu des choses mais romsk, un grand merci j'attend ta réponse
euh, je comprend pas bien : t'as récupéré tes données comment ? (et où ?) 

le tableau que montre testdisk indique un problème de géométrie : notamment tu devrais avoir au moins 14594 cylindres puisque linux termine au cylindre 14593... t'as des trucs à récupérer sur cette partition linux ? combien d'autres partitions avais-tu avant celle ci ?
Auteur : pat5978
Réponse le : 09/02/2007 22:15
Message :
J'ai utilisé le freeware PCinspector File Recovery, super logiciel !Avant de modifié quelquchose avec testdisk je voulais essayer de récupérer un max de données
Malheureusement pas tout, j'avais 2 partitions NTFS (windows) et Mandriva installé (3partitions: "/", home et Swap).
J'ai manipulé sous linux, tu crois que c'est irrécupérable ?
Auteur : romsk
Réponse le : 09/02/2007 22:32
Message :
...Avant de modifié quelquchose avec testdisk je voulais essayer de récupérer un max de données : c'est une sage décision... 
J'ai manipulé sous linux, tu crois que c'est irrécupérable ? tout dépend de tes manips...
Malheureusement pas tout, j'avais 2 partitions NTFS (windows) et Mandriva installé (3partitions: "/", home et Swap) : il faut faire search 2 ou 3 fois de suite jusqu'à ce qu'il te retrouve toutes tes partitions. si search n'y arrive pas je vois pas d'autre solution... sauf peut être en regardant sous slax-lfi (linux dans ma signature) si tes anciennes partitions sont retrouvées par la commande fdisk -l, dans quel cas il suffirait peut être de les monter pour pouvoir y accéder en mode graphique ?
Auteur : pat5978
Réponse le : 09/02/2007 22:49
Message :
j'ai cliquez sur "set disklabel" dans gparted (outil de partionnement de Kubuntu). Je dois apparement restaurer la table des partitions pour récupérer mes partitions. Je fais quand même ce que tu m'as proposé ?
Avant de m'afficher ce que j'ai mis en capture d'écran, on voit toutes mes partitions windows et linux juste aprés avoir cliqué sur "proceed" !!!
Auteur : romsk
Réponse le : 10/02/2007 07:00
Message :
pat5978 a écrit :

Avant de m'afficher ce que j'ai mis en capture d'écran, on voit toutes mes partitions windows et linux juste aprés avoir cliqué sur "proceed" !!!
ben si tu caches les infos, on va avoir du mal à t'aider... : montre les bonnes copies d'écran en indiquant à quelle étape de tesdisk ça apparait 
Auteur : pat5978
Réponse le : 10/02/2007 10:34
Message :
désolé, mais quand je dis on voit, c'est juste durant le temps de l'analyse, je n'ai copié que le résultat...voilà ce qu'on voit et qui disparait ensuite, on y retrouve toutes mes partitions soit 2NTFS et 3 pour Linux.
 
Auteur : romsk
Réponse le : 10/02/2007 11:53
Message :
si tu les vois à un moment c'est qu'elles sont là : c'est déjà bon signe...
as-tu fait ce que je te dis plus haut : il faut faire search (éventuellement 2 ou 3 fois de suite) jusqu'à ce qu'il te retrouve toutes tes partitions
si search ne les retrouve pas on les recréera (maintenant qu'on a leurs coordonnées précises...)
Auteur : pat5978
Réponse le : 10/02/2007 11:56
Message :
Oui j'ai essayé plusieurs fois sans résultat.
Auteur : romsk
Réponse le : 10/02/2007 12:01
Message :
comme je te disais : le tableau que montre testdisk indique un problème de géométrie : notamment tu devrais avoir au moins 14594 cylindres puisque linux termine au cylindre 14593...
donc va dans le menu geometry et met 14594 dans la case "cylinder" > va sur OK : entrée > retourne dans analyse > proceed (> +/- search) et dis-moi si tu retrouves les partitions... (ne ferme pas testdisk)
Auteur : pat5978
Réponse le : 10/02/2007 12:09
Message :
alors je vois toutes mes partitions (les 5) copie d'écran c'est plus simple:

Auteur : romsk
Réponse le : 10/02/2007 12:50
Message :
fait entrée > write > ferme testdisk > redémarre le PC et va voir tes données...
Auteur : pat5978
Réponse le : 10/02/2007 13:00
Message :

tu es un dieu !!!
C'est parfait tout fonctionne sans problème!
un immense merci pour ton aide !
Auteur : romsk
Réponse le : 10/02/2007 13:33
Message :
content pour toi pat  
Auteur : LeToM
Réponse le : 13/02/2007 16:08
Message :
Bonjour a tous , je viens pour la première fois sur ce forum qui m'a l'air surprenant de part sa simpliciter et rempli de reponses pertinentes surtout pour les personnes (comme moi) possédant un problème sur leur PC.
Je ne suis pas un novice en informatique mais j'ai eu -comme beaucoup apperement - un problème avec un disque dur Maxtor de 80Giga monter dans un boitier externe pour stocker photo films musiques extc..
Voici mon probleme:
Hier soir en copiant des données via mon DD ext sur mon DD interne en USB1 (c 'est pas rapide ) , il s'ai passer un bug et, depuis, impossible de rentrer dans mon DD externe. Son statut sous windows est passé de NTFS a système ROW.
Etant donner que c'est la 1ere fois que cela m'arrive, je suis aller chercher sur google qui m'a rapidement ammener ici. Je suis impressionner par Romsk car il répond a tous les posts qui lui sont adresser, et ce avec un professionalisme flagrant.
C'est pourquoi j'aimerais savoir si tu pourrais m'aider stp car autant les films et la musique ce n'est pas la fin du monde si je les perd, autant plus de 4ans de souvenirs en photo qui, du jour au lendemain me serai perdu a jamais sa me fais froid dans le dos.
J'ai commencer a cherche sur testdrive et quelques autres logiciels qui sont donner dans les différents post mais je prefere rien faire "d'irréparable" avant un avis d'expert.
J'espère sincèrement que tu pourras m'aider, à bientot et je te remercie par avance de consacrer un peu de ton temps a nos problèmes récurrents.
Auteur : romsk
Réponse le : 13/02/2007 17:49
Message :
salut letom, et bienvenu sur PCastuces...
t'avais une seule partition sur ce DD externe ? fat32 ou ntfs ?
pourrais-tu commencer par une copie d'écran de la gestion des disques, de ce que montre ptedit et de "boot record" (si accessible dans ptedit) : voir le sujet raw dans ma signature. 
selon ce que ça montrera on verra si ton problème passe ensuite par testdisk...
Auteur : LeToM
Réponse le : 13/02/2007 18:02
Message :
je viensdefaire des screens de mes résultats de testdrive je ne sais pas si sa va marcher j'essaye:
Choix du lecteur:

Analyse du lecteur:
 
Résultats:

 
Retour sur Advanced:
 
Boot:

Auteur : LeToM
Réponse le : 13/02/2007 18:05
Message :
merci de ta reponse et de ton soutien je prépare ceci de ce pas
Auteur : LeToM
Réponse le : 13/02/2007 18:18
Message :
Alors mon DD externe n'etait pas partitionner, tout comme mon interne qui lui est aussi un maxtor de 80 giga (environ 76 réel)
voici les screens que tu m'a demander sur ton post précédent:
Gestion des disques:

PTEDIT disque 1 (systeme ):
 
PTEDIT disque 2 (deffectueux):

Auteur : LeToM
Réponse le : 13/02/2007 18:23
Message :
j essaye le screen de gestion des disques en plus grand:
 
Auteur : LeToM
Réponse le : 13/02/2007 18:41
Message :
desoler mais mon site perso qui heberge mes photos me bloque la taille de mes screens' jespère que sa pourra t'aller.
sinon mes 2 disques etaient en NTFS en 1 seule partition chacunes.
Impossible d'aller dans "boot record" avec PTEDIT la case reste grisée (tout comme les autres).
Voilà j'ai mis tout ce que j'avais, si tu connais un moyen pour mettre des screens plus grand et plus net n'hesite pas a me le dire je les modifierais, (la elles sont stocker chez orange peut etre que d'autres hebergeurs seront plus généreux en taille, je ne sais pas).
Auteur : romsk
Réponse le : 13/02/2007 19:18
Message :
ptedit ainsi que testdisk confirment que c'est bien ton secteur de boot (= "boot record") qui est corrompu...
quand tu es sur cet écran :

fais "backup BS" > write si demandé > ferme testdisk (et ptedit) > éteint débranche rebranche et rallume ton DD externe > ça devrait être bon...
Auteur : LeToM
Réponse le : 13/02/2007 19:27
Message :
sa ne va pas effacer des donnee si je fais whrite?
Auteur : LeToM
Réponse le : 13/02/2007 19:47
Message :
Mille merci!!!!!!!!!!!!!!
sa remarche!!!!, la ptite larme qui commence a venir quand je redecouvres tous mes dossiers 
Quand je pense que c'était 3fois rien a faire, vraiment merci a toi romsk, je sens que je vais venir trés souvent sur ce forum car cela faisait 24h que j'avais vraiment les boules. Super forum, bonne mentalité , sa vraiment nikel, j'ai pas l'habitude de cirer les pompes mais la sa vient vraiment du coeur, vive l'entraide entre internautes!!!
bon je vais sauvegarder de ce pas mes photos sur dvd au cas ou, car la sa ma servi de leçon
BIG UP a toi   et encore merci, bonne fin de soirée et à bientôt.
Auteur : romsk
Réponse le : 13/02/2007 20:37
Message :
content pour toi letom , et c'est l'occasion de rajouter, pour tous ceux à qui testdisk a rendu service, de pas oublier d'aller remercier christophe grenier (voire de lui "exprimer leur gratitude"...)
Auteur : piouXpiou
Réponse le : 14/02/2007 20:46
Message :
Bonjour tout le monde, j'ai parcouru ce sujet de fond en comble pour essayer de résoudre un problème récent rencontré avec mon DD...
N'ayant rien trouvé qui ressemblait à mon problème je soumets donc mon cas à qui saura y répondre (si possible).
Alors voilà je possède 2 dd, le premier est le disque système avec 2 partitions mais c'est le second (Seagate 400 Go 16 Mo de cache assez neuf) avec lequel je rencontre des soucis. Après qq démarrages de l'ordi pendant 2 semaines où mon ordi essayait de booter sur mon disque slave (donc celui qui déconne maintenant), jusque là rien de méchant je changeais ça sous le bios, mon 2eme disque m'affiche maintenant ceci :

Bon... ok!
Je vais voir sur le forum, découvre ce magnifique sujet ainsi que Testdisk. Génial, j'essaye.
Je démarre le bigniou, mon disque est détecté -> intel -> analyse et là message étrange : Incorrect number of heads/cylinder 16 (NTFS) it may be 32.
ah bon !
je vais dans geometry passe dc le nombre de heads à 32 pour retenter l'analyse. Il continue à me signaler "warning : incorrect number of heads/cylinder 16 (NTFS) != 32 (HD)" mais bon, je peux lancer l'analyse -> search -> write! -> redémarrage et c'est pas mieux, toujours le même bug.
J'ai essayé de passer à 255 le nombre de heads et ça n'a pas donné plus de résultat comme le montre ce screen :

J'essaye 2,3 fois et rien de mieux !!!
Voilà je sais plus quoi faire !!! Est-ce un probème insoluble ?
J'attends des suggestions... et merci d'avance 
Auteur : romsk
Réponse le : 14/02/2007 21:35
Message :
salut piouXpiou,
pourrais-tu refaire des copies d'écran via imageshack, car les tiennes ne sont pas visibles...
Auteur : piouXpiou
Réponse le : 14/02/2007 21:47
Message :
autant pour moi
voilà :
http://img70.imageshack.us/my.php?image=bugddix0.png
et voici :
http://img131.imageshack.us/my.php?image=bugdd2xh7.png
Auteur : romsk
Réponse le : 14/02/2007 23:06
Message :
que ce soit avec 32 ou 255, est-ce que "search" te retrouvait ta ou tes partitions ? (au fait combien de partition sur ce DD ?)
le plus fréquent quand même est la config à 255 ou éventuellement 240 : recommence avec ces valeurs jusqu'à retrouver ta ou tes partitions avec des coordonnées CHS plausibles (c'est ça qui te permettra de choisir le bon chiffre), mais après search et write n'oublie pas d'aller vérifier le secteur de boot dans le menu advanced (et n'oublie pas non plus de ne pas fermer testdisk entre les différents menus et de bien faire, dans l'ordre, menu geometry > menu analyse > menu advanced...)
Auteur : piouXpiou
Réponse le : 15/02/2007 09:42
Message :
Alors je n'ai qu'une partition sur mon DD et effectivement il n'a jamais trouvé de partition... je ferai ce que tu m'as dit ce soir en rentrant du boulot !
En attendant merci romsk et bonne journée à tous
Auteur : exo bob
Réponse le : 15/02/2007 12:18
Message :
j ai un big pblm j ai fait une fusion de partition avec pm 8.0 sa a planter , j ai rebooter et la me rest qu une seul partition
a la base c etais un disk de 250 giga avec 2 partition une de 40 giga et l autre de 200 giga , dans le gestionnaire il voit la partition 
en tant que partition logique ,mais avant fusion c etais de partition principal
donc ma question komen puis je faire pour reparer la second partition,j ai recuperer klk fichier avec testdisk,mais le mieux serai de
reparer la partition
merci
Auteur : romsk
Réponse le : 15/02/2007 15:32
Message :
salut exo bob,
peux-tu faire une copie d'écran de la gestion des disques et de ce que montre testdisk dans le menu analyse > proceed (+/- entrée > search si proceed ne retrouve pas ce que tu cherches...)
Auteur : patrickguillard
Réponse le : 16/02/2007 22:28
Message :
bonjour à tous,
j'ai un disque dur externe depuis 1 an, il marchait très bien ... et depuis peu windows ne le reconnait plus sous le poste de travail , ni sous la gestion des disques, mais il s'affiche sous pariphérique de stockage usb. mais impossible d'y accéder. jai essayer de récupérer les données via beaucoup de logiciel mais erreur de données probleme de redondance cyclique. je ne peux avoir accès à aucune donnée. je tombe sur ce topic et je vois que vous pouvez m'aider a résoudre ce problème. mon disque dur externe n'est pas partitionné mais j'ai quand meme téléchargé test disk. Pouvez m'aider a récupérer les données , comment je dois procéder car je ne suis pas un as de l'informatique.
Voici le premier screenshot avant le test, il reconnait bien ma partition

Voici le deuxième screenshot en cours d'analyse si sa peut aider
 
le 3° qui m'indique que la straucture est ok
 
et le 4 ° après l'analyse ????
 
si vous avbez une solution merci d'avance de votre aide car sur ce disque j'ai toute ma vie : photos , docs du boulot, ....
si romsk passe dans le coin ça serait coool car c l'expert du topic ;-)
a+
patrick
Auteur : buddybuddy
Réponse le : 16/02/2007 23:50
Message :
Bonsoir Romsk
J’ai lu avec intérêt les tutorials que tu as écrit et je te remercie pur ça. Pas encore tout digérer, mais tu es devenu une référence pour moi, LOL. Je me suis plongé notamment sur le tuto testDisk. Et Félicitations pour un sujet qui dure depuis 7 mois!!
Alors voilà, je me permet de te demander un peu de temps pour t’exposer ma problématique : j’ai acquis avant Noël un HP Pavilion dv2150ea :intel core 2 cpu t5200 @ 1.60Ghz, 798 MHz, 1.00 Go de ram, disque dur de 120 go
Avec Parttion Magic, je vois ça :
Disque local (C:) NTFS 111 Go (contient XP media center avec un milliard de soft dont je ne me servirai jamais)

Espace libre 7,8 Mo (taille minimale de partition, je soupçonne HP de l’avoir créée uniquement afin qu’il y ait 4 partitions principales et de m’empêcher de bidouiller avec des outils classiques) 

HP_RECOVERY (D:) FAT32 7.5 Go (sur lequel le PC boot lorsque je le démarre en appuyant sur la touche F10. Le problème est qu’elle est sensée me réinstaller le système comme en sortie d’usine… Habituellement, sur mes autres PC (assembleur), je crée une partition principale pour le système et une série de partition logique afin de stocker mes données, ce qui me permet de formater/réinstaller sur C sans souci aucun de sauvegarder mes données)

Disque local (*: ) Type D7 1 Go (Contiendrait un mini XP, ce qui permettrait de lire un DVD sans lancer XP, ce qui n’a aucun intérêt pour moi)
Les 4 partitions sont des partitions principales, c’est la le problème… pour moi en tout cas.
1- Puis je effacer l’intégralité des partitions afin de n’en recréer qu’une seule et lui donner la structure que je veux (1 partition principale, suivie de X partitions logiques, le tout dans une partition étendue en NTFS, classique, quoi) pour ensuite créer une 2° par la suite afin d’installer linux en double boot. La partition HPrecovery sert réinstaller le système en appuyant sur F10 au démarrage mais aussi a créer les DVD de réinstallation, donc plus besoin de cette partition si j’ai les DVD de réinstallation.
2- Les 3 dernières partitions n’ont pas d’intérêt pour moi, je les supprimerais sans état d’ames, ça représente quand même 10Go en tout…
3- As-tu déjà entendu parler de tatouage dans les Pavilion ? Si ça n’est pas une légende, Test disk peut il m’aider a résoudre cette contrainte ?
4- TestDisk peut il supprimer toutes les partitions afin d’en recréer qu’une seule ?
Voilà. Le problème avec cette machine et sa configuration (le système de réinstallation qui restaure la configuration d’usine le fait que je peux pas créer de partition, etc) j’ai le sentiment de ne pas avoir la main sur la machine, et d’être sous la coupe du bon vouloir d’HP… Et j’aime pas ça.Je ne suis pas frileux pour bidouiller dans le PC, et je n’hésite pas avec mes 2 PC de bureau, mais là, je me pose des questions avec le portable. La conclusion, je n’achèterai plus HP, ça, c’est sur et je me renseignerai un peu plus avant. Mais bon, je l’ai et il marche bien au demeurant… et j’aime bien les défis, LOL
Merci d’avance
Buddy
Auteur : romsk
Réponse le : 16/02/2007 23:55
Message :
salut patrick,
tu dis "mon disque dur externe n'est pas partitionné", mais en fait il y a quand même au moins une partition... le problème est de savoir si c'était du fat32 ou du ntfs puisque la partition que retrouve testdisk est "unknown". le 2ème problème est que cette partition ne commence pas au bon endroit et c'est probablement là la cause de ton problème (une partition commence à CHS 0 1 1 et pas 0 0 1 comme c'est indiqué ici...)
dans un 1er temps fait "search" sur le dernier écran que tu affiches, et montre nous ce qui est éventuellement retrouvé.
Auteur : patrickguillard
Réponse le : 17/02/2007 23:51
Message :
Bonsoir
tout d'abord merci romsk de votre réactivité...
il me semble qu'à l'époque je l'avais formaté en ntfs sous gestion des disques
voici le screenshot pendant le search :
 
voici la copie d'écran après le search ...
 
merci encore de votre aide....
patrick
Auteur : romsk
Réponse le : 18/02/2007 09:29
Message :
re patrick,
1 remarque avant de continuer avec testdisk : les messages d'"error" avec testdisk et le problème de redondance cyclique indiquent un possible problème "matériel" : branche ce DD en interne dans ton PC (en esclave sur une des deux nappes IDE) et teste le avec le logiciel constructeur ainsi qu'avec HD-tune
salut buddybuddy,
j'avais raté ton post (on a mis nos 2 posts au même moment...)
testdisk ne peut rien dans ton cas de figure (il n'est pas fait pour ça), par contre la gestion des disques ou partition magic devraient te permettre d'arriver à tes fins... pour répondre à tes questions :

1) oui il parait qu'HP utilise aussi le tatouage : est-ce vrai ? sur tout ses nouveaux ordis ou que sur certaines séries ? j'avoue que j'en sais rien et le mieux est de leur poser clairement la question par mail... si c'est le cas il faut savoir que ça peut poser des problèmes de fonctionnement si tu devais un jour réinstaller un XP différent de ton C: d'origine (because non reconnaissance de C: par le BIOS au démarrage) > corollaire : avant de bidouiller (et notamment effacer HP recovery) il est impératif de créer tes CD de réinstallations qui te permettront au moins de restaurer ton ordi dans sa config d'origine en cas de gros problème insoluble, de même que le principe ceinture et bretelles me font te suggérer de faire une image (ghost ou autre) de ton C: d'origine au cas où, ainsi qu'une sauvegarde de ton MBR (voir edithexa dans ma signature)... Une fois que t'auras fait tout ça t'es sûr de pouvoir au moins restaurer ton PC en cas de big problème.

2) non tu n'as pas 4 partitions, mais seulement 2 ou 3 : je sais pas à quoi correspond ce "disque local *" de 1 Go (type D7 ???), mais les 7,8 Mo d'espace libre ne constituent pas une partition. peux-tu faire une copie d'écran de ce que montre ptedit (voir les partitions disparues dans ma signature) ainsi que de la gestion des disques ?
3) en pratique voilà ce que je ferais : 
> sauvegarde de la config actuelle comme je te l'explique au 1) 
> supprimer toutes les partitions autres que C: par la gestion des disques ou partition magic pour n'avoir que C: et un espace non alloué de 8 ou 9 Go à côté 
> défragmenter C: en mode sans échec +++ 
> redimensionner C: sous partition magic pour lui attribuer 25 Go seulement (et donc récupérer 85 Go) : c'est la partie délicate qui peut tout faire planter, d'où l'intérêt des sauvegardes du paragraphe 1)
> toujours avec partition magic créer une partition étendue avec l'espace libéré (8 + 85 = 93 à 95 Go environ) et dans cette partition étendue créer autant de partitions logiques que tu le souhaites 
> quand tu as tout fait, bien penser à refaire une image ghost de ton nouveau C: redimensionné et du MBR, car à ce stade si tu devais utiliser les CD de réinstallation ou le ghost du début ça te remettrait le C: d'origine de 111 Go et effacerait donc ta partition étendue créée par la suite et tout ce que tu auras mis dessus 
> l'ultime étape, si la config XP avec le milliard de logiciels ne te convient pas, est de réinstaller un XP tout neuf sur le C: de 25 Go, mais c'est là que tu risques d'avoir des problèmes en cas de tatouage... (d'où l'intérêt d'avoir refait un ghost à l'étape précédente...)
Auteur : patrickguillard
Réponse le : 18/02/2007 11:10
Message :
salut romsk
jai essayé de branché mon DD en interne en slave mais lorsque je démarre mon ordi il plante lorque l'écran windows xp avec la barre d'attente se lance jai attendu 10 mn mais il reste toujours sur cet écran...
jai essayé de le tester en externe avec seatools mais il ne le reconnait pas ni hdtunes....
au fait c'est un seagate barracuda...
merci
Auteur : romsk
Réponse le : 18/02/2007 12:41
Message :
t'es bien sûr de la position de ton cavalier esclave ? t'as essayé sur la même nappe IDE en esclave, puis sur l'autre nappe IDE en maître (en débranchant l'éventuel lecteur DVD sur la même nappe) ?
fais un chkdsk et un fixmbr sur ce disque sous la console de récupération comme je l'explique ICI
Auteur : buddybuddy
Réponse le : 18/02/2007 13:10
Message :
Bonjour Romsk
Merci beaucoup pour tes réponses.
J'ai déjà créé les disques de réinstallation, en fait, la première fois qu'on lance le PC après déballage, il exige de toi que tu le fasses, la première utilisation est dépendante de cette sauvegarde... Il est donc impossible de se servir du PC sans avoir fait cette sauvegarde.
J'ai envoyé un mail a HP leur posant la question, on verra ce qu'ils me répondent.
J'ai créé des sauvegardes du MBR avec edithexa, je les garde précieusement en plusieurs exemplaires sur disques durs et clé USB...
Je vais créer également un ghost, on n'est jamais assez prudent, je suis d'accord.
Comme tu me le demandes, je te post les images ptedit et gestion de l'ordinateur. Je met également une image PM8, qui fournit a priori plus d'informations que Gestion des disques. C'est la première fois que je mets des images, j'espère ne pas commettre d'impairs!!!
 
 






Voila, j'espère que les images sont ok, il ya de bonnes explications pour l'upload sur le site.
Vous êtes tous FORMIDABLES!!!!!!!!!!!!!! LOL
Merci encore et a bientot
Buddy
Auteur : romsk
Réponse le : 18/02/2007 14:37
Message :
tes copies d'écran sont magnifiques 
tu n'as bien que 3 partitions principales :
 
les 7,8 Mo correspondent à de l'espace libre laissé entre C: et D: (7,8 Mo = 1 cylindre = 255 x 63 x 512 octets = 214997895 - 214981767 + 63 secteurs) et que tu vas récupérer par la manip que je t'indique au dessus.
seul bémol : 25 Go semblent déjà être occupés sur ton C:, donc lorsque tu vas redimensionner C: laisse lui 40 Go (et non pas 25) pour qu'il soit à l'aise...
Auteur : dep
Réponse le : 18/02/2007 17:09
Message :
salut
je ne parviens plus a acceder a ma clé usb (pqi 1go)?(elle clignote constamment), la lettre apparait dans l'explorateur (xp) mais lorsque je clique dessus, il est demander d'inserer un disque dans le lecteur (dans les propriétés elle est en RAW) le formatage est impossible
comme je suis pas un expert en informatiquen je sais pas quelle option prendre avec ton tuto,
donc je lance le programme et j'arive a l'etape de selection intel mais apres je sais pas quelle option choisir, en faisant analyse j'ai ce message

si tu pouvais m'aide car je dois absolument recuperer les fichier (et si possible la clé)
merci d'avance
ps: avec r-studio il indique read disk failed after 2 attempt parametre incorrecte (87)
Auteur : romsk
Réponse le : 18/02/2007 18:44
Message :
salut dep,
d'après testdisk ta clé de 1 Go s'est transformée en disque de 2200 Go... y'a manifestement un problème de géométrie, mais on va avoir du mal à trouver le CHS juste sans passer par d'autres logs : montre le secteur 0 de cette clé avec edithexa (dans ma signature) et montre aussi comment elle apparait avec PTEDIT (partitions RAW dans ma signature)
l'autre solution est d'essayer tous les logiciels de récupération que je liste ICI, ou encore de regarder sous slax-LFI (linux dans ma signature) si tes données sont accessibles en mode graphique
Auteur : patrickguillard
Réponse le : 18/02/2007 19:02
Message :
salut romsk
jai tout essayé sur toutes les naps mais rien n'y fait ça plante ...
je l'ai mis en "cable select" rien puis master sur mon autre port rien n'y fait... l'autre position se limite a 36 go...
j'ai l'impression qui rentre en conflit avec mon DD interne
Auteur : romsk
Réponse le : 18/02/2007 19:08
Message :
romsk a écrit :

...fais un chkdsk et un fixmbr sur ce disque sous la console de récupération comme je l'explique ICI
pour le reste on verra après (si ça ne règle pas ton problème)
Auteur : dep
Réponse le : 18/02/2007 21:17
Message :
salut
merci d'essayer d'aider , voici ce que ça donne avec edithexa, des oooo partout : voir capture

et avec ptedit 32 pas moyen de selectionner la cle (ya que le hdd qui apparait voir capture)
edit:
pour les logiciel de recuperation j'en ai essayé quelques uns mais la clé reste inaccessible , pour linux , j'essaiarit plutard
merci
Auteur : romsk
Réponse le : 18/02/2007 21:55
Message :
romsk a écrit :

...l'autre solution est d'essayer tous les logiciels de récupération que je liste ICI, ou encore de regarder sous slax-LFI (linux dans ma signature) si tes données sont accessibles en mode graphique

alors passe à ça...
Auteur : Mic Dax
Réponse le : 19/02/2007 13:16
Message :
Merci à Romsk pour ses explications carrées et merci à Christophe Grenier pour Testdisk; je serais curieux de savoir combien de Go ils ont contribué à récupérer.
Auteur : romsk
Réponse le : 19/02/2007 14:25
Message :

Auteur : patrickguillard
Réponse le : 19/02/2007 14:28
Message :
salut romsk
jai essayé de corriger les erreurs avec la console de récupération de windows mais rein n'y fait ...
le disque qu'il soit en slave master, usb n'est pas reconnu par la console "map" il me marque tous mes autres périphériques mais pas mon diqsue alors qu'il était reconnu par test disk en unknow .... je ne peux donc pas le réparer ni faire un fixmbr....
est ce que je dois me résigner ou est ce que je peux encore récupérer mes données ?
merci encore de ton aide...
Auteur : benny67
Réponse le : 19/02/2007 15:09
Message :
bonjour a tous,j ais lu ce sujet avec attention.j aimerais feliciter romsk de son devouement et de son savoir,et surtout mettre chapeau bas pour sa patience et son travail et savoir qu il met a la disposition des autres .merci pour ce que tu fait ,tu merite pleinement tes vacances meme si tu le fait benevolement.
  
Auteur : romsk
Réponse le : 19/02/2007 18:57
Message :
salut benny67, et merci... 
patrick, les choses se compliquent mais y'a encore pas mal de possibilités...
regarde si ce disque est accessible avec edithexa (dans ma signature) et affiche le secteur 0 (MBR) comme expliqué au paragraphe 1...
Auteur : patrickguillard
Réponse le : 19/02/2007 19:37
Message :
Romsk ,
tu peux voir que le disque apparait en disque physique 2

et voila le résultat quand je le sélectionne

il apparait ici aussi on sent qui manque pas grand chose pour l'atteindre grrrrrrrrr....
jsui pret a essayé toutes tes techniques ....
UN grand merci a toi ROMSK pour le temps que tu consacres au novice comme nous ....
Auteur : romsk
Réponse le : 19/02/2007 19:43
Message :
Ces erreurs CRC peuvent être liées à un problème électrique dans le PC, une nappe défectueuse ou mal connectée (éventuellement 40 fils au lieu de 80) et/ou sont parfois annonciatrices d’un DD défectueux (ou d’une CM qui va cramer…). 
as-tu essayé une autre nappe ? c'est bien une 80 fils ?
regarde si ce DD est accessible (ainsi que tes données) sous linux (dans ma signature)
Auteur : patrickguillard
Réponse le : 20/02/2007 11:33
Message :
Salut romsk
jai essayé de changer de nappe j'en ai même racheter une ... c'est pas ça ...
Lorsque je vais sous linux je le branche en master ou slave : voila ce qui me marque : "hdb : lost interrupt" "cache flushes rapported" "ide failed opcode was : unknow" puis il démarre lkinux et rien dans le "poste de travail", il n'y a que mon c: qui apparait
PAR CONTRE quand il est branché en usb lorsque je vais sous gparted , il reconnai mon c:puis je sélectionne autre disque , il apparait 186 GO mais c'est marqué "non alloué" ... je clic droit sur "nouveau" et il me propose de créer une partition sur le disque j'ai refusé .... car il me dit que ça peut effacer toutes les données de mon DD...
a+
patrick
Auteur : montabor
Réponse le : 20/02/2007 12:01
Message :
Bonjour
c'est certainement bien tout cela , mais faut avoir fait les grandes écoles pour piger
Auteur : patrickguillard
Réponse le : 20/02/2007 12:19
Message :
salut montabor
issu d'une formation en marketing, je n'ai jamais appris l'informatique ... c'est de l'autoformation avec la collaboration de personnes comme romsk qui prenne le temps de t'expliquer ....
la compréhension de ce topic ne dépend que de ta motivation a résoudre ton problème ...
a+
patrick
Auteur : buddybuddy
Réponse le : 20/02/2007 20:39
Message :
Bonsoir Romsk et tous les autres
Alors voila, je me suis lancé ce week end et j'ai fait (presque) tout ce que tu m'avais conseillé.
Et ça marche, merci
Seulement, n'ayant pas encore eu de réponse de HP, je n'ai pas osé me débarassé de HP partition Recovery, ni de la partition type D7.
Tout s'est bien passé, pas de crash, pas de bug
et tadaaaaaa :

Mon disque il est (presque) comme je veux qu'il soit!!
J'ai finalement laissé que 22Go pour XP, en effet, il y avait deja pas mal de trucs, vu que je stockais tout dessus. Après ménage, j'ai libéré 12 ou 13 Go. Et maintenant ça roule.
Entretemps, à midi aujourd'hui, j'ai eu cette réponse un peu sybilline de HP, qui a répondu (avec rapidité, je le reconnais) à ma demande: le PC est effectivement tatoué, officiellement...
"Cher Monsieur, Nous vous remercions d'avoir contacté l'Assistance clientèle HP.
Suite à votre demande par email , nous vous informons que le modèle de votre ordinateur est équipé par une technologie nommé SATA pour les disques dur dont ils sont tatoués et il ne reconnaissent que le cd d' origine de l'ordinateur . Veuillez agréer, Monsieur, nos salutations les plus distinguées"
Ils sont polis, on ne peut pas leur retirer!!
Le seul Hic, c'est qu'ils ne fournissent pas le fameux disque... et que si je réinstalle le système avec leur système, je suis chocolat avec ma belle configuration : retour case départ... et hasta la vista avec toutes mes données sur les autres disques, alors ça sert à quoi que Ducros il se décarcasse??????????
Alors qu'est ce que ça t'inspire?
Et ce lien? : http://www.depannetonpc.net/article227-le-tatouage-bios-disque-dur-la-menace-fantome.html
Pense tu que puisse tenter de passer du coté obscure et faire valser le tatouage?
Merci pour tout
Buddy
Auteur : lop
Réponse le : 20/02/2007 20:47
Message :
Entretemps, à midi aujourd'hui, j'ai eu cette réponse un peu sybilline de HP
"Cher Monsieur, Nous vous remercions d'avoir contacté l'Assistance clientèle HP.
Suite à votre demande par email , nous vous informons que le modèle de votre ordinateur est équipé par une technologie nommé SATA pour les disques dur dont ils sont tatoués et il ne reconnaissent que le cd d' origine de l'ordinateur . Veuillez agréer, Monsieur, nos salutations les plus distinguées"
Ce n'est pas du français...moi y en a pas bien comprendre
Auteur : buddybuddy
Réponse le : 20/02/2007 20:53
Message :
Ben moi non plus, c'est un peu pour ça que je demande un avis.
A mon avis, la personne qui m'a répondu est probablement située dans l'équivalent d'un "call center" qq part en Asie... ce qui explique le Français moyen utilisé. J'ai récrit pour demander des précisions. J'ai un ticket chez HP, maintenant, on va échanger par mail...
En tout cas cette histoire de tatouage, c'est révoltant, et je ne félicite pas Darty non plus pour l'information du client!!
Auteur : romsk
Réponse le : 20/02/2007 22:19
Message :
bravo buddy :
je vois que t'as finalement choisis de garder la partition de restauration ? t'as pas tort puisque tu sembles ne pas manquer de place...
pour le reste je ne te conseille pas de détatouer ton ordi, du moins tant que tu n'est pas obligé de le faire : il sera toujours temps de t'en préoccuper si tu voulais un jour réinstaller un nouvel XP...
pour le "fameux disque", je pense qu'ils veulent parler du CD de réinstallation qu'ils te disent de créer au démarrage du PC : donc tu l'as bien ce disque, mais je confirme que si tu t'en serts tu vas te retrouver avec ton C: de 111 Go et adieu tes autres partitions... ceci dit si tu as bien fais le ghost de fin de manip y'a plus de problème pour ton C: que tu pourras restaurer facilement sans avoir à te servir de ton CD de réinstallation, et en ce qui concerne les données présentes sur les autres partitions, soit elles ne sont pas importantes et peu t'importe de les perdre, soit elles sont importantes et il te faut absolument les sauvegarder (sur un DD externe par exemple ou sur DVD) ou faire un ghost de l'ensemble de ton DD et que tu mettras sur un DD externe...
patrick :
puisque tu peux pas accéder à ce DD pour faire un fixmbr via la console de récupération, t'as qu'à utiliser le menu "mbr code" de testdisk qui est en fait l'équivalent de fixmbr... quand tu auras refais le MBR, va dans le menu analyse > proceed > +/- search jusqu'à retrouver ton ancienne partition : la seule inconnue est ces "read error" que signale testdisk sur certains secteurs et il faudra retenter un chkdsk dès que ce DD sera à nouveau accessible...
Auteur : buddybuddy
Réponse le : 20/02/2007 23:18
Message :
Merci, je crois aussi que je préfère garder HP recovery.
Comme tu dis, on verras pour la suite, d'autant que j'ai tout le stockage que je veux sur mes 2 autres PC + DD externe.
Que me conseilles tu pour faire une image de mon disque (on entend bien l'ensemble des partitions?)
Auteur : romsk
Réponse le : 20/02/2007 23:53
Message :
perso j'ai toujours utilisé ghost et j'en suis pleinement satisfait (version 2003 à 10 ou 15 euros sur e-bay ), mais d'aucuns te vanteront les mérites d'autres logiciels certainement non moins efficaces...
(mais on s'éloigne du sujet du topic, à savoir testdisk )
Auteur : patrickguillard
Réponse le : 21/02/2007 10:28
Message :
Salut romsk
je ne peux pas écrire un nouveau mbr cf ci dessous

est ce que ça peux venir de la géométrie d emon disque ? car tu m'avais di que "cette partition ne commence pas au bon endroit et c'est probablement là la cause de ton problème (une partition commence à CHS 0 1 1 et pas 0 0 1 comme c'est indiqué ici...)"
merci
Auteur : romsk
Réponse le : 21/02/2007 14:13
Message :
testdisk ne renvois pas de message d'erreur de geométrie et les coordonnées CHS affichées sont compatibles avec un 200 Go : donc je ne pense pas que le problème vienne de là...
d'autre part effectivement ce 0 0 1 n'est pas normal puisque c'est les coordonnées CHS du MBR et pas du secteur de boot...
essaye de recréer une partition :

quand tu es sur ce tableau (après proceed) clique sur la touche "A" et rentre successivement les valeurs suivantes : 
* cylinder : tu mets 0
* Head : 1
* Sector : 1
* cylinder : 24320
* Head : 254
* Sector : 63
* Type : tu vas sur la 2ème ligne > entrée : et tu tapes "07" (sans les guillemets)
* Done > entrée
et dans la fenêtre où tu reviens tu te mets sur la nouvelle partition et tu fais flèche droite gauche pour la mettre en "L" > entrée > "Write" : entrée > confirmer par "Y" > puis tu vas dans le menu "MBR code" et tu essayes de recréer le MBR (maintenant qu'on a libéré la place) > et si c'est bon, toujours sans fermer testdisk, tu vas dans le menu advanced > boot : copie d'écran...
si t'arrives toujours pas à créer ta partition, et compte tenu des messages "d'error" de testdisk, il faut vérifier ton DD avec le logiciel constructeur et hd-tune (peut être l'as-tu fait ? j'ai pas tout relu) et/ou essayer de le "réparer" avec HDD-regenerator +++... (lien en 1ère page de mon sujet raw).
Auteur : patrickguillard
Réponse le : 21/02/2007 18:04
Message :
salut romsk
jai essayé de reécrire avec test disk voila le résultat

 
 
jai essayé mais sans succès
jai lancé hdd regenerator il reconnait mon disque dur et pendant 2 h il a trouvé que des fichiers B : donc fichier a probleme
est ce qu'il faut que j'attende que l'analyse soit fini pour qu'il répare les fichiers corrompus ... ou il répare en m^me temps ?
je n'orai pas accés a internet pendant quelque jour mais je ne lache pas ...
MERCI MERCI en core romsk...
Auteur : romsk
Réponse le : 21/02/2007 18:26
Message :
je pense que c'est à la fin qu'il donne le verdict et commence les réparations, mais je crois qu'en version démo il ne répare les secteurs qu'un par un et qu'il faut relancer le logiciel à chaque fois ? j'espère que t'as pas trop de secteurs défectueux sur ton 200 Go  (de toute façon le problème principal, à mon avis, est situé sur le 1er secteur = MBR, et c'est pour ça que pas mal de logiciels plantent en essayant d'y accéder...)
Auteur : pluton8_13
Réponse le : 26/02/2007 12:29
Message :
Bonjour à tous et toutes,
Je suis nouveau sur ce forum.
J'ai lu attentivement les nombreuses pages de ce post pour essayer d'identifier un problème qui ressemblerait au mien, mais sans succés.
Je me permets donc de vous en faire la description:
-3 HDD : ==>Disque 1 = partition1: W2k
partition2: Programmes
espace libre destine a acceuillir Ubuntu
: ==>Disques 2-3 = Raid0 sur une carte pci ITE
Mon soucis est le suivant: j'ai perdu les 3 partitions inscrites sur le raid!
partition 1: swap (pagefile.sys)
partition 2: Internet (tmp internet/telechargements divers/tmp systeme)
partition 3: données personnelles...
W2k dans le gestionnaire de disques voit le raid comme une partition pricipale unique de 2x80Go (capacité des deux disques) 
Testdisk retrouve tout mais elles sont marquées par un "D" en début de ligne.
Je ne sais pas comment faire pour récupérer mes partitions...
 
Auteur : Loup blanc
Réponse le : 26/02/2007 12:41
Message :
Bonjour Pluton813,
Quand tu es dans testdisk, le D signifie Deleted, utilises les flèches <- et -> pour changer le "D" en "P" (ou encore "*") pour chaque partition puis "Entrer" puis "Write" et redémarrage du PC
Auteur : pluton8_13
Réponse le : 26/02/2007 13:49
Message :
Bonjour Desch et merci pour ta réponse ultra-rapide,
En fait lorsque je fais un "search" dans testdisk, à la fin du scan j'obtiens ce qui suit:
HPFS-NTFS 0 1 1 242 56 5 3891200 [swap]
HPFS-NTFS 242 56 6 2154 115 8 30720000 [internet]
HPFS-NTFS 2154 115 9 19451 251 63 277884928 [perso]
Dés que je change le "D" par "*" ou par "P" sur la premiere partition, j'obtiens ce qui suit:
HPFS-NTFS 0 1 1 242 254 63 3903732 [swap]
HPFS-NTFS 242 56 6 2154 254 63 30728812 [internet]
HPFS-NTFS 2154 115 9 19451 254 63 277885117 [perso]
Ce qui a pour effet d'afficher le "Structure:Bad".
Auteur : romsk
Réponse le : 26/02/2007 14:18
Message :
salut pluton,
y'a manifestement un problème de géométrie vu les coordonnées CHS affichées (ce qui explique le "structure bad"...)
peux-tu faire une copie d'écran de ce que montre le menu analyse > proceed (pour avoir entre autre les caractériques du "DD"...)
(PS : je sais pas ce que ça donne sur du RAID 0 : ça va être une 1ère...)
Auteur : Loup blanc
Réponse le : 26/02/2007 14:45
Message :
Est- tu aller voir dans le bios de la carte RAID ou dans l'utilitaire de configuration ?
Auteur : pluton8_13
Réponse le : 26/02/2007 15:01
Message :
Bonjour Romsk,
(tout dabord merci à tous de vous pencher sur mon cas...)
j'ai en fait résolu mon problème (sans trop de casse pour le moment, je vais voir à l'usage).
J'explique:
Face au "Structure:Bad", j'ai conclu que la seconde partition, que j'adresse à des telechargements de logiciels et autres fichiers temp, posait problème vu les valeurs "start" et "end".
J'ai donc pris la décision de passer la premiere partition en "*" et la derniere en "P". J'ai demandé àTestdisk de supprimer celle du milieu.
Au reboot, W2k lit: premiere partition en principale
deuxieme partition en espace disque non alloué
troisieme partition en principale (la plus importante puisqu'elle contient mes données).
J'ai formaté par W2k l'espace non-alloué (ex partition "internet") qui est devenue une partition principale.
Je retrouve ainsi toutes mes données et je n'ai plus qu'à rediriger le swap et les tmp comme innitialement.
Par contre mon empressement fait que je ne peux plus fournir de screen sur l'étape précédente...
En tout cas merci d'avoir créer ce post, sans quoi je perdais 3 années de photos films et données boulot... (dans l'état actuel des choses...)
Auteur : pluton8_13
Réponse le : 26/02/2007 15:17
Message :
Arf je n'arrive pas avec les copies d'écran...
voila ce que j'obtiens:
1 * HPFS-NTFS 0 1 1 242 254 63 3903732 [swap]
2 P HPFS-NTFS 243 0 1 2153 254 63 30700215 [internet] supprimée, formatée
3 P HPFS-NTFS 2154 115 9 19451 254 63 277885117 [perso]
CHS 19452 255 63
ceci avant de faire "annalyse", "proceed", apres tout est à l'identique sauf le "P" en 3 qui se transforme en "L"...
Mais j'hésite à confirmer...
Auteur : Loup blanc
Réponse le : 26/02/2007 15:21
Message :
Un petit conseil, si tu as des données importante n'utilises pas le RAID 0, ce mode ne fait qu'améliorer les performances d'acces aux données, mais pour la sécurité de celles-ci le risque de perte est 2 fois plus important qu'avec un disque seul.
Le RAID 1 est plus sûr pour les données mais les performances et l'espace disponible diminuent.
Dans tous les cas, fais des sauvegardes...
Auteur : Loup blanc
Réponse le : 26/02/2007 15:25
Message :
pluton8_13 a écrit :

Arf je n'arrive pas avec les copies d'écran...
voila ce que j'obtiens:
1 * HPFS-NTFS 0 1 1 242 254 63 3903732 [swap]
2 P HPFS-NTFS 243 0 1 2153 254 63 30700215 [internet] supprimée, formatée
3 P HPFS-NTFS 2154 115 9 19451 254 63 277885117 [perso]
CHS 19452 255 63
ceci avant de faire "annalyse", "proceed", apres tout est à l'identique sauf le "P" en 3 qui se transforme en "L"...
Mais j'hésite à confirmer...

Est-ce que tu n'avais pas une partition étendue sur ce disque qui contenait tes deux lecteurs Perso et Internet plutôt que deux partitions principales en NTFS ?
Auteur : pluton8_13
Réponse le : 26/02/2007 15:27
Message :
desch a écrit :

Un petit conseil, si tu as des données importante n'utilises pas le RAID 0, ce mode ne fait qu'améliorer les performances d'acces aux données, mais pour la sécurité de celles-ci le risque de perte est 2 fois plus important qu'avec un disque seul.
Le RAID 1 est plus sûr pour les données mais les performances et l'espace disponible diminuent.
Dans tous les cas, fais des sauvegardes...
Sage conseil le message est passé, en tout cas merci.
Auteur : pluton8_13
Réponse le : 26/02/2007 15:30
Message :
De memoire, windows avait déclaré tout le raid en partition étendue (vert), ensuite j'avais créé mes trois lecteurs... mais c'est vieux je n'en ai pas un souvenir exact.
Auteur : Loup blanc
Réponse le : 26/02/2007 19:34
Message :
Tes données sont accessible actuellement ?
Pour les captures d'écran, passe par un hebergeur comme tinypic et colle tout le contenu de la 3éme ligne dans la boite de dialogue que tu obtients en cliquant sur l'icône 
Auteur : pluton8_13
Réponse le : 26/02/2007 19:55
Message :
Re,
alors voila:
 
et apres le proceed:

Pour l'instant j'en suis au premier screen et cela semble fonctionner, mais ne semble pas "corporate"(!).
Dois-je continuer la procedure comme sur le second screen?
(ce soir, c'est sûr, je me couche un peu moins c**^^)
Auteur : pluton8_13
Réponse le : 26/02/2007 20:02
Message :
en gros ca donne çà (dsl):
 

Auteur : pluton8_13
Réponse le : 26/02/2007 20:11
Message :
Et enfin (maintenant que je sais envoyer des screens),
voilà comment windows interprete tout çà:

Auteur : Loup blanc
Réponse le : 26/02/2007 20:19
Message :
Et ton troisième disque, il est ou ? est-ce que les données sont accessibles ?
Si il est HS, avec du RAID 0 je crois que c'est sans espoir pour récupérer tes données, a moins que le RAID soit transparent pour Windows.
Auteur : pluton8_13
Réponse le : 26/02/2007 20:32
Message :
J'ai du mal m'exprimer,
disque 0 = 1 disque physique
disque 1 = 2 disques physiques sur carte pci en "array 0" (ne disposant que de trois disques identiques, j'ai opté pour cette solution car cela augmente l'espace de stockage ==> acquisition vidéo oblige).
Auteur : Loup blanc
Réponse le : 26/02/2007 21:38
Message :
J'avais le souvenir que les RAID apparaissaient dans la gestion des disques mais c'est vrais que je faisais ça avec des disques SCSI
Comme c'est actuellement tu as acces aux données de ta partition perso ?
Auteur : pluton8_13
Réponse le : 26/02/2007 21:59
Message :
Et bien oui, je trouve etrange que windows accepte 5 partions principales, ou alors peut-être que c'est moi qui fait une confusion?
Auteur : AlkaSelzer
Réponse le : 26/02/2007 22:24
Message :
Bonjour .....si on peut dire :-)
Tout d'abord félicitation pour la richesse de ce topic et tout ce temps passé pour aider les autres.
Je rejoinds à mon tour le lot des déprimés du disque dur.....on ne le dira jamais : il y a de plus en plus d'êtres humains transformés en périphériques !
Donc voilà mon problème.
J’ai 2 disques dur Sata. 
Le premier, mon C, est un sata de 80go formaté en NTFS sur lequel était installé windows XP pro et les logiciels. 
Le second, mon D, était un sata de 320go contenant exclusivement des données, toutes mes données ! Tous deux sont en partition unique.
J’ai formaté mon C puis réinstallé windows et cette manipulation a eu des répercutions plus que surprenantes sur mon disque D : il est désormais inaccessible.
En fait il est reconnu, mais lorsque je clique dessus dans le poste de travail m’apparaît une fenêtre qui me demande de formater.
Lorsque je clique droit et sélectionne les propriétés de ce disque cela m’indique qu’il est en raw et non plus en NTFS puis il m’affiche une capacité de 128 Go au lieu de 320. 
Enfin, son espace utilisé est déclaré comme étant égale à 0. Pareil pour son espace disponible.

Indice surprenant : windows qui est sur le disque C refuse de démarrer lorsque je débranche mon disque D !
A la base j’ai probablement chopé et installé un virus. J’avais téléchargé un programme que j’ai stocké sur mon D puis en double-cliquant dessus pour aller l’installer sur C, l’icône a subitement disparue. J’ai fait un scan avec Norton et il m’a découvert un virus sur C. J’ai procédé au nettoyage mais j’ai eu une succession de phénomènes désagréables comme l’impossibilité d’écouter la radio sur le net (problème de windows média player), puis lenteur extrême sur toutes manip allant jusqu’à l’incapacité d’ouvrir l’explorateur windows. 
Les embrouilles se sont succédées : obligation de désinstaller firefox avec suppression manuelle des restes dans la base de registre, suppression de windows media player et impossibilité de le réinstaller. J’ai donc décidé de procéder à une « réparation » radicale par formatage du disque contenant le système.

Je ne sais trop par où commencer et pourtant j'ai passé la journée à parcourir ce site.
Jusqu’à présent je n’ai fait aucune manip « sérieuse » pour réparer parce que je ne sais pas précisément où se situe le problème (secteur défectueux, secteur boot, MBR …), je n’ai pas une compétence pointue pour ce genre de plantage et surtout je ne veux pas perdre mes données (6 années de travail graphique, de recherche, de photos, de documents administratifs …).
J’ai juste bêtement transformé ce disque désormais défectueux en « actif » en passant par « poste de travail » - « gérer » - « gestion des disques »…..j’espère ne pas avoir fait une boulette.
J’ai également essayé EasyRecovery mais il n’a même pas trouvé mon D défectueux, j’ai donc laissé tombé.
Je n’ai pas osé faire un chkdsk de peur d’effacer ou déplacer des données ou de fixmbr vu que mon soucis semble trouver ses origines premières dans la présence d’un virus.

Actuellement mon « D » défectueux est installé dans un boiter SATA et est branché en USB sur un autre ordinateur afin que je puisse au moins accéder au net.
Pour info, dans le gestionnaire des disques de cet autre ordi mon « D » (je continue à l’appeler « D », même s’il a changé de lettre en même temps que d’ordi) apparaît avec 128 go sain actif (puisque je l’ai mis en actif) et 170,09 go non alloué.

J'ai fait qq imprim-écrans (cliquables) des résultats fournis par PTEDIT et TESTDISK, les voici :
http://img440.imageshack.us/img440/2187/edit01il3.jpg" border="0" alt="" hspace="0" vspace="0" width="331" height="190" />


 
Après avoir fait "continuer" :

 
Résultat du "search" :

"MANDCHA" est le nom de mon DD. J'ai du mal à comprendre ce qui est au dessus.


Voilà.
Donc au regard des faits décrits et des résultats fournis par testDisk, sauriez-vous me dire ce qu'on peut diagnostiquer comme problèmes ?
Et par quoi puis-je ensuite commencer pour récupérer mon disque en prenant le moins de risque possible ?

Par avance merci, ..... je suis dans le même état que mon disque :-)
Auteur : romsk
Réponse le : 27/02/2007 00:21
Message :
pluton8_13 : c'est par disque dur que windows n'accepte pas plus de 4 partitions principales... mais si t'as 3 DD tu pourras trouver jusqu'à 12 partitions principales dans ta gestion des disques. Ce qui est très inhabituel dans ton cas, c'est les coordonnées CHS de début de partition (pour tes partitions internet et données) : normallement ça commence toujours à head 1 et secteur 1 (mais bon, si ça marche comme ça...)
salut  alkaselzer (), et bienvenue sur pcastuces (et merci pour ces explications complètes et copies d'écran) 
qques remarques pêle-mêle :
* comme quoi ça arrive aussi aux sata (certains en doutaient), (mais bon on s'en fout...)
* l'option virus pourquoi pas, mais autant on en parle souvent autant on les trouve jamais : c'est donc pas la 1ère hypothèse que je retiendrai. ceci dit, dans le doute, passe un coup d'anti-virus sur CD bootable (ou en ligne ?) qui soit capable d'analyser le secteur 0 du DD (et les suivants bien sûr...)
* quand t'as réinstallé XP, t'as bien remis SP1 ou SP2 ? en effet c'est une des causes les plus fréquentes des DD reconnus à seulement 130 Go...
* ce qui est très bizarre par contre c'est qu'en réinstallant C: sur ton 80 Go, tu ais besoin du 320 Go pour démarrer. ton bios est-il correctement paramétré (notamment ordre de boot) ? peut être une fausse manip lors de l'instal qui fait que des fichiers systèmes ont par erreur été installés à la racine de D: ? (genre boot.ini, ntdetect ou autre). tu n'aurais peut être pas eu ce problème si à l'instal d'XP tu avais temporairement débranché ton 320 Go
* ton D: était-il toujours et normallement accessible juste avant de réinstaller C: alors que tes problèmes sur C: étaient déjà là ?
* ça n'a aucune importance d'avoir transformé ton disque en actif (et c'est réversible très facilement)
* le chkdsk, par contre, tu n'y couperas peut être pas si windows te le demande (condition parfois sine qua none d'un retour à la normale) : dans le doute cependant tu peux toujours faire un clonage de ce DD avant de faire la manip (ou une image grâce à ddrescue sous linux), de manière à tout retrouver si le chkdsk t'effaçait trop de "segments de fichiers orphelins" (c'est le terme qu'emploie windows avant de te nr tes données)
* concernant tes copies d'écrans :
- y'a manifestement une corruption du descripteur de partition du mbr, voire du mbr lui même, car cette partition en fat16 a les coordonnées CHS du MBR (0 0 1), ce qui est évidemment impossible.
- cette histoire de geometry avec 16 têtes est à garder en mémoire, mais comme 255 est la config de loin la plus fréquente, je crois qu'il vaut mieux ne pas modifier la geometry pour l'instant
- ce que te retrouve proceed est déjà plus intéressant car on revient au CHS 0 1 1 et à du NTFS, mais c'est hélas ta partition de 128 Go qui n'est donc pas celle qu'on cherche.
- explique moi par contre ce qui se passe quand tu fais search.
en effet sur ce tableau au début de search on voit la partition qui nous intéresse :
 
mais sur celui qui suit on voit plus rien : 

est-ce que t'as interrompu le search ou est-ce qu'effectivement il n'y a rien ?

dans cette dernière hypothèse commence par faire un nouveau MBR par le menu MBRcode > puis tu retournes dans le menu analyse > proceed (+/- search) pour voir si tu retrouves maintenant ta partition "mandcha"...
Auteur : AlkaSelzer
Réponse le : 27/02/2007 02:13
Message :
* l'option virus pourquoi pas, mais autant on en parle souvent autant on les trouve jamais : c'est donc pas la 1ère hypothèse que je retiendrai. ceci dit, dans le doute, passe un coup d'anti-virus sur CD bootable (ou en ligne ?) qui soit capable d'analyser le secteur 0 du DD (et les suivants bien sûr...)
Arf, qu'c'est qu'c'est "anti-virus sur CD bootable"? Et comment sais-tu que l'anti-virus est capable d'analyser le secteur 0 du DD ?
* quand t'as réinstallé XP, t'as bien remis SP1 ou SP2 ? en effet c'est une des causes les plus fréquentes des DD reconnus à seulement 130 Go...
Non mais en ce moment mon 2ème ordi tourne sous SP2 et ça ne change rien à mon disque défectueux actuellement branché en USB externe : il désire toujours autant être formaté :-)
* ce qui est très bizarre par contre c'est qu'en réinstallant C: sur ton 80 Go, tu ais besoin du 320 Go pour démarrer. ton bios est-il correctement paramétré (notamment ordre de boot) ?
J'ai vérifié et tout était comme d'hab.
peut être une fausse manip lors de l'instal qui fait que des fichiers systèmes ont par erreur été installés à la racine de D: ? (genre boot.ini, ntdetect ou autre).
Et tu vérifies ça comment ?
tu n'aurais peut être pas eu ce problème si à l'instal d'XP tu avais temporairement débranché ton 320 Go
....si j'avais su qu'une chose si improbable était possible.....en tout cas la prochaine fois je rase tout ce qu'il y a autour !
* ton D: était-il toujours et normallement accessible juste avant de réinstaller C: alors que tes problèmes sur C: étaient déjà là ?
Oui
* le chkdsk, par contre, tu n'y couperas peut être pas si windows te le demande (condition parfois sine qua none d'un retour à la normale) : dans le doute cependant tu peux toujours faire un clonage de ce DD avant de faire la manip (ou une image grâce à ddrescue sous linux), de manière à tout retrouver si le chkdsk t'effaçait trop de "segments de fichiers orphelins" (c'est le terme qu'emploie windows avant de te nr tes données)
J'en déduis donc que le chkdsk fait le ménage a sa guise, mais tous les checkdisk sont-ils aussi craignos ? Il n'y a pas des manip qui permettraient de vérifier sans rien toucher?
* concernant tes copies d'écrans :
- y'a manifestement une corruption du descripteur de partition du mbr, voire du mbr lui même, car cette partition en fat16 a les coordonnées CHS du MBR (0 0 1), ce qui est évidemment impossible.
Si tu le dis....
Personnellement je n'y comprends rien :-) 
Comme tu le vois ça va promettre pour la suite !
- ce que te retrouve proceed est déjà plus intéressant car on revient au CHS 0 1 1 et à du NTFS, mais c'est hélas ta partition de 128 Go qui n'est donc pas celle qu'on cherche.
Cette affaire m'ennuie sérieusement : que peut bien fiche cette partition de 128 go sur mon disque !
Ce disque était à partition unique !! 
Aurais-tu une idée de cette apparition surprise? 

- explique moi par contre ce qui se passe quand tu fais search.
en effet sur ce tableau au début de search on voit la partition qui nous intéresse : mais sur celui qui suit on voit plus rien : est-ce que t'as interrompu le search ou est-ce qu'effectivement il n'y a rien ?
Non je n'ai rien interrompu, en revanche j'ai fait des manip en même temps sur mon ordi et notamment j'avais essayé d'utiliser PTEDIT qui n'a jamais voulu démarrer....ils sont jalous de leurs prérogatives ces logiciels et pas partageurs pour un cachou :-)
Penses-tu qu'il me faille recommencer l'opération avant d'aller dans MBRcode?
Et ensuite il sera possible de retrouver mon disque entier c'est-à-dire mon MANDCHA en 320 (disons 298 go) entier sans partition?
Question en plus avant d'aller se coucher : si je récupère la bête ce sera avec mes dossiers classés ou en explosion nucléaire ? :-)
Je vais faire le clonage demain avec les idées fraîches et puis on passera à l'étape suivante.
Merci pour ce bon début ;-)
Auteur : patrickguillard
Réponse le : 27/02/2007 07:30
Message :
Salut romsk et tous les nouveaux arrivants ...
Comme je te l'avais dit dans mon dernier post, HDD regenerator reconnaissait mon disque dur de 200GO, l'analyse commence en trouvant que des bad sectors , je l'ai laissé pendant 24 h non stop et il ne m'a analysé que 13 Mb ... 27806 sectors ... j'ai arrété car j'avais besoin de mon ordi... est-ce qu'il faut que j'attende 5 jours ... pourqu'il répare mon mbr ou je me résigne à l'amener dans un magasin de réparation informatique ?
a+
Auteur : pluton8_13
Réponse le : 27/02/2007 08:50
Message :
romsk a écrit :

pluton8_13 : c'est par disque dur que windows n'accepte pas plus de 4 partitions principales... mais si t'as 3 DD tu pourras trouver jusqu'à 12 partitions principales dans ta gestion des disques. Ce qui est très inhabituel dans ton cas, c'est les coordonnées CHS de début de partition (pour tes partitions internet et données) : normallement ça commence toujours à head 1 et secteur 1 (mais bon, si ça marche comme ça...)
Je vous ai fait une copie de ce qui ce passe sur le HDD1 où est installé W2k, le problème des coordonnées CHS semble identique si j'ai tout compris.
Alors question: faut-il rectifier par un "fixmbr" ou autre, ou je ne touche plus à rien vu que cela fonctionne?
(ps: c'est un gros virus qui m'a foutu le b****l, localisé entre la chaise et le clavier... si vous voyez ce que je veux dire)

Auteur : romsk
Réponse le : 27/02/2007 14:51
Message :
patrick : laisse tomber hdd-regenerator et essaye de modifier la géométrie (finalement t'as raison, il faut explorer cette piste faute de mieux) : va dans le menu geometry > à cylinder met 24322 > done ou write > menu analyse > proceed (+/- search) : te retrouve t'il la partition ?
pluton : non, ça va mieux au niveau des coordonnées CHS (on aurait attendu 956 1 1 pour data, mais j'ai déjà vu 956 0 1 pour une partition principale...). Si tout fonctionne bien laisse en l'état, mais fait quand même un chkdsk de ce DD et une vérification avec le logiciel constructeur et hd-tune. (NB : il te reste 20 à 22 Go non alloués sur ce DD)
alkaselzer : 
* qu'c'est qu'c'est "anti-virus sur CD bootable"? tu en trouveras par exemple sur UBCD --> http://www.gpcservices.com/ultimatebootcd/
* tous les checkdisk sont-ils aussi craignos ? Il n'y a pas des manip qui permettraient de vérifier sans rien toucher? non (à part faire l'essai sur une copie faite avec ddrescue par exemple...)
* que peut bien fiche cette partition de 128 go sur mon disque ! Aurais-tu une idée de cette apparition surprise? sans importance (les mystères de l'informatique...)
* Penses-tu qu'il me faille recommencer search avant d'aller dans MBRcode? oui, sans rien faire d'autre sur l'ordi pendant ce temps...
* Et ensuite il sera possible de retrouver mon disque entier c'est-à-dire mon MANDCHA en 320 (disons 298 go) entier sans partition? c'est le but, mais par étapes...
* si je récupère la bête ce sera avec mes dossiers classés : tout normal en théorie
Auteur : patrickguillard
Réponse le : 28/02/2007 13:57
Message :
salut romsk
jai essayé de retrouvé ma partition en marquant 24322
mais "partition not found...."
???
a+ patrick
Auteur : romsk
Réponse le : 28/02/2007 17:14
Message :
maintenant que t'as mis 24322, réessaye un "mbrcode", et si ça marche pas réessaye de recréer la partition comme tu l'avais fait plus haut (vérifie à chaque fois que ce soit bien marqué 24322 255 63 en haut...)
Auteur : patrickguillard
Réponse le : 28/02/2007 18:08
Message :
j'ai essayé de recréer un mbr code : impossible
et lorsque je recréer une partition tout va bien mais write impossible...
Auteur : romsk
Réponse le : 28/02/2007 19:00
Message :
c'est mal barré... essaye à tout hasard, dans le menu geometry, de tester successivement head 240 puis 16 en regardant à chaque fois si t'arrives enfin à créer un mbr ou à voir ta partition dans proceed, mais j'y crois pas...
tu disais que Gparted le voyait quand il était branché en USB : essaye de booter à nouveau sur slax-lfi linux --> si par chance ce DD était enfin reconnu, on pourrait le copier en intégralité avec ddrescue en ignorant le mbr qu'on pourrait très bien reconstruire par la suite sur le nouveau DD...
Auteur : nobumasashi
Réponse le : 02/03/2007 12:07
Message :
Bonjour à tous,
Comme je vois qu'il y a des experts ici, je m'en remets à vous pour essayer de résoudre mon problème.
J'ai fait l'acquisition d'une nouvelle carte mère (ASRock 775Dual-VSTA) et d'un nouveau processeur (Pentium D 925)

J'ai donc pu récupérer ma RAM, ma Carte Graphique, et mes deux disques durs IDE (norme 133).
L'un fait 320 Go, partitionné en 5; l'autre fait 120 Go, partitionné en 2.

Je vais les appelé respectivement DD1 et DD2 pour plus de facilité.

Niveau montage, tout à l'air OK, par contre, c'est à l'installation d'Xp que ca pose problème. 
Les partitions de DD2 sont reconnues, par contre, celles de DD1 ne le sont pas.

Plus clairement, sur la page d'installation d'XP SP2 (ou je devrais avoir toutes mes partitions, les deux disques durs confondus) je ne vois que les partitions de DD2, DD1 n'étant reconnu que comme un unique disque, qui plus est de 180 Go au lieu de 320...
Erreur de ma part, je n'ai pas percuté la situation sur l'instant et j'ai commandé un formatage pour une nouvelle installation sur cette partition.
Bizarement (ou heureusement), le formatage ne s'est pas executé.

J'ai finalement pris un autre disque dur de secours, sur lequel j'ai (encore) réinstallé XP, pour pouvoir testé DD1. 
Le disque dur est reconnu par l'ordinateur (via boitier USB, ou branché en IDE en mode SLAVE; j'ai testé les 2 méthodes), mais rien ne s'affiche dans l'explorer.
Sous le logiciel partition magic, le disque est reconnu comme vide (sans partitions, non formaté)

Sous vos conseils, j'ai essayé d'utilisé Testdisk, mais je dois avouer que je ne comprends pas tout..@_@.
J'ai fait une analyse de DD1 (branché sur un boitier USB) et voila ce que j'obtiens : 
Pourquoi je ne sais pas, mais seules 4 partitions sur 5 sont visibles...Celle qui a disparu était celle de démarrage, la ou XP était installé, mais cette partition m'importe peu.
Au final, mes partitions sont-elles récupérables ? Que dois-je faire ? (Plus trop envie de faire des erreurs, je préfères demander maintenant..c'est la 1ère notion aprés tout )
Merci d'avance !
Auteur : romsk
Réponse le : 02/03/2007 13:35
Message :
salut nobumasashi,
déjà tes 4 partitions ont de bonnes coordonnées CHS et le DD semble bien reconnu : c'est déjà ça...
sur le tableau que tu montres, fais "entrée" > puis proceed : copie d'écran
Auteur : nobumasashi
Réponse le : 02/03/2007 14:18
Message :
Hum, je pense pas m'etre trompé, mais lorsque, depuis le tableau que j'ai montré, j'appuie sur "Entrée", j'obtiens ca : 
Je n'ai donc le choix qu'entre "Quit", "Search!", "Write" et "Extd Part"
Pour arriver au tableau de mon post précédent j'ai exactement fait :
Select media (donc DD1) > Proceed > Intel > Analyse > proceed...
Dans tout les cas, heureux d'apprendre ton bon diagnostic, tout le semble pas etre perdu 
Auteur : romsk
Réponse le : 02/03/2007 19:22
Message :
ben alors fait search...
Auteur : nobumasashi
Réponse le : 02/03/2007 20:16
Message :
Voila ce que j'ai aprés avoir fait "search!" :

si j'ai bien compris, le programme a réussi à retrouvé ma partition disparue (les tailles correspondent)
maintenant, j'aimerais savoir ce que j'ai à faire svp..
Auteur : romsk
Réponse le : 02/03/2007 21:34
Message :

t'as 12 lignes : une * et 11 D (deleted) --> il va falloir en laisser certaines en D et mettre d'autres en L :
- laisse la 1ère en *
- met la 2ème en L en utilisant les fleches droite gauche (la 1ère backup3)
- laisse la 3ème en D
- met la 4ème en L (MOI2)
- laisse la 5ème en D
- met la 6ème en L (MOI1)
- laisse 7ème et 8ème en D
- met la 9ème en L (backup4)
- laisse les 3 dernières en D
quand t'as tout fait, clique sur entrée > write > menu advanced > va sur la ligne * > boot : et vérifie que BS et backupBS sont OK et identique > et tu fais la même chose sur les 4 partitions L : si t'as un doute fais des copies d'écran (à ce stade ne ferme pas encore testdisk)
Auteur : pcjcg
Réponse le : 03/03/2007 00:39
Message :
Bonsoir,Tout astucien doit savoir utiliser Testdisk : je vais essayer de rattraper mon retard. J'avais une question derrière la tête : est-il facile de modifier la taille d'une partition avec ce logiciel?La question qu'il convient de poser est cependant: pourquoi ce diagnostic intermédiaire (mis en couleur marron) pour le disque interne, où le programme semble indiquer qu'il y a quelque chose de bizarre : le disque serait trop petit. S'il faut faire quelque chose, ne pas hésiter à être simple... Deux sous-questions : quand la commande log est-elle utile? et comment fait-on pour revenir au début d'une séquence d'analyse sans stopper le programme et le relancer?
Voici les données des deux disques durs qui résultent de cinq vues données en résultats par le logiciel, vues juxtaposées après cinq opérations (sélection, copier, coller)Merci1er disque dur (interne)TestDisk 6.6, Data Recovery Utility, February 2007 Christophe GRENIER grenier@cgsecurity.org http://www.cgsecurity.orgDisk /dev/sda - 79 GB / 74 GiB - CHS 9726 255 63Current partition structure: Partition Start End Size in secto 1 P Dell Utility 0 1 1 1 254 63 32067 2 * HPFS - NTFS 2 0 1 6795 254 63 109145610 3 E extended 6796 0 1 9725 254 63 47070450 5 L HPFS - NTFS 6796 1 7 9725 254 63 47070381 --TestDisk 6.6, Data Recovery Utility, February 2007 Christophe GRENIER grenier@cgsecurity.org http://www.cgsecurity.orgDisk /dev/sda - 79 GB / 74 GiB - CHS 9726 255 63The harddisk (79 GB / 74 GiB) seems too small! (< 111 GB / 104 GiB)Check the harddisk size: HD jumpers settings, BIOS detection...The following partition can't be recovered: Partition Start End Size in sectorsD HPFS - NTFS 6795 254 63 13589 254 61 109145609[ Continue ] NTFS, 55 GB / 52 GiB TestDisk 6.6, Data Recovery Utility, February 2007 Christophe GRENIER grenier@cgsecurity.org http://www.cgsecurity.orgDisk /dev/sda - 79 GB / 74 GiB - CHS 9726 255 63 Partition Start End Size in sectors* FAT16 <32M 0 1 1 1 254 63 32067 [DellUtility]P HPFS - NTFS 2 0 1 6795 254 63 109145610L HPFS - NTFS 6796 1 7 9725 254 63 47070381Structure: Ok. Use Up/Down Arrow keys to select partition.Use Left/Right Arrow keys to CHANGE partition characteristics:*=Primary bootable P=Primary L=Logical E=Extended D=DeletedKeys A: add partition, L: load backup, T: change type, P: list files, Enter: to continue 2e disque dur(externe)================================ Disk /dev/sdb - 160 GB / 149 GiB - CHS 19457 255 63Current partition structure: Partition Start End Size in sectors 2 E extended 1 0 1 19456 254 63 312560640No partition is bootable 5 L HPFS - NTFS 1 1 2 10444 254 63 167782796 [pourimages] X extended 10445 0 1 19456 254 63 144777780 6 L HPFS - NTFS 10445 1 5 19456 254 63 144777713 [pourdonnées]
Disk /dev/sdb - 160 GB / 149 GiB - CHS 19457 255 63 Partition Start End Size in sectorsL HPFS - NTFS 1 1 2 10444 254 63 167782796 [pourimages]L HPFS - NTFS 10445 1 5 19456 254 63 144777713 [pourdonnées] -----------------------------------------------------------------------------------------------------------
Auteur : romsk
Réponse le : 03/03/2007 08:30
Message :
...facile de modifier la taille d'une partition avec ce logiciel ? : facile non, faisable oui, mais testdisk n'est pas fait pour ça (la gestion des disques d'XP et surtout partition magique ou Gparted sont infiniment plus pratiques)
...pourquoi ce diagnostic intermédiaire marron pour le disque interne... : c'est pour réveiller l'utilisateur. sur cet écran, testdisk t'a retrouvé une partition (D) qui termine au CHS 13589 254 63 alors que le DD se termine à 9726 255 63 : donc testdisk te signale que ton DD semble trop petit par rapport à la partition retrouvée, et te suggère 2 ou 3 trucs à vérifier.
la commande log sert à transmettre à C Grenier un résumé de ce que montre testdisk lorsqu'on a besoin de son aide
et pour revenir au début d'une séquence d'analyse sans stopper testdisk, il suffit de faire "quit" et on se retrouve sur l'écran précédent à chaque fois.
question subsidiaire : quel est ton problème ? 
Auteur : joaopa
Réponse le : 03/03/2007 13:38
Message :
Bonjour a tous, comme la majorite des personnes de ce forums, j ai plante mon disque dur.
Sur mon disque dur, il y a un dual boot windows XP et Linux. Incroyable mais vrai, je n'arrive plus a booter sur les deux OS. Testdisk me dit qu'il y a un probleme de geometrie. Si un expert passe par la, pourrait\il m aider a retrouver mes donnees?
Merci d'avance
Joaopa
PS: J ai place mon disque dur dans une boite USB et je le teste sur un autre PC
PS2: Comment fait on pour attacher des screenshots? 
Auteur : romsk
Réponse le : 03/03/2007 14:03
Message :
salut joaopa,
pour les captures d'écran voir ICI le paragraphe 7 : pi fais la capture d'écran de ce que montre testdisk > menu analyse > proceed
Auteur : joaopa
Réponse le : 03/03/2007 14:34
Message :
Voici les screenshots demandes
 

Merci de vous occuper de mon enorme probleme
Joaopa
Auteur : romsk
Réponse le : 03/03/2007 14:53
Message :
t'avais bien 1 partition XP et 3 partitions linux ? si c'est le cas t'as effectivement un problème de geometrie
donc va dans le menu geometry > à cylinder met 9730 > done > retourne dans le menu analyse > proceed : copie d'écran
Auteur : joaopa
Réponse le : 03/03/2007 14:59
Message :
Voici la copie d'ecran
 
Joaopa
Auteur : nobumasashi
Réponse le : 03/03/2007 15:06
Message :
Bonjour,
Me revoila avec mon problème.....:p
Une fois que j'ai fait les changements de "D" en "L", j'ai fait comme dit "write" et voila ce que j'obtiens :

J'ai des doutes, quelle est la différence entre "Rebuild BS" et "Dump" ? Que faire finalement ?
Auteur : romsk
Réponse le : 03/03/2007 15:48
Message :
joaopa : ça a l'air bon --> sans quitter testdisk, va dans le menu advanced > met toi sur ta 1ère partition > boot : vérifie que BS et backup BS sont tous les 2 OK et identiques > et fais de même sur chaque partition linux : si t'as un doute ou un problème fais copie d'écran
nobumasashi : fais "backup BS" > write > et vérifie tes autres partitions de la même manière
Auteur : pcjcg
Réponse le : 03/03/2007 16:14
Message :
Merci Romsk,
Je n'ai pas de problème si ce n'est que les problèmes ne sont pas réservés aux autres, donc je voulais voir comment fonctionne ce logiciel.
Par ailleurs, incidemment, un assembleur m'avait glissé dans l'oreille qu'il arrivait que le type de disque dur que j'avais n'était pas sans connaître des déboires chez d'autres. De là, à me préparer à des grandes manoeuvres il n'y avait qu'à pas à franchir. Je n'aurais eu aucune excuse de ne pas plonger dans un dossier aussi conseillé et lu. Faut-il donc que je continue et vérifie les deux choses signalées?
Au revoir
Auteur : romsk
Réponse le : 03/03/2007 17:03
Message :
ta curiosité est une qualité...
Faut-il donc que je continue et vérifie les deux choses signalées? : continuer à lire mes sujets : oui (), mais vérifier les problèmes signalés par testdisk ? non si t'as aucun problème...
par contre, si j'avais un conseil à donner (ou deux), c'est de faire des chkdsk réguliers des disques et surtout sauvegarder MBR et secteurs de boot avec edithexa...
Auteur : joaopa
Réponse le : 04/03/2007 11:04
Message :
Romsk, t'es un dieu. Grace a toi, j'ai recuperer mes donnees. Je suis en trian de te couler une statue dans mon garage.
Merci pour tout.
Joaopa
Auteur : nobumasashi
Réponse le : 04/03/2007 17:03
Message :
Même chose que Jaopa, un grand merci à toi Romsk ! J'ai finalement pu récupérer toutes mes données intactes ! 
Auteur : romsk
Réponse le : 04/03/2007 18:07
Message :
 bravo à tous les 2 et content pour vous (et envoyez vos dons à C. Grenier )
Auteur : patrickguillard
Réponse le : 07/03/2007 15:26
Message :
salut à tous....
bravo a ce qui récupère leurs données...
salut romsk
j'ai essayé à nouveau avec gparted... il voit mon disque mais il est non reconnu , impossible de réécrire dessus ...
est-ce qu'il ya encore des possibilités , car j'ai l'impression que l'ont a tout essayé... test disk, hdd regenator, linux,...
j'hésite à l'amener dans un magasin pour qu'il le répare mais ça risque de me couter super cher.... sachant qu'à l'intérieur j'ai 2 mémoires d'examen, pleins d etruc du boulot,....
merci encore...
a+
patrick
Auteur : patrickguillard
Réponse le : 08/03/2007 14:42
Message :
Bonjour,
je viens d'amener mon dd externe chez un réparateur et il m'a dit que mes plateaux étaient défectueux qu'il était impossible pour lui de récupérer les données. A moins de l'envoyer à des sociétés mais qui prennent entre 700 et 1000€ et que la récupération n'était pas sur du tout...
a+
patrick
Auteur : romsk
Réponse le : 09/03/2007 23:00
Message :
yo patrick, je vois que t'as de la suite dans les idées... c'est bien.
il est manifestement impossible de réécrire les 1er secteurs de ce DD qui est peut être bien effectivement matériellement défectueux. la seule solution serait de pouvoir recopier ce qui est lisible sur ce DD, et outre les logiciels de récup (lesquels as-tu essayés ?), je crois que ça vaut le coup de retenter une copie par ddrescue sous linux (dans ma signature) en le laissant d'abord en externe, puis le réessayer en interne si slax-lfi ne le reconnait pas en externe, et si ça donne rien essaye de voir si tu peux faire une image de ce DD avec ghost ou autre logiciel de clonage, car si tu peux faire cette image on pourra probablement retrouver tes données en mettant cette image sur un DD neuf et en bidouillant MBR et secteur de boot...
Auteur : patrickguillard
Réponse le : 10/03/2007 12:41
Message :
salut romsk
je ne désespère pas et ce que j'aime bien chez toi c'est que tu positive toujours ;-)
je vaius essayer de récuperer mes données avec ddrescue...
parce que j'ai été sous d'autre forum qui dise de mettre le DD au congélateur pendant une nuit et op sa remarche on peut récupérer ses données ...mdr
ciao
patrick
Auteur : romsk
Réponse le : 10/03/2007 12:50
Message :
patrickguillard a écrit :

...mettre le DD au congélateur pendant une nuit et op sa remarche on peut récupérer ses données ...
ne rit pas trop  : le froid, en contractant le métal, peut effectivement marcher dans certains cas de pannes matérielles (ça coûte rien d'essayer si rien d'autre ne marche, en faisant gaffe que ton DD soit froid quand tu le mets au congélo et de bien hermétiser ton DD dans un sac plastique étanche pour éviter les problèmes de condensation)
Auteur : yeagermach1
Réponse le : 12/03/2007 12:00
Message :
Bonjour
J'ai un probleme similaire a celui de joaopa a la nuance pres que toutes mes partitions sont en NTFS.
Le log de testdisk me dit cela :
Mon Mar 12 11:24:49 2007
Command line: TestDisk

TestDisk 6.6, Data Recovery Utility, February 2007
Christophe GRENIER <grenier@cgsecurity.org>
http://www.cgsecurity.org
Windows version (ext2fs lib: 1.39, ntfs lib: 9:0:0, reiserfs lib: 0.3.1-rc8, ewf lib: 20070114)
Using locale 'C'.
file_read(4,1,buffer,586112687(581460/15/63)) seek err Invalid argument
file_read(5,1,buffer,390731039(25841/239/63)) seek err Invalid argument
file_read(6,1,buffer,390719951(387618/15/63)) seek err Invalid argument
file_read(7,1,buffer,488408129(30401/254/63)) seek err Invalid argument
Hard disk list
Disk /dev/sda - 300 GB / 279 GiB - CHS 581460 16 63, sector size=512
Disk /dev/sdb - 200 GB / 186 GiB - CHS 25841 240 63, sector size=512
Disk /dev/sdc - 200 GB / 186 GiB - CHS 387618 16 63, sector size=512
Disk /dev/sdd - 250 GB / 232 GiB - CHS 30401 255 63, sector size=512
Drive J: - 8396 MB / 8008 MiB - CHS 2002 64 32, sector size=2048
Drive K: - 2000 MB / 1908 MiB - CHS 477 64 32, sector size=2048

Disk /dev/sdd - 250 GB / 232 GiB
Partition table type: Intel

Analyse Disk /dev/sdd - 250 GB / 232 GiB - CHS 30401 255 63
Geometry from i386 MBR: head=255 sector=63
NTFS at 12748/60/1
heads/cylinder 16 (NTFS) != 255 (HD)
Info: size boot_sector 102399696, partition 102410595
get_geometry_from_list_part_aux head=8 nbr=1
get_geometry_from_list_part_aux head=16 nbr=1
get_geometry_from_list_part_aux head=240 nbr=1
Current partition structure:
1 E extended LBA 12748 59 1 19122 254 63 102410658
No partition is bootable
Warning: Incorrect number of heads/cylinder 16 (NTFS) != 255 (HD)
5 L HPFS - NTFS 12748 60 1 19122 254 63 102410595 [Caamas]

search_part()
Disk /dev/sdd - 250 GB / 232 GiB - CHS 30401 255 63
NTFS at 0/1/1
heads/cylinder 16 (NTFS) != 255 (HD)
filesystem size 204800337
sectors_per_cluster 8
mft_lcn 786432
mftmirr_lcn 12800021
clusters_per_mft_record -10
clusters_per_index_record 1
D HPFS - NTFS 0 1 1 12748 59 63 204800337 [Bastion]
NTFS, 104 GB / 97 GiB
NTFS at 12748/60/1
heads/cylinder 16 (NTFS) != 255 (HD)
filesystem size 102399696
sectors_per_cluster 8
mft_lcn 786432
mftmirr_lcn 6399980
clusters_per_mft_record -10
clusters_per_index_record 1
D HPFS - NTFS 12748 60 1 19122 81 63 102399696 [Caamas]
NTFS, 52 GB / 48 GiB
NTFS at 19122/82/1
heads/cylinder 16 (NTFS) != 255 (HD)
filesystem size 181194048
sectors_per_cluster 8
mft_lcn 786432
mftmirr_lcn 11324627
clusters_per_mft_record -10
clusters_per_index_record 1
D HPFS - NTFS 19122 82 1 30401 32 63 181194048 [NABOO]
NTFS, 92 GB / 86 GiB
This partition ends after the disk limits. (start=307200096, size=181194048, end=488394143, disk end=488392065)
Disk /dev/sdd - 250 GB / 232 GiB - CHS 30401 255 63
Check the harddisk size: HD jumpers settings, BIOS detection...
The harddisk (250 GB / 232 GiB) seems too small! (< 250 GB / 232 GiB)
The following partition can't be recovered:
D HPFS - NTFS 19122 82 1 30401 32 63 181194048 [NABOO]
NTFS, 92 GB / 86 GiB
J'ai reussi a lire (une a la fois) les deux autres partitions Caamas et Bastion. Mais je ne comprend pas l'erreur de NABOO. Dans le cas de joaopa, un changement de geometrie a resolue (a premiere vue) le probleme. Mais je ne vois pas comment l'appliquer a mon cas.
Merci d'avance de votre aide.
Auteur : romsk
Réponse le : 12/03/2007 12:41
Message :
salut yeagermach1,
désolé, mais c'est trop chiant à lire les log : pourrais-tu faire une (ou des) copies d'écran de analyse > proceed > +/- search
Auteur : yeagermach1
Réponse le : 12/03/2007 12:55
Message :
voila les images demandees:

 
Merci d'avance pour votre aide.
edit:meme message mais photos plus grandes.
Auteur : romsk
Réponse le : 12/03/2007 14:19
Message :
on a l'impression qu'il y a peut être 2 problèmes de geometry : 1) le 30401 qui semble trop petit, 2) le 255 que testdisk souhaiterait voir en 16.
sachant qu'en modifiant l'un ça peut arranger l'autre, et vu les coordonnées CHS qui ne sont pas habituelles, je pense qu'il faut d'abord changer le 255 : donc va dans le menu geometry > à head met 16 au lieu de 255 > done : entrée > menu analyse > proceed : copie d'écran (et laisse testdisk ouvert)
Auteur : yeagermach1
Réponse le : 12/03/2007 23:32
Message :
Merci pour ce debut de solution.
J'ai effectue la modification demande. Et la partition n'est toujours pas "recovered".
Voila la capture de ce que j'obtiens apres analyse:

Auteur : romsk
Réponse le : 13/03/2007 00:32
Message :
retourne maintenant dans le menu geometry, et à cylinder met 484518 > done > menu analyse > proceed : copie d'écran (ne ferme toujours pas tesdisk à ce stade sinon il faudrait tout recommencer, mais à demain quand même...)
Auteur : yeagermach1
Réponse le : 13/03/2007 00:56
Message :
Voila ce que cela donne

Et merci encore pour le temps que tu me consacre.
Auteur : romsk
Réponse le : 13/03/2007 07:06
Message :
ça a l'air bon, notamment les coordonnées CHS.
sur le tableau que tu montres fais entrée > save ou write > va dans le menu advanced > met toi sur la 1ère ligne > boot (: copie d'écran si doute), et fais pareil pour les 2 autres lignes : si les BS et backup BS sont OK et identiques pour chaque ligne, alors tu peux fermer testdisk, éteindre puis redémarrer le PC et aller voir si t'accèdes à tes données
Auteur : meave
Réponse le : 13/03/2007 07:07
Message :
up
Auteur : yeagermach1
Réponse le : 13/03/2007 10:59
Message :
Ok merci a toi. Donnees entierement recuperees (transfere sur un autre disque et formatage complet de celui, on est jamais assez prudent).
Auteur : romsk
Réponse le : 13/03/2007 12:35
Message :

Auteur : Franzzzz
Réponse le : 13/03/2007 15:22
Message :
Bonjour,
Je fais appel à votre aide pour récupérer une partition qui contient des données importantes.
En manipulant mes partitions avec Gparted, j'ai tenté un redimensionnement d'une partition FAT32. Gparted me disait que l'opération était réussie, mais en redémarrant sous Windows et sous Ubuntu, aucun des deux systèmes de la voyait plus. Windows me disait qu'elle n'était pas formatée et Ubuntu la voyait vide avec un point d'exclamation qui ne disait rien de bon.
J'ai d'abord exploré Testdisk tout seul et la seule opération que j'ai faite était de reconstruire le Boot sector. J'ai accepté les modifications car en listant les fichiers, j'y ai reconnu quelques noms qui étaient valides. En redémarrant Windows, il a pris un long temps à travailler avant de démarrer Windows, et j'espère qu'il n'a pas tout foutu en l'air (j'ai lu dans le forum que quelqu'un avait eu le même cas et il me semble que c'était mauvais signe).
Maintenant, Windows voit la partition mais les quelques fichiers qui portent le bon nom (une vingtaine sur plusieurs milliers) ne sont pas valides et tout le reste est sous la forme .CHK.

J'espère vraiment que cette opération de rebuild boot sector ne m'a pas été fatale car j'avais lu la doc (celle du manuel de Testdisk du moins, pas celle de ce forum) et il ne me semblait pas avoir lu que cette opération pourrait rendre la partition difficilement récupérable.
La question est maintenant de savoir si je peux encore tenter quelque chose sous Testdisk (dites moi oui, svp ;-) ? Ou faut-il se tourner vers un autre programme?
Toujours est-il que maintenant, voilà ce que j'obtiens sous Testdisk :
Après une analyse : 

 
Menu Advanced

Menu Rebuild BS

Après Abort

Un grand merci d'avance...
Franzzzz
Auteur : wielki
Réponse le : 13/03/2007 21:02
Message :
Bonsoir, j'ai eu connaissance du topic depuis un autre forum qui n'a pa pu m'aider, peut etre vous pourriez m'aider ?
Voici la situation :
J'ai eu une coupure de courant chez moi alors que le PC lisait des médias. Au redemarrage du PC, mes 2 disques durs sont toujours affichés dans le bios. Le disque principal fonctionne (Windows et tous les programmes, logiciels ..), mais le second disque dur partitionné en 3 est dit "endommagé et illisible" par Windows, les noms de mes partitions ont disparus et les lettres ont changés. Je reinstalle windows, toujours le même message, je lance Ultimate Boot CD avec tous ses programmes de diagnostique et ils m'indiquent tous que tous va bien (0x00). J'ai donc sous windows executé chkdsk /f /r comme on m'a conseillé dans un forum mais aucun effet. On m'a donné le lien de ce topic, j'ai executé TestDisk qui me dit que Boot Sector:OK Backup Boot sector: OK pour les 3 partitions et un message à la fin "A valid NTFS Boot sector must be present in order to access any data; even if the partition is not bootable."
Que dois je faire svp ?
Merci
Auteur : romsk
Réponse le : 13/03/2007 23:11
Message :
franzzz : hélas tes copies d'écran ne passent pas (héberge les sur imageshack ?)
wielki : peux-tu faire une copie d'écran de ce que montre la gestion des disques, ptedit (partitions disparues dans ma signature) et testdisk (menu analyse > proceed)
Auteur : wielki
Réponse le : 14/03/2007 00:11
Message :
 
 
Il me semble qu'il m'arrive un cas similaire à celui de shawarma le 11/11/2006 et ça me deprime d'avoir tous perdu :(  
J'ai pas envie de formater mes partitions, pourquoi tous les programmes disent que ça va alors que ça va pas. J'ai effectué chkdsk mais il n'a rien fait il a abandonné et test disk me signal "Can't open the files system" lorsque j'essai "list"
Auteur : romsk
Réponse le : 14/03/2007 00:24
Message :
ta 1ère partition est apparemment fausse (les coordonnées CHS ne collent pas à la suivante) : fais entrée > search : copie d'écran
Auteur : wielki
Réponse le : 14/03/2007 12:36
Message :

Comme tu m'a demandé sauf que je comprend rien à ces chiffres ni cette 4ème partition
Auteur : romsk
Réponse le : 14/03/2007 13:42
Message :
laisse la 1ère ligne telle quelle > met toi sur la 2ème ligne : fleche droite gauche pour la mettre en "*" > met toi sur la 3ème ligne : fleche droite gauche pour la mettre en "P" > laisse la 4ème ligne telle quelle > puis tu fais entrée > write > va dans le menu advanced > met toi sur la 1ère ligne (qui devrait être la 2ème de ce tableau) > boot : copie d'écran > et tu fais la même chose pour les 2 autres lignes (boot : copie d'écran)
Auteur : wielki
Réponse le : 14/03/2007 21:21
Message :



Le message est toujours identique, je commence à ne plus rien comprendre sur les disques  
Auteur : romsk
Réponse le : 14/03/2007 21:57
Message :
ce message est normal, il apparait toujours même si le secteur de boot est bon : donc n'en tiens pas compte...
ce qui est important c'est de voir que BS et backup BS sont OK et identiques, ce qui est le cas pour tes 3 partitions : donc ferme testdisk > éteint et redémarre ton PC et va voir si tes données sont accessibles...
Auteur : wielki
Réponse le : 14/03/2007 21:58
Message :
Lorsqu'on effectue "list" après le "boot" pour les 3 partitions il y a toujours ce même message :

Auteur : wielki
Réponse le : 14/03/2007 22:05
Message :
Ouinn, toujours le même message de la part de Windows pour les 3 partitions : Le Fichier ou le repertoire est endommagé et illisible  
Y a plus d'espoir, un disque qui n'a que 2 ans et qui me lache comme ça ... avec toutes mes thèses, mes dessins techniques, mes photos .....
Auteur : wielki
Réponse le : 14/03/2007 22:10
Message :
Merci Romsk d'avoir passé du temps sur mon cas et tenté de sauver mes données, il me reste plus qu'a essayer de recuperer avec je ne sais quel logiciel de recuperation ou alors il faudra que je me retape tous mes beaux écrits que j'ai heureusement imprimés ouinn 
Auteur : romsk
Réponse le : 14/03/2007 22:27
Message :

quand tu es sur ce tableau, fais "list" pour voir si tu retrouves tes fichiers (ce sera déjà bon signe), et tente "repair MFT" à nouveau.
si ça donne rien je crois effectivement qu'il n'y a pas beaucoup d'autre solution que de tenter un logiciel de récupération (certains gratuits, d'autres payants), ou une récup de tes données sous linux en mode graphique (voir dans ma signature).
PS : as-tu tenté un chkdsk /F /R ? testé ton DD avec hd-tune et le logiciel constructeur
Auteur : wielki
Réponse le : 14/03/2007 23:21
Message :
Files system endommagé ...
Oui j'ai effectué chkdsk /f /r et utilisé le logiciel constructeur il me reste à tester avec hd-tune comme tu me propose et après jouer au freezbee avec le DD 
Un grand merci à toi pour tes conseils et bon courage pour la suite ...
Auteur : romsk
Réponse le : 14/03/2007 23:26
Message :
romsk a écrit :

...tenter un logiciel de récupération (certains gratuits, d'autres payants), ou une récup de tes données sous linux en mode graphique (voir dans ma signature)...
ne baisse pas les bras comme ça, les logiciels de récupération font souvent des miracles...
Auteur : jimcarre2001
Réponse le : 16/03/2007 22:20
Message :
Salut tout le monde ! voila, mon pc a crashé, et mon deuxieme disque dur ne voyait plus aucune partition. J'ai utilisé testdisk, et j'ai recupere les partitions , sauf la 1ere. Voici le resultat de testdisk : [URL=http://img1.easysharing.fr/view.php?image=403621_16032007_HC1.JPG][IMG]http://img1.easysharing.fr/data/vignettes/16_03_2007/403621_16032007_HC1.JPG[/IMG][/URL]
A priori, il manque un bout entre la 1ere et la 2eme partoche ? A partir de la 2eme c'est nickel. Si quelqu'un peut me conseiller, avant que je fasse une connerie ... Merci d'avance.
[URL=http://www.easysharing.fr][IMG]http://img1.easysharing.fr/data/images/16_03_2007/403621_16032007_HC1.JPG[/IMG][/URL]
[url=http://www.easysharing.fr][img=http://img1.easysharing.fr/data/images/16_03_2007/403621_16032007_HC1.JPG][/url]
romsk 17/03/2007 09:39 Auteur :
Réponse le :
Message :
salut jimcarre2001,
est-ce que tu as fait search ? éventuellement 2 ou 3 fois de suite ? si ça donne rien on recréera la partition en partant du principe qu'elle doit coller à la suivante... (fais des copies de tout l'écran de testdisk STP)
jimcarre2001 17/03/2007 11:11 Auteur :
Réponse le :
Message :
Alors, voila le resultat de search : il voit bien ma partition qui s'appelle donnees :
[URL=http://www.easysharing.fr][IMG]http://img1.easysharing.fr/data/images/17_03_2007/241807_17032007_HC2.JPG[/IMG][/URL]
En fait, j'avais 6 partitions dans l'ordre : Donnees, MP3, Avi, Sauvegardes, Rip et XP Work. Il les voit toutes, mais la 1ere MP3 et Données sont vues Deleted. Or je pense que Données était tout au début du disque. Il n'y a pas moyen de copier cette partition deleted sur un autre disque ? Pour vérifier ?
romsk 17/03/2007 11:37 Auteur :
Réponse le :
Message :
il faut changer le statut de certaines lignes en se mettant dessus et en utilisant les fleches droite gauche :- met la ligne 2 en "*" et les lignes 6 et 8 en "L"- laisse les lignes 1, 7 et 9 en "D", et les lignes 3, 4 et 5 en "L"puis fait entrée > write > menu advanced > met toi sur la 1ère ligne > boot : vérifie que BS et backupBS soient bien OK et identiques > ferme testdisk > éteint et redémarre le PC et voir si t'accèdes à tes données


jimcarre2001 17/03/2007 12:27 Auteur :
Réponse le :
Message :
En fait actuellement, je vois bien Mp3, Avi, Sauvegardes, Rip et XP Work. Il n'y a que Données que je ne vois pas. De plus, ce n'est pas un disque bootable. Comment faire pour ne toucher qu'à Données ?
romsk 17/03/2007 12:50 Auteur :
Réponse le :
Message :
romsk a écrit :

il faut changer le statut de certaines lignes en se mettant dessus et en utilisant les fleches droite gauche :- met la ligne 2 en "*" et les lignes 6 et 8 en "L"- laisse les lignes 1, 7 et 9 en "D", et les lignes 3, 4 et 5 en "L"puis fait entrée > write > menu advanced > met toi sur la 1ère ligne > boot : vérifie que BS et backupBS soient bien OK et identiques > ferme testdisk > éteint et redémarre le PC et voir si t'accèdes à tes données




pascalseverine 17/03/2007 13:38 Auteur :
Réponse le :
Message :
bonjour,
me voila membres du club des disque "raw" !! voila j'ai un gros probleme tout contemt d'avoir acheter un nouveau disque dur 250 go, je le monte dans mon pc je redemare pas de souci le disque est reconu . Je veux donc copier mon disque dur actule (80 go) sur le 250, j'utilise donc ghost et tous ce passe bien jusqu'au redemarage la ecrans bleu je reset et plus rien ! plus d'accee a mes disques.
je prend donc un vieux disque dur ou je reinstalle windows (avec l'idee de retrouver mes donnees sur mes disques)
en effet mes disque reaparaissent mais vide! les deux le 80 et 250 go avec comme format RAW
je fais donc un tour sur les forum et je tombe sur celui si et je dit bravo! car c'est vraiment detailler j'ai fais test disk et voila les copie(enfin si j'arrive a les mettre ici!) pas a pas car je suis novice dans ce genre de probleme mais tres cutieux d'apprendre pouvez vous m'aider ?
romsk 17/03/2007 14:48 Auteur :
Réponse le :
Message :
salut pascalseverine,
pour les copies d'écran voir le paragraphe 7tuto de MJo54
pascalseverine 17/03/2007 15:13 Auteur :
Réponse le :
Message :
merci j'essayais mais je n'arrive qu'a mettre le liens et pas la copie
romsk 17/03/2007 15:56 Auteur :
Réponse le :
Message :
romsk a écrit :

...voir le paragraphe 7
tuto de MJo54
pascalseverine 17/03/2007 16:51 Auteur :
Réponse le :
Message :

jimcarre2001 17/03/2007 17:22 Auteur :
Réponse le :
Message :
Ouf, me voilà sauvé ! J'ai mis P à la place de * pour ma partoche Données, sinon j'ai fait comme on m'a dit, et mon disque est redevenu comme avant. Je vais me dépécher d'acheter un autre disque pour faire mes sauvegardes. Merci encore pour tous ces precieux conseils !
pascalseverine 17/03/2007 18:02 Auteur :
Réponse le :
Message :

pascalseverine 17/03/2007 18:03 Auteur :
Réponse le :
Message :
voila le scan je ne sais pas trop quoi faire
pascalseverine 17/03/2007 18:10 Auteur :
Réponse le :
Message :
apres j'ai fais proceed

romsk 17/03/2007 18:34 Auteur :
Réponse le :
Message :
jimcarre2001 (mais "P" ou "*" c'est pareil...)
pascalseverine : tes partitions sont bien là... --> va dans le menu advanced > boot : copie d'écran
pascalseverine 17/03/2007 18:42 Auteur :
Réponse le :
Message :

romsk 17/03/2007 18:46 Auteur :
Réponse le :
Message :
le secteur de boot aussi semble bon...fais un , un et un sous la console de récupération comme expliqué 
chkdskfixbootfixmbrICI
pascalseverine 17/03/2007 18:51 Auteur :
Réponse le :
Message :
j'ai deja essayer chkdsk mais il refuse j'avais deja fais un fix mbr et fix boot mais je vais reessayer
romsk 17/03/2007 20:12 Auteur :
Réponse le :
Message :
si ça donne rien, retourne sur ce tableau :

et tu fais "" pour voir si tu vois à tes données : - si c'est le cas essaye de redémarrer le PC pour voir si t'accèdes à tes données (mais j'en doute puisqu'on n'a rien changé)- si tu les vois pas ou si le redémarrage du PC ne donne rien, tente un ""- si ça donne toujours rien reste plus qu'à essayer une (dans ma signature) ou par des list

repair MFT
récupération sous linuxlogiciels de récupération
pascalseverine 17/03/2007 21:21 Auteur :
Réponse le :
Message :
j'ai utilise la console de recup il ne trouve pas c: windows! j'ai juste l'invite c: j'ai tape map la il m'a sortie tous les partition de mon disque alors j'ai fais chksdk resultat message d'erreur "la table des metraisse endomage"
puis apres fais fixboot c: resulta il a trouver des erreur puis les a corige
mais toujour pas regler ne boot pas
redemarage, la chkdsk repare deux ficher puis abandonne
voila la copie de test disk je ne trouve pas raire mft
pascalseverine 17/03/2007 21:30 Auteur :
Réponse le :
Message :
pu..... les photo ne veule plus ce mettre erreur sur la page
pascalseverine 17/03/2007 21:34 Auteur :
Réponse le :
Message :
a la place de repar mft j'ai rebuild bs
romsk 18/03/2007 00:20 Auteur :
Réponse le :
Message :

normallement repair MFT est juste à côté de rebuild BS et cette option de commande apparait toujours...
pascalseverine 18/03/2007 01:55 Auteur :
Réponse le :
Message :
c bizare ca mais j'ai beau regarder mais rien je vais reessayer et je verrais ca demain il ce fais tard bonne nuit et merci pour ton aides
romsk 18/03/2007 05:22 Auteur :
Réponse le :
Message :
pascalseverine a écrit :


ça c'est ta copie d'écran d'hier : tu l'as bien le "repair MFT" ?!...
pascalseverine 18/03/2007 13:08 Auteur :
Réponse le :
Message :
apres cette manip" je suis retournee sur l'ecrans comme tu m'a dit
le secteur de boot aussi semble bon...fais un chkdsk, un fixboot et un fixmbr sous la console de récupération comme expliqué 
ICI
et la repair mft a disparu ?!
romsk 18/03/2007 13:53 Auteur :
Réponse le :
Message :
ben si tu peux pas tenter ça, reste plus que linux ou les logs de récupération...
pascalseverine 18/03/2007 19:02 Auteur :
Réponse le :
Message :
je vais essayer alors je n'arrive meme pas a le formater ca bloque
ELICHA 19/03/2007 11:11 Auteur :
Réponse le :
Message :
Romsk bonjour,
Le sujet sur les disques passés en RAW devient de plus en plus fréquent depuis qu'on en connaît l'existence. J'avais eu il y a quelques mois des disquettes anciennes dont je voulais récupérer le contenu, mais impossible car en RAW; Je viens de recevoir en cadeau familial un Palm dernier modèle. Pour l'installer, il y a un CD; Son introduction dans le lecteur-graveur rame à l'infini; bref, il ne se lance pas. Dans l'explorateur, il a 0 octet, mais surtout sa structure est en RAW. Le service après-vente me demande si, par erreur, le CD n'est pas pour MAC; je réponds que rien n'est écrit. Je raccroche et sur la pochette du CD je vois écrit ;" Pour Windows et Mac"; bizzare que le SAV ne le sache pas!! Je viens de renvoyer tout le colis, car le CD seul n'étant pas référencé, il faut renvoyer le tout.
Que penses-tu de ce CD inscrit RAW ?
romsk 19/03/2007 12:22 Auteur :
Réponse le :
Message :
salut elicha,
je pense pas que le problème vienne de ton CD, mais plutôt de la reconnaissance qu'en fait XP qui est mauvaise, et ça rejoint tes problèmes de disquettes qui étaient également reconnues en raw... à mon avis c'est un problème de base de registre (voir la discussion ici --> ) et la seule solution, me semble t'il, serait de réinstaller XP (ou peut être tenter une réparation en bootant sur le CD d'XP ?)http://forum.pcastuces.com/sujet.asp?f=1&s=123995
ELICHA 19/03/2007 13:00 Auteur :
Réponse le :
Message :
merci pour ta réponse. Je vais m'atteler au problème avec le lien que tu m'indiques.
Reprise : Romsk, je n'ai pas vu dans le lien indiqué de solution à mon problème. Je vais déballer le colis que je n'avais pas encore envoyé et vais tester le CD chez un voisin
ELICHA 21/03/2007 11:27 Auteur :
Réponse le :
Message :
Romsk Bonjour,
Alors, effectivement ouverture du colis de retour de mon palm pour la 3eme fois. Le CD essayé chez mon voisin fonctionne parfaitement et j'en ai fait une copie qui fonctionne maintenant chez moi. Cela obscurcit davantage ce format RAW, avec un CD illisible puis une copie qui est parfaitement normale. A signaler que le XP a été entièrement réparé il y a 2 mois (carte-mère, disque dur, modem...changés) et XP réinstallé comme à l'origine. De plus le problème des disquettes illisibles l'avait été avec un autre portable prété pendant la réparation, et de toute façon, le mien n'a pas de lecteur disquette et j'en avais profité pour copier toutes ces disquettes sur un DVD.Le problème se pose de savoir quoi faire pour réparer le lecteur récalcitrant qui fonctionne parfaitement par ailleurs.
Bonne journée
romsk 21/03/2007 12:45 Auteur :
Réponse le :
Message :
ELICHA a écrit :

... lecteur récalcitrant qui par ailleurs...
fonctionne parfaitementsous réserve : il est classique, avant qu'un lecteur-graveur ne tombe en rade définitivement, que de petits bugs surviennent par moment, de tout type (et pourquoi pas raw ?), de plus en plus fréquents au fil des mois jusqu'à ce qu'il rende l'âme... à suivre
ELICHA 21/03/2007 13:55 Auteur :
Réponse le :
Message :
Merci de ta réponse; je vais tacher de trouver un driver nouveau et si cela n'est pas possible, je vais profiter d'une absence de 2 semaines début juin pour envoyer le portable en réparation puisque toujours sous garantie
Franzzzz 22/03/2007 13:28 Auteur :
Réponse le :
Message :
Bonjour, je reposte mon message de la semaine passée, cette fois avec les captures d'écran qui s'affichent :-)
Je fais appel à votre aide pour récupérer une partition qui contient des données importantes.
En manipulant mes partitions avec Gparted, j'ai tenté un redimensionnement d'une partition FAT32. Gparted me disait que l'opération était réussie, mais en redémarrant sous Windows et sous Ubuntu, aucun des deux systèmes de la voyait plus. Windows me disait qu'elle n'était pas formatée et Ubuntu la voyait vide avec un point d'exclamation qui ne disait rien de bon.
J'ai d'abord exploré Testdisk tout seul et la seule opération que j'ai faite était de reconstruire le Boot sector. J'ai accepté les modifications car en listant les fichiers, j'y ai reconnu quelques noms qui étaient valides. En redémarrant Windows, il a pris un long temps à travailler avant de démarrer Windows, et j'espère qu'il n'a pas tout foutu en l'air (j'ai lu dans le forum que quelqu'un avait eu le même cas et il me semble que c'était mauvais signe).
Maintenant, Windows voit la partition mais les quelques fichiers qui portent le bon nom (une vingtaine sur plusieurs milliers) ne sont pas valides et tout le reste est sous la forme .CHK.

J'espère vraiment que cette opération de rebuild boot sector ne m'a pas été fatale car j'avais lu la doc (celle du manuel de Testdisk du moins, pas celle de ce forum) et il ne me semblait pas avoir lu que cette opération pourrait rendre la partition difficilement récupérable.
La question est maintenant de savoir si je peux encore tenter quelque chose sous Testdisk (dites moi oui, svp ;-) ? Ou faut-il se tourner vers un autre programme?
Toujours est-il que maintenant, voilà ce que j'obtiens sous Testdisk :
Après une analyse : 


Menu Advanced
 
Menu Rebuild BS

Après Abort

Un grand merci d'avance...
Franzzzz
romsk 22/03/2007 15:23 Auteur :
Réponse le :
Message :
quelles étaient les différentes partitions sur ce DD que tu ne redimensionnes ? qu'est ce qui apparait comme partition maintenant? y'avait-il un espace libre comme actuellement ?avant
Franzzzz 22/03/2007 15:52 Auteur :
Réponse le :
Message :
Ouie... Je ne me souviens plus exactement. C'est un disque de 60Gb au total, j'avais fait deux partitions FAT32 (l'une nommée DU FAT et l'autre FAT2) d'un peu moins de 30Gb chacune et au moins deux partition pour Linux (2Gb et 600Mb ?) plus une toute petite en FAT32. J'ai effacé les deux partitions destinées à Linux et la toute petite et j'ai ajouté l'espace libre à la partition FAT32 qui posera problème plus tard (FAT2). Ensuite je pense que j'ai encore tenté un redimensionnement entre les 2 partitions FAT32 restantes, de sorte que la partition qui n'est plus lisible devait faire +- 35GB. Je peux claculer plus précisément une fois chez moi si ça aide.
Avant :
DU FAT --> FAT32 +- 28GbFAT2 --> FAT32 +- 28GbLinux1 --> Ext2 +- 2GbLinux2 --> SWAP +- 600MbGhost --> FAT 32 +- 140Mb



Juste avant que ça ne foire : DU FAT --> FAT32 +- 25GbFAT2 --> FAT32 +- 35Gb 
Maintenant : DU FAT était lisible, j'ai pu sauver les données puis j'ai reformaté en FAT32 en attendant. FAT2 : illisible, puis j'ai fait la manipulation décrite plus haut et maintenant elle apparait sous Windows avec les fichiers en .CHK et Gparted ne s'ouvre même pas, il reste bloqué sur l'analyse des disques.


Pas d'espace libre (il avait été intégré à la partition problématique, FAT2)
romsk 22/03/2007 17:21 Auteur :
Réponse le :
Message :
on voit bien qui fait environ 23 Go, par contre ton autre partition ligne "6" fait bien 35 Go mais n'a pas son appellation ce qui en général traduit bien un secteur de boot corrompu (le nom qu'on donne à une partition est inscrit dans le secteur de boot). les coordonnées CHS sont bonnes, sans chevauchement ni chiffre aberrant, le seul élément est un problème éventuel de géométrie (nombre de head à 16 et non 255 ?) à garder en mémoire...DU FATFAT 2
pour l'instant retourne sur ce tableau :

fait entrée > : copie d'écransearch
Franzzzz 22/03/2007 18:21 Auteur :
Réponse le :
Message :
Un grand merci pour ta disponibilité et ta rapidité!
Voilà j'ai été plus loin dans l'analyse comme demandé et le nom FAT2 apparait. Encore mieux, j'ai appuyé sur P et j'ai retrouvé les noms de dossiers!! Je suppose que c'est bon signe et j'attends les instructions suivantes avec impatience! 
romsk 22/03/2007 23:45 Auteur :
Réponse le :
Message :
met toi sur la 3ème ligne (DU FAT) > fleche droite gauche pour la mettre en "L" > puis fais pareil pour la 5ème ligne (FAT 2) > entrée > write > menu advanced > met toi sur la ligne qui correspond à ton ancienne partition FAT 2 retrouvée > boot : si BS et backup BS sont OK et identiques, tu peux fermer testdisk et redémarrer le PC, sinon fais une copie d'écran de boot mais ne ferme pas testdisk...
Franzzzz 23/03/2007 00:17 Auteur :
Réponse le :
Message :
Romsk tu es génial, 10000 fois pour ce coup de main, j'ai tout retrouvé grâce à tes instructions!MERCI
romsk 23/03/2007 06:55 Auteur :
Réponse le :
Message :
 content pour toi franzzzzz 
ELICHA 23/03/2007 09:39 Auteur :
Réponse le :
Message :
Romsk bonjour,
Encore un incident qui se finit bien !! Je n'ai pas besoin de toi ...pour l'instant, mais on est vraiment rassuré de te savoir toujours à l'affut
eletonance 13/04/2007 20:23 Auteur :
Réponse le :
Message :
bonjour ROmsk
Comment te remercier pour ce grand travail que tu as fais pour tous , c'est rare.
tu as sauvé la vie à beaucoup de personnes. Vive internet et vive toi.
ok je pleure depuis une semaine car un disque dur maxtor formater MAC ne monte plus et dessus, bien sur 8 ans de boulot, photo doc etc...
maintes recherches sur la toile et je rencontre Testdisk pour mac, mais je ne suis pas habille avec terminal. Disons que j'ai tout essayer en partant du mac rien a faire. avec les tools mac normaux.
je prend mon pc .je branche mon hd en usb , testdisk xp et voila. donc au regard de ces captures, quel sera le probleme ?
merci merci pour l'aide que tu as donné à tous.
romsk 13/04/2007 21:15 Auteur :
Réponse le :
Message :
yo eletonance,
t'as seulement oublié de nous mettre tes captures... 
eletonance 13/04/2007 21:16 Auteur :
Réponse le :
Message :

eletonance 13/04/2007 21:19 Auteur :
Réponse le :
Message :
imageshack me donnes des petits problemes
c'est ici : http://profile.imageshack.us/user/eletonance/images
mais le forum dis que le total des captures doit etre 24 k, c'est chaud pour lire quelquechose..
eletonance 13/04/2007 21:28 Auteur :
Réponse le :
Message :
donc un peu plus de details
le maxtor de 160 giga
une partition de 140 g pour mac je crois et 20 giga libre si je me souviens bien (au cas ou)
testdisk a fait Analyse
P hfs start 1824 end 273579961 size 273578138 (big mama)
HFS, 140 GB / 130 GiB
enter
Disk /dev/sdd - 163 GB /152 GiB - CHS 320159389 1 1
bad mac partition, invalid block 0 signature
eletonance 13/04/2007 21:47 Auteur :
Réponse le :
Message :

eletonance 13/04/2007 21:48 Auteur :
Réponse le :
Message :
EXCUSER MOI MAIS JE COMMENCE A ETRE FATIGUER
 
eletonance 13/04/2007 22:18 Auteur :
Réponse le :
Message :

romsk 13/04/2007 22:24 Auteur :
Réponse le :
Message :
sous XP je te dirai qu'il y a manifestement un problème de géométrie, mais pour MAC j'avoue que j'en sais rien : MBR et secteurs de boot sont-ils pareils ? FAT MFT ? signification de "bad MAC partition, invalid block signature" ?...A partir de là je sais pas quoi te proposer : logiciels de récupération ? essayer de remettre des coordonnées CHS "normales" sous testdisk ???

pascalseverine 14/04/2007 02:31 Auteur :
Réponse le :
Message :
bonjour,je reviens vous donner des nouvelle apres pas mal de temps passe sur mon probleme de disk( trois semaine!!!!!!), en utilisans testdisk j'ai pu avoir axée a mon dd mais il ne demarais plus sous windows, en le mettant en esclave, il apparaissais comme un dd vierge et j'ai du le formater et la j'ai pu recuperer toutes mes docs ( ouf!!) un grand merci a toi Romsk pour ton aide pour info j'ai trouver la raison pour lesquel mes tois dd ce sont transformer en RAW j'avais, sur une prise mollex, un probleme de cosse qui ne fesais pas bien contact!!
voila bon courrage^pour ceux qui on le meme probleme
romsk 14/04/2007 07:24 Auteur :
Réponse le :
Message :
pascalseverine a écrit :

...pour info j'ai trouver la raison pour lesquel mes tois dd ce sont transformer en RAW j'avais, sur une prise mollex, un probleme de cosse qui ne fesais pas bien contact!!
encore un problème matériel qui explique du raw... allez hop, en 1ère page 
Lenny-bar 14/04/2007 12:24 Auteur :
Réponse le :
Message :
Bonjour 
Je me permet de vous demander de l'aide pour l'utilisation de testdisk, qui pour les novices reste (malgré ce beau topic) ardue.
Il s'agit d'un disque Samsung SP2514N 250Gb Ide 8Mo.
J'avais dessus 3 partitions Ntfs (~35Go / ~100Go / ~100Go). Aujourd'hui win xp ne vois que 2 partitions différentes non formatées (128Go saine / 104.88Go non alloué).
J'ai lancé un scan de testdisk et voila ce qui en ressort:





J'ai l'impression qu'il faut bidouiller la géométrie pour arriver à 255 têtes/cylindre, mais là j'ai peur de faire des bêtises.
Quelqu'un a une opinion sur mon problème?
D'avance merci.
romsk 14/04/2007 13:21 Auteur :
Réponse le :
Message :
salut lenny-bar,
effectivement ça semble être un problème de géométrie : va dans le menu geometry > met 255 à Head > done > write si demandé > menu analyse > proceed : vérifie que tu retrouves bien tes 3 partitions (si t'as un doute fais une copie d'écran) > si c'est bon va dans le menu advanced vérifier, en faisant boot sur chaque ligne, que les BS et backup BS sont bien OK et identiques (si doute copie d'écran) > si c'est bon ferme testdisk > éteint et redémarre le PC et ça devrait être bon...
Lenny-bar 14/04/2007 14:57 Auteur :
Réponse le :
Message :
merci pour votre rapidité 
alors, j'ai mis 255 heads (il ne propose pas write), puis dans Analyse il trouve encore 2 partitions en fat16

je fais Proceed et il trouve bien les 3 partitions (en faisant P je vois bien mes fichiers/repertoires)

Dois je faire Write? (j'avoue être très tenté)
Pour l'instant je ne l'ai pas fais et je retourne au menu Advanced


Je ne sais pas quoi faire à cause de ces satanés partitions 16bits.
romsk 14/04/2007 15:01 Auteur :
Réponse le :
Message :

oui il faut faire write sur ce tableau et finir la procédure comme je te le décrits plus haut (t'occupes pas du fat 16, tu le reverras plus)
Lenny-bar 14/04/2007 15:31 Auteur :
Réponse le :
Message :
merci beaucoup .
une fois toutes les données rapatriées sur mon nouveau Hdd, vaut il mieux que je fasse 1 formatage de bas niveau (je dois revendre ce hdd à un collègue de travail et je ne voudrais pas qu'il lui arrive une tuile comme ça sachant qu'il est assez frileu pour les manipulations que nous venons de faire)?
romsk 14/04/2007 19:00 Auteur :
Réponse le :
Message :
j'pense pas que ce soit nécessaire, mais bon pourquoi pas...
donpipo 16/04/2007 11:40 Auteur :
Réponse le :
Message :
Salut romsk,
J'aurais sans doute besoin d'un peu d'aide... je pense avoir fait une connerie avec Testdisk! 
Apres une enieme "ecriture decalée échouée" (cause boitier firewire merdique), ma partition, une unique FAT32 sur un disque de 80 Go, est devenue illisible: plus de nom de volume, racine du disque accessible mais les noms de fichiers et de dossiers sont en caractères hieroglyphiques et impossibles a ouvrir... la partition etait toujours reconnue comme FAT32.
Avec Testdisk, j'ai ecrasé le BS avec son backup (les deux n'etaient pas identiques mais OK) et depuis rien n'a changé si ce n'est que le nom de ma partition est un nom assez ancien, pas le dernier en date. La racine du disque est toujours accessible mais avec au moins le double de dossiers et des fichiers en hieroglyphes qu'avant et toujours impossibles à ouvrir...
Et c'est la que je crois avoir fait une connerie car ensuite j'ai tenté toutes les etapes que tu decris pour faire un "rebuild BS" mais Testdisk me liste au final la meme arborescence hieroglyphique que Windows avec ce message "...file system seems damaged". Je n'ose plus rien faire.
J'avoue etre un peu perdu. Y a-t-il un espoir?
Merci de ton aide.
Alex.
PS: bravo pour tes tutos très bien faits, c'est ce qui manquait a la doc de Testdisk. J'avais deja sauvé des partitions avec Testdisk mais jamis vu ce cas de figure, je suis paumé 
Edit: 2 petits screens


romsk 16/04/2007 12:16 Auteur :
Réponse le :
Message :
salut donpipo,
les écritures hyéroglyphes correspondent le plus souvent à des FAT corrompues... donc si tout le reste est OK (bonne coordonnées CHS, secteurs de boot et de backup ok et identiques) il faut faire un "" en croisant les doigts (est-ce que t'as fait un chkdsk ?). repair FAT
Si ça donne rien, reste plus qu'à tenter une récup sous linux (dans ma signature) en mode graphique (précédé d'un fsck sous la konsole), ou utiliser les logiciels de récupération, puis une fois les données récupérées faire un formatage bas niveau (et tester ce DD avec hd-tune et le logiciel constructeur) et changer ton boitier externe...
donpipo 16/04/2007 14:36 Auteur :
Réponse le :
Message :
romsk a écrit :

salut donpipo,
les écritures hyéroglyphes correspondent le plus souvent à des FAT corrompues... donc si tout le reste est OK (bonne coordonnées CHS, secteurs de boot et de backup ok et identiques) il faut faire un "" en croisant les doigts (est-ce que t'as fait un chkdsk ?).
repair FAT
Si ça donne rien, reste plus qu'à tenter une récup sous linux (dans ma signature) en mode graphique (précédé d'un fsck sous la konsole), ou utiliser les logiciels de récupération, puis une fois les données récupérées faire un formatage bas niveau (et tester ce DD avec hd-tune et le logiciel constructeur) et changer ton boitier externe...

Pour le chkdsk, j'ose meme pas tenter, un peu trop peur de me retrouver avec un dossier FOUND.000 avec tous les fragments de fichiers en vrac, ce qui m'est deja arrivé sans recup possible ensuite.
Et, si je fais un "Repair FAT" (en croisant les doigts!) qui echouerait, est-ce que ca risquerait de m'empecher de tenter la recup avec un logiciel de recuperation genre Get Data Back? J'ose pas le "Repair FAT" parce que "List" me donne rien du tout en fait (meme pas les hieroglyphes comme j'avais dit plus haut). Cf mes screens plus haut.
Merci d'avance.
Alex.
romsk 16/04/2007 16:51 Auteur :
Réponse le :
Message :
donpipo a écrit :

Pour le chkdsk, , un peu trop peur de me retrouver avec un dossier FOUND.000 avec tous les fragments de fichiers en vrac,
j'ose meme pas tenteralors tente au préalable de récupérer le maximum de données par linux ou les logicuiels de récupération, on reviendra bidouiller avec chkdsk et testdisk après...
donpipo 16/04/2007 16:59 Auteur :
Réponse le :
Message :
Je fais ca...
Get Data Back m'a retrouvé quelques dossiers mais pas tout, c'est un peu le vrac: il manque des sous-dossiers et/ou certains sont vides, mais je dois avoir au moins 30 gigas de recuperables sous la main.
Je viens de lancer un ddrescue, je te tiens au courant.

Edit: ddrescue sous linux n'a fait que copier cette partition foireuse hieroglyphique sur mon autre disque  
Je lance la copie de ce que j'ai pu retrouver et j'ecoute tes conseils pour la suite
romsk 16/04/2007 18:43 Auteur :
Réponse le :
Message :
donpipo a écrit :

Edit: ddrescue sous linux n'a fait que copier cette partition foireuse hieroglyphique sur mon autre disque

ben vi, t'avais pas tout lu de mon sujet :
: quand on copie une partition NTFS corrompue sur une partition de sauvegarde formatée en FAT32, cette partition se retrouve elle même en NTFS. En réalité j'ai l'impression que cette commande agit réellement comme un logiciel de clonage qui transfère tout ce qui existe sur la partition corrompue, y compris le système de fichier... : ddrescue est parfait pour récupérer des données sur un DD contenant des secteurs défectueux, mais lorsque la corruption de la partition résulte d'un problème dans le système de fichier, Mais même dans ce cas de figure la commande reste cependant intéressante car sans avoir peur de perdre des données puisque la partition source corrompue n'a pas été touchée... : peut être que dans ce cas de figure le "glisser-déposer" en mode graphique serait plus efficace puisqu'en théorie il ne transfère que les fichiers et non le système de fichier…* ultime commentaire
Corollaire 1le même problème (de système de fichier) pourrait persister sur la partition de sauvegarde ?ça permet au moins de tester chkdsk et testdisk sur la partition de sauvegarde
Corollaire 2
mais comme tu le vois t'as pas perdu ton temps : ça pourrait te permettre du coup de tester chkdsk sur la partition de sauvegarde...
donpipo 16/04/2007 19:21 Auteur :
Réponse le :
Message :
mais comme tu le vois t'as pas perdu ton temps : ça pourrait te permettre du coup de tester chkdsk sur la partition de sauvegarde...
Quel con je fais: je viens de la reformater pour sauvegarder le recuperable!
Je te tiens au courant.
donpipo 16/04/2007 22:17 Auteur :
Réponse le :
Message :
Etant donné que j'ai recupéré a peu pres l'essentiel, j'ai tenté le diable avec un "chkdsk /f /r" et... il me reste un dossier FOUND.000 avec des fichiers FILExxxx.CHK.
Auparavant, j'ai tenté un "Repair FAT" mais Tesdisk me repond "FAT seems OK, nothing to do". Ensuite, idem.
Donc, je suis dans l'impasse pour la suite. A moins que tu me proposes quelque chose pour refaire partir ma partition comme en l'an 40, je crois que je vais reformater en bas niveau...  
romsk 16/04/2007 22:36 Auteur :
Réponse le :
Message :
romsk a écrit :

les écritures hyéroglyphes correspondent le plus souvent à des FAT corrompues... donc si tout le reste est OK (bonne coordonnées CHS, secteurs de boot et de backup ok et identiques) il faut faire un "" en croisant les doigts (est-ce que t'as fait un chkdsk ?).
repair FAT
Si ça donne rien, reste plus qu'à tenter une récup sous linux (dans ma signature) en mode graphique (précédé d'un fsck sous la konsole), ou utiliser les logiciels de récupération, puis une fois les données récupérées faire un formatage bas niveau (et tester ce DD avec hd-tune et le logiciel constructeur) et changer ton boitier externe...

hélas non, une fois que "fat seems ok" y'a rien d'autre à tenter sauf récupérer tout ce qu'on peut avec slax-lfi en (t'as essayé que ddrescue ???) ou les logiciels de récup...et une fois que t'as tout récupéré, je repartirai effectivement sur des bases saines en testant ce DD avec le logiciel constructeur et en le formatant bas niveau...mode graphique
donpipo 16/04/2007 22:57 Auteur :
Réponse le :
Message :
romsk a écrit :

hélas non, une fois que "fat seems ok" y'a rien d'autre à tenter sauf récupérer tout ce qu'on peut avec slax-lfi en (t'as essayé que ddrescue ???) ou les logiciels de récup...et une fois que t'as tout récupéré, je repartirai effectivement sur des bases saines en testant ce DD avec le logiciel constructeur et en le formatant bas niveau...
mode graphique

Eh bien, en mode graphique, j'avais la meme arborescence que Windows, donc rien de plus...
Je crois bien que le fait d'avoir ecrasé la FAT1 corrompue avec la FAT2 qui n'etait pas mieux etait une belle erreur. La prochaine fois je demanderai avant Grosso modo, j'ai recupéré le plus important et meme quelques FILExxx.CHK que je suis parvenu a identifier...
Donc je vais suivre tes conseils en repartant sur de bonnes bases.
En tout cas, merci pour tes precieux conseils, tes reponses tres rapides... 
Alex.
babar333 20/04/2007 12:11 Auteur :
Réponse le :
Message :
babar333 a écrit :

Bonjour à tous
Mon problème ressemble à de nombreux autres traités ici, mais je n'ai pas réussit à maitriser testdisk pour autant....
J'ai voulu fusionner deux partitions avec partition magic 8, et à la suite d'un bug, une de mes partitions est devenue illisible... J'ai donc essayé testdisk en suivant les conseils donnés sur ce forum, mais tout ce que j'ai reussi à avoir, c'est une erreur de type hal.dll manquant. Apres avoir réinstalé windows sur un disque de secour, j'essaye toujours de retrouver ma partition perdue... Si je ne le retrouve pas, je vais me faire étriper par ma petite soeur qui avait toutes ses photos dessus!!!
Merci d'avance!
voici quelque copies d'écrans....
ps: à l'origine il y avait trois partitions sur ce disque, une pour windows, et les deux que je voulais fusionner, celle marquée essai est celle qui est encore accessible.

J'ai essayé de mettre en * les deux premiere partitions (l'une apres l'autre) mais ca revient comme ci-dessus si je relance testdisk



romsk 20/04/2007 12:58 Auteur :
Réponse le :
Message :
salut babar,
désolé mais : d'après testdisk t'as 3 partitions qui font respectivement 20 Go, 51 Go (essais) et 49 Go.* est-ce la config que tu avais au départ ou celle obtenue après la fusion ?* sur quelle partition avais-tu XP ?* lesquelles as-tu voulu fusionner ?* sur laquelle se trouve les données (photos) à récupérer ?* ton 1er tableau est celui obtenu après search ?c'est pas clair




babar333 20/04/2007 13:08 Auteur :
Réponse le :
Message :
Tout d'abord, merci de répondre aussi rapidement et désolé de pas avoir été assez clair!
Ces trois partition de 20, 51 et 49 go sont les partitions que j'avais au départ, la fusion des disques à échouée, je voulais fusionner les deux dernieres, celles de 49 et 51go.
Xp était sur la partition de 20GO, les photos se trouvent sur la partition de 49go, et c'est la seule qui n'est plus accessible.
Mon premier tableau a été obtenu apres search.
romsk 20/04/2007 13:16 Auteur :
Réponse le :
Message :
* est-ce que tu te souviens si c'était 3 partitions principales ? ou est-ce que la 20 Go XP était la seule principale et les 2 autres des partitions logiques au sein d'une partition étendue ?* as-tu déjà fais des manips sur ces 3 partitions du genre backup BS ou autre ?
babar333 20/04/2007 14:23 Auteur :
Réponse le :
Message :
En fait je connais pas trop la différence entre principale et étendue, j'avais simplement formaté chacune des partitions a partir d'espace libre... et des le debut testdisk m'indiquait les partition comme *, D ou P, j'ai jamais eut de E ou de L.
Et oui j'ai essayé quelque manips, au tout début les boot dans advanced n'était pas tous identiques, et j'avais un "bad" pour les deux dernieres partitions, mais pas au meme endroit (l'un avait boot sector bad, l'autre bachup boot sector). J'ai donc utilisé backup bs et l'autre option dont tu parlais sur le forum, puis en desespoir de cause j'ai aussi essayé rebuild bs et rebuilt mft ... j'imagine que j'aurai pas du....!!
romsk 20/04/2007 15:31 Auteur :
Réponse le :
Message :
babar333 a écrit :

...J'ai donc utilisé backup bs et l'autre option dont tu parlais sur le forum, puis en desespoir de cause j'ai aussi essayé rebuild bs et rebuilt mft ... j'imagine que j'aurai pas du....
 c'est pas que t'aurais pas du, c'est qu'il faut être sûr de son coup parce que maintenant ça complique la réflexion...te souviens-tu laquelle avait le BS OK et laquelle avait le backup BS OK ? (en gros qu'est-ce que t'as fait sur celle qui nous intéresse, c'est à dire la 49 Go ?)
peut être qu'à ce stade le plus simple serait d'utiliser (du même auteur) en lui demandant de rechercher tes photos sur la partition de 49 Go...photorec
babar333 20/04/2007 15:53 Auteur :
Réponse le :
Message :
Je crois que sur la 49 go le probleme était backup boot sector, et que sur la 51 le probleme était boot sector, mais j'en suis pas sur a 100%. Donc j'ai du faire le backup BS sur la 51 et pas la 49.
je vais de ce click me pencher sur photorec en attendant ta réponse!
romsk 21/04/2007 13:41 Auteur :
Réponse le :
Message :
as-tu pu récupérer toutes tes photos avec photorec ?
babar333 21/04/2007 14:07 Auteur :
Réponse le :
Message :
J'ai récupéré pas mal de photos, mais je pense pas les avoir toutes, et surtout, photorec redonne pas l'arborescence des dossiers, du coup c'est plus de 5000 photos qu'il faut que je trie maintenant ...;!!
S'il existe encore un moyen de recuperer la partition je suis toujours preneur!!!
merci deja pour ce que j'ai pu récupérer!
romsk 21/04/2007 19:21 Auteur :
Réponse le :
Message :
alors retourne dans le menu analyse > proceed > entrée > search : tu devrais retrouver l'écran suivant (si c'est pas le cas fais une copie d'écran)

met toi sur la dernière ligne > fleche droite gauche pour la mettre en "D" > clique sur "A" et rentre successivement les valeurs suivantes : * cylinder : 8924* head : * sector : 1* cylinder : 15016* head : 254* sector : 63* type : entrée > entrée > 07 > entrée > done > fleche droite gauche pour la mettre en "P" > write ou OK > menu advanced > met toi sur cette nouvelle partition > boot : (ne ferme pas testdisk)

1




copie d'écran
spike1983 22/04/2007 00:07 Auteur :
Réponse le :
Message :
salut, comme tout le e monde sur ce post j'ai un probleme avec 1 partition, effectivement sur mon hdd 750Go une partition a sauté, mais si je boote avec acronis il me dit que la partition est OK, donc bizarre!!
j'ai donc testé Testdisk et voila ce qu'il me dit:
http://img156.imageshack.us/img156/9463/89808034tz1.jpg
http://img217.imageshack.us/img217/6306/27484795pp3.jpg
http://img301.imageshack.us/img301/5171/47439874de8.jpg
http://img156.imageshack.us/img156/6898/27915839ya1.jpg
En esperant que vous pourrez m'aider!!
spike1983 22/04/2007 00:10 Auteur :
Réponse le :
Message :
desolé pour les images




spike1983 22/04/2007 00:16 Auteur :
Réponse le :
Message :
j'ai oublié celle là:

romsk 22/04/2007 01:17 Auteur :
Réponse le :
Message :
salut spike,
t'as apparemment un problème de géométrie : va donc dans le menu geometry > met 91202 à cylinder > done > ok ou write si demandé > menu analyse > proceed : copie d'écran
spike1983 22/04/2007 01:39 Auteur :
Réponse le :
Message :
merci mais j'ai un autre probleme, en attendant une reponse j'ai essayé partition table doctor et quand je l'ai lancé il m'as dit que le nombre de secteur sur les 2 parttions etaient faux, est ce que je veux corrigé, j'ai mis oui et maintenant la 1ère partition à apparement disparu (supprimé), mais celle qui manquait toute a l'heure est revenu et j'y ai accés sous windows. Bizarre, j'espere que tu as une solution car la j'en peu plus!!
PS: dans gestion des disques il me met que la partition est non alloué!!!
romsk 22/04/2007 10:21 Auteur :
Réponse le :
Message :
c'est normal puisque tes partitions se chevauchent : si l'une est fonctionnelle elle "efface" l'autre et vice versa si tu rétablis l'autre...1) tant que tu y es sauvegarde ce que tu peux de cette partition retrouvée (on sait jamais...)2) refais une copie d'écran de ce que montre maintenant et dans le menu analyse

proceedsearch
spike1983 22/04/2007 11:34 Auteur :
Réponse le :
Message :
voila deja un premier iprim ecran:

je suis en train de faire proceed mais c'est un peu long (750Go oblige), je mets les photos des que possible, en esperant une solution.
babar333 22/04/2007 12:18 Auteur :
Réponse le :
Message :
J'ai fait tout ce que tu as dis et voila ce que j'ai :
http://images1.hiboox.com/images/1607/evw1d7nx.jpg
ps: désolé je n'arrive plus à afficher l'image directement ...
romsk 22/04/2007 13:23 Auteur :
Réponse le :
Message :
babar : fais rebuild BS > puis "list" pour voir si t'accèdes à tes données > et si c'est bon fait write, ferme testdisk et redémarre le PC, mais si c'est pas bon copie d'écran sans faire write...
spike : j'ai l'impression que le problème de geométrie est le même. donc va dans le menu geometry > met 91202 à cylinder > done > ok ou write si demandé > menu analyse > proceed : copie d'écran
spike1983 22/04/2007 13:52 Auteur :
Réponse le :
Message :
bon j'ai fait ce que tu m'as dit c'est en cours de proceed par contre voila la photo du proceed avant la manip si ca peut te donner une idée.

PS: apparement il n'y a aucune trace de ma premiere partition
spike1983 22/04/2007 14:00 Auteur :
Réponse le :
Message :
voila le proceed apres la modif, mais toujours pas ma premiere partition

romsk 22/04/2007 14:11 Auteur :
Réponse le :
Message :
fais entrée > (désolé si c'est long, mais t'avais qu'à pas t'acheter un 750 Go )search
babar333 22/04/2007 14:13 Auteur :
Réponse le :
Message :
Apres le rebuild BS, je suis retombé sur exactement le meme écran qu'a la derniere copie d'écran, et "list" n'est pas accéssible (rien ne se passe quand je le selectionne)
spike1983 22/04/2007 14:13 Auteur :
Réponse le :
Message :
ok, j'ai lancé search je te tiens au courant quand c'est terminé, c-à-d dans 1h, en tout cas merci pour ton aide, en esperant que ca fonctionne.
spike1983 22/04/2007 15:19 Auteur :
Réponse le :
Message :
voila l'imprim ecran apres le search, toujours aucune trace de ma partition

romsk 22/04/2007 16:52 Auteur :
Réponse le :
Message :
ben déjà t'as plus le message "hard disk seems too small..."t'as essayé de repasser un coup de partition table doctor ?sinon retourne dans le menu geometry > et essaye de mettre 16 à cylinder > done ok write > menu analyse > proceed, et si ça donne rien de plus essaye cylinder à 240...

babar333 22/04/2007 17:12 Auteur :
Réponse le :
Message :
et moi?????
mon cas est il désespéré????? !!!! lol
spike1983 22/04/2007 17:40 Auteur :
Réponse le :
Message :
tu es sure que c'est dans cylinder que je dois mettre 16, car d'origine il est a 91201?
romsk 22/04/2007 23:58 Auteur :
Réponse le :
Message :
'xcuse , tu as raison : c'est à head qu'il faut essayer 16 (voire 240 si 16 ne donne rien), pas à cylinder... spike
babar : désolé, mais apparemment 8924 1 1 ne donne pas plus de résultat que 8924 0 1, et si rebuild BS ne donne rien de plus j"ai bien peur que les possibilités ne s'amenuisent ... peut être regarder en mode graphique sous linux ? (dans ma signature)
matifou 23/04/2007 00:07 Auteur :
Réponse le :
Message :
Bonjour!!
J'ai eu un gros (peut-être en fait que petit, j'espère en tout cas) problème en faisant de mauvaises manipulations avec Gparted sur mes partitions...
En voulant diminuer une première partition et augmenter une troisième, j'utilise Gparted. Tout allait pour le mieux dans le meilleur des mondes, le logiciel avait "enlevé" quelques gigas de trop à la première partition (fonction resize) et transférait bizarrement ces gigas à la deuxième (fonction move), avant probablement de les enlever pour les ajouter à la troisième (fonction resize). J'ai alors bêtement, aie aie aie, annulé en pleine opération, et, rebelote, rai raie raie, attribué le petit bout de giga libéré de la deuxième partition à la troisième, ce qui a parfaitement marché.
Evidemment, en redémarrant, la deuxième partition était devenue illisible... J'essaie avec TestDisk, constate en mode advanced que le "backup boot sector" est bad et alors tente la fonction org.bs qui marche. Au redemarrage, windows teste le disque, efface des orphelins , en restaure d'autres (ça correspond à quoi en fait?)... et mon disque est lisible, presque restauré car certains fichiers ont disparu, d'autres sont vides...
Comment les récupérer? Ont-ils été détruits lors de l'opération "move" de gparted sur la deuxième partition? Lors de l'opération "resize" de gparted sur la troisième partition? Comment le savoir? Puis-je les retrouver?
Merci beaucoup pour tout conseil et aide!!!
romsk 23/04/2007 07:06 Auteur :
Réponse le :
Message :
salut matifou,
en réalité t'as eu de la chance de t'en tirer comme ça : j'ai vu d'autres situations comparables où l'on n'arrivait pas à récupérer les partitions redimensionnées...ce qui t'a fait perdre certaines données, c'est le chkdsk au reboot qui est incontournable et fais ce qu'il peut pour récupérer la table d'allocation des fichiers. les fichiers disparus sont irrécupérables sous windows et testdisk ne peut plus rien : la seule possibilité est de tenter les différents logiciels de récupération cités 
ICI
babar333 23/04/2007 10:35 Auteur :
Réponse le :
Message :
Ok. Merci quand meme pour ton aide précieuse. Au moins j'aurai récupéré un certain nombre de photos!
vanezou 29/04/2007 10:36 Auteur :
Réponse le :
Message :

Bonjour,
Je me permets de relancer le sujet car le désespoir s'installe.
Voilà, j'ai installé ubuntu sur l'ordinateur de mon copain en supprimant toutes les données qui existaient sur le XP. J'ai donc posté mon problème sur le forum de ubuntu qui m'a suggéré de lancer testdisk. J'ai donc fait une analyse et voilà le message qui m'est apparu :
"
Warning : the current number of heads per cylinder is 255but the correct value maybe 240.You can use the geometry menu to change this value.It's something to try if -some partitions are not found by testdisk-or the partition table can not be written because partitions overlaps.




"
Je n'ai encore rien fait, de peur de faire à nouveau une erreur.
Que me conseillez-vous de faire. Dois-je réellement modifier la geometry?
Merci d'avance.
Vanessa
romsk 29/04/2007 23:15 Auteur :
Réponse le :
Message :
vanezou a écrit :
...j'ai installé ubuntu sur l'ordinateur de mon copain en supprimant toutes les données qui existaient sur le XP.
salut vanezou,1) explique plus clairement ce que t'as fait, en rajoutant une copie d'écran de la gestion des disques,2) fais aussi une copie d'écran de ce que montre testdisk dans le menu analyse > proceed 

Vehuia 02/05/2007 17:00 Auteur :
Réponse le :
Message :
Bonjour,
Tout d'abord, félicitation et merci, vos explications et tuto (de Romsk), clairs et précis, m'ont déjà appris beaucoup. Je suis nouvelle sur le Forum et débutante dans les embrouilles de windows.
J'ai le même problème : mon 2e disque dur F (interne) s'est mis en raw. (Type de disque : Partition de disque dur - Type de périphérique : ATA - Modèle : Maxtor 6Y080L0 (données de pc wizard))
http://www.box.net/shared/53oeqv30mn
J'ai fait un "chkdsk F: /F /R" comme conseillé, mais au bout de 5 jours et 5 nuit, le pc s'est essouflé et a redémarré ... grrrrrrrr. Tous mes dossiers/fichiers y sont encore !!!
Cependant le chkdsk annonçait que le format était NTFS. J'ai refait le chkdsk mais sans le /R. Il s'est terminé normalement avec les résultats suivants :
http://www.box.net/shared/y5iqo20spx
Le F est resté en RAW !!!
J'ai donc chargé TestDisk (version 6.6), mais à l'ouverture, celui-ci ne me donne pas le même résultat que ceux que j'ai vu sur le forum. Apparemment il y manquerait quelque chose !!!
http://www.box.net/shared/ui5f974417
S'il vous plait, aidez-moi, cela fait 3 semaines que je planche pour récupérer les fichiers de mon disque F (photos de famille que je ne veux surtout pas perdre, images et pps, certains programmes, ... et documents importants.).
Merci d'avance pour l'aide que vous pourrez m'apporter !!!
PS : comment faites-vous pour mettre les images de votre pc sur le forum. Je n'ai trouvé comme solution que de les mettre dans ma boxnet et d'insérer le lien.
romsk 03/05/2007 00:30 Auteur :
Réponse le :
Message :
salut vehuia,
pour les copies d'écran utilise imageshack somme expliqué pour le reste on en reparle demain ICI

Vehuia 03/05/2007 01:24 Auteur :
Réponse le :
Message :
Merci de me répondre si rapidement, Romsk
Alors je fais un essai avec imageshack pour afficher mes trois images (dans l'ordre de mon message). J'ai oublié de dire dans mon message précédant que mon DD (F) est un Maxtor 80 go
Quand à la partition G, je ne sais à quoi elle correspond, elle était installée à la base lorsque j'ai acheté le pc.
Lien 1) (Disque défaillant = F)

lien 2 (résultats chkdsk F/F

lien 3 (prob testdisk)
 
 super ça marche !!! 
romsk 03/05/2007 18:46 Auteur :
Réponse le :
Message :
1) chkdsk semble t'avoir fait un sacré ménage : j'espère que t'auras pas perdu trop de fichiers dans la bagarre... corollaire, avant d'aller plus loin, regarde déjà si (dans le même fichier zip que testdisk) ne pourrait pas te permettre d'au moins récupérer le maximum de données en les copiant sur ton autre DD ???photorec
2) ton problème testdisk vient, à mon avis, de ce que tu tentes de lancer testdisk alors que tu l'as sorti du répertoire où tu l'avais dézippé ? il faut le remettre dans son répertoire (il a besoin notamment des dll qui s'y trouvent)
Vehuia 03/05/2007 20:43 Auteur :
Réponse le :
Message :
 Merci pour ta réponse. J'ai tout compris !!! J'ai redézippé le tout dans un dossier et ne l'ai plus changé de place. Effectivement, j'obtiens un autre résultat à l'ouverture de TestDisk et de Photorec.
Je vais faire comme tu dis, mais auparavant, il me faut faire un peu ménage sur mon C afin d'avoir assez de place pour accueillir tout ce que Photorec pourrait me récupérer récupererai sur mon F.  
Vehuia 03/05/2007 21:12 Auteur :
Réponse le :
Message :
J'ai testé Photorec. Mes deux DD y apparaissent bien. Je sélectionne mon DD défectueux. Par contre, en ce qui concerne la sélection du type de partition ça ne va pas plus loin (je laisse la sélection Intel/PC Partition), enter ..... et rien ne se passe,
romsk 03/05/2007 23:06 Auteur :
Réponse le :
Message :
ben laisse tomber photorec et lance testdisk pour voir s'il trouve qqch (menu analyse > proceed > +/- entrée et search : et n'oublie pas les copies d'écran...
Vehuia 04/05/2007 16:57 Auteur :
Réponse le :
Message :
d'accord voici ce que ça donne à l'ouverture. Il ne me donne pas mes DD. Je choisis Create, Append ou No Log ?

romsk 04/05/2007 17:29 Auteur :
Réponse le :
Message :
pas d'importance, t'as qu'à faire create...
Vehuia 04/05/2007 18:49 Auteur :
Réponse le :
Message :
Merci. Voici les 1er résultats :

 
Voilà où j'en suis. Que dois-je faire ensuite ?
romsk 04/05/2007 19:29 Auteur :
Réponse le :
Message :
quand tu es sur le dernier écran, tape "P" pour voir si t'accèdes à tous tes fichiers et répertoires : > puis va dans le menu advanced > boot : copie d'écrancopie d'écran
Vehuia 04/05/2007 20:04 Auteur :
Réponse le :
Message :
 ok. voici la liste des fichiers
 

 
Mais, petit problème, je ne vois pas comment quitter cette fenêtre pour aller dans le menu advanced. j'ai beau faire entrée ou bouger mes flèches, rien ne se passe
romsk 04/05/2007 20:29 Auteur :
Réponse le :
Message :
c'est marqué sur le ligne au dessus des fichiers : tape "q" pour quitter... > write si demandé > va dans le menu advanced > boot : copie d'écran
Vehuia 04/05/2007 20:51 Auteur :
Réponse le :
Message :
 Oups, pardon, suis vraiment pas douée hihi. j'avais bien vu ce "quit" mais avais peur de quitter totalement Testdisk. Bon, j'ai trouvé advanced, fait entrée après l'avoir sélectionné, j'attends qu'il m'affiche quelque chose de nouveau 
Vehuia 04/05/2007 21:00 Auteur :
Réponse le :
Message :

Voilà le résultat  
romsk 04/05/2007 21:03 Auteur :
Réponse le :
Message :
ben tout a l'air bon : fais "list" pour voir si tous tes fichiers et répertoires sont toujours là, et si c'est bon quitte testdisk et redémarre le PC pour voir ce que ça donne...
Vehuia 04/05/2007 21:22 Auteur :
Réponse le :
Message :
C'est incompréhensible, tout est bon, mais DD toujours en RAW, ça me dis toujours que disque n'est pas formaté quand je tente de l'ouvrir Que faire maintenant ?
romsk 04/05/2007 21:45 Auteur :
Réponse le :
Message :
est-ce que tu as fait "list" avant de fermer testdisk comme je te le disais ?
Vehuia 04/05/2007 21:47 Auteur :
Réponse le :
Message :
Oui oui, tout y était 
romsk 05/05/2007 00:03 Auteur :
Réponse le :
Message :
ben dans ton cas on a l'impression que c'est peut être pas le DD qui est défectueux mais la reconnaissance qu'en fait XP ? ça vaudrait le coup de le démonter et de le mettre en esclave sur un autre ordi pour voir s'il est reconnu normallement...
Vehuia 05/05/2007 00:09 Auteur :
Réponse le :
Message :
J'ai pensé la même chose, ça doit être windows xp qui reconnais plus. Et si je formatais mon C et réinstallait windows, cela pourrait-il faire une différence ? Chipotter dans ma tour, ça me fait un peu peur ...
romsk 05/05/2007 16:09 Auteur :
Réponse le :
Message :
c'est bien plus simple de changer le DD d'ordi plutôt que de réinstaller XP... (qui plus est réinstaller XP risque de ne rien changer à ton problème) : je te donnerai des liens pour t'aider visuellement...par contre tu pourrais faire au préalable fixmbr et fixboot sur ce DD comme je l'explique 
ICI
@ntho 06/05/2007 16:08 Auteur :
Réponse le :
Message :
bonjour,testdisk n'arrive pas à retrouver ma partition lorsque je lance une analyse, voici le message qui s'affiche
"the hardisk seems to small"
comment faire pour ne plus avoir ce message et ainsi retrouver ma partition lorsque testdisk la recherche ?
merci
j'ai oublié de dire que le nombr de cylinders était de 21174, est-ce normal pour une disque de 163GB / 152GiB ?
romsk 06/05/2007 17:59 Auteur :
Réponse le :
Message :
salut antho,
c'est probablement un problème de geométrie à modifier, mais comme tu l'as peut être vu sur les posts précédents les aident bien à dire quelle modif faire...copies d'écran
@ntho 06/05/2007 18:56 Auteur :
Réponse le :
Message :
vi je sais, mais je suis encore en bas-débit et malheureusement le temps de chargement de chaque photos me prend 3min environs
sinon j'ai remarqué avec le programme PTEDIT32 que la valeur qui s'affiche dans la colonne "head" lorsqu'on lance le programme n'est pas de 255 contrairement à mon disque principal, mais de 111, et lorsque je clique sur "Boot Record" la valeur qui s'affiche dans le cadre "head" est de 240
est-ce normal ?
romsk 06/05/2007 21:41 Auteur :
Réponse le :
Message :
@ntho a écrit :

j'ai remarqué avec le programme PTEDIT32 que la valeur qui s'affiche dans la colonne "head" lorsqu'on lance le programme n'est pas de 255 contrairement à mon disque principal, mais de 111, et lorsque je clique sur "Boot Record" la valeur qui s'affiche dans le cadre "head" est de 240
ça confirme un probable problème de géométrie : si tu peux pas faire de copie d'écran, alors recopie le texte (tout le texte) qui apparait sur l'écran de testdisk > menu analyse > proceed(sinon envoie le logfile à C. Grenier)
raouf77 07/05/2007 19:41 Auteur :
Réponse le :
Message :
bonjour cher astucien et astucienne cé mon premier message, et mon premier probleme.
j'ai un flash disq qui cé mis on system RAW, j'ai lancer PTEDIT32.EXE et sa mafiche que des 00 alors je suis passer a testdisq
1 je fait analyse il me dit "partition sector doesn't have the end mark 0*AA55"
2 j'appuie sur entrée il commense a analyse puis me lance le message suivant " structure : ok"
3 j'apuie sur entree et il me dit " no partition fonud or selected for recovery"
4 j'apuie sur entree et je me retrouve au point de depart donc le menu de demarage
j'ai n'ai trouver null part comment toucher le mbr rebuild ou quelque chose comme sa je suis naz, je n'ai rien compris malgre que j'ai respecter tt les etape.
romsk 08/05/2007 00:22 Auteur :
Réponse le :
Message :
salut raouf,
rebuildBS n'apparait que dans le menu advanced, et que si t'as retrouvé une partition...peut être un problème de geometry ? * fais une si possible,* et dans le menu analyse, fais bien proceed > entrée > 

copie d'écran
search
romsk 08/05/2007 19:02 Auteur :
Réponse le :
Message :
désolé, tes copies d'écran ne passent pas...
raouf77 08/05/2007 20:28 Auteur :
Réponse le :
Message :
romsk a écrit :désolé, tes copies d'écran ne passent pas...


j'ai pas compris comment elle ne passe pas
romsk 08/05/2007 23:04 Auteur :
Réponse le :
Message :
ben on les voit pas...voir le tuto de MJo54
ICI
raouf77 09/05/2007 10:03 Auteur :
Réponse le :
Message :
cé vrai je vais les mettre cette apre-midi.
merci baucoup pour votre patience.
chapeau.
amadeustar 10/05/2007 02:24 Auteur :
Réponse le :
Message :
Bonjour,
Après plusieurs essais infructueux sous TestDisk 6.6, j'aimerai avoir quelques confirmations si possible avant de faire une connerie ;o) Je possède 2 DD de 320 Go montés en RAID0. Afin de se placer dans le contexte, voici différents screenshot :
1) première analyse
 
2) seconde analyse
 
3) le search!

Vous l'aurez deviné, le but est de récupérer la partition logique "DIVERS" qui est normalement G:\
Voici maintenant ce qu'en pense Windows :

Nous avons donc bien nos 90Go qui apparaissent comme libres, alors que se trouvait "the lost partition" à cet emplacement.
1ere question : après avoir effectué le search!, TestDisk ne trouve que des partitions "deleted", avec un beau D devant. J'essaye de mettre les bonnes caractéristiques mais sans succès. Il n'aime pas ma façon de partitionner ;o) Pourtant, d'après Windows, je voulais mettre cette suite : *, P, P, L, L. Suis-je dans l'erreur ? Et dans ce cas que faut-il mettre ?
2eme question : à partir de la seconde analyse, il ne détecte plus la partition étendue, qui comporte les 2 partitions logiques. Est-ce normal ? Balo ou catastrophique ?
N'ayant jamais pu lui faire accepter le bon partitionnement, je ne suis pas allé plus loin, ne voulant pas inscrire n'importe quoi dans la table des partitions. Le tuto de m'a déjà bien aidé. Et comme je vois qu'il est toujours présent sur le forum...romsk
"Ton aide me serait très précieuse"
Merci ;o)
romsk 10/05/2007 07:25 Auteur :
Réponse le :
Message :
salut amadeustar,
j'avoue ne pas savoir si testdisk peut "réparer" des systèmes raid 0 comme il le fait pour les disques de base, notamment parce qu'il n'y a plus notion de partition mais de volume... en tous cas la présentation est très différente de ce qu'on voit dans les disques de base, entre autre les coordonnées CHS de début et de fin des partitions qui collent au secteur près au lieu de coller au cylindre près.
en admettant que testdisk le puisse, voilà qques réponses à tes questions :* c'est normal car si tu regardes bien les coordonnées CHS de ce que retrouve proceed ou search, tu remarqueras que ces partitions "D" se chevauchent : donc ça peut pas coller...* oui c'est normal. s'il te retrouvait la bonne partition en D, il te suffirait de la transfoprmer en L pour voir apparaitre la partition étendue correspondante
1ere question : après avoir effectué le search!, TestDisk ne trouve que des partitions "deleted", avec un beau D devant. J'essaye de mettre les bonnes caractéristiques mais sans succès :
2eme question : à partir de la seconde analyse, il ne détecte plus la partition étendue, qui comporte les 2 partitions logiques. Est-ce normal ?
je pense que la seule solution, à part essayer des logiciels de récupération, va être de recréer la partition disparue telle qu'elle devrait apparaitre, mais avant d'aller plus loin peux-tu aller sur le tableau obtenu après proceed > met toi sur "divers" > clique sur "P" pour voir si tes fichiers et répertoires sont là...
amadeustar 10/05/2007 09:36 Auteur :
Réponse le :
Message :
Travaillant toute la journée, je ne peux faire ce genre de tests normalement que le soir, mes réponses pourront donc parfois être tardives.
Cependant je puis répondre à cette question facilement puisque j'avais déjà essayé. Et TestDisk voit parfaitement mes dossiers et sous-dossiers... C'est d'ailleurs ce qui me permet de ne pas "paniquer". Une petite voix me dit au fond de moi que je vais bien réussir à récupérer mes données puisqu'elles sont visibles ;o)
Edit: A propos des logiciels de récupération, j'en ai déjà essayé plusieurs. Certains ne voient jamais ma partition, d'autre oui. Malheureusement, pour ces derniers, il n'en est pas un qui puisse sauvegarder les données car ce sont des versions d'essai. J'ai simplement le droit de voir que mes fichiers existent toujours ;o) Donc si tu as une référence à me proposer en particulier, je suis preneur. D'autant plus que pour l'instant je ne suis pas chaud pour débourser +100€ afin de récupérer mes fichiers.
melar 10/05/2007 13:32 Auteur :
Réponse le :
Message :
Bonjour,
J'arrive jusqu'à la dernière vérification (celle qui dure le plus longtemps, c'est à dire le search!) sur mon disque dur de 80 Go
le mien me donne "Warning: Incorrect number of heads/cylinder 255 (NTFS) !=16 (HD)
HPFS - NTFS 12495 0 1 155055 14 63 143701425
Warning: Incorrect number of heads/cylinder 255 (NTFS) !=16 (HD)
HPFS - NTFS 14535 0 1 155055 14 63 141645105
Je suppose que ca veut dire que j'ai du 255 != (différent en algo) de 16, donc je dois le faire passer en 16 ?
PS: Pour être plus précis, j'ai crée une table de partition avec QTParted sans faire exprès, puis j'ai installé ubuntu par dessus. Ensuite j'ai été obligé de télécharger des logiciels pour ensuite les graver en .iso afin de récuperer mes données.
Finalement, je pense que j'ai réussi à récuperer ma partition (je l'ai fait passer en *) mais maintenant qu'elle est passé dans ce mode là, je ne peux plus accéder à aucun systeme d'exploitation, et donc comme suis-je censer récuperer mes données ? Tout ce qui m'importe c'est de reprendre mes fichiers d'avant, quitte à devoir réinstaller un systemene d'exploitation (je suis sur ordianteur portable)
romsk 10/05/2007 18:53 Auteur :
Réponse le :
Message :
amadeustar : on pourrait recréer la partition manquante avec la touche "A", mais comme c'est une partition logique il faudrait la décaler pour pouvoir y mettre l'EBR correspondant si bien que le secteur de boot de cette partition recréée se retrouverait dans la partition "divers" retrouvée et risquerait d'effacer des données peut être importantes, donc pas conseillé...de la même manière, et comme tu l'as vu par toi même, on ne peut pas rétablir en même temps toutes les partitions D car elles se chevauchent, ni rétablir certaines "D" (notamment system) qui risqueraient d'écraser le début d'autres partitions...donc je vois 2 possibilités :* essaye d'abord de modifier la geometry en mettant 7782cylindres > ok ou write > menu analyse (sans faire proceed) : si ta partition divers n'est pas réapparue retourne dans geometry remettre 7782 cylindres > ok ou write, et passe à la manip suivante* retourne sur le tableau proceed ou tu n'as que des partitions en "D" > mets la dernière ligne (divers) en "P" (et pas "L") > tape "A" > rentre successivement les valeurs CHS suivantes : 0 32 33 3916 96 20 > type : entrée > entrée > 07 > entrée > done > fleche droite gauche pour la mettre en "*" > write ou OK > menu advanced > mets toi sur chacune des 2 lignes qui devraient apparaitre > boot : copie d'écran de chacune pour vérifier les boot sector et backup boot sector....(PS : ta partition "applications" ne correspond pas, j'espère, à tes programmes ? car dans ce cas system ne marchera pas seule et il faut également rétablir applications...)


7 6

l'idée est de rétablir system et divers pour que tu puisses sauvegarder le contenu de cette partition sur un autre DD, puis une fois que tu as tout récupéré on rétablira sous testdisk la config telle qu'elle apparait actuellement dans le menu analyse puis, sous windows, de formater l'espace libre de feu-divers avant de remettre tes données sur cette partition nouvellement créée
salut ,une serait plus explicite, notamment pour voir ce qui apparait comme valeurs CHS sur la 1ère ligne (disk /dev/sda...). sinon ça semble effectivement correspondre à un problème de geometrie et on va voir quel chiffre modifier... melar
copie d'écran(concernant tes explications en PS, j'ai RIEN compris...)
amadeustar 10/05/2007 21:48 Auteur :
Réponse le :
Message :
romsk a écrit :(PS : ta partition "applications" ne correspond pas, j'espère, à tes programmes ? car dans ce cas system ne marchera pas seule et il faut également rétablir applications...)
Euh... si ;o)
La partition SYSTEME ne contient que Windows (et tout ce qui s'y rattache implicitement sans me demander mon avis). La partition APPLICATIONS contient toutes mes applis "installées". En effet je déteste mettre ça avec Windows, on ne s'y retrouve plus sinon. Pareil pour JEUX et MULTIMEDIA. La partition DIVERS contenait les "installateurs" de tout ce qui se trouve sur le PC. C'est une partition qui me sert donc entre autre de bibliothèque.
Je rappelle qu'à ce jour tout fonctionne parfaitement, si ce n'est la perte de ma fameuse partition. Je suis donc un peu frileux pour déplacer les premières partitions, sous peine que le PC ne boot plus ;(
Peux tu me rassurer sur ce point ? ;o)
Edit : j'ai essayé ton premier test sans succès, la partition ne réapparait pas, j'attend ta réponse suite à mon dernier post avant d'aller plus loin
romsk 11/05/2007 00:36 Auteur :
Réponse le :
Message :
Je rappelle qu'à ce jour tout fonctionne parfaitement, si ce n'est la perte de ma fameuse partition. Je suis donc un peu frileux pour déplacer les premières partitions, sous peine que le PC ne boot plus. Peux tu me rassurer sur ce point ? oui j'ai bien intégré, non on va rien déplacer on ne fait que modifier les descripteurs de partition du MBR, non je peux pas te rassurer à 100 %... (mais tout devrait bien se passer)
donc : retourne sur le tableau proceed ou tu n'as que des partitions en "D" > mets la dernière ligne (divers) en "P" (et pas "L") > tape "A" > rentre successivement les valeurs CHS suivantes : 0 32 33 3916 96 20 > type : entrée > entrée > 07 > entrée > done > fleche droite gauche pour la mettre en "*" > tape à nouveau "A" > rentre successivement les valeurs CHS suivantes : 3916 96 21 7832 160 8 > type : entrée > entrée > 07 > entrée > done > fleche droite gauche pour la mettre en "P" > write > menu advanced > mets toi sur chacune des 3 lignes qui devraient apparaitre > boot : copie d'écran de chacune pour vérifier les boot sector et backup boot sector... si tous les secteurs sont ok et identiques, tu peux fermer testdisk, redémarrer le PC et va voir si t'as accès à tes données, sinon faire backup BS ou org BS selon, mais si t'as un doute ne fais rien et à demain (sans fermer testdisk)
xorglos 14/05/2007 17:14 Auteur :
Réponse le :
Message :
Bonjour,
Je viens à mon tour de tomber sur un pb de reconnaissance de disque...
Il s'agit d'un dd externe d'un Tera... reconnu maintenant en type raw (inaccessible sous l'explorateur), originellement en NTFS (1 seule partition).
Le testdisk donne les résultats suivants:
TestDisk is free software, andcomes with ABSOLUTELY NO WARRANTY.
Select a media (use Arrow keys, then press Enter):Disk /dev/sda - 237 GB / 221 GiBDrive D: - 402 MB / 384 MiB

Disk /dev/sdb - 1024 B
_______________________________________________________________________ANALYSE

Disk /dev/sdb - 1024 B - CHS 2 1 1Current partition structure:Partition Start End Size in sectors

Invalid NTFS boot1 P HPFS - NTFS 63 1960926028 19609259661 P HPFS - NTFS 63 1960926028 1960925966

Warning: Bad starting cylinder (CHS and LBA don't match)No partition is bootable
_______________________________________________________________________PROCEED
Disk /dev/sdb - 1024 B - CHS 2 1 1Partition Start End Size in sectors
Structure: Ok._______________________________________________________________________SEARCH!Disk /dev/sdb - 1024 B - CHS 2 1 1Partition Start End Size in sectors



Structure: Ok.
_______________________________________________________________________ADVANCED
Disk /dev/sdb - 1024 B - CHS 2 1 1
Partition Start End Size in sectors1 P HPFS - NTFS 
_______________________________________________________________________
PTEDIT32

Gestion des disques
 
Si vous aviez des idées pour tenter de corriger le pb, milles mercis d'avance
romsk 14/05/2007 21:01 Auteur :
Réponse le :
Message :
ton disque de 1 To est reconnu comme 1 Ko : tu t'es fait avoir... trève de plaisanterie, il semble encore s'agir d'un problème de geometrie : va dans le menu geometry de testdisk > met 255 à head et 63 à sector > write > menu analyse > proceed : copie d'écran.
xorglos 14/05/2007 21:12 Auteur :
Réponse le :
Message :
Merci d'essayer de corriger mon problème
bon, alors les modifs faites ça donne:
Disk /dev/sdb - 0 B - CHS 0 255 63Current partition structure:Partition Start End Size in sectors

Invalid NTFS boot1 P HPFS - NTFS 0 1 1 122061 254 62 19609259661 P HPFS - NTFS 0 1 1 122061 254 62 1960925966

Bad relative sector.No partition is bootable
par contre pas vu de write ds le menu geometry
ps: je me prends un dump si proceed
ps2: le disque est en fait un aggrégat de 4 disques (en raid 0 je crois bien), un lacie...
romsk 14/05/2007 21:56 Auteur :
Réponse le :
Message :
on a maintenant une idée précise du nombre de cylindres : retourne dans le menu geometry > met 122062 à cylindre, 255 à head et 63 à sector > ok ou done ou write () > menu analyse > proceed : copie d'écranj'sais plus
xorglos 14/05/2007 22:06 Auteur :
Réponse le :
Message :
bon ça a l'air mieux, ça passe... mais vu que donne que des read errors, faut-il attendre les 3 plombes ou pas?
Disk /dev/sdb - 1003 GB / 935 GiB - CHS 122062 255 63Analyse cylinder 6302/122061: 05%Read error at 6301/2/1 (lba=101225691)

romsk 14/05/2007 22:50 Auteur :
Réponse le :
Message :
t'as pas le choix (ça t'apprendra à faire dans le tera ...)
xorglos 14/05/2007 23:28 Auteur :
Réponse le :
Message :
Clair et on pleure plus qd ça fume
Bon sinon tera heures plus tard ():
Disk /dev/sdb - 1003 GB / 935 GiB - CHS 122062 255 63 Partition Start End Size in sectors
structure: Ok.
romsk 15/05/2007 01:29 Auteur :
Réponse le :
Message :
t'as bien fais ?search
xorglos 15/05/2007 02:14 Auteur :
Réponse le :
Message :
c'est en cours, 66%
et hop résultat pas très encourageant apparemment:
Disk /dev/sdb - 1003 GB / 935 GiB - CHS 122062 255 63Partition Start End Size in sectors
Structure: Ok.
Disk /dev/sdb - 1003 GB / 935 GiB - CHS 122062 255 63
Partition Start End Size in sectors
No partition found or selected for recovery
romsk 15/05/2007 07:25 Auteur :
Réponse le :
Message :
xorglos a écrit :

bon, alors les modifs faites ça donne:
Disk /dev/sdb - 0 B - CHS 0 255 63Current partition structure:Partition Start End Size in sectors


Invalid NTFS boot1 P HPFS - NTFS 0 1 1 122061 254 62 1960925966

1 P HPFS - NTFS 0 1 1 122061 254 62 1960925966
Bad relative sector.No partition is bootable

search ne l'a pas retrouvée, mais la partition que tu cherches est apparemment celle ci : va sur le menu analyse > proceed > tape "A" (si ça apparait bien en bas) et rentre successivement les valeurs suivantes : * cylinder : 0* head : 1* sector : 1* cylinder : 122061* head : 254* sector : 63* type : entrée > entrée > 07 > entrée > done > fleche droite gauche pour mettre cette partition en "P" > write ou OK > menu analyse > proceed : copie d'écran (ne ferme pas testdisk)






xorglos 15/05/2007 13:36 Auteur :
Réponse le :
Message :
c'est parti 
Disk /dev/sdb - 1024 B - CHS 2 1 1Partition Start End Size in sectorsP HPFS - NTFS 1 317 317


Structure: Ok. Use Up/Down Arrow keys to select partition.Use Left/Right Arrow keys to CHANGE partition characteristics:*=Primary bootable P=Primary L=Logical E=Extended D=DeletedKeys A: add partition, L: load backup, T: change type,Enter: to continue162 KB / 158 KiB




par contre retour analyse/proceed, faut faire le write?
Write partition table, confirm ? (Y/N)
romsk 15/05/2007 17:49 Auteur :
Réponse le :
Message :
xorglos a écrit :

Disk /dev/sdb - Partition Start End Size in sectorsP HPFS - NTFS 1 317 317
1024 B - CHS 2 1 1

entre temps tu as perdu la bonne geométrie... donc dans l'ordre, et sans fermer testdisk :1) remettre la bonne geometrie : 122062 255 632) puis aller dans le menu analyse créer la bonne partition...3) puis aller dans le menu advanced vérifier le secteur de boot : copie d'écran sans fermer testdisk 



xorglos 15/05/2007 17:57 Auteur :
Réponse le :
Message :
ok, j'en suis là ds le menu analyse:
Disk /dev/sdb - 1003 GB / 935 GiB - CHS 122062 255 63
Partition Start End Size in sectors
1 P HPFS - NTFS 0 1 1 122061 254 63 1960925967

[ Quit ] [Search! ] [ Write ]
Faut-il faire le write avant de filer ds le menu advanced?
romsk 15/05/2007 21:37 Auteur :
Réponse le :
Message :
oui, tout à fait
xorglos 15/05/2007 21:43 Auteur :
Réponse le :
Message :
ok... voilà pour le secteur de boot:
Disk /dev/sdb - 1003 GB / 935 GiB - CHS 122062 255 63Partition Start End Size in sectors1 P HPFS - NTFS 0 1 1 122061 254 63 1960925967

Boot sectorntfs_boot_sector: Can't read boot sector.Status: Bad

Backup boot sectorntfs_boot_sector: Can't read backup boot sector.Status: Bad

Sectors are identical.
A valid NTFS Boot sector must be present in order to accessany data; even if the partition is not bootable.
[ Quit ] [ List ] [Rebuild BS][Repair MFT][ Dump ]Return to Advanced menu
Parti pour un coup de rebuild?
romsk 15/05/2007 22:18 Auteur :
Réponse le :
Message :
vi... (c'est bien une partition principale unique que tu avais, pas une partition logique ?)
xorglos 15/05/2007 22:22 Auteur :
Réponse le :
Message :
oui une principale
romsk 15/05/2007 23:01 Auteur :
Réponse le :
Message :
alors go pour le rebuild BS > et fais bien "list" pour voir si t'accèdes à tes données avant de faire "write"...
xorglos 15/05/2007 23:13 Auteur :
Réponse le :
Message :
euh là il est parti pour un marathon
Disk /dev/sdb - 1003 GB / 935 GiB - CHS 122062 255 63Partition Start End Size in sectors1 P HPFS - NTFS 0 1 1 122061 254 63 1960925967


Search mft 4792800/1960925967
la suite au prochain numéro 
Bon c'était super long, j'ai arrêté bien avant la fin (ça risque de prendre la semaine).
Sinon, avec ptedit32, on trouve les infos suivantes:
MFT Start Cluster: 786432
MFT Mirror Start Cluster: 122557872
Sachant que j'ai stoppé le search mft ds les 2000000 au bout de 6h, testdisk n'a apparemment pas trouvé le 1er mft. D'ou la question, est-il possible de squeezer la semaine de rebuild mft via testdisk, en allant directement voir ce qui se passe au cluster mirror?
sinon tanpis, je relancerais un rebuild
romsk 16/05/2007 08:27 Auteur :
Réponse le :
Message :
effectivement 1 To c'est beaucoup : rebuild BS risque de te prendre la semaine, et sans garantie de résultat... donc 2 solutions :* soit tu t'armes de patience pour voir ce que donne rebuild BS, * soit on essaye de bidouiller le secteur de boot en cherchant manuellement la MFT, mais là encore sans garantie de résultat car d'autres éléments interviennent tel par exemple le nombre de secteur par cluster (ce qu'on ne maitrise pas) : recherche la MFT comme indiqué au paragraphe 3 

ICI
xorglos 16/05/2007 21:40 Auteur :
Réponse le :
Message :
Je me la joue patience, vu que j'avais déjà essayé le 3), mais ça dépasse pas le secteur de boot pour la recherche... le C/H/S affiché étant de 0/1/1, ça semble logique... à moins que j'ai raté un épisode
romsk 16/05/2007 22:49 Auteur :
Réponse le :
Message :
xorglos a écrit :j'avais déjà essayé le 3), mais ça dépasse pas le secteur de boot pour la recherche...

dans ce cas, il faut faire la recherche en sélectionnant "disque physique" en bas et non "lecteur logique" en haut...
amadeustar 17/05/2007 21:15 Auteur :
Réponse le :
Message :
Eh non je ne suis pas mort !! Désolé pour ce "trou" sans réponses de ma part mais j'étais en déplacement, et je re pars demain soir. J'ai donc beaucoup de mal à m'investir sur ce sujet. Mais tant pis pour moi personne ne le fera à ma place ;o)
Je reviens donc après avoir exécuté ce que tu m'avais conseillé, et voici les screens adéquats :
 



J'attend donc ton approbation avant de fermer TestDisk puis de rebooter. Encore désolé pour ma disparition durant une semaine. Et si ça marche je t'offre une bonne bouteille + une autre pour me faire pardonner !! ;o)
romsk 17/05/2007 21:49 Auteur :
Réponse le :
Message :
tout est bien sauf ta partition système que tu as mis en "P" au lieu de "*" : ça démarrera pas comme ça... donc retourne dans analyse > proceed > mets toi sur systeme > fleche droite gauche pour la mettre en "*" > write > ferme testdisk et va voir ce que ça donne sous windows... ("divers" a un backup BS qui est bad mais ça ne devrait pas gêner la récup...)
(PS : c'est moi qui maintenant part pour une semaine : donc à vendredi prochain si besoin, sauf si je trouve un ordi là où je vais...)
amadeustar 17/05/2007 23:22 Auteur :
Réponse le :
Message :
J'ai redémarré (ouf !! ;o) et j'ai effectivement accès à mon disque "DIVERS" ! Tu n'imagines pas ma joie. Par contre c'est raté pour le disque "APPLICATIONS". Je n'ai donc plus accès qu'à mon système.
Pour l'instant ce n'est pas grave, je suis en ce moment même en train de copier tout le disque "DIVERS" sur un disque amovible. Ensuite je vais retélécharger TestDisk puis l'installer sur "SYSTEME" cette fois-ci. Pour finir je pourrais récupérer tous mes disques avec ton aide.
Inspico 19/05/2007 05:16 Auteur :
Réponse le :
Message :
Bonjour,
Voici mon probleme :
J'ai decouvers ce soir que deux de mes partitions avaient disparut, donc un disque dur endomagé (Ca fait toujours plaisir a voir è_é)...

C'etait des partitions que j'avais deja retrouvé il y a quelques temps avec le logiciel testdisk lorsque ma carte raid avait pris les disques durs pour faire sa manip toute seule. J'avais tout bien retrouvé et la vie continuait tout bien dans le meilleur des mondes. Je ne pense pas que cet ancien incident soit lié a mon probleme mais cela expliquera le mbr du disque.
Donc j'ai lancé le logiciel testdisk pour voir si je pouvais rereparer ca un peu comme la derniere fois...

Cette fois je demande a faire une analyse, et premier avertissement : "Partition sector doesn't have the endmark 0xAA55", bon ca commence bien.

Apres l'analyse -> "No partition available" je continue en voyant une analyse en profondeur des cylindres sans succes non plus.

En cherchant dans le forum je vois qu'il faut alors tenter le menu advanced pour faire un rebuild bs (?), donc je vais voir dans le menu Advanced et la il me ressort -> "No partition available".

Une fois encore j'ai vu dans un sujet que la personne demandais d'aller voir le mbr avec Editexa.
Donc voici ce que j'obtiens avec ce logiciel (a partir de la je ne sais pas trop quoi faire ~~).
[AD]
Techniquement vu que j'ai pas retoucher au disque dur depuis la decouverte, je suppose que les données dessus sont intactes.
Je m'en remets a vous et j'espere que vous saurez quoi faire pour pouvoir m'aider, car je me vois un peu perdu la.
Merci d'avance.
Edit : Apres un redemarrage cet aprem la partition est revenue ... Hum je ne sais pas trop quoi penser la é_è
xorglos 20/05/2007 16:12 Auteur :
Réponse le :
Message :
Re bonjour!
Bon j'ai laissé tourner quatre jours déjà, et il en est au quart...
Mais comme il a passé en théorie les deux endroits ou devaient se trouver les deux mft, ma question est la suivante: donne t'il le résultat dès qu'il est sensé trouver (auquel cas je peux arrêter de suite), ou bien faut il attendre la fin de la recherche?
romsk 21/05/2007 14:25 Auteur :
Réponse le :
Message :
inspico, ton MBR n'est pas normal et a apparemment été refait par testdisk : t'as utilisé MBRcode dans testdisk ? ceci dit vu que ta partition est retrouvée c'est que ton MBR est fonctionnel... en fait t'en es où ? ton problème est-il résolu compte tenu que ta partition est réapparue ?
amadeustar, dès que tu as tout récupéré et sauvegardé tes trucs dans divers, on remettra les descripteurs de partition comme ils étaient à l'origine et il te suffira de reformater l'espace "libre" de divers pour recréer ta partition...
xorglos, pour le rebuildBS j'en sais rien si il faut attendre la fin ou non... pour la recherche de MFT :
xorglos a écrit :j'avais déjà essayé le 3), mais ça dépasse pas le secteur de boot pour la recherche...

romsk a répondu :
dans ce cas, il faut faire la recherche en sélectionnant "disque physique" en bas et non "lecteur logique" en haut...
amadeustar 21/05/2007 15:46 Auteur :
Réponse le :
Message :
romsk a écrit :

, dès que tu as tout récupéré et sauvegardé tes trucs dans divers, on remettra les descripteurs de partition comme ils étaient à l'origine et il te suffira de reformater l'espace "libre" de divers pour recréer ta partition..
amadeustar
C'est bon j'ai tout récupéré, je t'écoute pour la suite.
romsk 21/05/2007 16:12 Auteur :
Réponse le :
Message :
le tout c'est de retrouver tous tes descripteurs tels qu'ils apparaissaient ici :

donc commence par faire analyse > proceed > +/- search pour voir si tu retrouves cette config, mais vu ce que cette manip te retrouvait au début que des partitions se terminant à 255 63, il y a de fortes chances que ça te refasse la même chose, dans quel cas, à partir de la fenêtre "proceed", il te faudra recréer toutes tes partitions par la touche "A" telles qu'elles figurent ci dessus (en ce qui concerne leurs coordonnées CHS) > fais bien attention, pour chacunes, aux "*", "P" ou "L" > write > ferme testdisk et redémarre, et ça devrait être bon...
amadeustar 21/05/2007 17:14 Auteur :
Réponse le :
Message :
Merci bcp cela a parfaitement fonctionné !! Mon offre pour une bouteille ou autre est toujours valable ;o) Contactes moi par MP si quelque chose peut te faire plaisir.
Merci encore !!
xorglos 21/05/2007 18:52 Auteur :
Réponse le :
Message :
Pour le 3, j'ai bien pris le physique en bas mais avec un c/h/s de 1/1/1 ça va pas loin... Même après un testdisk pour recadrer la géométrie... ça sent le paté cette histoire... d'autant plus que tout proceed, search ou autre rebuild bs ne donne que des seek error ds le fichier de log... donc quoi qu'on fasse, on n'arrive même pas à lire quoi que ce soit, hormis ce foutu premier bloc avec edithexa par exemple... ça ressemblerait plus à un pb hard non? (genre le controleur raid qui a fumé, mais dans ce cas on ne devrait pas retrouver la valeur 1960925966???)
Sinon pour info, les disques sont 4 maxtor maxline II 250Gb ATA 133 (on s'en fou en fait :o) )... donc voir si les histoires de nb de cylindres, heads et cie sont ok... la division donne bien 122062 mais est-on sur qu'il ne fasse pas baisser ou monter un poil cette valeur pour éviter les seek error?
cgrenier 22/05/2007 20:22 Auteur :
Réponse le :
Message :
romsk a écrit :

le tout c'est de retrouver tous tes descripteurs tels qu'ils apparaissaient ici :

donc commence par faire analyse > proceed > +/- search pour voir si tu retrouves cette config, mais vu ce que cette manip te retrouvait au début que des partitions se terminant à 255 63, il y a de fortes chances que ça te refasse la même chose, dans quel cas, à partir de la fenêtre "proceed", il te faudra recréer toutes tes partitions par la touche "A" telles qu'elles figurent ci dessus (en ce qui concerne leurs coordonnées CHS) > fais bien attention, pour chacunes, aux "*", "P" ou "L" > write > ferme testdisk et redémarre, et ça devrait être bon...

C'est une table des partitions créés sous Vista, Microsoft n'aligne plus les partitions sur les cylindres mais sur des multiples de 1 Mo. Utilise la toute dernière version, et dans le menu Options, met "Allow partial last cylinder : Yes" sinon la dernière partition ne sera peut-etre pas récupérée. Cela évitera de devoir recréer les partitions une à une ou bien de devoir mettre "Cylinder boundary: No". TestDisk 6.7-WIP
penpex 22/05/2007 21:50 Auteur :
Réponse le :
Message :
Bonjour, après une dizaine d'heures de recherches et d'apprentissages (MFT, MBR, structure d'un disque...etc), et la consultation de plusieurs forums, je tombe enfin içi alors que je commençais réellement à perdre espoir!!! romsk fait vraiment un travail formidable !!!(à ce que j'ai lu des 4 premieres pages et des 2 dernières)
Voilà ma situation, petit résumé des faits :
En copiant des fichiers d'une partition à une autre de mon disque système (il en a 2, une de 128 Go et l'autre de 27 je crois, la deuxième ayant été créé aprés l'installation de windows grâce à gparted) une erreur survient juste à la fin de la copie "impossible de supprimer le dossier" puis aussitôt une notification dans une info-bulle avec "$MFT... écris dedans et je ne me souviens plus tres bien, puis reboot! Et au démarrage : "erreur lors du chargement du systeme d'explotati" (pas de "on" à la fin...) En allant dans la console de récupération depuis le cd d'install je ne peux faire ni dir, ni cd, et un chkdsk /p /r finit par m'indiquer que le disque comporte peut-être des erreurs irrécupérables...je lance alors un live-cd knoppix et voici le resultat que j'obtiens en cliquant sur la partition : Impossible de monter le périphérique. L'erreur signalée est : mount: I could not determine the filesystem type, and none was specified (pour la seconde partition j'ai encore eu droit à $MFT....et puis "NTFS is inconsistent" et "faites un chkdsk /f sur windows" (en anglais)) Pour finir dans QTparted (logiciel gérant les partitions sur le live-cd) le type de ma partition système est "unknown" Je retourne dans le cd d'install de windows puis je fais installer windows pour voir mes partitions, et la la partition est de type Inconnu. L'autre est bien là mais je la supprime. (elle ne contenait quasiment rien). En revenant cette fois dans gparted, là aussi le type de fichiers est Inconnu..(il le reconnait tout de même comme bootable apparemment puisqu'il est indiqué : Marqueur boot) 









En faisant un j'obtiens :fdisk
Périphérique Amorce Début Fin Blocs Id Système/dev/hda1 * 1 16708 134206978+ 7 HPFS/NTFS
Me voilà à moitié rassuré, enfin un logicel qui reconnaît ma partition comme étant NTFS.
Juste après je découvre testdisk et que je tombe chez les astuciens!
Après avoir lu 3 fois plutôt que 2 l'incroyable tuto de romsk je lance et voici ce que j'obtiens :testdisk
Tout d'abord dans : Analyse
Disk /dev/hda - 164 GB / 153 GiB - CHS 20023 255 63Current partition structure: Partition Start End Size in sectorsInvalid NTFS boot 1 * HPFS - NTFS 0 1 1 16707 254 63 268413957 1 * HPFS - NTFS 0 1 1 16707 254 63 268413957




Déja c'est bizarre que la même partiton apparaisse deux fois non? (remarque mineure : le annocait une fin à 16708 et ici à 16707 mais comme il à l'air de commencer à 1 et içi à 0...j'ai bon?)fdisk
Après proceed :
Disk /dev/hda - 164 GB / 153 GiB - CHS 20023 255 63 Partition Start End Size in sectors* HPFS - NTFS 16708 0 1 20022 254 63 53255475

Là c'est la deuxième partition que j'ai supprimée qu'on retrouve mais je note que comme chez la première personne que tu as aidée (page 1) la partition principale a disparu...De plus je ne fais pas Entrée car je ne sais pas ce que dois mettre devant : * ou p ou autre chose?
butch001 HPFS - NTFS
J'ai quand même tenté de faire P pour lister les fichiers (il est censé y avoir les 15 fichiers que j'avais tenté de déplacer avant que ça ne plante) et là il apparait : erreur de segmentation, peut etre un rapport avec l'erreur MFT signalée au début ? Toujours est-il que je quitte, ce n'est pas dramatique si je ne récupère pas cette partition ne contenant que 15 fichiers (4 Go tout de même...) et je ne veux pas faire n'importe quoi...
Enfin quand je vais dans> (sur la partition principale après avoir fait AdvancedBootQuit ) j'obtiens:
Disk /dev/hda - 164 GB / 153 GiB - CHS 20023 255 63 Partition Start End Size in sectors 1 * HPFS - NTFS 0 1 1 16707 254 63 268413957Boot sectorStatus: BadBackup boot sectorStatus: OKSectors are not identical.A valid NTFS Boot sector must be present in order to accessany data; even if the partition is not bootable.[ Quit ] [Backup BS] [Rebuild BS][ Dump ] Return to Advanced menu
















Je remarque que je n'ai pas (mais j'ai déjà vu page 3 ou 4 de ce thread quelqu'un qui n'avait pas ça et dont la MFT était bonne)repair MFT
Voilà le rapport le plus complet que je pouvais faire (ouf, c'est long quand même!!)
Je souhaiterais maintenant un avis sur ce que je dois faire car sur cette partition il y a 110 Go de données! (Oui je sais, c'est pas bien, faut faire des partitions systèmes! bouh! je le ferai plus la prochaine fois, promis!) Je pense qu'il va falloir tenter  Backup BS non?J'attends les conseils d'un expert!!
Merci d'avance!
P.S. : je tiens à préciser que je n'ai trouvé référence sur le web qu'un seul cas de personne ayant une partition en unknown et qui avit réussi à recouvrer sa partition NTFS en utilisant Bootit NG : et en faisant delete puis undelete sa partition... si quelqu'un en sait plus à ce sujet, je suis preneur car j'ai vu pas mal de solutions avant de tomber sur testdisk qui semble le recours ultime, mais ces utilitaires ont l'air de marcher 1 fois sur 2 et personne ne sait trop comment donc j'ai préféré ne pas prendre de risque...http://www.terabyteunlimited.com/bootitng.html
Ah oui! si on pouvait me préciser quand est-ce que testdisk réelement sur le disque pour que je sache quand je risque vraiment quelquechose (j'ai peur de tout perdre définitivement!!!) écrit 
Edit :(encore une question, c'est la derniere cette fois!) Est-ce que RAW c'est pareil que Inconnu comme système de fichiers ?
xorglos 23/05/2007 16:50 Auteur :
Réponse le :
Message :
Bon j'y vois plus clair...
Un démontage de la bête et hop, une alim de la carte raid (alimentant l'un des disques) a fumé...
Donc à priori, les disques sont ok, "reste plus" qu'à trouver une carte de remplacement... MAlheureusement, c'est du spécifique, donc je verrais bien chez Lacie ce que ça donne...
En tout cas grand merci à Romsk pour sa contribution
penpex 23/05/2007 19:30 Auteur :
Réponse le :
Message :
En attendant une réponse je me suis lancé dans ptedit pour essayer de diagnostiquer ce qui est réellement défaillant. Comme je suis sous un live-cd knoppix je suis donc sous linux j'ai eu un mal fou à faire fonctionner ptedit qui ne voulait pas se lancer en version ptedit32 (erreur dans wine : error #5 failed to launch powerquest's ptedit (c'est pas exactement ca mais un truc comme ca...), ni en version ptedit (la il ne se passait rien...) je suis heureusement tombé ici et du coup j'ai pu booter sur une disquette avec ptedit!!! malheureusement j'en suis réduit à faire des photos de mon écran!!!http://www.pcguide.com/vb/showthread.php?t=52472
Voilà le résultat

J'ai remarqué que le n'était reconnu que 131 Go soit 128 Go réels c'est le premier de tout ces utilitaires à ne voir que ça...peut etre que c'est une ancienne version qui ne gere pas les diques de plus de 128 Go (je ferai remarquer que la taille de ma partition fait cette taille la parce que windows ne pouvait pas reconnaître de disque plus grand car ce n'était pas le sp2...que je ne voulait pas installer) drive1
Sinon pour NTFS ça a l'air bon vu que c'est 07 non?
Voilà pour les dernières informations!
En attendant une réponse sur ce que je peux faire!
Edit :Quand je clique sur 07, boot sector n'est pas grisé, mais quand je vais dessus ca ne fait rien, ce qui revient au même! Je pense que je vais devoir faire un BackupBS mais je voudrais savoir si quand on fait un BackupBS il y a une fonction"lister cles fichiers" comme après RebuilBS (selon tes tutos) pour être sur de ne pas faire n'importe quoi?
Quoi qu'il en soit j'attends tes conseils! 
lkynkaid 24/05/2007 10:08 Auteur :
Réponse le :
Message :
Bonjour a tous,
Que dire excepte que je viens de decouvrir les joies de la recuperation de disque, a mon insu (de mon plein gre) bien sur.
Cependant, cela me rassure de voir des personnes qui maitrisent le sujet, et surtout l'aide de Romsk.
J'ai suivi certaines etapes presentes sur ce thread, et je me permet de vous demander votre aide.
Apres une recherche, j'obtiens cela :

Si je lui demande de lister les fichiers :

Quand je valide, j'obtiens cela :

Et il me repond :

Si je regarde le mbr :

Tetu, je regarde l'etat du MFT :

Si vous avez des idees, ca m'aiderait beaucoup.
Merci a tous
romsk 25/05/2007 21:05 Auteur :
Réponse le :
Message :
salut , et content de te voir passer par là mettre "allow partial last cylinder" sur yes aurait donc pu suffire à faire réapparaitre normalement la dernière partition dans son cas ? on se méfiera de vista la prochaine fois... C.grenier
content pour toi amadeustar(mais si don à faire, c'est à C.grenier qu'il faut l'envoyer )
dont acte pour le problème matériel (on y pense jamais assez...), et bonne chasse pour retrouver une carte compatible xorglos(ou sinon les mettre en interne sur une autre carte raid ?)
salut et bravo pour tes explications détaillées...vu ce que te montre testdisk, c'est effectivement "" qu'il faut faire et qui devrait régler ton problème (backup BS > write > ferme testdisk et redémarre le PC). pour tes autres questions : non ça n'écrit rien d'autre que le secteur de boot, donc pas de risque pour tes données. le repair MFT n'apparaitra qu'après backup BS mais ne te concerne pas (pas encore en tout cas). non, une partition "inconnu" n'est pas forcément raw, mais raw peut parfois apparaitre comme inconnu...penpex
backup BS
salut , tu as donc une seule partition de 230 Go sur ce DD de 300 Go ?ton cas est exactement le même que celui de zud et de bok (voir ) : j'ai bien peur qu'il ne te faille passer par les (j'ai pas encore trouvé comment résoudre ces "filesystem seems damaged" et "MFT and MFT mirror are bad"...) (peux-tu quand même afficher ce que montre edithexa quand tu recherches MFTmirror (comme indiqué paragraphe 3 ) ainsi que "boot record" quand tu lances PTEDIT ?)lkynkaid

ICIlogiciels de récupérationICI
penpex 25/05/2007 21:12 Auteur :
Réponse le :
Message :
Bon voilà une dernière image du secteur de boot et de son Backup, ils ne sont pas identiques (comme prévu) mais quand même il n'y a pmême pas 5% pareil...enfin tu dois mieux savoir interpréter ça que moi romsk : 
 
En attendant, j'ai également peut-être trouvé la raison qui m'a fait passer ma partition en mode Inconnu : le fait que windows XP ne gère pas par défaut les disquessupérieurs à 128 Go (il ne voyait que 128 Go sur les 160 à l'époque, c'est ce qui m'avait forcé à faire une partition de 128 Go et la modification de la base de registre EnableBigLba n'avait pas fonctionné (alors que mon Bios le voit...) Et du coup quand j'ai copié cesf ichiers, ça a dépassé les 128 Go (mais bon j'avais déjà mis un fichier dessus une fois...) et selon ce lien : http://www.bellamyjc.org/fr/theoriemultiboot2.html#128Go
Voici ce que dit (un des premiers fabricants de disques de capacité > 128 Go) à ce sujet :Maxtor
En raison de limitations dans Windows et de nombreux types de BIOS système, partitionner et formater des disques durs plus grands que 137 Gigaoctets sans le support adéquat de pilotes ou d'un contrôleur CAUSERA DES PERTES DE DONNEES lorsque la capacité au delà de la barrière des 137 Go sera utilisée.
Encore donc (peut-être) une possibilité parmi les nombreuses existantes de masssacrer une partition..
penpex 25/05/2007 21:16 Auteur :
Réponse le :
Message :
Ah! merci pour ta réponse romsk, j'étais en train de poster , est-ce que ca confirme tes indications?
Edit : Et alors est-ce qu'on peut faire lister les fichiers après un backupBS ? (c'est pour savoir car même si on peut pas je le ferais quand même vu que c'est la seule solution, mais bon c'e serait plus sur!)
romsk 25/05/2007 22:21 Auteur :
Réponse le :
Message :
non, je crois bien que c'est qu'après rebuild BS que tu peux faire list... mais pas d'importance.(quant à ton secteur de boot, il est effectivement bien daubé : fais vite le backup BS...)
penpex 25/05/2007 22:44 Auteur :
Réponse le :
Message :
Ouais !!! j'ai fait Backup BS et sous linux je peut monter le disque même si j'ai un message WARNING: Dirty volume mount was forced by the 'force' mount option. Et là j'ai accès à mes fichiers!!! 
Mais maintenant, j'ai peur (comme je l'ai lu 3 ou 4 fois ici) que Windows me fasse un et efface tout!!! chkdsk
C'est pour cela que je voulais savoir si dans quand on fait , ca fait quoi? parce que c'est marqué en légende, alors on peut voir si elle est ok? (auquel cas je me sentirais rassuré) ou alors ca la répare tout de suite???Advanced>Bootrepair MFTcheck MFT
penpex 25/05/2007 23:35 Auteur :
Réponse le :
Message :
En fait la joie est un peu retombée : lorsque j'ai regardé mes fichiers sous linux la première fois, en fait en regardant de plusprès, il manque plein de dossiers et de fichiers un peu partout...je me dis c'est peut être l'erreur de montage signalée plus haut...je reboot, (mais sur le live-cd hein!!!) et la il me voit plus de fichiers qu'avant (étrange...) mais bon il en manque encore un paquet! et le truc louche c'est qu'en fait les fichiers qui manquent sont les fichiers qui sont dans les répertoires ou il n'y aplus de répertoires "pour descendre plus bas" en fait dans les répertoires ou il y a un ou plusieurs répertoires et des fichiers, les fichiers sont là...
C'est donc la MFT qui doit être un peu charcutée, d'où ma question est-ce que quand on fait (ce qui risque fortement d'être le cas!) on nous propose de la réparer avant de la réparer???repair MFT
Je vais aussi essayer le cd d'install de windows pour voir si on voit les fichiers (vu que linux semble avoir un peu déconné...), mais je voudrais savoir si ce cd sur le disque ou pas... (toujours pour les mêmes raisons) parce qu'il charge plein de fichiers, des pilotes...etc écrit
Merci et bonne nuit! (dodo maintenant...)
romsk 26/05/2007 11:19 Auteur :
Réponse le :
Message :
penpex a écrit :

Je vais aussi essayer le cd d'install de windows pour voir si on voit les fichiers (vu que linux semble avoir un peu déconné...), mais je voudrais savoir sur le disque ou pas...
si ce cdécrit
de quel CD tu parles ? de toute manière, qu'il s'agisse du CD d'XP ou d'un CD linux, ils n'écrivent rien sur le DD car tout ce qu'ils chargent est mis et pas sur le DD...pour ce qui est du repair MFT, c'est pas maintenant qu'il faut le faire... (quant au check MFT versus repair MFT j'ai pas la réponse : c'est à C. Grenier qu'il faudrait la poser...)si t'as peur du chkdsk, fais les choses par étapes :1) sauvegarde tout ce que tu peux sous linux (en mode graphique) sur un autre DD2) puis utilise ddrescue (toujours sous linux) pour faire une copie de sauvegarde de ton DD daubé sur un DD sain, 3) puis reboot sous windows et fais un chkdsk sur ton DD daubé : si ça marche t'as tout gagné, si ça t'efface plein de "fichiers orphelins" t'auras toujours la copie faite avec ddrescue pour tenter les logiciels de récupérationen mémoire




penpex 26/05/2007 11:32 Auteur :
Réponse le :
Message :
Ok, merci pour ces conseils, je vais donc me procurer un autre disque dur et essayer ça (au final j'ai regardé, ça fait 70 Go de disparu tout de même!)
Et je parlais du cd de windows en fait (parce qu'avec windows faut se méfier!)
Sinon je vais poser la question à C. Grenier pour la MFT et puis je vais essayer de voir ce que fait exactement un chkdsk quand à la MFT et sa sauvegarde...
Je vais aussi regarder du coté des points de restauration pour voir si ca peut faire queque chose (m'enfin ça m'etonnerait beaucoup qu'ils checkent la MFT...puisqu'ils sont censés conserver seulement les fichiers système si je ne me trompe...)
romsk 28/05/2007 12:44 Auteur :
Réponse le :
Message :
j'ai mis à jour le tutoriel en 1ère page :* en donnant le lien de la dernière version 6.7 de testdisk* en détaillant certaines commandes utiles que j'avais précédemment omis (notamment le listing des fichiers et répertoires et leur éventuelle sauvegarde)* et en précisant certains cas de figure fréquents (vérification boot sector dans le menu advanced, modification de geométrie,...)


bon courage à tous...
penpex 28/05/2007 17:24 Auteur :
Réponse le :
Message :
Voyant que tu viens de réactualiser ton tuto, tu pourra peut-être y ajouter quelque chose ou du moins le garder pour ta "culture testdiskienne personnelle", ayant posé la question à Christophe Grenier, voilà ce que fait repair MFT :
"TestDisk va essayer de lister les fichiers à partirde la MFT puis à partir de MFTmirror, il compare les2 résultats. Si MFT et MFTmirror sont différents et l'undonne de meilleurs résultats, alors TestDisk proposede l'utiliser pour réécrire l'autre."



Sinon pour mon problème, étanbt trop impatient d'attendre l'arrivée du nouveau DD, j'ai fait un chkdsk en croyant que ca ne ferait rien sur ledisque lui même à part mettre les éventuels secteurs défectueux de côté, mais apparemment j'étais mal renseigné puisque ça a fait quelque chose : réapparaître (sous linux) 98 % de mes fichiers!!! Finalement il n'a pas tout bousillé! (il manque quand même encore 4 Go, et aussi incroyable que cela puisse paraître les fichiers que j'avais copié sur l'autre partition sont toujours là...)Mais je viens de voir à l'instant les modifs de ton tuto et notamment la possibilité de copier les fichiers visibles sous testdisk, j'aurais bien voulu voir ce que je pouvais faire sous testdisk avant de faire ce chkdsk, 'fin bon je vais attendre de pouvoir faire une image de la partition avant de bricoler encore (l'essentiel est tout de même sauf!) mais je garde espoir pour ces 4 Go! 

romsk 28/05/2007 19:11 Auteur :
Réponse le :
Message :
penpex a écrit :

...voilà ce que fait
repair MFT :
"TestDisk va essayer de lister les fichiers à partirde la MFT puis à partir de MFTmirror, il compare les2 résultats. Si MFT et MFTmirror sont différents et l'undonne de meilleurs résultats, alors TestDisk proposede l'utiliser pour réécrire l'autre."



ça je savais , mais ce n'étais pas la question que tu m'avais posée, à savoir "...dans Advanced>Boot quand on fait repair MFT, ca fait quoi? parce que ???" c'est marqué check MFT en légende, alors on peut voir si elle est ok? (auquel cas je me sentirais rassuré) ou alors ca la répare tout de suitec'est la réponse à cette question qu'il aurait été intéressant d'avoir 
pour le reste, ton impatience aurait pu te coûter cher (en pertes de données), mais content pour toi que le chkdsk se soit bien terminé pour les 4 Go qui manquent à l'appel, j'ai bien peur cependant que le chkdsk effectué ne permette pas d'aller plus loin sous windows ou linux, sauf à passer par les logiciels de récupération mais qui vont te retrouver également tout ou partie des fichiers déjà récupérés et qu'il va te falloir trier...mais comme tu dis, l'essentiel est sauf 


penpex 02/06/2007 16:17 Auteur :
Réponse le :
Message :
Enfin! j'ai utilisé pour sauvegarder mes données sur mon nouveau dd (malgré quelques problèmes c'est fait!), j'ai donc pu tester le dessus, résultat : je vois bien mes fichiers et ayant vu ce qu'il a fait dans le log du chkdsk, à savoir remplacé plein de fichiers du systeme 32, et aussi supprimé environ 300 Mo de fichiers, je me dis que c'est bon et je tente sur le dd principal, ca se passe bien, il me dit qu'il a corrigé quelques erreurs, je verifie que les données sont la, elles y sont, et je reboote et la...rien, le systeme s'arrete sur l'écran juste apres le bios ou on voit des indormations sur les disques branchés la ram etc...avec le message habituel qu'on a à peine le temps de voir normalement vu que ca demarre tout de suite apès : sauf que la ben...il s'arrete la...ddrescuechkdsk /P /RVerifying DMI pool data,
D'apres tes tutos que j'ai lu ce serait la MBR qui serait endommagée ('fin le code executable) c'est bien ca? Un sous la console de récupération règlerait le problème alors?fixmbr
Ce que je me demande quand même c'est que si elle avait été endommagée, il n'y aurait pas eu le message que j'avais eu, non?Erreur lors du chargement du systeme d'exploitati
A moins que ce ne soit le chkdsk qui ait fait ca???
J'attends donc une confirmaation pour le (de toutes facon windows demande avant de remplacer la MBR non?)fixmbr
Sinon j'ai trouvé (à 99% sûr) l'origine de mon problème que tu pourras rajouter à une liste dans un de tes tutos : Mon bios ne supporte pas les disques durs supérieurs à 128 Go et même avec les modifications de la base de registre dans windows si on écrit apres les 128 Go il y a de gros risques de pertes de données (dixit microsoft lui-même).
Et en fait linux peut voir les disques dur en entier parce qu'il ne passe pas par le bios pour detecter les peripherique IDE apparemment (j'ai lu ca...)
C'est quand même rageant parce que sur le site du constructeur de ma carte mere, aucune des révisions du bios ne le permet, je suis condamné. Enfin bon, quand je changerais de pc, (c'est à dire bientôt puisqu'il a 5 ans celui la), ces gros disques durs ne seront pas de trop! 
romsk 02/06/2007 17:47 Auteur :
Réponse le :
Message :
comme tu le suggères, j'opterai pour un (de toute manière tu risques pas grand chose si t'as pas de multi-boot) et profites en pour faire un pour ton bios tu es, je pense, comme tous ceux qui ont un bios de plus de 1 an (à qqch près), c'est à dire que le comptage des secteurs des DD dans le BIOS est codé sur , ce qui explique que les BIOS ne reconnaissent pas les DD > 137 Go (268 435 456 secteurs x 512 octets = 137 Go), mais au-delà il suffit habituellement de bidouiller la BdR pour activer le mode LBA-48 bits et voir ainsi les DD plus gros : bizarre que dans ton cas ça ne marche pas, car pour moi y'a pas de raison... (t'as bien installé SP1 ou 2 ?)fixmbrfixboot
28-bits
penpex 02/06/2007 17:52 Auteur :
Réponse le :
Message :
Ok je vais donc tester , mais je vois pas trop pourquoi ???(je ne sais pas ce qu'il fait mais mes 2 sectuers de boot ont l'air bon sous testdisk...)fixmbrfixboot
Pour mon bios je pense qu'il ne gere pas le mode lba-48 bits donc c'est mort...(et je ne sais pas si j'ai le sp1 ou pas...la honte)
Edit : Ca ne te semble donc pas louche que la MBR soit morte et que j'ai quand même eu le message d'erreur au tout début???
romsk 02/06/2007 17:59 Auteur :
Réponse le :
Message :
...je vois pas trop pourquoi fixboot ??? t'as raison mais tu risques pas grand chose...
Pour mon bios je pense qu'il ne gere pas le mode lba-48 bits donc c'est mort... : je viens de t'expliquer le contraire : tu es à mon avis dans la situation de 95 % des gens qui eux, pourtant, peuvent accéder à des DD > 137 Go... c'est pour ça que je te disais que ton histoire est bizarre (p'têt que ta manip dans la BdR n'a pas réussi ? SP1 ou 2 ???)
Ca ne te semble donc pas louche que le MBR soit mort et que j'ai quand même eu le message d'erreur au tout début??? bof...
penpex 02/06/2007 18:08 Auteur :
Réponse le :
Message :
Bon, ne donne rien, je suis bon pour essayer fixboot? (avant je vais retourner sous testdisk vite fait pour voir...)fixmbr
Edit : tout a encore l'air normal sous testdisk, je le fais quand même?
penpex 02/06/2007 18:37 Auteur :
Réponse le :
Message :
Bon ben j'ai fait le fixboot et ca ne met toujours rien apres , la je sais plus trop quoi faire...verifying DMI pool data
As tu une autre idée???
(Moi qui croyais que ce serait fini une fois que j'aurais fait le chkdsk) 
romsk 02/06/2007 18:38 Auteur :
Réponse le :
Message :
bof... j'aurai tendance à dire que maintenant que t'as récupéré 98 % de tes fichiers (sic) tu ferais peut être mieux de reformater ce DD et réinstaller un XP tout beau tout propre > et quand tu viens de faire une nouvelle instal nickel t'en profites pour faire 1) une image de ta partition système toute belle que t'auras plus qu'à restaurer en cas de déboires ultérieurs, et 2) une sauvegarde de ton MBR et de tes secteurs de boot avec edithexa comme expliqué dans ma signature (que là encore tu pourras restaurer à la demande...)
penpex 02/06/2007 18:54 Auteur :
Réponse le :
Message :
C'est ce que j'étais en train de me dire aussi.
Et je voudrais ajouter en fait que j'ai sans doute retrouvé 100% de mes fichiers!
Je t'avais dit que je voyais apres le chkdsk des fichiers sous la console der récupération et que je croyais les avoir perdu (les fameux 4 Go) etbien en fait il ne s'agit sans doute pas du chkdsk mais le fait que ni linux ni testdisk ne gère les polices de caractères japonais!!! puisque j'avais aussi 7 ou 8 petits autres fichiers de ce type autre part et il n'apparaissaient pas non plus dans linux mais il apparaissent sous la console de récupération !!!
Si je ne trouve pas de solution dans les deux heures sui viennent je formate!
(c'est quand même con d'en être arrivé là...)
romsk 02/06/2007 19:10 Auteur :
Réponse le :
Message :
penpex a écrit :

Bon ben j'ai fait le fixboot et ca ne met toujours rien apres , la je sais plus trop quoi faire...
verifying DMI pool data
est-ce que t'arrives à booter sur un CD bootable ou une disquette bootable genre win98 ? ta partition système était bien active (*) sous testdisk ?
penpex 02/06/2007 20:36 Auteur :
Réponse le :
Message :
Ben oui je peux booter avec le cd et parcourir le disque, c'est bizarre! et il est bien marqué bootable sous testdisk.
T'as une idée?
Parce que plus j'y pense plus ca me fait ch*** de formater alors que ca doit être un tout petit truc de rien du tout maintenant.. mais bon on va pas y passer 3 mois non plus!!!
romsk 03/06/2007 02:14 Auteur :
Réponse le :
Message :
déréglage du BIOS ? va vérifier l'ordre de boot dans le bios et les différentes options inscrites,... et je dirais même plus : fais un ... ça peut pas faire de mal et ça résoudra peut être ton problème...
clear cmos
penpex 04/06/2007 13:39 Auteur :
Réponse le :
Message :
J'avais en effet entendu parler d'une telle solution sur d'autres forums, mais ne préférant pas trop faire jouou avec le bios j'ai decidé de voir ce que pouvais me faire dans le cd d'installation. Windows répare donc ce qu'il peut, le PC redémarre et la je vois l'écrand e chargement windows...et pui hop! reboot!, et ce en boucle infinie...Ayant cherché d'ou cela pouvait provenir et au vu de la multiplicité des causes (dont encore le bios...) je décide de réinstaller windows cette fois ci sur une partition système séparéé des données. Ca me fait mon petit décrassage annuel quoi !, et j'ai retrouvé mes données grâce au 500 Go (et même les 4 Go qui étaient en japonais invisibles sous linux...faudra que je me renseigne sur ça d'ailleurs...) donc tout va bien!!!réparer windows 
Au final j'ai du perdre 300 Mo de fichier... quasiment rien quoi! Par contre il y a un truc louche, tous les documents Word sont corrompus et ce même quand je les regarde sous linux, alors que je crois qu'avant le ddrescue ils étaient bons...mais bon j'ai des sauvegardes de tous ces documents sur clé USB donc c'est bon!!!
Tout est bien qui finit a peu près bien!
Merci donc pour toute l'aide que tu m'as apportée et au constructeurs des différents logiciels utilisés! 
Une dernière chose quand même, étant donné que mon problème semble être du à cette fameuse limite des 128 Go et que non je n'avais ni le sp1 ni 2 d'installé...(en fait j'avais du installer le sp1 ya longtemps mais j'avais du réinstaller windows depuis) c'est sans doute pour ça que ma manip n'a pas du fonctionner, je voudrais savoir si tu es sûr que n'importe quel bios (il va avoir 5 ans celui là) gère le LBA 48 et que ce n'est donc qu'un problème logiciel? Auquel cas je m'empresserais d'installer le sp2 (parce que j'ai lu que sous le sp1, des gens qui avaient fait la modif de la BdR avait vu la clé disparaître comme ca un jour sans prévenir...et avaient donc perdu leur partition...)
buldozer51 04/06/2007 18:38 Auteur :
Réponse le :
Message :
romsk au secours j ai lancer testdisk il a fini son skan j avait perdu deux partitions essentiel il me les a retrouver mais je sais pas quoi faire pour les remettre a leur place stp aide moi.
romsk 04/06/2007 21:57 Auteur :
Réponse le :
Message :
salut ,fais les copies d'écran de ce que montre proceed ainsi que la gestion des disques et dis nous quelles partitions tu as actuellement et lesquelles tu veux récupérerbuldozer
penpex, oui il faut absolument un service pack : le 2 si tu veux, mais tu ne risques ABSOLUMENT rien à mettre le 1...
buldozer51 05/06/2007 11:25 Auteur :
Réponse le :
Message :
re les amis c moi donc suite a mon probleme de partitions supprimer voila le details de testdisk.
TestDisk 6.5, Data Recovery Utility, October 2006Christophe GRENIER <>
grenier@cgsecurity.org
http://www.cgsecurity.org
Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63 Partition Start End Size in sectorsD HPFS - NTFS 0 1 1 19451 254 63 312496317D HPFS - NTFS 0 1 1 38911 254 63 625121217D HPFS - NTFS 19452 1 1 37867 254 63 295852977 [BACKUP]D FAT32 LBA 37868 1 1 38912 254 63 16787862 [RECOVER]




Structure: Ok. Use Up/Down Arrow keys to select partition.Use Left/Right Arrow keys to CHANGE partition characteristics:*=Primary bootable P=Primary L=Logical E=Extended D=DeletedKeys A: add partition, L: load backup, T: change type, P: list files, Enter: to continue



buldozer51 05/06/2007 11:40 Auteur :
Réponse le :
Message :
que dois je faire pour remettre la partitions recover a sa place ds mon dd
romsk 05/06/2007 13:48 Auteur :
Réponse le :
Message :
je t'ai demandé de nous montrer ta gestion des disques actuelle et de nous dire quelle partition tu as actuellement et lesquelles tu veux récupérer : y'a que recover que tu veux récupérer ? les autres tu t'en fout ? c'est un disque avec ta partition système ou un disque esclave de données ??? si t'en dis pas plus ça va être dur de t'aider... 
buldozer51 06/06/2007 10:42 Auteur :
Réponse le :
Message :
dites moi c quoi une gestion de disque et je vous montre en ce moment mon dd fonctionne comme ca :
c:/ recover
D:/ disque local
type ntfs capaciter 290go
moi ce ke je voulait c reprendre recover et backup de sur testdisk et remettre ca ds mon dd a leur place
romsk 06/06/2007 12:09 Auteur :
Réponse le :
Message :
bon ben c'est pas grave...
quand t'es sur ce tableau :
Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63Partition Start End Size in sectorsD HPFS - NTFS 0 1 1 19451 254 63 312496317D HPFS - NTFS 0 1 1 38911 254 63 625121217D HPFS - NTFS 19452 1 1 37867 254 63 295852977 [BACKUP]D FAT32 LBA 37868 1 1 38912 254 63 16787862 [RECOVER]




mets toi sur la 1ère ligne (D HPFS - NTFS 0 1 1 19451 254 63 312496317) > fleche droite gauche pour la mettre en "*" > puis mets toi sur la 3ème ligne () > fleche droite gauche pour la mettre en "P" > puis mets toi sur la 4ème ligne () > fleche droite gauche pour la mettre en "P" > write > va sur le menu advanced > mets toi sur la 1ère ligne > boot : copie d'écranD HPFS - NTFS 19452 1 1 37867 254 63 295852977 [BACKUP]D FAT32 LBA 37868 1 1 38912 254 63 16787862 [RECOVER] > et tu fais pareil pour les 2 lignes suivantes (backup et recover) > et tu laisses testdisk ouvert...
lkynkaid 06/06/2007 15:46 Auteur :
Réponse le :
Message :
Bonjour a tous,
Pour ma part, j'avais baisse les bras et j'ai tout formate, en recuperant avant les infos avec r-studio.
J'ai recree des partitions tel que
boot : 20Go : fat32
extended : perso : 100Go : NTFS ; pro : 100Go : NTFS
secours : 80Go : Ext3
La parition ext3 est montee sosu windows avec les docs critiques, parce que je sais que l'ext3, avant de ne pas pouvoir le recuperer, windows sera devenu un systeme fiable...
Je bosse et la tout d'un coup, mon event manager me dit "Uh Oh, raw partition detected".
Je suis en colere, limite faire mon metier avec un mac. Comment se convertisse les partitions en raw. J'ai bien compris que cela vient du catalogue ntfs (MFT) mais comment se corrompt il ?
Voici ma config :
Nx6325 sous Vista Business
Carte PCI Express Esata (sil3132)
Boitier Nexstar 3 sata
disque Barracuda 7200.9 SATA 300-GB
Si quelqu'un peut m'expliquer paske la, j'en perds mon cobol :)
romsk 06/06/2007 18:34 Auteur :
Réponse le :
Message :
lkynkaid a écrit :

... Comment se convertisse les partitions en raw. J'ai bien compris que cela vient du catalogue ntfs (MFT) mais comment se corrompt il ?...Si quelqu'un peut m'expliquer ...
ben si t'as la réponse tu nous la donnes 
zeyeti77 08/06/2007 19:46 Auteur :
Réponse le :
Message :
Bonsoir, après 2 nuits blanches passées a essayer de comprendre mon problème….je m’aperçois qu’il a l’air assez « courant » d’après tous les forums lus, mais que chacun est quand même un peu spécifique…alors je voudrai te demander ton avis sur le mien : DD Maxtor IDE 160 Go en slave, non partionné, soudainement devenu RAW !!
Impossible de récupérer les données ultra sensibles qui sont dessus, et qui risquent de faire perdre mon taf si je le retrouve pas……
Alors l’ordi peut bruler, les 2 disques aussi, l’OS aussi…je m'en fiche, mais je voudrai absolument ne pas faire de conneries pour récupérer mes fichiers qui n'ont pas de prix….J’ai lu beaucoup de forums la dessus, mais ne comprend pas tout. Après avoir éssayé CHKDISK, PTEDIT32, file recovery etc….j’en suis arrivé a la conclusion que TESTDISK pouvait me sauver a condition de comprendre ce que l’’on fait : Or j’ai un doute :Après la première analyse, j’ai :
Disk/dev/sdb – 163 GB / 152 GiB CHS 21175 240 63
Current partition structure :Warning : incorrect number of heads/cylinder 255(NTFS) ! = 240 (HD)
Et si c’est ca qu’il faut faire, qu’est ce qu’il faut faire après STP ?1* HPFS – NTFS O 1 1 21174 239 63 320165937Alors, d’après ce que j’ai lu, j’ai envie de remplacer dans geometry le 240 par 255, mais j’ai trop peur de faire une connerie.
romsk 08/06/2007 21:34 Auteur :
Réponse le :
Message :
salut zeyeti,
dans ton cas les coordonnées CHS semblent cohérentes avec la valeur de 240, et à mon avis le 240 est correct.montre nous ce que montre menu advanced > boot : copie d'écran
zeyeti77 08/06/2007 22:31 Auteur :
Réponse le :
Message :
 Merci de m'avoir répondu si vite....
Alors, TestDisk, dans "advanced" donne:
euh, je ne sais pas si il faut attendre un moment ou si c'est que Testdisk plante, mais il ne se passe rien quand je clique sur advanced!!!???
Je ne sais pas si ca a un rapport, mais dans le meme style de temps d'attente, j'ai lancé un search vers 1h du mat hier, et à 17h ce soir ( c'est a dire 16h après ), il n'avait analyser "que" 59 millions des 321 millions de secteurs....donc un peu long quand meme.....
zeyeti77 08/06/2007 22:40 Auteur :
Réponse le :
Message :
autant pour moi, j'ai parlé trop vite....alors j'ai a l'écran:
euh, désolé, ca me met un cadre avec une croix rouge dedans quand j'insère le screenshot.....
Ca me met:
Disk/dev/ sdb - 163 GB / 152 Gib - CHS 21175 240 63
1* HPFS - NTFS 0 1 1 21174 239 63 320165937
romsk 08/06/2007 22:43 Auteur :
Réponse le :
Message :
pour les copies d'écran voir ICI
zeyeti77 08/06/2007 22:46 Auteur :
Réponse le :
Message :
ensuite dans BOOT:
il me remet la meme première ligne:
1* ......
et ensuite,
Warning : incorrect number of heads/cylinder 255(NTFS) ! = 240 (HD)
status: OK
Backup boot sector:
status : BAD
Sectors are not indentical
A valid NTFS boot sector must be present in order to access any data ; even if the partition is not bootable
romsk 08/06/2007 23:01 Auteur :
Réponse le :
Message :
c'aurait été le contraire entre ok et bad, j'taurais dis de faire un backup BS, mais là ça m'étonne : peux-tu faire une copie d'écran de "dump" ?
zeyeti77 08/06/2007 23:16 Auteur :
Réponse le :
Message :

zeyeti77 08/06/2007 23:20 Auteur :
Réponse le :
Message :
Dis donc....ca a une drole de tronche ce truc....j'ai bien fait de demander conseil, j'y comprend rien a ce truc....tu penses que c'est grave?
romsk 09/06/2007 00:02 Auteur :
Réponse le :
Message :
bon, ben le backup est vraiment bad (rempli de 00) --> donc fais org BS, valide et ferme testdisk > éteint et redémarre le PC et regarde à tout hasard si t'accèdes à tes données > et si ça donne rien retourne dans advanced > boot : copie d'écran > list : copie d'écran
zeyeti77 09/06/2007 00:23 Auteur :
Réponse le :
Message :
ok, j'ai fais la première manip, mais il m'as remis en avant le probleme de géometry
( Warning : incorrect number of heads/cylinder 255(NTFS) ! = 240 (HD)....
et j'ai redémmaré, et toujours pas de fichiers, et le disque toujours RAW.....
alors , j'ai refait a nouveau "advanced/boot", ca donne ca:
zeyeti77 09/06/2007 00:26 Auteur :
Réponse le :
Message :
j'ai l'impression qu'il a en fait dupliqué l'erreur de geometry du boot sector sur le backup sector.... et sinon, la commande "List" necessite un peu de temps....d'analyse préalable....je te l'envoie des que je l'ai....
zeyeti77 09/06/2007 00:30 Auteur :
Réponse le :
Message :
euh, dis moi, au fait, LIST, c'est bien la commande P accessible une fois "proceed" lancé?
romsk 09/06/2007 00:31 Auteur :
Réponse le :
Message :
tente repair MFT > et si t'accèdes toujours pas à tes fichiers (ou si message du genre MFT seems OK) > tente rebuild BS : et tu fais "list" avant de valider par write
zeyeti77 09/06/2007 00:34 Auteur :
Réponse le :
Message :
Si c'est bien ca, il refuse:

romsk 09/06/2007 00:36 Auteur :
Réponse le :
Message :
romsk a écrit :tente > et si t'accèdes toujours pas à tes fichiers (ou si message du genre MFT seems OK) > tente rebuild BS : et tu fais "list" avant de valider par write

repair MFT
à demain 
zeyeti77 09/06/2007 00:47 Auteur :
Réponse le :
Message :
ok, bon ben j'essaye de lancer ca, et puis je vais essayer de dormir un peu ( boulot a 4H30), et je te tiens au courant demain. j'espere que ca va finir par fonctionner...en tout cas merci bien, et bonne nuit.
zeyeti77 09/06/2007 19:55 Auteur :
Réponse le :
Message :
salut, bon j'ai lancé repair MFT hier soir....et ce matin, j'avais le message suivant:
MFT and MFT mirror are bad. failed to repair them
Du coup, moi aussi bad, j'ai lancé Rebuild BS...que j'avais deja lancé avant hier, et que je n'ai pas laissé finir, car il en était a 59millions sur 320 millions de secteurs au bout de 16 heures....., donc ben la ca tourne...et on verra!
En tout cas, juste une question, est tu sur qu'il ne s'git pas d'un probleme de géométry "déréglée" vu tous les messages d'erreurs relatifs a ca??
merci, A+
romsk 10/06/2007 00:26 Auteur :
Réponse le :
Message :
je persiste à penser que c'est un problème de geometry (...), et le dernier message dont tu fais mention (MFT et MFT mirror sont bad ) laisse penser qu'effectivement ton problème est d'une autre nature : tu es en fait exactement dans la situation de zud et bock , et outre les solutions que je leur suggère, je te conseille avant tout la manip réussie par FLO4 avec getdataback : voir ...pasmais pose la question à C.Grenier à tout hasardICIICI
zeyeti77 10/06/2007 19:45 Auteur :
Réponse le :
Message :
salut, bon comme tu me l'as suggéré, le disque est analysé en ce moment par Getdataback, qui semble trouver pas mal de fichiers....reste a savoir si je pourrai les récuperer après, et trouve également beaucoup d'erreurs....mais pour l'instant, 2% éffectués en 4H...patience....
Jean_Phil 13/06/2007 14:34 Auteur :
Réponse le :
Message :
Bonjour à vous, 
J'ai parcourru (un peu rapidement) tous les messages sur ce fameux programme mais je n'ai pas trouvé la réponse qui pourrait résoudre mon problème.A savoir, j'ai un DD Ext. USB marque LaCie mais qui contient un DD Maxtor 160GB réf.6Y160P0. Il était partagé en 2 partitions (120GB + reste). Depuis un formatage sous DOS avec la disquette MaxBlast je me retrouve maintenant avec un DD d'une capacité de 32GB. J'ai tout essayé avec la disquette MaxBlast mais plus moyen de recupérer mon DD de 160GB.
Je viens d'essayer TestDisk. Lui aussi me trouve un DD de 32Gb. Je n'arrive pas à l'utiliser pour essayer de retrouver mes 160GB. J'aimerai savoir comment je pourrais l'utiliser pour essayer de "ressusciter" la totalité de mon DD.Si quelqu'un comprend mon problème et voit la solution . . . . J'attend de le lire 

lop 13/06/2007 15:16 Auteur :
Réponse le :
Message :
ça sent le problème de cavaliers...vérifie de ce côté..
Jean_Phil 13/06/2007 15:23 Auteur :
Réponse le :
Message :
lop a écrit :ça sent le problème de cavaliers...vérifie de ce côté..


Je n'ai pas touché au cavalier.Il est sur "Master" 
lop 13/06/2007 15:55 Auteur :
Réponse le :
Message :
Jean_Phil a écrit :

ça sent le problème de cavaliers...vérifie de ce côté..
lop a écrit :


Je n'ai pas touché au cavalier.Il est sur "Master"


il peut être sur Master limité à 32G..
Jean_Phil 13/06/2007 16:15 Auteur :
Réponse le :
Message :
lop a écrit :

Jean_Phil a écrit :

ça sent le problème de cavaliers...vérifie de ce côté..
lop a écrit :


Je n'ai pas touché au cavalier.Il est sur "Master"


il peut être sur Master limité à 32G..

Il est en "Master" comme indiqué ici http://www.seagate.com/staticfiles/maxtor/en_us/documentation/quick_specs/diamondmax_plus_9_quick_specs.pdf
lop 13/06/2007 16:19 Auteur :
Réponse le :
Message :
oui mais Master avec limitation ou Master sans limitation (y a les 2 sur le schema ..!) ??
romsk 13/06/2007 19:15 Auteur :
Réponse le :
Message :
salut jean-phil, salut lop 
moi aussi je crois bien que c'est un problème de jumper, et comme le dit lop vérifie que tu sois bien en "master" (un seul jumper) et pas en "master w/ CLJ" (2 jumpers)
Jean_Phil 13/06/2007 20:19 Auteur :
Réponse le :
Message :
romsk a écrit :

salut jean-phil, salut lop

moi aussi je crois bien que c'est un problème de jumper, et comme le dit lop vérifie que tu sois bien en "master" (un seul jumper) et pas en "master w/ CLJ" (2 jumpers)

Merci à vous deux pour vos suggestions 
Ce n'est pas un problème de cavalier car il est bien mis en "Master" comme çà Masterhttp://img509.imageshack.us/img509/6783/snap1if7.jpg
Si vous avez d'autre vue sur le problème ...
Par exemple, n'y a-t-il pas moyen avec TestDisk de ré-inscrire les informations dans le mbr ?
romsk 13/06/2007 20:27 Auteur :
Réponse le :
Message :
peux-tu faire une copie d'écran de ce que montre testdisk > analyse > proceed
Jean_Phil 13/06/2007 21:12 Auteur :
Réponse le :
Message :
romsk a écrit :peux-tu faire une copie d'écran de ce que montre testdisk > analyse > 

proceed
Voilà, je te met les captures dans le même ordre d'utilisation du programme
12345678






















romsk 13/06/2007 22:51 Auteur :
Réponse le :
Message :
va dans le menu geometry et met 19500 à cylinder > write > menu analyse > > entrée > (et laisse testdisk ouvert)proceed : copie d'écransearch : copie d'écran
Jean_Phil 14/06/2007 11:32 Auteur :
Réponse le :
Message :
romsk a écrit :va dans le menu geometry et met 19500 à cylinder > write > menu analyse > > entrée > (et laisse testdisk ouvert)

proceed : copie d'écransearch : copie d'écran
menu geometry et met 19500 à cylinder 


(je n'ai pas d'option "Write) => je fais donc Ok> write


menu analyse > proceed : copie d'écran

entrée > search : copie d'écran


Je fais "Enter" et il y a "Analyse cylinder" qui travaille ...

Vu à la fin "Analyse cylinder"

J'ai fait "Enter" et j'ai ceci

Maintenant je fais "Write" pour avoir

Je confirme yes en tapant "y"

Et malgré que je reboote mon pc je retombe toujours avec mon DD à 32GB comme à la 1er capture 
romsk 14/06/2007 18:15 Auteur :
Réponse le :
Message :
Et malgré que je reboote mon pc je retombe toujours avec mon DD à 32GB comme à la 1er capture
pas étonnant...le problème est que search ne retrouve pas ta plus grande partition et que sans les coordonnées CHS (ou secteurs) précises on va avoir du mal à la recréer.1) regarde avec photorec si ta grande partition n'est pas reconnue,2) sinon fais une copie d'écran du secteur ayant les coordonnées CHS 4111 1 1 (avec edithexa : voir dans ma signature)



lop 14/06/2007 19:12 Auteur :
Réponse le :
Message :
pourquoi on a changé de device? sdb..sdc ?
Jean_Phil 14/06/2007 19:36 Auteur :
Réponse le :
Message :
lop a écrit :pourquoi on a changé de device? sdb..sdc ?


très bonne observateur lop 
C'est parce que je n'ai pas travaillé sur le même pc. 
A romsk,je te montrerai les captures avec EditHexa ce weekend car je suis pas mal pris en ce moment.
Merci pour tout  
lop 14/06/2007 20:22 Auteur :
Réponse le :
Message :
Jean_Phil a écrit :
DD Maxtor 160GB réf.6Y160P0.
Il était partagé en 2 partitions (120GB + reste).
Depuis un formatage sous DOS.......
t'as formaté quoi et en quoi, sans indiscrétion ? (qui sait Maxblast formate peut-être en Fat32?), pcque, si tout ton DD est formaté cela devient plus simple (sauf si tu tiens à retrouver tes part, mais souvent quand on formate, c'est pas le but).
Jean_Phil 16/06/2007 09:41 Auteur :
Réponse le :
Message :
romsk a écrit :2) sinon fais une copie d'écran du secteur ayant les coordonnées CHS 4111 1 1 (avec edithexa : voir dans ma signature)

Voici pour la capture d'écran avec EditHexa de ce fameux DD 160GB reconnu comme un 32GB

A lop,
Sur ce DD ce n'est pas les partition que je veux retrouver (ni même un quelconque fichier) mais récupérer la totalité de la taille d'origine => càd 160GB
lop 16/06/2007 15:04 Auteur :
Réponse le :
Message :
Jean_Phil a écrit :

A lop,
Sur ce DD ce n'est pas les partition que je veux retrouver (ni même un quelconque fichier) mais récupérer la totalité de la taille d'origine => càd 160GB

si c'est le seul problème écris des zéros sur tout le premier secteur (ou sur les 100 premiers!), ça pourrait suffire.
lilian83 16/06/2007 15:17 Auteur :
Réponse le :
Message :
Bonjour a tous,
Je cherchais désespérement quelqu'un qui pourrait m'apporter un peu d'aide, je suis tombé sur ce forum et particulièrement dans ce topic qui je pense trouvera echo à mon problème, je vous remercie d'avance tous qui allez probablement vouloir m'aider.
Mon problème donc : j'ai mon PC qui d'un coup n'a plus voulu s'eteindre, il a fallu l'éteindre on va dire un peu violament...Du coup le lendemain il a plus voulu démarrer, j'avais la mire XP avec la barre bleu qui défile mais rien de plus a part un écran noir au bout d'un moment...
J'ai du acheter un second disque de 160 pour remettre un OS, chose bizarre c'est que quand je met mon disque pourri en slave, je le vois bien maintenant mais je n'y ai pas accés le système de fichier est devenu RAW ?...J'ai récupérer Mandrake Move pour essayer de récupérer mes fichiers d'origine, malheureusement je n'ai pû récupérer que l'ancienne partition C: du disque, la D: reste invisible même sous Linux...
Je suis super embété car sur D: y'a pas mal de photo de mes petits bouts et j'aimerais bien les récupérer en plus des docs de travails...
Je suis tombé sur TESTDISK qui m'en a dit quelques unes que je ne comprends pas c'est une évidence d'où mon post ici :

Puis j'ai

Enfin si je veux acceder aux fichiers pour faire style une recopie sur le second disque

Voilà en espérant que quelqu'un pourra me donner la marche à suivre pour résoudre mon problème ou du moins m'aider à récupérer mes documents sur la partition moisi de mon ancien disque...
Jean_Phil 16/06/2007 17:25 Auteur :
Réponse le :
Message :
lop a écrit :

Jean_Phil a écrit :

A lop,
Sur ce DD ce n'est pas les partition que je veux retrouver (ni même un quelconque fichier) mais récupérer la totalité de la taille d'origine => càd 160GB

si c'est le seul problème écris des zéros sur tout le premier secteur (ou sur les 100 premiers!), ça pourrait suffire.

Merci lop.STP, si en plus tu pouvais me dire comment je dois faire car je ne connais absolument pas EditHexa
romsk 16/06/2007 18:41 Auteur :
Réponse le :
Message :
romsk a écrit :
1) regarde avec photorec si ta grande partition n'est pas reconnue,2) sinon fais une copie d'écran du secteur ayant les coordonnées CHS 4111 1 1 (avec edithexa : voir dans ma signature)

1) et photorec ?2) t'as fais une copie du secteur 0 0 1 (= MBR) et non du 4111 1 1...
ceci dit, si t'as rien à récupérer sur ce DD, tu peux aussi faire un formatage bas niveau avec powermax, puis le repartitionner avec maxblast ou mieux directement sous windows si on considère que c'est maxblast qui est responsable de tes problèmes...
salut ,le dernier message dont tu fais mention (filesystem seems damaged...) laisse penser que ton problème n'est pas un simple secteur de boot abimé ou autre truc facile à réparer, mais plutôt une MFT corrompue : tu es en fait exactement dans la situation de zud et bock , et outre les solutions que je leur suggère, je te conseille avant tout la manip réussie par FLO4 avec getdataback : voir ...au préalable, par acquis de conscience, 1) vérifie dans le menu advanced > boot que BS et backup BS sont OK et identiques, et 2) tente un "repair MFT" (mais y'a toutes les chances que tu te retrouves avec un beau "MFT and MFT mirror are bad...")lilian
ICIICI
Jean_Phil 17/06/2007 11:53 Auteur :
Réponse le :
Message :
romsk a écrit :
1) et photorec ?2) t'as fais une copie du secteur 0 0 1 (= MBR) et non du 4111 1 1...

ceci dit, si t'as rien à récupérer sur ce DD, tu peux aussi faire un formatage bas niveau avec powermax, puis le repartitionner avec maxblast ou mieux directement sous windows si on considère que c'est maxblast qui est responsable de tes problèmes...
Merci romsk pour ta contribution mais je dois t'avouer que j'ai bien du mal à vous suivre quand vous me donnez des explications (c'est certainement dû à mon passage de la cinquantaine 
Enfin voici la 1er capture d'écran avec PhotoRec 

Si je peux te faire remarquer que mon disque à problème c'est le sdb (ide1 en esclave). Le sda c'est celui de mon système qui est sur un autre DD de 80GB (ide1 en maître)
Et voici la 1er capture d'écran avec EditHexa 

Je ne vois pas ce que tu veux dire Moi j'ai sélectionné "Disque physique 2 31,49Go" et j'ai fait OK pour avoir la capture d'écran dans le message d'avant.Alors si tu pouvais me dire qu'elle est la manip pour voir ce que tu veux "2) t'as fais une copie du secteur 0 0 1 (= MBR) et non du 4111 1 1..."


Pour ce qui est de PowerMax je l'ai déjà fait mais sans résultat 


Dans tout çà ce qui est surprenant c'est que j'ai bien un DD référencé de 160GB (6Y160PO) mais dont 32 sont visible et exploitable. Voir ces 3 prises de vue




Je pense à une solution qui serait de patcher le firmware du DD avec le firmware d'origine mais où le trouver et comment faire ????
Pour ne pas encombrer ce post j'ai créé un nouveau sujet pour mon problème.Donc pour y répondre veuillez vous rendre ici 
http://forum.pcastuces.com/sujet.asp?f=1&s=130342
Merci à tous pour tout  
lilian83 18/06/2007 00:15 Auteur :
Réponse le :
Message :
romsk a écrit :

salut ,au préalable, par acquis de conscience, 1) vérifie dans le menu advanced > boot que BS et backup BS sont OK et identiques, et 2) tente un "repair MFT" (mais y'a toutes les chances que tu te retrouves avec un beau "MFT and MFT mirror are bad...")
lilian

1) vérifie dans le menu advanced > boot que BS et backup BS sont OK et identiques :

C'était pas trop ça...
Donc j'ai fait rebuild BS...

Aprés c'était OK (je suppose que j'ai pas fait une connerie là non ?)
2) tente un "repair MFT"

J'ai pas le message auquel je m'attendais... MFT and MFT mirror are bad...
Dois-je quand même aller regarder du coté de zud et bock et essayer la manip de FLO4 avec getdataback comme tu me le suggère ?
J'attend tes instructions...
Merci encore
romsk 18/06/2007 01:57 Auteur :
Réponse le :
Message :
1) t'as même pas pris le temps de lire la prose en 1ère page : c'était backup BS qu'il fallait faire et pas rebuild BS (d'autre part avant de faire rebuild BS il faut vérifier les fichiers par list...)2) tu nous montres la 1ère partition que tu es censé avoir déjà récupérée alors que c'est D à laquelle tu n'as plus accès et qui, selon toute logique, est la suivante...
lilian83 18/06/2007 11:22 Auteur :
Réponse le :
Message :
Bonjour Romsk...
romsk a écrit :1) t'as même pas pris le temps de lire la prose en 1ère page : c'était backup BS qu'il fallait faire et pas rebuild BS (d'autre part avant de faire rebuild BS il faut vérifier les fichiers par list...) 


J'ai lu ton tuto avant de me lancer, surment avec de la m.... dans les yeux et de la mayo dans les doigts, ok, je crois que j'ai fait boulette là...
Par contre j'avais bien fait 'list' avant de faire rebuild et en effet j'étais sur l'ancien C:
romsk a écrit :2) tu nous montres la 1ère partition que tu es censé avoir déjà récupérée alors que c'est D à laquelle tu n'as plus accès et qui, selon toute logique, est la suivante...


Tu dois te dire 'encore un qui voudrait que je fasse tout a sa place...', allez optimiste, je pense que j'ai rien cassé de plus que ce qui était déjà...
Bon, je vais essayer de voir ce qu'est GetDataBack en étant moins boulet cette fois mais avant je vais relire tout le topic depuis le début au cas je me retrouve dans le problème d'un autre...
 <= Moi !
romsk 18/06/2007 23:13 Auteur :
Réponse le :
Message :
mais non t'es pas un boulet (), mais c'est vrai que je peux pas tout réexpliquer en permanence, et quand je te suggère "" je pars du postulat que tu vas prendre le temps de relire le passage qui s'y rapporte en 1ère page, ce qui ne semble pas avoir été le cas et tu te débrouilles même franchement mieux qu'un certain nombre qui n'arrivent même pas à faire une copie d'écran ou qui comprennent rien aux manips de baseau préalable, par acquis de conscience, 1) vérifie dans le menu advanced > boot que BS et backup BS sont OK et identiques, et 2) tente un "repair MFT
pour en revenir à ton problème :1) pas sûr que le rebuild BS n'ait pas eu un effet néfaste : ce "can't read NTFS MFT" est quand même bien étonnant puisque tu disais un peu plus haut que t'avais réussi à récupérer cette partition...2) avant de passer à getdataback, retourne dans le menu advanced > fleche haut bas pour te mettre sur partition () > boot : copie d'écran

la 2ème
neya06 20/06/2007 12:30 Auteur :
Réponse le :
Message :
Bonjour à tous,
Après recherches, je ne pense pas avoir trouvé de réponses à mes problèmes.
J'ai un disque dur de 120 Go sur mon portable Acer qui a été partitionné par le constructeur en 2 disques de 60 Go en FAT32 (C: ACER et D: ACERDATA).
Après avoir utilisé Partition Magic pour effectuer quelques changements, et quelques problèmes, je me retrouve avec mon deuxième DD sans lettres et inaccessible par Windows car il n'est plus formaté en FAT32 mais en Xenix (et d'après TestDisk en Primary Bootable).
Les dossiers qui sont dans "feu" ACERDATA sont toujours visibles grâce à TestDisk mais la commande de copie () qu'expliquait romsk dans 1) Menu Analyse, ne fonctionne pas ; c'est-à-dire de copier des fichiers depuis ACERDATA vers ACER. Peut-être à cause de ce système de fichier : Xenis...si on veut sauvegarder (copier) un répertoire (et tous les fichiers et sous-répertoires qu'il contient) sur une autre partition (ou DD), il faut se positionner dessus puis cliquer sur "c".
Ma question est la suivante :
Puis-je utiliser la commande "T: change type" afin de changer la partition ACERDATA du format Xenix vers le format FAT32 d'origine ?
Merci d'avance pour votre aide.
lilian83 20/06/2007 19:25 Auteur :
Réponse le :
Message :
romsk a écrit :

[...]2) avant de passer à getdataback, retourne dans le menu advanced > fleche haut bas pour te mettre sur partition () > boot : copie d'écran
la 2ème
Bonjour Romsk,
Difficile de trouver du temps rapidement pour moi en ces temps...
En plus vu qu'en mettant en cul le DD pourrave la bécane rame de chez rame j'abandonne souvent l'affaire, je me suis décidé a démarrer en mode sans echec, ça sera toujours mieux...
Néanmoins voici ce que donne TESTDISK aprés ma je pense donc 'bourde'...
2ème partition

1ere partition ?

Bouh!
neya06 21/06/2007 22:28 Auteur :
Réponse le :
Message :
Je vous mets des copies d'écran :


neya06 22/06/2007 03:38 Auteur :
Réponse le :
Message :
UP
romsk 22/06/2007 11:59 Auteur :
Réponse le :
Message :
salut neya,ça se présente plutôt bien (au vu de ce qu'a retrouvé testdisk sur ta dernière copie d'écran) : donc quand tu es là-dessus 
fais entrée > > menu advanced > met toi sur acerdata > boot : copie d'écran
write
lilian :* pour la 1ère partition p'têt bien que le rebuild BS explique le problème... fais donc org BS et vois ce que ça donne...* pour la 2ème ça se présente bien : fais backup BS > write > ferme testdisk, éteint l'ordi, redémarre et va voir ce que ça donne (toujours avec le DD en esclave)

neya06 23/06/2007 01:03 Auteur :
Réponse le :
Message :
Dommage, je devais vraiment trouver une solution rapidement.
J'ai donc un peu fouillé sur le net et j'ai utilisé EasyRecovery. Il m'a permis de retrouver les fichiers (.doc) les plus importants que je devais absoluement retrouvés. Pour les films et la musique, je refairai un petit tour sur un certain logiciel interdit.
Effacement, formatage, augmentation de la taille de la partoche et voila : C: 30 Go, D: 80 Go
Merci pour ton aide.
PS : que sert-il passé si j'avais suivi des puissants conseils ? juste pour info...
romsk 23/06/2007 08:30 Auteur :
Réponse le :
Message :
neya06 a écrit :

...PS : que sert-il passé si j'avais suivi des puissants conseils ? juste pour info...

t'aurais retrouvé ta partition et TOUTES tes données intactes ...
neya06 23/06/2007 13:42 Auteur :
Réponse le :
Message :
Mince, ça c'est con...
Tu pourrais me donner plus de détails, svp.
Je ne comprends toujours pas pourquoi PM m'a changé ma partition de FAT32 en XENIX BBT ??
(Heureusement que je n'ai pas perdu des dossiers importants, je m'en serais un peu voulu)
Merci pour ton aide et tes explications.
romsk 23/06/2007 13:53 Auteur :
Réponse le :
Message :
neya06 a écrit :

...pourquoi PM m'a changé ma partition de FAT32 en XENIX BBT ??
bof, pas de raison valable si ce n'est que c'est de l'informatique... (pour aller plus loin quand même, il faut savoir que quand on repartitionne sous PM, le logiciel déplace un grand nombre de données notamment au niveau des secteurs de boot et que de petits bugs avec perte ou corruption de 1 ou 2 octets peuvent avoir de graves conséquences : c'est pour ça entre autre qu'on conseille +++ de faire des sauvegardes et de défragmenter son DD avant ce genre de manip...)
Trompette83 24/06/2007 23:25 Auteur :
Réponse le :
Message :
Bonjour, bonsoir a toutes et à tous,Apres lecture d'une grande partie de ce fil et multiples tentatives pour retrouver mes data, je viens faire appel a romsk qui, je l'ai constaté est d'une incroyable gentillesse d'aider les astucien/nes en détresse.Donc merci encore romsk.Voici mon problème.J'ai changé ma carte mere un peu trop rapidement et sans avoir lu le fil s'y rapportant. Je pensais pourvoir reinstaller Win XP sans probleme mais ce ne fut pas le cas.A l'origine, le DD physique 1 etait partitionne en C: D: E:. Voyant les difficultés arriver, j'ai realisé une sauvegarde de E: avec TrueImage (131.5 Go dont environ 50 Go de data) que j'ai stockée sur un autre disque physique 2 en attendant de reprendre mes data.J'ai du lors de l'install supprimé toutes les partitions et reformaté le DD 1 et recréé de nouvelles partitions. Aujourd'hui, je veux récupérer mes data. Je possede 3 fichiers Warehouse11.tib (4194304 KB), Warehouse12.tib (4194304 KB), Warehouse13.tib (4088656 KB).Lorsque je test ces fichiers avec TrueImage le logiciel me donne OK.Lorsque je restore mes données, tout ce passe bien (presque 2 heures de traitement), la partition est bien remise en place mais quand je veux y acceder, Window me donne un message d'erreur, ne peux pas y acceder et me dit de faire un chekdisk.Si je fais un checkdisk (presque 2 heures de traitement) la partition deviens accessible mais si je retrouve bien les repertoires, les fichiers image sont vide (plus précisément environ 1 sur 50 est lisible), les fichiers pdf ne peuvent pas etre lu, etc...Je peux aussi monter les fichiers .tib en disque virtuels mais quand je veux y acceder j'ai le message "K:\ is not accessible. The file or directory is corrupted and unreadable".J'ai essaye differentes manip avec TrueImage sans resultat et je pense que je ne peux rien faire de plus avec.Je manipule toujours une copie des fichiers donc j'en possede toujours une version originale.Seule solution, je pense: TestDisk et surtout romsk.Question: Dois je reinstaller la sauvegarde sur le DD (2 heures) ou puis je utiliser les fichiers montés de disques virtuels, nettement plus facile et rapide?J'ai déja essayé de changer la geometrie sans succes.Voici quelques captures de TestDisk avec le disque virtuel monté en lecture seule.
























 
apres P
 
Pas de repertoire ni de fichier trouvé
J'ajoute le log
----------------------------------------------------------------------------------------------------------
Sun Jun 24 22:29:41 2007Command line: TestDiskTestDisk 6.6, Data Recovery Utility, February 2007Christophe GRENIER Windows version (ext2fs lib: 1.39, ntfs lib: 9:0:0, reiserfs lib: 0.3.1-rc8, ewf lib: 20070114)Using locale 'C'.filewin32_getfilesize(\\.\H:) GetFileSize err Incorrect function.filewin32_setfilepointer(\\.\H:) SetFilePointer err Incorrect function.Warning: can't get size for \\.\H:file_read(4,1,buffer,312592769(19457/254/63)) seek err Invalid argumentfile_read(5,1,buffer,78172289(4865/254/63)) seek err Invalid argumentfile_read(6,1,buffer,625153409(38913/254/63)) seek err Invalid argumentfile_read(7,1,buffer,1028159(63/254/63)) seek err Invalid argumentfile_read(8,1,buffer,276656687(274460/15/63)) seek err Invalid argumentHard disk listDisk /dev/sda - 160 GB / 149 GiB - CHS 19457 255 63, sector size=512Disk /dev/sdb - 40 GB / 37 GiB - CHS 4865 255 63, sector size=512Disk /dev/sdc - 320 GB / 298 GiB - CHS 38913 255 63, sector size=512Disk /dev/sdd - 518 MB / 494 MiB - CHS 63 255 63, sector size=512Disk /dev/sde - 141 GB / 131 GiB - CHS 274460 16 63, sector size=512Disk /dev/sde - 141 GB / 131 GiBPartition table type: IntelAnalyse Disk /dev/sde - 141 GB / 131 GiB - CHS 274460 16 63Geometry from i386 MBR: head=16 sector=63NTFS at 0/1/1heads/cylinder 255 (NTFS) != 16 (HD)Info: size boot_sector 276655365, partition 276655617get_geometry_from_list_part_aux head=16 nbr=2get_geometry_from_list_part_aux head=8 nbr=2get_geometry_from_list_part_aux head=16 nbr=2get_geometry_from_list_part_aux head=32 nbr=2get_geometry_from_list_part_aux head=64 nbr=2get_geometry_from_list_part_aux head=128 nbr=1get_geometry_from_list_part_aux head=240 nbr=1get_geometry_from_list_part_aux head=255 nbr=1Current partition structure:Warning: Incorrect number of heads/cylinder 255 (NTFS) != 16 (HD) 1 * HPFS - NTFS 0 1 1 274459 15 63 276655617 [Warehouse1]search_part()Disk /dev/sde - 141 GB / 131 GiB - CHS 274460 16 63NTFS at 0/1/1heads/cylinder 255 (NTFS) != 16 (HD)filesystem size 276655365sectors_per_cluster 8mft_lcn 786432mftmirr_lcn 17290960clusters_per_mft_record -10clusters_per_index_record 1 D HPFS - NTFS 0 1 1 274459 11 63 276655365 [Warehouse1] NTFS, 141 GB / 131 GiBfile_read(8,1,buffer,276655681(274460/0/2)) seek err Invalid argumentfile_read(8,1,buffer,276655682(274460/0/3)) seek err Invalid argumentfile_read(8,1,buffer,276655683(274460/0/4)) seek err Invalid argumentfile_read(8,1,buffer,276655684(274460/0/5)) seek err Invalid argumentfile_read(8,1,buffer,276655685(274460/0/6)) seek err Invalid argumentfile_read(8,1,buffer,276655686(274460/0/7)) seek err Invalid argumentget_geometry_from_list_part_aux head=16 nbr=1get_geometry_from_list_part_aux head=8 nbr=1get_geometry_from_list_part_aux head=16 nbr=1get_geometry_from_list_part_aux head=32 nbr=1get_geometry_from_list_part_aux head=64 nbr=1get_geometry_from_list_part_aux head=128 nbr=1get_geometry_from_list_part_aux head=240 nbr=1get_geometry_from_list_part_aux head=255 nbr=1Warning: the current number of heads per cylinder is 16 but the correct value may be 255.Results * HPFS - NTFS 0 1 1 274459 15 63 276655617 [Warehouse1] NTFS, 141 GB / 131 GiBNTFS filesystem need to be repaired.dir_partition inode=5ntfs_readdir failed * HPFS - NTFS 0 1 1 274459 15 63 276655617 [Warehouse1] NTFS, 141 GB / 131 GiBDirectory / 5 dr-xr-xr-x 0 0 0 2-Jan-2007 20:00 . 5 dr-xr-xr-x 0 0 0 2-Jan-2007 20:00 ..



http://www.cgsecurity.org









































































------------------------------------------------------------------------------------------------------------
Que faire?
Merci d'avance aux personnes qui pourraient m'aider.
Cordialement
romsk 25/06/2007 00:53 Auteur :
Réponse le :
Message :
salut trompette,
3 remarques et une proposition : 1) pourquoi avoir supprimé les 3 partitions ? supprimer la partition système pour réinstaller XP aurait été suffisant, non ?2) tu parles de "tester" ton fichier image, mais est-ce que tu as utilisé la fonction "explorer l'image" pour vérifier que tes données sont bien présentes dans cette image ?3) la partition sur laquelle tu restaures cette image doit être au moins aussi grande que la partition d'origine, donc je dirai mettre plutôt 140 Go pour avoir une marge...4) si les points 2 et 3 ci dessus sont OK, va sur ton disque virtuel > lance testdisk > menu advanced > boot : vérifie que les secteurs de boot sont tous les deux OK et identiques, et si c'est le cas fais un "repair MFT" pour voir ce que ça donne...



Trompette83 25/06/2007 21:01 Auteur :
Réponse le :
Message :
Bonjour romsk et avant tout merci de t'occuper de mon cas.
1) Tout à fait d'accord, je n'avais en théorie pas besoin de supprimer les partition D: et E: de mon disque et c'est pour cela que ne n'avais pas d'image de E:.
Seulement quand j'ai reinstallé Win XP, il s'est collé sur D:, puis est devenu instable. J'ai donc à ce moment fait l'image de E: car j'ai eu peur de tout perdre. A savoir que je fais toujours une verification de l'image après la création et c'était OK. J'avais fait l'image de D: avant le changement de carte. Finalement comme tout allait mal j'ai préféré repartir de zéro en toute confiance et j'ai effacé les partitions.
2) Je viens d'explorer l'image. Je vois bien E: mais il n'y a rien a l'intérieur ... mais je sais que les données y sont présentes 
3) J'ai déjà restauré l'image et il faut environ 1h30, c'est pour cela que je préfèrerais travailler sur le disque virtuel c'est plus rapide. Quand je retrouverai mes data (je suis entre de bonnes mains) je les recopierai directement sans restaurer le disque complet car il n'y a pas de system dedans.
Est ce possible de ne travailler que sur le disque virtuel?
4) Le point 2 n'est pas valide que dois je faire?
Merci
Information de dernière minute : J'ai monté le disque virtuel et fais clic droit propriété et je lis "File System: RAW"
Ca doit te parler n'est-ce pas?
romsk 25/06/2007 23:10 Auteur :
Réponse le :
Message :
Je viens d'explorer l'image. Je vois bien E: mais il n'y a rien a l'intérieur ... mais je sais que les données y sont présentes : alors là tu t'avances un peu : à mon avis si l'exploration ne montre pas tes données, ben c'est qu'elles sont pas là !... et je dirai même, vu ce que tu décris après, que ta partition E était peut être devenue RAW, avant que tu ne fasses l'image, et c'est pour ça que ton image est daubée... ceci dit, à mon avis on doit pouvoir la récupérer de la même manièredéjà
Est ce possible de ne travailler que sur le disque virtuel? oui je pense
Le point 2 n'est pas valide que dois je faire? poursuivre quand même avec testdisk, sur ton disque virtuel, et faire ce que je te suggère au dessus
Trompette83 26/06/2007 00:03 Auteur :
Réponse le :
Message :
J'ai lancé TestDisk et vérifié les secteurs boot:

Puis Rebuild BS

Puis List : Pas de donnée
La fonction "repair MFT" n'existe pas
romsk 26/06/2007 12:18 Auteur :
Réponse le :
Message :
plusieurs pistes, notamment soit un problème de cylindre comme suggéré par testdisk, soit un problème de MFT corrompue. dans l'ordre :1) tente de modifier les cylindres : menu geometry > mets 255 à cylindre > write quand demandé > menu analyse > proceed : copie d'écran > menu advanced > boot : copie d'écran2) sinon, quand tu es sur le 1er tableau du 26 juin 00h03, fais dump : copie d'écran(on verra après pour le repair MFT)


Trompette83 26/06/2007 20:43 Auteur :
Réponse le :
Message :
Bonjour et merci pour ton assiduité
Résultats de mes essais :
Geometry : Cylinders a 255 puis Analyse (Il n'y a pas de possibilité de Write)

Proceed

Continue

Pas de répertoire
Dump

Nota : Quand je fais un dump avec CHS 274460 16 63 (celui d'origine) le backup boot sector est vide
romsk 26/06/2007 23:40 Auteur :
Réponse le :
Message :
désolé trompette, je m'suis gourré : c'est pas à cylindre mais à head qu'il fallait mettre 255 ...allez hop, au boulot 

Trompette83 27/06/2007 01:17 Auteur :
Réponse le :
Message :
J'ai eu un doute mais j'ai effectué ce que tu demandais.
Voici donc en changeant head

Proceed


En fait ce n'est pas mieux. On voit que le Backup boot sector est vide.
Question : le Boot sector est-il bon? Si oui peut on le copier sur le Backup boot sector?
romsk 27/06/2007 06:33 Auteur :
Réponse le :
Message :

la voila la bonne partition... Quand tu es sur ce tableau fais entrée > > menu advanced > boot : copie d'écranwrite
Trompette83 27/06/2007 22:09 Auteur :
Réponse le :
Message :
J'ai donc fais les manip suivantes:
"Mount" le disque virtuel
Avec TestDisk changé head à 255
Sur la partition en vert Continue puis Write et le logiciel demande de rebooter pour prendre en compte.
J'ai "dé-mount" puis "re-mount" le disque mais la géométrie 255 heads n'est pas prise en compte.
En revanche sans "dé-mount" puis "re-mount" j'ai ceci
 
Puis P: Pas de sous répertoire utilisateur (seulement . et ..)
Puis Boot
 Je n'ai pas l'impression que la géométrie soie bonne car on lit 0 1 1 17221 4 63 (au lieu de 254 63 ?)
Enfin Dump

Backup boot est vide
Mais je precise encore que je n'ai pas fais de "dé-mount" puis "re-mount" mais j'ai bien fais WRITE
Faut il que je "recover" le disque avec les fichiers?
romsk 27/06/2007 22:48 Auteur :
Réponse le :
Message :
j'ai pas dis de faire de reboot... j'ai dis : "... Quand tu es sur ce tableau fais entrée > > menu advanced > boot : copie d'écran"allez hop, recommence...write
Trompette83 27/06/2007 22:57 Auteur :
Réponse le :
Message :
J'ai bien compris mais le logiciel écris apres avoir executé le WRITE "You will have to reboot for the change to take effect"
Donc la copie d'ecran que tu attends est celle de mon message precedent entre "Puis Boot" et "Je n'ai pas l'impression..."
Je viens de le refaire c'est bien ça.
Excuses moi dans le message precedent j'ai fais une erreur: j'ai bien fait WRITE mais pas de "de-mounte" "re-mount"
Donc les copies sont bien celles que tu veux
romsk 27/06/2007 23:12 Auteur :
Réponse le :
Message :
alors peut être que demount et remount n'est pas l'équivalent d'un reboot... quand tu es sur ce tableau : 

fais "org BS" > valide si demandé > puis tente un repair MFT > demount puis remount et regarde ce que ça donne...
Trompette83 27/06/2007 23:20 Auteur :
Réponse le :
Message :
J'ai fais "Org. BS" j'ai eu le message "Copy original NTFS boot sector over backup boot, confirn ? (Y/N)" j'ai confirmé Y et je retombe immédiatement sur la même écran que dans ton dernier message.
Je ne sais pas ou se trouve l'option "Repair MFT"
romsk 27/06/2007 23:35 Auteur :
Réponse le :
Message :
le repair MFT apparait (normalement) quand tu as fait org BS : boot sector et backup boot sector sont-ils bien OK et identiques après org BS ? ça n'est qu'à cette condition que repair MFT apparaitra...
Trompette83 28/06/2007 00:05 Auteur :
Réponse le :
Message :
Malheureusement les secteurs de boot ne sont pas identiques même apres "Org BS", c'est exactement ta derniere copie postée.
Peux tu m'expliquer quelle est la signification du 4 63 sous le End (6eme ligne) de cette derniere copie d'ecran. Ne doit-on pas avoir 254 63 a la place?
Je pense que demain, je vais liberer de la place sur mon DD et recréé le disque a partir des images.
Merci encore et " "a demain si vous le voulez bien !!
romsk 28/06/2007 07:09 Auteur :
Réponse le :
Message :
effectivement, entre le descripteur 254 63 qui n'est pas conservé après "reboot" et org BS qui ne donne pas de BS ok et identiques, p'têt bien qu'un disque virtuel ne peut pas être corrigé par testdisk et qu'il faut recopier sur un DD physique...
Trompette83 30/06/2007 19:15 Auteur :
Réponse le :
Message :
Me voici de retour, bonjour à tous et particulièrement romskJ'ai donc restructuré mon DD comme avant ma sauvegarde soit:DD sur 1ere nappe en MasterPartition C:, D:, E:Restauration sur E: de 131.1 GB en disque logique.Si je veux acceder au disque E: Warehouse1, j'ai toujours le message "E:\ is not accessible. The file or directory is corrupted and unreadable"1er question: Lors de la restauration du disque logique E: je n'ai restauré que la partition NTFS. L'image contient aussi le MBR du disque (physique si j'ai bien compris). J'ai la possibilité de le restaurer mais je ne l'ai pas fais car j'ai peur de rendre C: et D: inaccessibles vu que ces partitions ne font plus exactement la même taille.Réécrire ou ne pas réécrire le MBR?J'ai donc continué les manip avec TestDisk.Selection du disque physique, Analyse, Proceed, selection de la partition Warehouse1,On voit que head est a 255Enter to Continue puis Write, YYou will have to rebootfor the change to take effectJe rebootAu demarrage Win XP veut faire un checkdisque sur E:, je l'arrete avant. J'avais déjà essayé mais ca ne retrouve pas les fichiers, 2 heures de traitement ou on voit défiler tous les noms des fichiers. E: est toujours inaccessible.Avec TestDisk, Advanced,























 Boot,

Repair MTFFix MFT mirror ? YMTF mirror fixed, OKDump (pour info!!)




List : toujours que les repertoires . et ..  
Rebuils BS

Faut il ecrire ?
Quit puis List : Rien de mieux
Maintenant je ne sais plus quoi faire.
Merci romsk si tu peux reprendre ton aide, je suis d'une grande incompétence à ce sujet.
romsk 01/07/2007 08:40 Auteur :
Réponse le :
Message :
1) en y repensant je pense savoir d'où vient la corruption de E : quand tu as réinstallé XP tu dis qu'il s'est mis sur D. Or D ne fait apparemment que 2,5 Go, donc une partie de XP installé a dû aller se mettre au début de E... ce qui explique d'ailleurs que ton image de E ne soit pas fonctionnelle car quand tu as fait l'image, E était déjà corrompue...2) non, ne recopie pas le MBR (strictement inutile dans ton cas et probablement dangereux comme tu le dis très justement)3) c'est quand tu travaillais sur le disque virtuel que le chkdsk ne faisait rien : maintenant que tu es sur un vrai disque il faut laisser faire ce chkdsk...4) quand tu as fait le rebuild BS, est-ce que tu as fait list de faire quit ?


avant
Trompette83 01/07/2007 12:01 Auteur :
Réponse le :
Message :
Bonjour romsk et bon dimanche,
1) Effectivement je pense que XP c'est installé sur E:. Autre détail, quand je restaure, l'image donne les renseignements : NTFS, Flags : Pri, Capacity : 131.9 GB.
Pri ne voudrait il pas dire primaire? Mais ensuite il me propose par défaut logical. Et si je restaurais de nouveau en Primaire? mais j'ai déja une partition primaire sur ce disque avec boot, est-ce possible?
2) Je ne fais pas
3) J'ai fais un chkdsk et je peux entrer dans le disque, j'ai la structure des repertoires, le nom des fichiers mais 9 fichiers sur 10 sont vides voir plus. Je crains de mélanger encore plus les cartes et d'encore moins bien récuperer les données.
4)Oui j'ai bien listé mais il n'y a rien de plus que les rep . et ..
romsk 01/07/2007 13:05 Auteur :
Réponse le :
Message :
1) pri = primary je pense, c'est à dire principale, mais tu peux plus la mettre en principale à partir du moment où t'as fait une étendue prenant tout le DD quand t'as créé D... ceci dit ça n'explique pas ton problème à mon avis.2) je pense qu'XP a du écraser une partie des données et/ou de la MFT et que tu pourras pas aller plus loin par testdisk. reste plus que les logiciels de récupération, quitte à en essayer plusieurs car chacun travaille +/- différemment et peut récupérer des trucs là où d'autres n'y arrivent pas...
Trompette83 01/07/2007 13:20 Auteur :
Réponse le :
Message :
Au point ou j'en suis que penses tu de restaurer de nouveau avec le choix :
Please select the restored partition type :
Active
Primary
Logical
Jusqu'à présent j'ai choisi logical. Si je choisi Primary, je n'aurais rien de mieux? Est ce que je risque de casser ma partition de boot C:?
Si non, peux tu me donner des noms de logiciel pour récupérer des images, pdf, xls, video, rar
Et aussi un bon logiciel d'image disque.
romsk 01/07/2007 14:52 Auteur :
Réponse le :
Message :
tu peux toujours essayer primary, mais à mon avis ça changera rien...pour les logiciels de récupération, voir mais commence par essayer (sur le même site que testdisk)pour les logiciels imageur moi j'utilise ghost, mais d'autres existent surement aussi bons...
ICIphotorec
Volfangel 01/07/2007 18:21 Auteur :
Réponse le :
Message :
bonjours à tous et à toutes voila mon probleme j'ai recemment acheté un disque dure externe USB 500G
puis pour faire du clair sur mon PC et son DDinterne j'ai j'ai voulut tout reclasser sur le DD externe de 500G 
apres une journée de Déplacement, j'ai ensuite voulut departionné mon DD interne mais par mégarde j'ai supprimé la partition ntfs de mon DD externe et je l'ai formaté (rapide)en ntfs 
l'orque j'ai compris ma bétise je n'ai plus touché a ce disque dur sachant qu'il ya avait possibilité de récupéré les données apres formatage
maintenant j'ai trouvé le logiciel Test disk et commencé l'analise mais apres cette etape (voir ci dessous) je ne sait plus qu'elle manipe a operer pour recuperer ma partition éffacé !!

s'il vous plait dite moi qu'il est possible de récuperer tous mes précieux fichier !!
 
romsk 01/07/2007 23:26 Auteur :
Réponse le :
Message :
salut volfangel,
la bonne question c'est de savoir si la partition retrouvée que tu montres est celle d'origine avec tes données ou celle que tu as recréée...1) est-ce que tu avais donné comme nom "mes documents" à cette nouvelle partition ? ou à l'ancienne ???2) sur la 1ère copie d'écran que tu montres fais "P" pour voir si t'accèdes à tes données...

Volfangel 02/07/2007 17:51 Auteur :
Réponse le :
Message :
oui je l'avait nomé "Mes documents" mais maintenant il y a "Mes documen" ce qui est le nom de mon lecteur a present !!
et non en faisant P je n'ai pas eu acces a mes données !!
romsk 02/07/2007 18:00 Auteur :
Réponse le :
Message :
le "mes documen" qu'on voit et le fait que "P" ne montre pas tes fichiers indiquent à priori que la partition retrouvée est la nouvelle que tu as recréée... le problème est qu'en faisant ta manip tu as probablement écrasé non seulement le secteur de boot mais également sa copie de sauvegarde en fin de partition et c'est pas évident que testdisk la retrouve : 1) as-tu bien fait ? 2) si c'est le cas il ne te reste plus qu'à essayer, dans le menu advanced, de faire "" et de faire pour voir si ce rebuild t'a retrouvé l'ancienne MFT (puis write si c'est le cas...). 3) sinon, reste plus que les ...
search
rebuild BSlist
logiciels de récupération
Volfangel 02/07/2007 21:41 Auteur :
Réponse le :
Message :
oui c'est la solution pour laquel j'ai opté j'ai demandé a mon voisin de me preter son cd de récup Easy recoverry professionnel et j'ai enfin pu retrouver mes fichier perdu reste 1H avant d'avoir tout recupéré je vous remerci bien
une derniere petit question avant de partir de ce poste :
s'il vient a m'arriver de nouveau une suppression de partition je ne doit absolument pas en crée une autre mais la retrouver avec test disk c'est cela?
merci bien de votre réponse grace a vous j'en ai encore appris un peu plus sur mon ordi 
encore une fois merci !
romsk 03/07/2007 08:19 Auteur :
Réponse le :
Message :
Volfangel a écrit :

s'il vient a m'arriver de nouveau une suppression de partition je ne doit absolument pas en crée une autre mais la retrouver avec test disk c'est cela?
vi... (mais faudrait te remettre en question )
oxmoz 13/07/2007 05:32 Auteur :
Réponse le :
Message :
Bonjour,
D'abord merci beaucoup à romsk pour ses tutos vraiment très bons ! Ils m'ont bien aidé, mais il me reste encore un problème.
Voilà, j'ai voulu utiliser la commande "convert" de Windows pour convertir mes disques FAT32 en NTFS. C'est bien passé pour deux partitions, pour les deux autres (F et D) elles étaient occupées (non démontables) et Windows m'a proposé de faire ça au prochain reboot.
Au reboot suivant Windows a analyé la partition D puis a commencé la conversion, en plein milieu de celle-ci il a trouvé un problème avec un fichier rendant la conversion impossible, je me dis "bon ok", il passe à F et là dés l'analyse il dit qu'il ne peut pas convertir... "bon ok".
Une fois sous Windows je m'appercois que mes deux partitions sont en RAW... C'est là que j'ai commencé à fouiller le net et que j'ai trouvé les tutos de romsk. J'ai utilisé testdisk sur la partition F, j'ai remis le backup BS par dessus le BS actuel puis j'ai fait un repair FAT, ça a marché : ma partition est de nouveau accessible, merci romsk.
Cependant sur la deuxième c'est plus galère (rappel : c'est celle qui a eu un problème PENDANT la conversion), lorsque je veux faire un Rebuild BS plus rien ne se passe et j'entends mon disque dur gratter sans arret, dans le gestionnaire des tâches je vois que testdisk n'utilise pas du tout le processeur, je peux rester ainsi pendant des dixaines de minutes sans qu'il se passe quelque chose, idem si je fais Repair FAT.
J'ai installé EasyRecovery pour voir, mais lorsque je scanne le disque dur à la recherche d'erreurs j'ai le même phénomène, idem lorsque je tente une récuperation de données (pourtant avec une autre partoche ça marche direct).
Bref du coup je sais pas trop quoi faire, lorsque j'analyse les disques sous testdisk je peux naviger dans les dossiers et fichiers de la partition D, seulement la copie (via la touche "c") n'est pas accessible, elle ne l'était pas non plus lorsque je naviguais sur F avant qu'elle ne remarche correctement...
A votre avis que dois-je faire ? Les données sur ce disque sont très très importantes...
fifiz79 16/07/2007 21:40 Auteur :
Réponse le :
Message :
Bonjour à tous,
Je cherche de l'aide ... ce week-end en voulant aider un pote et son PC qui plantait, et avant d'installer sa box internet, j'ai voulu formater et réinstaller son PC. Je fais une jolie sauvegarde sur mon HD externe et ensuite une grosse boulette ... en ne déranchant pas mon HD externe et je fais sauter la partition.
Donc je suis dans le ca...
Voilà donc les étapes de mes conneries en cascades :
- modification de la partition de mon HD
- formatage NTFS
Je pense que mon HD était en FAT 32 mais je ne suis même pas sûr.
Qu'est-ce que je peux faire pour récupérer ma partition et mes données avec Testdisk ... je ne suis pas très pro côté matos et autre problématique système. J'ai un peu de mal dans les différentes possibilités de ce logiciel qui a l'air très intéressant mais là je suis complètement bloqué et flippé ... peu de faire encore une connerie.
D'avance merci pour votre aide. 
romsk 18/07/2007 10:13 Auteur :
Réponse le :
Message :
salut ,puisque la conversion s'est arrêtée au milieu de D et que le disque rame à la lecture, il faut avant tout vérifier l'intégrité de cette partition et rechercher des secteurs défectueux : fais un de cette partition comme expliqué , teste ce DD avec le logiciel constructeur salut ,oui tu peux récupérer la partition avec testdisk, mais tout dépend de ce que tu as fait : tu dis "". quand tu dis HD, tu parles de ton disque externe ? "modification de la partition" correspond à la suppression par erreur de celle ci ? formatage NTFS signifie qu'en plus de l'avoir supprimée tu as refait un formatage par dessus ? HD était en FAT 32 : t'avais une seule partition sur ce DD ?oxmoz
chkdskICIavec HD-Tune ainsi que le logiciel constructeur (Powermax pour Maxtor, seatools pour Seagate, Drive Fitness pour Hitachi, Hutil ou DataAdvisor pour Samsung...), et en cas de secteur défectueux tenter une réparation par HDD-regenerator

fifiz79
Voilà donc les étapes de mes conneries en cascades : - modification de la partition de mon HD - formatage NTFS - Je pense que mon HD était en FAT 32 mais je ne suis même pas sûr
fifiz79 18/07/2007 10:21 Auteur :
Réponse le :
Message :
romsk a écrit :

salut ,oui tu peux récupérer la partition avec testdisk, mais tout dépend de ce que tu as fait : tu dis "". quand tu dis HD, tu parles de ton disque externe ? "modification de la partition" correspond à la suppression par erreur de celle ci ? formatage NTFS signifie qu'en plus de l'avoir supprimée tu as refait un formatage par dessus ? HD était en FAT 32 : t'avais une seule partition sur ce DD ?
fifiz79
Voilà donc les étapes de mes conneries en cascades : - modification de la partition de mon HD - formatage NTFS - Je pense que mon HD était en FAT 32 mais je ne suis même pas sûr
Salut romsk,
Pour répondre à tes questions :
- mon HD externe (Western Digital passeport) n'avait qu'une partition et je ne suis plus sûr du format mais il me semble que c'était en FAT 32, et je n'y avais pas touché depuis l'achat.
- j'ai bien fait toutes ces bêtises sur mon HD externe
- j'ai en effet supprimé par erreur cette partition puis j'ai formaté en NTFS (c'est deux opérations j'en suis sûr et c'est bien ça qui me pose problème ... qu'est-ce qu'on peut être con parfois )
Voilà pour les réponses à tes questions. D'avance merci pour les infos que tu pourras me donner.
Cordialement.
romsk 18/07/2007 10:42 Auteur :
Réponse le :
Message :
si t'étais en FAT 32 testdisk devrait te la retrouver, mais si tétais en NTFS c'est compromis (voir le cas de volfangel ).partons du principe que t'étais en FAT 32 : lance testdisk > menu analyse > > entrée > (et laisse testdisk ouvert)ICI
proceed : copie d'écransearch : copie d'écran
fifiz79 18/07/2007 11:48 Auteur :
Réponse le :
Message :
romsk a écrit :si t'étais en FAT 32 testdisk devrait te la retrouver, mais si tétais en NTFS c'est compromis (voir le cas de volfangel ).partons du principe que t'étais en FAT 32 : lance testdisk &gt; menu analyse &gt; &gt; entrée &gt; (et laisse testdisk ouvert)

ICI
proceed : copie d'écransearch : copie d'écran
Voici les deux captures d'écran :
- après testdisk &gt; menu analyse &gt; proceed : copie d'écran

- après lance testdisk &gt; menu analyse &gt; &gt; entrée &gt; proceed : copie d'écransearch : copie d'écran

Voilà ... en espérant que tu pourras m'en apprendre un peu plus, d'avance merci.
Les deux écrans son tidentiques ... je ne sais pas pourquoi mais ce n'est surement pas une bonne chose ?!
romsk 18/07/2007 12:24 Auteur :
Réponse le :
Message :
es-tu bien sûr d'avoir fait sur le premier tableau ? c'est effectivement pas normal que t'ais deux fois le même tableau...si c'est le cas, ben c'est mal barré et reste plus que les logiciels de récupération (confère volfangel ci-dessus). A tout hasard clique quand même sur "P" pour voir si t'accèdes à tes fichiers...entrée puis search
fifiz79 18/07/2007 12:43 Auteur :
Réponse le :
Message :
romsk a écrit :es-tu bien sûr d'avoir fait sur le premier tableau ? c'est effectivement pas normal que t'ais deux fois le même tableau...si c'est le cas, ben c'est mal barré et reste plus que les logiciels de récupération (confère volfangel ci-dessus). A tout hasard clique quand même sur "P" pour voir si t'accèdes à tes fichiers...

entrée puis search

Oui je fais ce qui était demandé à priori car cela a duré qque temps pour le search.
Est-ce que je peux faire un truc du genre ""avant j'avais mon HD externe qui avait une partition FAT 32, peux-tu chercher un truc comme ça ?
Je me doutais un peu de l'issue finale ...
fifiz79 18/07/2007 13:52 Auteur :
Réponse le :
Message :
fifiz79 a écrit :

es-tu bien sûr d'avoir fait sur le premier tableau ? c'est effectivement pas normal que t'ais deux fois le même tableau...si c'est le cas, ben c'est mal barré et reste plus que les logiciels de récupération (confère volfangel ci-dessus). A tout hasard clique quand même sur "P" pour voir si t'accèdes à tes fichiers...
romsk a écrit :

entrée puis search

Oui je fais ce qui était demandé à priori car cela a duré qque temps pour le search.
Est-ce que je peux faire un truc du genre ""
avant j'avais mon HD externe qui avait une partition FAT 32, peux-tu chercher un truc comme ça ?
Je me doutais un peu de l'issue finale ...

En fait j'ai fait ceci exactement :
lance testdisk > create > sélectin du HD externe > Proceed > Je choisis [Intel] > Analayse > Proceed () > Je réponds Y pour les partitions Vista (même si ça ne sert à rien dans mon cas) > Enter > Search ()première imagedeuxième image
romsk 18/07/2007 18:06 Auteur :
Réponse le :
Message :
une dernière chose que tu peux tenter avant les logiciels de récupération est un "rebuild BS" dans le menu advanced (et "list" avant de valider comme expliqué en 1ère page)
200691 18/07/2007 18:56 Auteur :
Réponse le :
Message :
 Slt
Exellent tuto mes félicitation. C'est du très bon travail.
 
fifiz79 19/07/2007 11:08 Auteur :
Réponse le :
Message :
romsk a écrit :une dernière chose que tu peux tenter avant les logiciels de récupération est un "rebuild BS" dans le menu advanced (et "list" avant de valider comme expliqué en 1ère page)


Bonjour,
Quand je fais cette manip, j'ai l'arborescence actuelle de mon HD externe.
Je parlais de faire un truc du genre :
- repasser en FAT 32
- retrouver mon ancienne partition
C'est pas qque chose de possible ?
Sinon quand il s'agit de récupérer les données, quel est le logiciel le plus efficace ?
D'avance merci ... et encore merci pour le temps consacré.
Hyokayl 19/07/2007 17:26 Auteur :
Réponse le :
Message :
Bonjour a tous je suis Hyo et jai un enorme probleme, je possede un disque dur externe toshiba de 500giga.
le probleme ai que jai voulu formater mon ordinateur, et au moment ou je devai supprimer et ensuite crée de nouvel partition, je navai pas fait atention que mon disque externe étai alumé, donc sans le faire exprés jai supprimer la partition de mon disque 500 giga
et le probleme ai que je travaille sur un dessin animée dont jai besoin de recuperer les donnée qui sont trés importante
jai télécharger testdisk, le bleme et que jy comprend rien a comment lutilisé, jai suivi les conseil du forum dont jai effectuer les deux analyse ( la normal et la minusieuse ) maispour la suite je ne sait comment faire
Quelqu'un peut t-il mexpliquer pas a pas les manipulations a exercer car jai besoin des donnée le plutot possible
Merci Hyo
fifiz79 19/07/2007 17:47 Auteur :
Réponse le :
Message :
Hyokayl a écrit :

Bonjour a tous je suis Hyo et jai un enorme probleme, je possede un disque dur externe toshiba de 500giga.
le probleme ai que jai voulu formater mon ordinateur, et au moment ou je devai supprimer et ensuite crée de nouvel partition, je navai pas fait atention que mon disque externe étai alumé, donc sans le faire exprés jai supprimer la partition de mon disque 500 giga
et le probleme ai que je travaille sur un dessin animée dont jai besoin de recuperer les donnée qui sont trés importante
jai télécharger testdisk, le bleme et que jy comprend rien a comment lutilisé, jai suivi les conseil du forum dont jai effectuer les deux analyse ( la normal et la minusieuse ) maispour la suite je ne sait comment faire
Quelqu'un peut t-il mexpliquer pas a pas les manipulations a exercer car jai besoin des donnée le plutot possible
Merci Hyo

Salut,
Tu peux reprendre ma discussion depuis le début ainsi tu pourras fournir plus rapidement les informations qu'attendent les experts testdisk. Je suis dans le même cas sauf que j'ai formaté HD externe en plus ! 
Hyokayl 19/07/2007 18:39 Auteur :
Réponse le :
Message :
merci de ton conseil mais puisje savoir comment je peut afficher les image car elle ne passe pas quand jessaye de les mettre
Hyokayl 20/07/2007 00:56 Auteur :
Réponse le :
Message :
bonsoir tous le monde, jai besoin daide et persone repond, je voudrai savoir comment puije recuperrer met donnée sur mon disque dur 500giga dont jai suprimer la partition sans le fire expré,
quand jeffectu testdisk, doije effectuer lanalyse sous vista??
romsk 21/07/2007 08:43 Auteur :
Réponse le :
Message :
fifiz79 a écrit :
1) Je parlais de faire un truc du genre : - repasser en FAT 32 - retrouver mon ancienne partition. C'est pas qque chose de possible ?2) Sinon quand il s'agit de récupérer les données, quel est le logiciel le plus efficace ?

1) si search et rebuild BS ne donnent rien, y'a peu de chance (aucune) que de recréer une partition FAT32 ne règle ton problème2) je les ai mis dans l'ordre à essayer (à mon avis), certains gratuits d'autres payants. Commence par photorec...
salut hyo,
sans les copies d'acran je sais pas aider : voir pour les explications, et si t'y arrives pas envoie le logfile à C.Grenier sur son siteICI
ekobol 25/07/2007 14:02 Auteur :
Réponse le :
Message :
Bonjour à tous,
d'abord une félicitation de plus pour ce tuto mais aussi par ce que tu es toujours là alors franchement .
Bon alors moi aussi j'ai un problème. j'avais sur le même disque 2 partitions bootable ( linux et windows).
Depuis que j'ai réinstaller xp je ne peux pas booter sous linux, test disk vois la partition linux sans soucis en primaire mais dans advanced je n'ai pas la fonction boot pour cette fonction mais superblock ???
Comme dans le tuto tu ne parle que de boot....
voila merci.
PS: je dois avouer que je n'ai pas lu toutes les pages de ce forum donc si le sujet est déjà traité merci de me le dire et encore bravo à romsk
romsk 25/07/2007 23:47 Auteur :
Réponse le :
Message :
salut ,ekobol
je savais même pas que cette fonction existait sous testdisk, mais d'une part j'ai pas souvenir avoir traité une partition linux et d'autre part je n'ai pas remis mon nez depuis longtemps sur le site de C.Grenier qui, je pense, a dû faire évoluer son logiciel...sous linux les superblocks contiennent toutes les informations vitales concernant le système de fichier et la partition (voir ), un peu l'équivalent finalement du secteur de boot sous windows, et si les données sont corrompues, testdisk peut rechercher les copies de superblock présentes sur la partition : donc je pense qu'il faut prendre l'option superblock (ce que je confirme après visite sur le site de C.Grenier : voir )
ICIICI
Sphere 26/07/2007 11:56 Auteur :
Réponse le :
Message :
Bonjour,
J'ai utilisé testdisk recemment et il m'a en effet retrouvé beaucoup de données de mon 300Go
Le problème c'est qu'il me les classe dans des dossiers "directories" de 1 à 135 avec des noms de fichiers à coucher dehors du genre f01358489657...
J'avais tout un repertoire de milliers (millions meme) de samples pour faire du son, et le nom et la place des fichiers avaient une importance cruciale pour pouvoir etre utilisés sous reason.
Si je dois tout renommer et replacer, j'en ai pour environ 2 ans à temps plein! 
Existe-t-il une solution pour recuperer mes fichiers exactement comme ils etaient à l'origine?
Mon problème vient d'un virus, j'avais un ecran bleu a chaque demarrage, et en slave ça demandait un formatage. J'ai essayé avec divers logiciels de recup' de données mais impossible d'acceder au disque, donc j'ai effectué un formatage rapide (j'aurais ptet pas du?)
La question a peut-être déja été posée, mais je n'ai pas eu le courage de lire les 24 pages (jsuis au taf en +) désolé.
Merci de vos precieux conseils 
ekobol 26/07/2007 12:08 Auteur :
Réponse le :
Message :
salut romsk,
merci de ta réponse,
j'ai fai le superblock et ça me donne:
Disk /dev/sda - 81 GB / 76 GiB - CHS 9964 255 63 Partition Start End Size in sectors Linux 7077 0 1 9963 254 56 46379648superblock 0, blocksize=4096superblock 32768, blocksize=4096superblock 98304, blocksize=4096superblock 163840, blocksize=4096superblock 229376, blocksize=4096superblock 294912, blocksize=4096superblock 819200, blocksize=4096superblock 884736, blocksize=4096superblock 1605632, blocksize=4096 Linux 7078 5 7 9965 4 62 46379648superblock 0, blocksize=4096[ Quit ] Return to Advanced menu



















Donc pas trop de possibilité.
j'ai regaredr le lien que tu m'as passé du site de Grenier ou il parle de fsck: EXT2: fsck.ext2 -p -b block -B blocksize device
Qu'est-ce que je dois en faire???? merci
ekobol 26/07/2007 12:13 Auteur :
Réponse le :
Message :
sinon pour sphere,
je ne mis connait pas autant que romsk mais je ne pense pas que le formatage t'aider.
est-ce que tu as essayer EasyRecovery Professional?
Je crois qu'il y a une version d'essai sur télécharger.com
Sphere 26/07/2007 17:22 Auteur :
Réponse le :
Message :
ok je te remercie je vais essayer.
j'ai essayé handyrecovery, pci_filerecovery, et d'autres mais pas celui dont tu parles.
++
romsk 26/07/2007 22:13 Auteur :
Réponse le :
Message :
ekobol,aucune idée de ce qu'il faut faire de ces différentes lignes de superblock : y'a t'il la possibilité, par les fleches haut bas, de se mettre sur telle ou telle ligne et de faire "entrée" ? sinon faudrait poser la question à c.grenier himself... concernant le fsck, c'est l'équivalent de chkdsk pour les partitions linux ext2 ou ext3, et j'imagine que "" est la ligne de commande qu'il faut faire sous linux ? mais là encore c.grenier t'en dira surement plus...
fsck.ext2 -p -b block -B blocksize device
salut ,les récups de partition que fait testdisk les remettent telles qu'elles étaient à l'origine, et c'est pas normal qu'il te renomme tes données en te les classant dans des répertoires bizarres : t'aurais effectivement peut être pas dû formater, p'têt ben que ça t'as mis le bronx dans ta MFT (ou FAT ?)... as-tu tout simplement tenté un chkdsk de cette partition ?peux-tu faire une copie d'écran de ce que montre proceed dans le menu analyse, ainsi que searchsphere


ekobol 28/07/2007 15:34 Auteur :
Réponse le :
Message :
merci,
je vais essayer de le joindre.
Juste 2 dernières questions et promis je te laisse: est-ce qu'il répond facilement? et surtout est-ce qu'il parle français?
merci de ton aide 
romsk 28/07/2007 15:58 Auteur :
Réponse le :
Message :
1) oui,2) oui

crapongil 30/07/2007 00:21 Auteur :
Réponse le :
Message :
Bonjour a tous,
Suite à un probleme materiel, (nappe defectueuse) j'ai perdu les données de mon dd. Visiblement il semble possible de les recuperer à la lecture de ce forum, avec de grands spécialistes comme romsk qui semble très dispo et competent. Est-il possible de voir ensemble la marche à suivre pour tenter de retrouver mes fichiers accumulés au long des années et dont j'ai besoin?Avant d'aller plus loin merci de vos réponses et des conseils pour savoir par quoi commencer.
Merci à tous
romsk 30/07/2007 07:58 Auteur :
Réponse le :
Message :
crapongil a écrit :

Suite à un probleme materiel, (nappe defectueuse) j'ai perdu les données de mon dd...
salut crapongil,
dis-en un peu plus : vois-tu ton DD dans le bios au démarrage de l'ordi ? dans le gestionnaire de périphérique ? dans la gestion des disques ? combien de partitions ? es-tu RAW (voir )commence par faire une copie d'écran de la gestion des disques et de ce que montre ptedit et "boot record" comme expliqué dans le lien que je te donneICI
crapongil 30/07/2007 08:33 Auteur :
Réponse le :
Message :
milles merci de ta reponse rapide romsk. Pour faire simple, apres crash du dd j'ai tout de suite tenté une recup avec File Scavenger (logiciel payant)et il m'a restauré ts mes fichiers et même en respectant la structure des dossiers. MAIS après un second crash du a la nappe defectueuse que j'ai changée j'ai partitionné le dd, tout est rentré dans l'ordre sauf que mes fichiers ont de nouveau disparu! J'ai retenté une recup avec Scavenger et je n'ai que des fichiers "unknown" et plus de structure de dossiers. Résultat: mes 80GO sont eparpillés ds ts les sens, difficile de s'y retrouver.
Depuis j'ai donc utilisé testdisk, qui m'a beaucoup facilité la tache car je retrouve mes fichiers mais encore une fois le boulot est enorme pour vérifier leur integrité. Ma question est de savoir si je peux tenter de restaurer mon dd (qui ne contient que des données) afin que je puisse retrouver l'arborescence des dossiers. Bien sur pour te permettre de me repondre je t'envoie les captures que tu me demande le temps de bidouiller je l'ai jamais fait.
Encore merci mon prochain post arrive
crapongil 30/07/2007 08:54 Auteur :
Réponse le :
Message :
Voici une premiere capture:
[/IMG][/URL]http://img183.imageshack.us/img183/9163/capture01sk8.th.jpg


romsk 30/07/2007 11:27 Auteur :
Réponse le :
Message :
1) ta capture est trop petite,2) combien de partitions ? et si plusieurs, où se trouvent tes données ?
Sphere 30/07/2007 14:19 Auteur :
Réponse le :
Message :
salut romsk
je vais te faire une copie d'écran de ce que m'affiche testdisk pour demain
en fait maintenant je n'arrive plus du tout a voir mes données depuis testdisk
j'ai sans doute fait une connerie...
il m'affiche également des messages comme quoi des partitions se superposent
au cours de mes multiples essais j'ai également tenté "repair MFT" mais sans aucun effet particulier...
voila je te montre ça demain.
Merci de ton aide
crapongil 30/07/2007 14:50 Auteur :
Réponse le :
Message :
Voila une capture digne de ce nom désolé je suis tout nouveau sur un forum!!

romsk 30/07/2007 15:26 Auteur :
Réponse le :
Message :
pour les copies d'écran, voir paragraphe 8 (touche "impr écran" > ouvre paint > édition > coller > recadre sur la partie que tu veux > copier > nouveau > coller > enregistrer sous : ICIformat jpg)
romsk 30/07/2007 15:31 Auteur :
Réponse le :
Message :
crapongil :1) bravo pour les captures d'écran 2) j'attends toujours les réponses : 1 seule partition ? qui occupait tout le DD (160 Go) ou qu'une partie du DD (110 ou 120 Go) ? elle s'appelait gigan ou stockage ?


crapongil 30/07/2007 15:40 Auteur :
Réponse le :
Message :
Merci romsk on s'est croisé! Avec toi je vais devenir un as de l'informatique! Maintenant je me bats pour ouvrir PTEDIT32 j'ai eu plusieurs message d'erreur, mais mon DD incriminé n'y figure pas comme il ne figure pas dans Windows(pas de lettre lecteur), je ne sais si c'est normal. Cela dit j'ai reussi à y recuperer pas mal de données avec le tres bon testdisk, mais y a t-il pas moyen de fusionner ces partitions pour tenter de retrouver le disque originel?
crapongil 30/07/2007 16:07 Auteur :
Réponse le :
Message :
En réalité je travaille avec 2dd dont celui ci m'a servi de stockage de mes données perdues sur un autre dd. J'avais donc crée une partition nommée "stockage" et "Gigan" était le nom attribué au DD. A moins que j'ai du faire une autre manip dont je vais essayer de me souvenir, car j'ai tenté plusieurs fois de créer des partitions avec PowerQuest et cela a tjrs fini par des messages d'erreurs, avant remplacement de la nappe reliant le dd à la carte mère. Quand tout est rentré ds l'ordre, j'ai recrée une nouvelle partition, alors que je pense que j'aurais du le laisser tel quel, car réecrire sur le dd n'était pas une bonne idée. Je n'arrive plus a retrouver mes fichiers dans l'arborescence d'origine comme j'avais réussi a le faire une première fois. Je me suis donné comme challenge de remettre ce dd, après crash mais surtout après REECRITURE, dans son état premier! Tu crois que c'est possible?
romsk 30/07/2007 16:24 Auteur :
Réponse le :
Message :
pas très claires tes explications, mais faut dire que t'as déjà fait beaucoup de manips...quand tu es sur l'écran de testdisk que tu montres, mets toi sur chaque ligne à tour de rôle en cliquant à chaque fois sur "P" pour voir si tu vois tes fichiers et leur arborescence (celle qui semble le mieux correspondre est la 3ème ligne)
romsk 30/07/2007 18:16 Auteur :
Réponse le :
Message :
c'est pas à moi mais à toi d'explorer les répertoires : moi je ne sais pas ce que t'avais comme répertoire ou fichier...
chaque ligne commencant par -r est un fichier, celles commençant par dr sont des répertoires : on peut explorer les répertoires en se positionnant dessus et en faisant fleche droite (ou entrée). On revient au répertoire parent en se positionnant sur la 2ème ligne (qui se termine par .. au lieu d'un nom de fichier ou répertoire) et en faisant fleche droite (ou entrée)
si tu ne retrouves pas tes fichiers et répertoires, c'est que tes données sont peut être bien dans la dernière partition, celle où figure "can't open file system..." Dans ce cas mets toi sur cette dernière ligne > fleche droite gauche pour mettre cette partition en "P" > entrée : write > va dans le menu advanced > boot : copie d'écran
crapongil 30/07/2007 19:21 Auteur :
Réponse le :
Message :
Merci de ta patience mais j'ai tellement peur de faire une mauvaise manip que je touche plus avant de suivre tes conseils, et pendant ce tps je lis et m'informe un max sur ce forum très interessant. Sur cette capture et suite à la derniere procedure, apres reboot voila ce q ça donne il y des erreurs: dois je faire rebuilt BS?

romsk 30/07/2007 21:06 Auteur :
Réponse le :
Message :
non, > write > quitte testdisk, éteind et redémarre le PC, et regarde ce que ça donne...backup BS
hoppyuniatz 31/07/2007 06:06 Auteur :
Réponse le :
Message :
 J'avais une double partition (H & I) sur 1 HD externe. H avait virer en RAW.J'ai essayé "testdisk" pour win xp sous dos, et bien Testdisk ne voyait pas H maisseulement I.Ai-je bien employé testdisk ? j'ai réessayé à +sieurs reprises, mais sans résultatde récupérer les fichiers sur H.Je le signale ici car je trouve ce tuto super et peut être que qq 1 pourra me diresi je me suis trompé, ou si mes résultats obenus sont normaux.






romsk 31/07/2007 08:24 Auteur :
Réponse le :
Message :
salut hoppyuniatz,
non c'est pas classique, testdisk aurait du la retrouver...as-tu bien fait search ? (pourquoi avoir utilisé la version DOS ?)
hoppyuniatz 31/07/2007 08:37 Auteur :
Réponse le :
Message :
J'ai bien fait le sur le disque physique, mais il ne trouvaitque la partition I (la bonne) la H (en RAW) il ne voyait rienFinalement comme les 3/4 des fichiers présents sur H j'en avais unback up sur un autre HD interne, j'ai reformaté H.J'ai pas perdu grand chose, en tout cas rien d'essentielle.search



J'ai pris la version pour qui travaille dans une fenêtre DOS souswin.testdisk win xp 

romsk 31/07/2007 08:59 Auteur :
Réponse le :
Message :
search ne retrouve les partitions que s'il trouve les backup boot sector : peut être que dans ton cas le boot sector et son backup ont tous les deux été corrompus, ce qui expliquerait que search n'ait rien trouvé ? dans ce cas tu peux essayer de recréer la partition sous testdisk puis de faire un rebuild BS
hoppyuniatz 31/07/2007 09:10 Auteur :
Réponse le :
Message :
Trop tard maintenant j'ai reformaté H, et ça fonctionne a nouveauxavec les dossiers/fichiers que j'i à nouveau stockés.Mais je prend bonne note pour la prochaine avarie...



hoppyuniatz 31/07/2007 09:12 Auteur :
Réponse le :
Message :
Trop tard maintenant j'ai reformaté H, et ça fonctionne a nouveauxavec les dossiers/fichiers que j'i à nouveau stockés.Mais je prend bonne note pour la prochaine avarie...



Sphere 31/07/2007 10:46 Auteur :
Réponse le :
Message :
me revoila
alors voici ce que m'affiche testdisk lorsque je fais analyse:

ensuite il m'affiche ma partition mais je ne peux lister les fichiers, "filesystem seems damaged".
Sinon j'ai testé GetdataBack ^^ et ça marche nikel, excepté la petite surprise au moment de copier les fichiers!
Va donc falloir acheter cette licence, ça fait cher quand même O_o
en tout cas merci et chapeau Romsk pour ces tutoriaux très interessants
et également gros respect aux developpeurs de ces ptits logiciels magiques.
++
crapongil 31/07/2007 13:07 Auteur :
Réponse le :
Message :
Bonjour, me revoila!
Romsk je te fais un résumé de la situation après consultation de ton topic que j'avoue ne pas avoir lu avec précision:
Mon disque dur est reconnu par windows mais en raw et illisible.
Pas moyen de lancer PTEDIT32: erreur de la MFT?

Testdisk me retrouve des partitions effacées:

Quand je passe ligne2 en "P" voila ce que ça donne:

Ainsi que pour la ligne3 meme après fait "backup" et reboot.Enfin quand je remets la ligne1 en "D" et la ligne2 en "P" voila le résultat:

Donc pas moyen d'avoir les 4 lignes en vert. C'est un signe de quoi? Te faut-il d'autres captures pour élargir la recherche?
Merci de ta réponse!
Hyokayl 01/08/2007 16:37 Auteur :
Réponse le :
Message :
bonjour a tous et excusez moi javai pas pu repondre avant,
voici met exemple testdisk



arriver la jai fait proceed directement ensuite doije effectuer lanalyse sous vista??? doije mettre y ou n?
romsk 01/08/2007 17:19 Auteur :
Réponse le :
Message :
hyokayl, sur l'avant dernier tableau que tu montres (où c'est marqué "no partition is bootable"), tu as donc fait > et c'est là que tu as eu le dernier tableau qui te parle de vista ? ça ne t'affiche rien d'autre ?? dans ce cas il faut taper "Y" pour faire la recherche et regarder ce que te retrouve testdisk > et si ça donne rien, il faut ensuite faire ...proceedsearch
sphere, pour les logiciels de récupération, as-tu essayé tous les gratuits ? pour ce qui est de ce que montre testdisk, ça évoque en 1er lieu un : ICIproblème de géométrieva dans le menu geometry > mets 255 à head et 63 à sectors > write > retourne dans le menu analyse > proceed (> +/- search si proceed ne retrouve rien) : copie d'écran (et laisse testdisk ouvert).
, c'est normal que tu ne puisses pas valider les 4 lignes que trouve search puisque leurs coordonnées CHS se chevauchent : seule l'une d'entre elle est valide et ne peut cohabiter avec les 3 autres... as-tu fais ce que je t'ai proposé il y a 2 jours (..) ? dans ton dernier post d'hier tu ne me dis pas ce que ça a donné et tu reprends tout à zéro ... crapongilfais > write > quitte testdisk, éteind et redémarre le PC, et regarde ce que ça donne.backup BS
Hyokayl 01/08/2007 18:04 Auteur :
Réponse le :
Message :
ok donc voila je suis entraint de faire lanalyse avec vista

je mettreai la suite a la fin de lanalyse
sinon merci a toi romsk pour ton aide
Hyokayl 01/08/2007 19:05 Auteur :
Réponse le :
Message :
voicile resultat de l'analyse

que doije fairemaintenant: a , l ou entrer???????????????????????????????
romsk 01/08/2007 21:15 Auteur :
Réponse le :
Message :
reste 2 solutions :1) clique sur "A" 
puis rentre successivement les valeurs adéquates de début de partition (cylinder head sector) et de fin de partition (cylinder head sector), c'est à dire 0 1 1 60798 254 63 > type : entrée > fleche de direction pour choisir le bon type de partition (NTFS ???) > entrée > done > write ou OK > menu advanced > boot : copie d'écran (pour vérifier BS et backup BS, mais il faudra probablement tenter un rebuild BS...)2) sinon, tenter d'autres 
logiciels de récupération
crapongil 01/08/2007 22:50 Auteur :
Réponse le :
Message :
Bonsoir romsk, merci de ton suivi et ton soutien
J'ai suivi pas à pas les procedures et voila ou ça en est apres avoir fait "backupBS" et "write" sur la partition corrompue:

Et le résultat:

Voici en fin une capture avec PTEDIT32 que je n'arrivais pas à ouvrir jusqu'à maintenant:

Quand je fais list (P):

Meme question que Hyokayl: quel suite à donner stp?
romsk 02/08/2007 09:33 Auteur :
Réponse le :
Message :
y'a un truc qui m'échappe :

sur ce tableau on voit les coordonnées CHS suivantes pour la 4ème partition : 0 13141 254 63, et je ne comprend pas comment tu peux te retrouver avec les coordonnées qui apparaissent sur ta dernière copie d'écran : 0 13141 ? (un backup BS ne fait pas ça...)qui plus est, ces coordonnées CHS de début (0 0 1) sont celles du MBR : donc si t'as fait write, t'as effacé tout ou partie du MBR ? dans ce cas il faut passer par le menu "MBRcode" > valider le nouveau MBR > retourner dans le menu analyse > proceed > entrée > search : copie d'écran...1 70 1253 57
PS : je ne vois plus ton post du 30.07 entre 16h24 et 18h16 : tu l'as effacé ???
crapongil 02/08/2007 14:38 Auteur :
Réponse le :
Message :
Salut romsk,
Oui j'avais effacé le post pour +de clarté à mon sens mais bon.... J'ai qd même l'impression de tourner en rond Je me remotive car j'ai des fichiers perso que je n'ai pas encore pu recuperer, alors je m'accroche!! Heureusement t'es là!
Je mets dans l'ordre successif ce que j'ai fais, d'abord "analyse":

Puis "proceed", a noter que le test démarre à 73%:

Résultat:

"Enter":

Puis "Search":

Les coordonnées CHS sont redevenues ce qu'elles étaient, a noter pas d'option "found using backup sector", alors que les autres partitions l'ont.La partition qui m'interesse et inaccessible pour l'instant est bien celle surlignée en vert, car je retrouve pas mal de données sur les autres partitions (avec les logiciels de recup que tu as cité) mais il en manque, je suppose qu'elles se trouvent sur cette derniere.
Voici ce que ça fait qd je fait "list":

Après enter:

Je fais "quit" car il n'y avais precedemment pas d'options "load backup" donc je fais pas "write" je pense puis je vais dans "advanced":

Y a un hiatus entre ce tableau et le precedent ou les "files sont damaged" non? Je ne fais pas "rebuiltBS" puisque le status est "OK"
Ensuite je tente "repair MFT":

Je fais "dump":





Et pour finir une capture du gestionnaire de disques sous windows:

Bon ben c'est là où je ne sais plus dans quelle direction aller. Vois tu des choses anormales? Je suis incapable de dechiffrer comme toi ces Au plaisir de te lire..hiéroglyphes!
romsk 02/08/2007 21:03 Auteur :
Réponse le :
Message :
bravo pour ta persévérance et tes copies d'écran (celles de dump ne sont pas utiles puisque boot sector et backup boot sector sont ok et identiques)
hélas pour toi, on arrive au bout des possibilités de testdisk. tiré de cet : "autre topicdans certains cas la MFT est corrompue. Dans ce cas la commande "list" échoue en dans ce cas on peut essayer de retrouver la bonne MFT (encore que j'y suis pas encore arrivé...) ou sinon reste plus qu'à essayer de récupérer les données grâce à un logiciel de récupération. voir les cas de et renvoyant un message d'erreur du genre "can't open filesystem. filesystem seems damaged", de même le "repair MFT" renvoie un autre message d'erreur du genre "MFT and MFT mirror are bad, failed to repair them".zudbok2000 ainsi que la solution qu'a trouvé FL04 avec getdataback..."
crapongil 02/08/2007 21:39 Auteur :
Réponse le :
Message :
Romsk,
Merci millexmille fois de ton aide Je sais au moins qu'on est allé au bout de testdisk, ça tranquillise l'esprit. Si je trouve une solution, je la posterai évidemment pour que ça puisse servir. Je me servirai des méthodes citées dans ton post.
Merci encore et bonne soirée!
crapongil 07/08/2007 14:50 Auteur :
Réponse le :
Message :
Bonjour Romsk, tu es disponible en ce moment ou tu es en vacances?
romsk 07/08/2007 21:42 Auteur :
Réponse le :
Message :
'suis là 
crapongil 08/08/2007 16:40 Auteur :
Réponse le :
Message :
J'ai procédé à la tentative de récupération sous slax-LFI comme décrit dans ton tuto romsk, en mode "Konsole" et dans le but de faire profiter l'info à tous je voulais signaler que pour ma part cette procédure a conduit à recréer sur le disque hote partitionné en FAT32 exactement la même image que le disque corrompu, donc en RAW.
Je n'ai donc pas plus avancé mais au moins c'était un essai à faire et pour l'instant je tente une nlle récup de données avec "File Scavenger" sur la partition ainsi crée.
A plus pour d'autres infos.
romsk 08/08/2007 17:32 Auteur :
Réponse le :
Message :
crapongil a écrit :

J'ai procédé à la tentative de récupération sous slax-LFI comme décrit dans ton tuto romsk, en mode "Konsole" et dans le but de faire profiter l'info à tous je voulais signaler que pour ma part cette procédure a conduit à recréer sur le disque hote partitionné en FAT32 .
exactement la même image que le disque corrompu, donc en RAW
merci pour cette confirmation que je subodorait déjà comme précisé dans le sujet :

" ultime commentaire : quand on copie une partition NTFS corrompue sur une partition de sauvegarde formatée en FAT32, cette partition se retrouve elle même en NTFS. En réalité j'ai l'impression que cette commande agit réellement comme un logiciel de clonage qui transfère tout ce qui existe sur la partition corrompue, y compris le système de fichier... : ddrescue est parfait pour récupérer des données sur un DD contenant des secteurs défectueux, Mais même dans ce cas de figure la commande reste intéressante car ça permet au moins de tester chkdsk et testdisk sur la partition de sauvegarde sans avoir peur de perdre des données puisque la partition source corrompue n'a pas été touchée... : peut être que dans ce cas de figure le "glisser-déposer" en mode graphique serait plus efficace puisqu'en théorie il ne transfère que les fichiers et non le système de fichier…(et pi j'arrête)
Corollaire 1mais lorsque la corruption de la partition résulte d'un problème dans le système de fichier, le même problème (de système de fichier) pourrait persister sur la partition de sauvegarde ?
Corollaire 2
perbugi 09/08/2007 19:40 Auteur :
Réponse le :
Message :
Salut tout le monde
Suite à une perte de partition, je suis tmbé sur sur ce forum. J'ai donc testé Testdisk mais celui-ci ne me trouve aucune partition lors du "search". J'ai pourtant essayé plusieurs fois. Je précise que Windows voit ces partitions ainsi que ptedit (les codes fournit par ptedit sont corrects).
Quelqu'un a t-il une idée pour m'aider ?
PS : Pendant le search de Testdisk, j'obtiens "des read erreurs at ......."
Merci d'avance
romsk 09/08/2007 21:28 Auteur :
Réponse le :
Message :
salut perbugi,
dis-en un peu plus sur ta panne et tes partitions (nombre, noms, ntfs ou fat...) et fais des copies d'écran de la gestion des disques, de ptedit et de ce que montre testdisk pour analyse et proceed (pas search s'il ne trouve rien)
perbugi 10/08/2007 00:29 Auteur :
Réponse le :
Message :
Bonsoir
Il y a du mieux ... J'arrive a voir mes partitions dans testdisk (système et celle que je veux récupérer) mais lorsque je fait une recherche appronfondie, il ne reste plus que la partiton système. Pour ce qui est des capture d'écran, va falloir m'expliquer car la je sèche un peu. Pour en revenir aux partitoins je pense qu'il doit y avoir un problème de géométrie :
Ptedit :
Type Boot Cyl Head Sector Cyl Head Sector Sectors Before Sectors
07 80 0 1 1 1023 239 63 63 204800337
0F 00 1023 0 1 1023 239 63 268440480 211740480
Testdisk :
1 * HPFS-NTFS 0 1 1 13544 239 63 204800337
2 E extended LBA 17754 0 1 31757 239 63 211740480
test_FAT : Boot sector doesn't have the endmark 0xAA55
Quand je fais proceed je n'ai plus que ma première partition et je ne vois pas comment faire à partir de cemoment là.
Pour info ce problèmem'est arriver lorsque je souhaitias redimensionner mes partitons avec partitions magic 8. Je voulais diminuer la taille de la partition système pour ensuite aygmenter l'autre (partiton étendue contenant une partiton logique)
Merci pour votre aide
perbugi 10/08/2007 09:09 Auteur :
Réponse le :
Message :
J'ai oublié de vous préciser un point. A l'origine ma partition système faisait 130 Go et l'autre 100 Go mais après ma panne il m'était impossible de booter. J'ai donc réinstaller Windows sur la partition système et j'ai réduis la taille de cette partition lors de lanouvelle install. Maintenant je me trouve donc avec 3 partitions :
Système (100 Go)
Une zone non allouée (30 Go)
Mes données (Musique, Photos,... 100 Go)
Le but étant de récupérer la partition de données
Merci
romsk 10/08/2007 22:26 Auteur :
Réponse le :
Message :
ta partition de données est à l'intérieur de la partition étendue : maintenant que testdisk fonctionne il faut faire (proceed > entrée > search) pour essayer de la retrouver...pour les copies d'écran, voir le paragraphe 8 search
ICI
perbugi 11/08/2007 12:04 Auteur :
Réponse le :
Message :
Voici les différentes captures d'images


 


romsk 11/08/2007 12:51 Auteur :
Réponse le :
Message :
ta partition logique est bien là, elle a les bonnes coordonnées CHS, mais elle est passée en FAT16...ferme testdisk, et retrouve ce tableau dans ptedit :


clique sur "goto EPBR" > dans la 1ère case (1ère ligne) de la colonne type, tape > clique sur "save changes" > ferme ptedit > redémarre l'ordi et regarde si t'accèdes à tes données : si ce n'est pas le cas relance testdisk et fais une copie d'écran de ce que montre maintenant analyse07
perbugi 11/08/2007 14:05 Auteur :
Réponse le :
Message :
Je n'ai toujours pas accès à mes données mais le message d'erreur n'est plus le même :
perbugi 11/08/2007 16:40 Auteur :
Réponse le :
Message :
Rebonjour tout le monde
Personne n'a une idée pour m'aider car là je sèche complètement ...
Merci d'avance
romsk 11/08/2007 22:38 Auteur :
Réponse le :
Message :
déjà ça se présente mieux : toujours dans testdisk, va dans le menu advanced > met toi sur la ligne correspondant à ta partition disparue > boot : copie d'écran
perbugi 11/08/2007 23:29 Auteur :
Réponse le :
Message :
Voici ce que me donne le "boot" de ma partition :

J'ai essayé de faire "Rebuils BS" mais cela ne m'a pas donné grand chose
En tout cas merci de m'aider car là ca me dépasse
romsk 12/08/2007 08:52 Auteur :
Réponse le :
Message :
le "rebuild BS" était effectivement la chose à faire...fais une copie d'écran de "dump", et regarde d'autre part si t'accèdes à tes répertoires et fichiers en faisant "list" (cette partition était bien en NTFS ? pas FAT32 ?)
perbugi 12/08/2007 13:34 Auteur :
Réponse le :
Message :
Effectivement cette partition était bien en NTFS. Je viens de refaire le Rebuild BS puis la command List mais malheureusement TestDisk ne m'affiche aucun fichier ni dossier. Voici les deux premières captures d'écran de dump :


J'ai parcouru tout le boot sector et il semblerait que celui-ci ne soit rempli que de 0 ....
romsk 12/08/2007 18:00 Auteur :
Réponse le :
Message :
effectivement ton BS est naze (rempli de 00), mais ton backup BS n'est pas correct non plus...télécharge et fais une copie d'écran du secteur ayant les coordonnées CHS 31758 239 63 en suivant la manip "2ème possibilité" sur l'exemple ci-dessous :
Edithexa

perbugi 12/08/2007 20:54 Auteur :
Réponse le :
Message :
Voici les coordonnées du secteur demandé :

cgrenier 13/08/2007 23:53 Auteur :
Réponse le :
Message :
perbugi, recommence un RebuildBS avec puis examine le fichier testdisk.log, copie/colle sur le forum le texte entre rebuild_NTFS_BS et "Failed to rebuild NTFS boot sector". Exemple: TestDisk 6.8
mft at 85120, seq=1, main=0 res=1read_mft_info failedntfs_find_mft: sectors_per_cluster invalidntfs_find_mft: mft_lcn 85152ntfs_find_mft: mftmirr_lcn 127727ntfs_find_mft: mft_record_size 1024mft at 127695, seq=1, main=0 res=1read_mft_info failedntfs_find_mft: sectors_per_cluster invalidntfs_find_mft: mft_lcn 85152ntfs_find_mft: mftmirr_lcn 127727ntfs_find_mft: mft_record_size 1024Potential partition: D HPFS - NTFS 0 1 1 499 14 32 255936Failed to rebuild NTFS boot sector.rebuild_NTFS_BS
















Cela permettra de vérifier si le problème vient de la table des partitions ou non.
newbita 14/08/2007 00:35 Auteur :
Réponse le :
Message :
Bonsoir tout le monde,mes futurs sauveurs!
Je crois n'avoir jamais autant connecté mes neurones(en vain) que lors de ces dernières 24h :-(
Alors,entrée en matière:Je possède deux disques durs : le 1er, système,qui fait 40G le 2ème,données,qui fait 160G partionné en X ,Y et une 3ème partition pour Acronis
Configuration pré formatage:

Bref,en post formatage:J'ai tjs le 1er,formaté,comme neuf Mais le 2ème,que je n'ai pas touché lors du processus,est tt bonnement transformé en "D",128G et detecté comme vide!format RAW et inaccessible à moins de le formater,enfin selon windows.

Alors je vagabonde,je traine,je picore sur les forums,et j'en viens à ce testdisk.Ok,je "vois" mes données intactes,suis même parvenue à en copier quelques-unes,mais je rame sérieusement pour acceder à mon disque dur.après les étapes d'analyse(les screenshots sont plus bas),je ne sais aps trop quoi faire :-S
 
 
 
 
et voilà :( ,c là que je bloque,please helpez-moi :(
newbita 14/08/2007 01:16 Auteur :
Réponse le :
Message :
Me revoilà pour une dernière info:
après le derneir screenshot que jai envoyé,si je veux changer les caactéristique des partitions,les seules configuration ki me donnant une "structure:ok" sont
* ou *P P D D D DL P



Sachant que la 2ème ligne et la 4ème ont les même numéros d'entrée et de fin(même si pas la même taille apparemment,'fin suis qu'une newbie),et que l'une est en "P" et l'autre en "D",n'y aura-t-il aps conflit???Sera-t-elle effacée?? Et bien sûr,je ne sais tjs pas quoi faire après ça.Il ya possibilié de récupérer mon disque dur tel qu'il était avant?
Merci
romsk 14/08/2007 08:05 Auteur :
Réponse le :
Message :
salut ,newbita
proceed a retrouvé tes partitions, et dans ce cas search est inutile... va sur ce tableau (menu analyse > proceed : entrée) :

toutes tes partitions sont là avec les bonnes coordonnées : il ne faut pas faire search mais > puis va dans le menu advanced, et met toi à tour de rôle sur chaque ligne > boot : et vérifie que boot sector et backup boot sector sont pour chaque partition > 1) si c'est pas le cas fais une copie d'écran, 2) si c'est le cas fais quit, ferme testdisk, éteind et redémarre le PC et c'est terminé...writeOKetidentiques
perbugi : le secteur ayant les coordonnées CHS 31758 239 63 ne correspond pas à un secteur de boot : donc si t'es sûr que c'était bien NTFS, je ne vois pas pour ma part de solution à part les logiciels de récupération, mais suis les conseils de cgrenier qui aura peut être une solution...
newbita 14/08/2007 13:33 Auteur :
Réponse le :
Message :
Bonjour,j'ai suivi votre conseil.
Le boot des 2 premières lignes est parfait.qd je veux faire celui de lma 3èème j'ai ça:


et la 4ème ,son boot me donne ça:
 .
merci encore.
perbugi 14/08/2007 16:36 Auteur :
Réponse le :
Message :
Bonjour tout le monde
Merci encore pour votre aide même si mon cas à l'aitr d'être plutôt désespéré
J'ai refait le rebuild _BS et voici le sinformations contenus dans le fichier testdisk.log
rebuild_NTFS_BS
mft at 27428657, seq=1, main=0 res=1
read_mft_info failed
ntfs_find_mft: sectors_per_cluster invalid
ntfs_find_mft: mft_lcn 4
ntfs_find_mft: mftmirr_lcn 524288
ntfs_find_mft: mft_record_size 1024
mft at 31622929, seq=1, main=0 res=1
read_mft_info failed
ntfs_find_mft: sectors_per_cluster invalid
ntfs_find_mft: mft_lcn 4
ntfs_find_mft: mftmirr_lcn 524288
ntfs_find_mft: mft_record_size 1024
Potential partition:
5 L HPFS - NTFS 19568 16 1 33572 14 63 211740417
Failed to rebuild NTFS boot sector.
blacksea 15/08/2007 10:14 Auteur :
Réponse le :
Message :
Bonjour a tous, J'ai un pb avec mon Lacie mobile external hardrive 80Go. J'ai toutes mes donnees (toutes mes recherches depuis 3 ans) dedans et Windows ne le reconnait plus. J'ai une rreur qui indique que le disque est non-formatte. J'ai lance une analyse Testdisc et voici ce que je recoit:
blacksea 15/08/2007 10:20 Auteur :
Réponse le :
Message :
Bonjour a tous, J'ai un pb avec mon Lacie mobile external hardrive 80Go. J'ai toutes mes donnees (toutes mes recherches depuis 3 ans) dedans et Windows ne le reconnait plus. J'ai une rreur qui indique que le disque est non-formatte. J'ai lance une analyse Testdisc et voici ce que je recoit:
Image ecran: [URL=http://img107.imageshack.us/my.php?image=ecranerreurux0.png][IMG]http://img107.imageshack.us/img107/8149/ecranerreurux0.th.png[/IMG][/URL]
Merci d'avance pour votre aide!!!
M.
newbita 15/08/2007 22:34 Auteur :
Réponse le :
Message :
Bonsoir tt le monde et bonsoir ,romsk
Pour changer:
Entre hier et aujourd'hui le seul truc notable que j'aie fait au pc,c'est de l'éteindre pdt la nuit et de le rallumer ce matin..Bref,en l'attente de vos réponses après mon dernier post,je n'ai même pas eu le courage de jeter un coup d'oeil à l'état des lieux. Et là!Ô surprise mêlée de pincez-moi-je-rêve et de Oh-pourvu-que-ça-ne-bouge-plus,je retrouve dans le poste de travail mes 3 partitions,nommées maintenant D,F et G... L'info bulle,dit qu'elles sont quasi pleines..mmmh..bon signe.. J'explore les dossiers,tout est là! :-|



Alors,mil mercis pour vos conseils Mister Romsk et bonne chance pour les autres 
PS:Ah et juste pour ne pas mourir idiote:un pote qui s'y connait en tt ça(pas là actuellement sinon je n'aurai aps ramé comme ça),m'avait vivement conseillé de retirer ce fameux DD avt de formater(..et jai oublié).Ma question:n'aurai-je pas eu exactemen le même blème en rebranchant le DD après le formatage?et en fait,pourquoi ai-je eu ce blème mainna?d'où ça vient?
Infomediasvc 17/08/2007 00:51 Auteur :
Réponse le :
Message :
Bonjour,Je sollicite votre aide dans l'utilisation du logiciel Testdisk.En effet, sur un pc Packard Bell sous XP SP2, les deux partitions se chevauchent et aucun logiciel tel que Gparted ou Partiton Magic n'arrive à détecter correctement l'ensemble.Partion Magic indique un disque dur défectueux mais le pc fonctionne très bien sous XP et les deux partitions sont bien détectées correctement.Je pense d'avantage à une corruption de la table d'alllocation des fichiers NTFS.Le soft indique bien les deux partitions avec néanmoins un éventuel soucis de géométrie (240 ou lieu de 255 ?) mais cependant avec chevauchement des deux partitions.Je souhaite redimensionner les partitions car XP sous 5 Go, ça le fait pas très bien... Surtout quand on a 320 Go de libre à coté sur la partition suivante avec seulement 3 Go d'occupé mais pour cela je dois d'abord réparer la table d'allocation.Merci d'avance de votre aide, CordialementFab














Ps: Le log de Testdisk:
TestDisk 6.8, Data Recovery Utility, August 2007Christophe GRENIER <grenier@cgsecurity.org>Dos version (ext2fs lib: 1.39, ntfs lib: 9:0:0, reiserfs lib: 0.3.1-rc8, ewf lib: none)Using locale 'C'.Disk 80 - 7927 MB / 7560 MiB - CHS 1024 240 63Disk 80 Enhanced BIOS 2.1 / EDD-1.1 - R/W/I - IdentifyComputes C from number of sectorsLBA 488397168, computed 488397168 (CHS=484520,15,63)hd_identify_enh_biosDisk 80 - 250 GB / 232 GiB - CHS 484521 16 63LBA size=488397168Hard disk listDisk 80 - 250 GB / 232 GiB - CHS 32301 240 63, sector size=512Disk 80 - 250 GB / 232 GiBPartition table type: IntelAnalyse Disk 80 - 250 GB / 232 GiB - CHS 32301 240 63Geometry from i386 MBR: head=240 sector=63NTFS at 0/1/1Info: size boot_sector 10485783, partition 10493217NTFS at 693/122/1get_geometry_from_list_part_aux head=240 nbr=2get_geometry_from_list_part_aux head=8 nbr=2get_geometry_from_list_part_aux head=16 nbr=2get_geometry_from_list_part_aux head=32 nbr=2get_geometry_from_list_part_aux head=64 nbr=1get_geometry_from_list_part_aux head=128 nbr=1get_geometry_from_list_part_aux head=240 nbr=2get_geometry_from_list_part_aux head=255 nbr=1Current partition structure: 1 * HPFS - NTFS 0 1 1 693 239 63 10493217 2 P HPFS - NTFS 693 122 1 32299 239 63 477890154 [HDD]Space conflict between the following two partitions 1 * HPFS - NTFS 0 1 1 693 239 63 10493217 2 P HPFS - NTFS 693 122 1 32299 239 63 477890154 [HDD]Ask the user for vista modeAllow partial last cylinder : Nosearch_vista_part: 0search_part()Disk 80 - 250 GB / 232 GiB - CHS 32301 240 63NTFS at 0/1/1filesystem size 10485783sectors_per_cluster 8mft_lcn 262144mftmirr_lcn 655361clusters_per_mft_record -10clusters_per_index_record 1 D HPFS - NTFS 0 1 1 693 121 63 10485783 NTFS, 5368 MB / 5120 MiBNTFS at 693/122/1filesystem size 477890154sectors_per_cluster 8mft_lcn 786432mftmirr_lcn 29868134clusters_per_mft_record -10clusters_per_index_record 1 D HPFS - NTFS 693 122 1 32299 239 63 477890154 [HDD] NTFS, 244 GB / 227 GiBget_geometry_from_list_part_aux head=240 nbr=1get_geometry_from_list_part_aux head=8 nbr=1get_geometry_from_list_part_aux head=16 nbr=1get_geometry_from_list_part_aux head=32 nbr=1get_geometry_from_list_part_aux head=64 nbr=1get_geometry_from_list_part_aux head=128 nbr=1get_geometry_from_list_part_aux head=240 nbr=1get_geometry_from_list_part_aux head=255 nbr=1Warning: the current number of heads per cylinder is 240 but the correct value may be 255.Results D HPFS - NTFS 0 1 1 693 239 63 10493217 NTFS, 5372 MB / 5123 MiB D HPFS - NTFS 693 122 1 32299 239 63 477890154 [HDD] NTFS, 244 GB / 227 GiBinterface_write() No partition found or selected for recoverysearch_part()Disk 80 - 250 GB / 232 GiB - CHS 32301 240 63NTFS at 0/1/1filesystem size 10485783sectors_per_cluster 8mft_lcn 262144mftmirr_lcn 655361clusters_per_mft_record -10clusters_per_index_record 1 D HPFS - NTFS 0 1 1 693 121 63 10485783 NTFS, 5368 MB / 5120 MiBNTFS at 693/122/1filesystem size 477890154sectors_per_cluster 8mft_lcn 786432mftmirr_lcn 29868134clusters_per_mft_record -10clusters_per_index_record 1 D HPFS - NTFS 693 122 1 32299 239 63 477890154 [HDD] NTFS, 244 GB / 227 GiBNTFS at 693/239/63filesystem size 10485783sectors_per_cluster 8mft_lcn 262144mftmirr_lcn 655361clusters_per_mft_record -10clusters_per_index_record 1 D HPFS - NTFS 0 119 1 693 239 63 10485783 NTFS found using backup sector!, 5368 MB / 5120 MiBNTFS at 32299/239/63heads/cylinder 255 (NTFS) != 240 (HD)filesystem size 477890154sectors_per_cluster 8mft_lcn 802815mftmirr_lcn 3840826clusters_per_mft_record -10clusters_per_index_record 1 D HPFS - NTFS 693 122 1 32299 239 63 477890154 [HDD] NTFS found using backup sector!, 244 GB / 227 GiBget_geometry_from_list_part_aux head=240 nbr=1get_geometry_from_list_part_aux head=8 nbr=1get_geometry_from_list_part_aux head=16 nbr=1get_geometry_from_list_part_aux head=32 nbr=1get_geometry_from_list_part_aux head=64 nbr=1get_geometry_from_list_part_aux head=128 nbr=1get_geometry_from_list_part_aux head=240 nbr=1get_geometry_from_list_part_aux head=255 nbr=1Warning: the current number of heads per cylinder is 240 but the correct value may be 255.Results D HPFS - NTFS 0 1 1 693 239 63 10493217 NTFS, 5372 MB / 5123 MiB D HPFS - NTFS 0 119 1 693 239 63 10485783 NTFS found using backup sector!, 5368 MB / 5120 MiB D HPFS - NTFS 693 122 1 32299 239 63 477890154 [HDD] NTFS, 244 GB / 227 GiBdir_partition inode=5 D HPFS - NTFS 0 1 1 693 239 63 10493217 NTFS, 5372 MB / 5123 MiBDirectory / 5 dr-xr-xr-x 0 0 0 15-Aug-2007 14:00 . 5 dr-xr-xr-x 0 0 0 15-Aug-2007 14:00 .. 16816 -r--r--r-- 0 0 268 15-Aug-2007 13:57 sqmdata02.sqm 4341 dr-xr-xr-x 0 0 0 3-Apr-2006 10:47 Anuman Interactive 5276 -r--r--r-- 0 0 0 30-Aug-2005 18:22 AUTOEXEC.BAT 3250 -r--r--r-- 0 0 212 30-Aug-2005 20:11 boot.ini 3213 -r--r--r-- 0 0 4952 30-Aug-2005 20:11 Bootfont.bin 24824 dr-xr-xr-x 0 0 0 26-May-2007 22:45 Bridge Base Online 5275 -r--r--r-- 0 0 0 30-Aug-2005 18:22 CONFIG.SYS 1259 -r--r--r-- 0 0 46496 10-Jan-2006 23:04 devicetable.log 14583 dr-xr-xr-x 0 0 0 15-Aug-2007 14:30 Diskeeper 3256 dr-xr-xr-x 0 0 0 30-Aug-2005 19:12 Documents and Settings 201 dr-xr-xr-x 0 0 0 14-Aug-2007 11:04 ErdUndoCache 6941 -r--r--r-- 0 0 0 30-Aug-2005 18:22 IO.SYS 20393 -r--r--r-- 0 0 1553 8-Jun-2007 17:19 i_m.txt 10122 dr-xr-xr-x 0 0 0 30-Aug-2005 21:57 kav 6942 -r--r--r-- 0 0 0 30-Aug-2005 18:22 MSDOS.SYS 3217 -r--r--r-- 0 0 47564 30-Aug-2005 20:11 NTDETECT.COM 3212 -r--r--r-- 0 0 251712 30-Aug-2005 20:11 ntldr 16294 -r--r--r-- 0 0 805306368 14-Aug-2007 11:48 pagefile.sys 28618 dr-xr-xr-x 0 0 0 2-Sep-2005 14:40 pnp 3656 dr-xr-xr-x 0 0 0 30-Aug-2005 19:13 Program Files 10099 dr-xr-xr-x 0 0 0 30-Aug-2005 22:04 RECYCLER 10922 dr-xr-xr-x 0 0 0 14-Apr-2007 17:53 SOULET1 12557 dr-xr-xr-x 0 0 0 3-Jun-2007 15:21 SOULET2 15035 -r--r--r-- 0 0 280 6-Aug-2007 12:09 sqmdata00.sqm 16577 -r--r--r-- 0 0 268 14-Aug-2007 11:50 sqmdata01.sqm 23032 -r--r--r-- 0 0 268 15-Aug-2007 14:00 sqmdata03.sqm 10140 -r--r--r-- 0 0 268 15-Aug-2007 14:22 sqmdata04.sqm 23112 -r--r--r-- 0 0 268 15-Aug-2007 17:35 sqmdata05.sqm 24329 -r--r--r-- 0 0 268 15-Aug-2007 22:56 sqmdata06.sqm 15034 -r--r--r-- 0 0 244 6-Aug-2007 12:09 sqmnoopt00.sqm 16572 -r--r--r-- 0 0 244 14-Aug-2007 11:50 sqmnoopt01.sqm 16783 -r--r--r-- 0 0 244 15-Aug-2007 13:57 sqmnoopt02.sqm 23026 -r--r--r-- 0 0 244 15-Aug-2007 14:00 sqmnoopt03.sqm 10066 -r--r--r-- 0 0 244 15-Aug-2007 14:22 sqmnoopt04.sqm 23105 -r--r--r-- 0 0 244 15-Aug-2007 17:35 sqmnoopt05.sqm 23190 -r--r--r-- 0 0 244 15-Aug-2007 22:56 sqmnoopt06.sqm 9352 dr-xr-xr-x 0 0 0 30-Aug-2005 18:25 System Volume Information 28 dr-xr-xr-x 0 0 0 30-Aug-2005 20:08 WINDOWSinterface_write() No partition found or selected for recoverysimulate write!write_mbr_i386: starting...write_all_log_i386: starting...No extended partitionTestDisk exited normally. 

http://www.cgsecurity.org































































































































































































romsk 19/08/2007 10:34 Auteur :
Réponse le :
Message :
newbita : content que ton problème soit résolu effectivement tes secteurs de boot étaient bons après le write, et tu as fais ce qu'il fallait faire c'est à dire éteindre et redémarrer le PC... Pour ta dernière question, ton pôte a raison : quand on formate un DD et qu'on réinstalle XP il vaut mieux débrancher tous les autres DD (ça t'aurait probablement évité ces problèmes...)
salut : ta 2ème copie d'écran est trop petite...bizarre ce problème de "mauvais compte de secteurs" : les coordonnées CHS affichées semblent pourtant bonnes... fais "proceed" : > entrée > search : blacksea
copie d'écrancopie d'écran
salut : si chevauchement de partition ça peut correspondre effectivement à un problème de geométrie, et tu peux essayer de le rectifier dans le menu geometry de testdisk (en mettant 255 au lieu de 240 à head), mais tu peux aussi essayer, dans le menu "option", de mettre yes à "allow partial last cylinder" et de regarder ce que ça donne dans le menu analyse...pour le reste fais des copies d'écran si tu veux plus d'aide (ou envoie ton logfile à cgrenier)infomediasvc 
Infomediasvc 20/08/2007 02:13 Auteur :
Réponse le :
Message :
Bonsoir,
Merci de ta réponse Romdsk, j'ai finalement résolu le problème en copiant la seconde partition en externe, puis en la supprimant.
Plus de problème de chevauchement, puisque plus de seconde partition.
J'ai ensuite redimensionné la première partition avec l'espace libre et recréé la seconde partition en lui restransférant ses fichiers.
J'avais envoyé déjà le log a C Grenier mais je pense qu'il devait encore être trop occupé ailleurs pour s'occuper de mes petits problèmes de partitions.
Bonne continuation
F.
Mordox 20/08/2007 17:52 Auteur :
Réponse le :
Message :
Bonsoir à tous!!
Je viens de découvrir l'outil test disk : il m'a l'air très puissant mais malheureusement je ne suis pas familier avec le vocabulaire...en gros je ne pige rien!!!!
J'ai un problème : ma clef usb est illisible (erreur windows qui me dit "inserer un disque!...")
Je lance "test disk" sur ma clef et il ne me trouve aucune partitions dessus, il me met (quand je lui demande de l'analyser) : "read block error". Après le scan, je peux charger (bouton L) ou créer une nouvelle partition (bouton A), c'est tout!
Je suis perdu et je commence à perdre espoir de retrouver un jour les fichiers qui sont dessus....Help les gens svp!!
Merci d'avance
romsk 21/08/2007 07:19 Auteur :
Réponse le :
Message :
salut ,mordox
si search ne retrouve rien et que t'as pas de problème évident de géométrie, alors il te faut passer aux , et quand t'auras récupéré tes données, reformater cette clé...logiciels de récupération
Mordox 21/08/2007 09:15 Auteur :
Réponse le :
Message :
Merci pour cette réponse rapide mais j'en ai déjà utilisé plusieurs (dans leur version gratuite) : romsk
- PC Inspector File Recovery : il ne trouve pas de disque dur logique sur ma clef
- easy recovry (j'ai que la version d'essai : elle n'arrive même pas à me montrer les fichiers de ma clef)
En gros je ne peux rien récupérer de ma clef (je vais essayer les autrres logiciels de ton lien)
Mais là je crois que je m'éloigne du sujet de test disk.
Merci quand même.
perbugi 24/08/2007 22:54 Auteur :
Réponse le :
Message :
Bonjour tout le monde
Voila j'ai un petit problème avec une partition de données. Lorsque je veut y accéder, j'ai le message d'erreur suivant :
H:\ n'est pas accessible
Le fichier ou le répertoire est endommagé et illisible
J'ai donc utilisé testdisk qui réussi à lister tous mes fichiers. Testdisk me dit que le boot sector et le backup boot secteur sont ok. Malheureusement ce n'est pas suffisant j'ai donc fait repair MFT pour la partition H -> pas de problème mais quand je fait repair MFT de la partition système testdisk me dit :
Both MFT seems ok but they don't match, use chkdsk
J'ai donc fait chkdsk sur les 2 partitions en ligne de commande et sous la console de récupération mais Windows me dit qu'il n'y a aucun problème.
A noter qu'à chaque démarrage de mon PC, Windows lance un chkdsk de H:. Lors de chkdsk Windows trouve le nom du volume mais pas dans le poste de travail.
Donc si quelqu'un à une piste ca serait génial
Merci à vous
P.S. : J'ai essayé GetDataBack for NTFS et le logiciel retrouve toutes mes données. Partition Magic réussi à me dire combien de Go sont utilisé et combien sont libres. PM réussi à retrouvé le système de fichiers (NTFS) mais Windows m'indique qu'elle est de type RAW. Pour finir Lorsque j'essaie de récupérer le secteur de boot de H: avec EditHexa, j'ai un message d'erreur qui me dit : échec lors de la récupération du type de partition.
silvJ 25/08/2007 00:46 Auteur :
Réponse le :
Message :
Bonjour,
je viens de me taper presque les 26 pages de ce topic en recherchant une réponse a mon problème. J'ai vu que vous aidiez un max de gens ... j espere que quelqu'un aura le temps de s'occuper de moi. J'ai un disque dur externe qui du jour au lendemain n'a plus fonctionné, et a afficher ce message d'erreur :la structure du disque est endommagée ou illisble.
Le DD est passé du format NTFS au format RAW
Apres avoir passé le DD au Testdisk .... les données semble présente, la unique partition du DD est retrouvé et porte son le nom que je lui ai donné (disque dur externe).
je l'ai analysé avec Testdisk et :
boot secteur : OK
backup boot secteur : OK
Sectors are identical.
a valid NTFS boot sector must be present in order to access any data; even if the partition is not bootable
L'analyse que j'ai faite de la géométrie parait également être correcte au veu de ce que j'ai lu ....
Il y aurait d'autre chose qui pourrait m'indiquer le début de la queue d'une explication ?
MERCI BEAUCOUP
romsk 25/08/2007 23:37 Auteur :
Réponse le :
Message :
salut ,* qu'entends-tu par "Lors de chkdsk " ? je comprends pas la phrase...* pour le chkdsk, t'as bien fais ? (ou chkdsk H: sous la console de récupération)* puisque edithexa te dis "échec lors de la récupération du type de partition", ce serait intéressant de voir comment PTEDIT (RAW dans ma signature) voit ce DD, la table de partition et à quoi ressemble le secteur de boot ("boot record")* sinon reste la possibilité d'un problème hardware sur ce DD : teste le avec HD-tune et avec le logiciel constructeur.* autre possibilité : si testdisk (ou autre logiciel de récup) voit tes données, copie les sur un autre DD et fais un formatage bas niveau de ce DD...perbugi
Windows trouve le nom du volume mais pas dans le poste de travail
chkdsk H: /F /R/P /R


salut ,1) fais un chkdsk /F /R en ligne de commande de ce DD,2) tu dis "les données semblent présentes"... tu les vois en faisant "list" ou non ? si tu les vois, il te reste plus qu'à les copier (sous testdisk) sur un autre DD...3) si testdisk voit la partition et que advanced-boot montre BS et backupBS OK et identiques, alors reste plus qu'à tenter "repair MFT"4) quand ce genre de problème touche un DD externe, mieux vaut le démonter de son boitier et le brancher en esclave à l'intérieur de ton PC sur une de tes nappes IDE5) si "MFT and MFTmirr are bad, failed to repair them", alors reste plus que les logiciels de récupérationsilvJ




daka 26/08/2007 17:44 Auteur :
Réponse le :
Message :
Bonjour
Je souhaite récupérer toutes les données d'un disque dur.
Je suis à ce stade dans testdisk

Merci d'avance pour votre aide.
romsk 26/08/2007 18:55 Auteur :
Réponse le :
Message :
salut daka,
ta copie d'écran est franchement prématurée, mais vu comme ça je dirai p'têt ben un problème de geométrie (il faudrait mettre 255 ou 240 à head)
daka 27/08/2007 13:54 Auteur :
Réponse le :
Message :
J'ai changé la valeur de head en mettant 240.
Ensuite j'ai eu cela :

En ce moment je suis entrain de faire l'analyse.
Suite à l'analyse :

Si j'ai bien compris c'est mort ? ://
romsk 27/08/2007 23:16 Auteur :
Réponse le :
Message :
quesako ce message "bad MAC partition..." ? tu travailles sur un DD de MAC ou est-ce que tu t'es gourré en sélectionnant la ligne MAC au lieu d'Intel au lancement de testdisk ?
daka 28/08/2007 03:23 Auteur :
Réponse le :
Message :
oui.
Même quand je choisis non partition, il me sort ces résultats.
romsk 29/08/2007 09:43 Auteur :
Réponse le :
Message :
romsk a écrit :...tu travailles sur un DD de MAC ?


klory 30/08/2007 10:12 Auteur :
Réponse le :
Message :
Bonjour,
Je decouvre votre topic tres instructif et pointu qui peut sans doute me venir en aide car j'ai un pb de disque un peu particulier
Sur mon disque externe 3,5 " en fat32 de 750 Go j'ai des données importantes mais en testant vmware qui crée un os virtuel il a "monté" sur ce disque la FAT d'un second disque externe de 2,5 " en les confondant semble-t'il.
Resultat: je me retrouve avec la FAT la liste des repertoires, fichiers et la taille du second disque (160 go) sur le premier et bien sur je n'ai plus aucun acces aux anciennes donnees !!!
Je pense n'avoir touche a rien pour l'instant ...
Est-il possible avec testdrive (ou autre) de recuperer la FAT initiale (il me semble me souvenir qu'il existe un double qque part ?)et retrouver les donnees qui deraient etre intactes ?? (le disque physique est reconnu mar les outils de gestion mais aucune partition n'apparait)
Merci de toute aide...
romsk 30/08/2007 14:09 Auteur :
Réponse le :
Message :
salut klory,
Sur une partition FAT32 le secteur de boot s'étend la FAT commence au 33ème secteur, s'étale sur plusieurs milliers de clusters, et à sa suite commence effectivement une copie de la FAT... Si ton hypothèse est la bonne, il faudra tenter un "rebuild BS" et/ou un "repair FAT" (avec qques précautions).Cependant, le secteur de boot proprement dit (secteurs logiques 0 à 2) peut lui aussi être en cause dans ton problème (en pointant vers la mauvaise FAT), et il serait intéressant de voir les informations qu'il contient en le comparant à la copie du secteur de boot (secteurs logiques 6 à 8). Pour ce, fais les copies d'écran de ce que montre testdisk > menu advanced > boot : > dump : ...sur 32 secteurs,
copie d'écrancopie d'écran
klory 30/08/2007 18:19 Auteur :
Réponse le :
Message :
Merci Romsk de ta réponse rapide.
Voici les 2 écrans demandés
c:\Graphics\Paint Shop Pro 7.02 Fr\pbddur1.gif
c:\Graphics\Paint Shop Pro 7.02 Fr\pbddur2.gif
Merci de ton aide
klory 30/08/2007 18:37 Auteur :
Réponse le :
Message :
oups..
J'ai un probleme pour inserer les images; j'ai peu l'habitude. Désolé.
J'ai cru qu'il suffisait de copier le lien vers le fichier. Je ne sais pas comment faire. Sans doute ais-je oublie de lire une doc quelque part.
Peux-tu me renseigner ?
Merci encore
 
klory 30/08/2007 22:09 Auteur :
Réponse le :
Message :
Ca y est j'ai trouvé la manip
Voici mes 2 ecrans
boot
dump

Qu'en penser ??
Merci d'avance.
romsk 30/08/2007 23:07 Auteur :
Réponse le :
Message :
arghhh, désolé mais mes vieux yeux n'en peuvent plus... 
timer 30/08/2007 23:11 Auteur :
Réponse le :
Message :
re
klory ça marche pas tes images pour romsk copier coller dans "Direct link to image"[url]http://......[/url] "dans la fenêtre URL du forum 

klory 31/08/2007 07:02 Auteur :
Réponse le :
Message :
re, re, re salut romsk...
Peut-etre vais-je y arriver ???
 
 
Enfin ...
Merci

 
romsk 01/09/2007 23:44 Auteur :
Réponse le :
Message :
oui klory, ton problème vient bien du secteur de boot qui est corrompu :
le "boot sector" correspond bien au 160 Go (828aa112 ligne 0020 correspond à 160 Go), alors que le "backup boot sector" correspond à un DD de 750 Go (c2525457 signifie 750 Go)sauf erreur, la partition de ton 750 Go devait d'ailleurs s'appeler "my book" (alors que WD passport doit correspondre à ton 160 Go...)
donc il faut faire "backup BS" > write > ferme testdisk > éteint et redémarre ton 750 Go et ...
klory 02/09/2007 09:29 Auteur :
Réponse le :
Message :
Tout est OK !!! 
Merci beaucoup. De plus grace à ton tuto trés bien fait j'en étais arrivé à la même conclusion mais j'ai préféré attendre d'avoir le feu vert de l'expert...
ça c'est "le bon coté de la force" comme dans StarWars 
Encore bravo et merci à toi pour l'excellent boulot que tu fais...
Klory
RM 02/09/2007 18:02 Auteur :
Réponse le :
Message :
Bonjour,
Je viens d'avoir un crash avec mon ordi portable. Et comme je veux récupérer les données du DD, j'ai utilisé un boitier externe avec USB. Le problème vient du fait que j'ai deux partition de 20 Go et que quand je branche le boitier sur un ordi (en xp) il ne m'apparait qu'une seule partition.
J'ai fait une analyse avec testdisk 6.7 et voilà ce que j'obtiens.
Disk /dev/sdb - 40 GB / 37 GiB - CHS 4864 255 63
Current partition structure :
Partition Start End Size in sectors
1 *HPFS - NTFS 0 1 1 2431 254 63 39070017 [Disque local]
2 E extended LBA 2432 0 1 4863 254 63 39070080
5 L FAT32 LBA 2432 0 1 4863 254 63 39070017 [NO NAME]
Voilà, j'ai essayé d'interpréter à partir des explications romsk, mais j'ai peur de faire une bétise et en plus je comprend pas pourquoi j'ai 3 partitions, enfin je crois.
Que dois-je faire pour voir les deux partitions à partir du boitier ?
Merci
romsk 02/09/2007 23:37 Auteur :
Réponse le :
Message :
content pour toi , et surtout un coup de chapeau de plus à C.grenier klory
salut ,non, tu as bien que 2 partitions : la 2 E n'est pas une partition à proprement parler, ce n'est qu'une "boite" (la partition étendue) qui contient ta 2ème partition (5 L)par contre ce que j'ai mis en rouge n'est pas normal : ce devrait être 1 et pas 0... tu t'es pas trompé en retranscrivant les données ?cette partition disparue avait-elle un nom ?RM
1 *HPFS - NTFS 0 1 1 2431 254 63 39070017 [Disque local]2 E extended LBA 2432 
01 4863 254 63 390700805 L FAT32 LBA 2432 1 4863 254 63 39070017 [NO NAME]
0


RM 02/09/2007 23:50 Auteur :
Réponse le :
Message :
Re bonjour,
Effectivement j'ai fait une erreur en retranscrivant il s'agit en fait d'un 1.
Je ne sais pas si la partition avait un nom, moi quand je l'utilisais comme disque dur de mon portable j'y accédais en allant sur D.
Puis-je en utilisant le boitier externe rendre visible les deux partitions sur un autre ordinateur ? Si oui, comment ?
Encore merci
romsk 02/09/2007 23:56 Auteur :
Réponse le :
Message :
j'imagine que les 3 lignes que tu montres sont celles obtenues dans le menu analyse. dans ce cas c'est que les descripteurs de partition sont bons. ce n'est peut être par contre pas le cas du secteur de boot : va dans le menu advanced > met toi sur la ligne de "no name" > boot : copie d'écran...
RM 03/09/2007 00:18 Auteur :
Réponse le :
Message :
Bon je n'arrive pas à coller la capture d'écran donc voilà la retranscription :
Disk /dev/sdb - 40 GB /37 GiB - CHS 4864 255 63
Partition Start End Size in sectors
5 L FAT32 LBA 2432 1 1 4863 254 63 39070017 [NO NAME]
Boot sector
OK
Backup boot sector
OK
Sectors are identical.
A valid FAT Boot sector must be present in order to access
any data; even if the partition is not bootable.
voilà
Que peut-on en déduire ??
romsk 03/09/2007 08:52 Auteur :
Réponse le :
Message :
on peut en déduire que ton problème ne vient pas du secteur de boot qui semble correct.qqpart dans testdisk tu dois pouvoir faire "list" (ou "P") : est-ce que tu vois tes données ?si tu regardes les propriétés de cette partition, est-ce qu'elle est passée en RAW ?tu dis que tu vois pas cette 2ème partition : peux-tu faire une copie d'écran de ce que montre la gestion des disques ? pour les copies d'écran, regarde paragraphe 8 



ICI
sag-man 03/09/2007 15:13 Auteur :
Réponse le :
Message :
Bonjour romsk 
Comme beaucoup de gens, moi aussi, je viens te demander de l'aide.
J'ai supprimer la partition de mon DD de stockage de musiques
En utilisant le TestDisk, Menu Analyse, ça donne:
Que dois je faire?
Merci
romsk 03/09/2007 15:57 Auteur :
Réponse le :
Message :
salut sag-man,1) dis-en plus sur le nombre de partition que tu avais, leur taille, leur nom (si t'en avais donné)...2) fais proceed : copie d'écran (+/- entrée > search : copie d'écran, si proceed ne retrouve pas ce qu'on cherche...)

Goldorak2024 03/09/2007 16:04 Auteur :
Réponse le :
Message :
Bonjour a tous et a Romsk,
Et bravo pour ce tuto qui est vraiment super , et ainsi que l'aide apporté a tous le néophites comme moi
Qui n'arrive pas a régler les problèmes un peut plus complexes....
Bon je vous expose mon problème:
Sur un disque dur de 160 G j'ai deux partitions G et I dont je me servais de sauvegarde et bein sur je n'ai pas sauvegarder
Mes donnés essentiells et personnel sur aucun autre support, jusqu'au drame.... Comme tout le monde bien sur,
Me croyant a l'abris des problèmes...
Tout marchais bien jusqu'a ce que j'utilise Partition Magic pour récuperer un peut d'espace libre de G pour l'attribuer a I,
Mais il y a eu un probleme et l'attribution de l'espace libre n'a pas pas pu etre transférer, mais depuis je ne peut plus utuliser
Tous les fichiers stocker sur I, dont toutes mes photos +/- 14 Go (aucun apperçu n'est disponible) et tous mes document,
Logiciels, music vidéo et autre bien sur très important.
Je suppose que c'est le MFT qui a été touhé et qui m'empeche de pouvoir utiliser tout le contenu de cette partition.
Ce qui est bizare c'est que ca a affècter que la partition I, et la la G est intacte.
J'ai utiliser TestDisk, fait les verif omme dans le tuto, et fait aussi aveec les options avancées, le "repair mft", mais
Pour test disk, tout est ok....
Dans les propriétées de la partition sous windows, j'ai 55 Go de libre sur 64 Go, alors que tous les fichiers selectionnées
Dans I font 64 Go....
Please Help me....
sag-man 03/09/2007 16:26 Auteur :
Réponse le :
Message :
romsk a écrit :

salut sag-man,1) dis-en plus sur le nombre de partition que tu avais, leur taille, leur nom (si t'en avais donné)...2) fais proceed : copie d'écran (+/- entrée > search : copie d'écran, si proceed ne retrouve pas ce qu'on cherche...)


Merci pour ta réponse romsk,
Mon disque dur, est de 320gb et 1 seul partition de +/- 298gb le nom je n'ai pas donné.
J'ai fais proceed et je n'ai pas de +/-
je dois faire Y ou N ?
 
romsk 03/09/2007 18:02 Auteur :
Réponse le :
Message :
sag-man, tu lis pas du tout l'anglais ? il te demande si ta partition a été créée sous Vista : tape N si non, Y si oui ou si tu sais pas...y'a pas de +/- après proceed : "+/-" dans mon language signifie "éventuellement" (
fais "éventuellement" entrée puis search si proceed ne retrouve pas ce qu'on cherche...)
salut ,difficile de t'aider comme ça : une ou deux bonnes copies d'écran valent mieux que de longs discours... fais déjà une copie d'écran de la gestion des disques en précisant quelle était la taille de tes 2 partitions avant et après modif, ainsi de ce que montre testdisk dans le menu analyse...goldorak

(quand même)
Goldorak2024 03/09/2007 19:03 Auteur :
Réponse le :
Message :
Coucou,
Alors voici les images:
Le disque sous Partition magic ou I affiche 6 Go d'utilisé sur 64 alors qu'il est plein...
Ensuite,

I sous WinXp avec les propriétés des documents contenu dans I:

Et voici les résultats ave TestDisk:
 

Voila, j'espere que a ira, les photo son petite, mais je ne sais pas ou les heberger, désolé.
A+
sag-man 03/09/2007 19:18 Auteur :
Réponse le :
Message :
romsk a écrit :

, tu lis pas du tout l'anglais ? il te demande si ta partition a été créée sous Vista : tape N si non, Y si oui ou si tu sais pas...y'a pas de +/- après proceed : "+/-" dans mon language signifie "éventuellement" (
sag-man
fais "éventuellement" entrée puis search si proceed ne retrouve pas ce qu'on cherche...)
romsk, pas beaucoup, mais, en ce moment j'ai la tête comme 
J'ai tapé Y et après N et ça donne la même fenêtre celle ci 
J'ai fais Enter et puis Search.
romsk, En attendant peux-tu me dire porquoi sur la copie d'écran "au dessus"
c'est marquer "Invalid NTFS Boot"
Fin de la Search

Maintenant sur "P" ou sur "Enter"
sag-man 03/09/2007 21:35 Auteur :
Réponse le :
Message :
Bonsoir
Est-ce qu'il y a quelqu'un pour me dire si je dois faire Enter et puis Write ou P List.
Merci
Goldorak2024 03/09/2007 21:59 Auteur :
Réponse le :
Message :
Bon apparement j'ai des soucis avec les photos,
Elles sont visibles a cette ardresse:
http://picasaweb.google.fr/Goldorak2024/MesImages
Merci
sag-man 03/09/2007 22:38 Auteur :
Réponse le :
Message :
romsk est tu la?
Après la copie d'écran au dessus j'ai fais Enter, Write et puis Boot et maintenant cette fenêtre, que dois je faire?

Merci
romsk 04/09/2007 00:01 Auteur :
Réponse le :
Message :
goldorak,bizarre la différence CHS entre le menu analyse (CHS 19612...) et proceed (CHS 19928...), mais bon... apparemment c'est le bon qui semble apparaitre dans le menu advanced > boot...à part cette réserve je vois pas trop comment testdisk pourrait t'aider (t'as déjà tenté repair MFT...) : reste plus que les ...

logiciels de récupération
sag-man,t'as bien travaillé... fais backup BS > write > ferme testdisk, éteint et redémarre le PC et ça devrait être bon...
RM 04/09/2007 01:20 Auteur :
Réponse le :
Message :
Re bonjour Romsk,
romsk a écrit :

on peut en déduire que ton problème ne vient pas du secteur de boot qui semble correct.qqpart dans testdisk tu dois pouvoir faire "list" (ou "P") : est-ce que tu vois tes données ?
OUI JE VOIS LES DONNEES
si tu regardes les propriétés de cette partition, est-ce qu'elle est passée en RAW ?
Je comprend pas l'histoire de RAW. Je regarde un peu partout et pas de RAW
tu dis que tu vois pas cette 2ème partition : peux-tu faire une copie d'écran de ce que montre la gestion des disques ?
En fait je vois la seconde partition avec Testdisk. Mais par contre dans "poste de travail", j'ai "E" qui représente la partition "disque local"
Peut-on penser que comme j'utilise un boitier et que la partition 1 est bootable, elle ne permet pas de monter la partition 2 ? qui d'ailleur n'a pas de nom "no name". faut-il modifier le type de partition principal...?
Merci 
Goldorak2024 04/09/2007 11:27 Auteur :
Réponse le :
Message :
Je peut rien faire de plus avec test disk? 
On peut pas réparer cette MTF autrement?Au fait c'est bien la MTF qui est en cause a ton avis?
Si j'essai de récupérer les dossier sous linux, tu crois que j'ai plus de chance?
En tout cas merci pour tes réponse.
sag-man 04/09/2007 11:39 Auteur :
Réponse le :
Message :
Yessss.....!!!!!!! ça marche... tout y est!!!!!
MILLE FOIS, FOIS MILLE FOIS MERCI ------------------- ROMSK
romsk 04/09/2007 12:21 Auteur :
Réponse le :
Message :
content pour toi sag-man
oui , j'ai bien l'impression que c'est ta MFT qui est corrompue, ou en tout cas qu'une nouvelle MFT de 6 Go est référencée au lieu de la 64 Go de l'ancien I:... T'es bien sûr d'avoir fait search après proceed ?si ce qui t'importe est avant tout de récupérer tes données, alors regarde déjà ce que ça donne avec les logiciels gratuits dont je donne les liens plus haut. Sinon, bien sûr que tu peux également tenter une récup sous linux.Si tu veux aller plus loin dans les bidouilles (et si search ne donne rien), alors on peut chercher l'ancienne MFT avec Edithexa comme j'explique paragraphe 3...goldorak

ICI
RM, si tu sais pas faire les copies d'écran (malgré le tuto de MJ54 que je t'indique plus haut...), met au moins les liens...si tu vois tes fichiers en faisant list, y'a pas de raison qu'on n'arrive pas à rétablir ta partition, mais pour ça il me faut toutes les copies d'écran (proceed, search, boot, et gestion des disques...). Plus simplement tu peux aussi, quand tu vois tes fichiers, utiliser la fonction copier "c" comme expliqué en 1ère page...
Goldorak2024 04/09/2007 16:09 Auteur :
Réponse le :
Message :
Coucou,
Alors voici les résultat de Serach....Il a bien trouvé 2 partitions qui on été éffacé,bizarre car ce sont quasi les meme
et on dirai deux partition I.
je suis Passer a coté hier en voulant aller trop vite certainement.
Je joint les trois photos du résultat avec chaque ligne sélectionné, et comme tu peut le constater
Sur la dernière ligne on lit: NTFS found backup sector!
Je restore quellle ligne???En partition Logique je suppose?
En tout cas merci de ton aide.



Goldorak2024 04/09/2007 16:19 Auteur :
Réponse le :
Message :
Une autre image, avant de lancer l'analyse j'ai trois ligne dont une nommé: Extended LBA
Est-ce normal Doc?
Merci

romsk 04/09/2007 17:20 Auteur :
Réponse le :
Message :
met toi sur chacune des 2 lignes D(eleted) > et cliques sur "P" pour voir si t'accèdes à tous tes fichiers sur l'une ou sur l'autre...
Goldorak2024 04/09/2007 19:18 Auteur :
Réponse le :
Message :
Alors,
La première ligne j'ai accès au fichiers tel qu'il sont en ce moment sur le disque, c'et a dire format inconnu ou endomagé.
Et pour deuxième voila le résultat:

Goldorak2024 04/09/2007 20:54 Auteur :
Réponse le :
Message :
Bon voici le résultat de scan de EditHexa sur le disque qui contien les 2 partitions.
31 occurences, je doit rechercher lesquelles commence par le mot FILE en début de secteur?
Est ce que je fait le meme scan que sur la partition I?

Goldorak2024 04/09/2007 23:04 Auteur :
Réponse le :
Message :
Voici le scan de la partition I sur la disque dur, 25 occurences:

Goldorak2024 04/09/2007 23:30 Auteur :
Réponse le :
Message :
Voici les trois occurences commencent par "File" et "MFTMirr" au milieu trouvé dans la partition I :



Voila, que puis je faire de plus Doc????
romsk 04/09/2007 23:45 Auteur :
Réponse le :
Message :
c'est la dernière option qui est la bonne, c'est à dire le scan sur la partition I que tu veux récupérer (et pas le scan sur tout le DD...)oui, les occurences intéressantes sont celles qui contiennent file au début et MFTmirr au milieu, puis reste plus qu'à convertir ça en cluster et comparer ces valeurs avec celles qui se trouvent dans le secteur de boot de la partition...
RM 05/09/2007 02:53 Auteur :
Réponse le :
Message :
romsk a écrit :
, si tu sais pas faire les copies d'écran (malgré le tuto de MJ54 que je t'indique plus haut...), met au moins les liens...si tu vois tes fichiers en faisant list, y'a pas de raison qu'on n'arrive pas à rétablir ta partition, mais pour ça il me faut toutes les copies d'écran (proceed, search, boot, et gestion des disques...). Plus simplement tu peux aussi, quand tu vois tes fichiers, utiliser la fonction copier "c" comme expliqué en 1ère page...
RM

Désolé pour les copies d'écran, je te les envois :
Voici le test boot partition 1 /
 
Et maintenant le test boot partition 2
Après le proceed :


Après search qui donne les même infos :

Et la gestion du disque où il n'existe pour le disque E qu'une seule partition de 37,26 Go (?):


D'autant plus que quand je demande les propriétés du disque E voilà ce que j'obtiens :
Voilà, j'espère que cela pourra t'aider à analyser la situation. C'est assez bizarre tout de même.

Peut-il s'agir du pilote qui gère la lecture du disque externe ??
Merci encore pour ton aide.
romsk 05/09/2007 08:49 Auteur :
Réponse le :
Message :
effectivement y'a une incohérence entre ce que montre la gestion des disques, les propriétés du disque et ce que montre testdisk...à mon avis ça vient du MBR de ce DD : peux-tu faire une copie d'écran de ce que montre PTEDIT (partitions disparues dans ma signature) ?autre option = démonter ton boitier externe et mettre ce DD en interne (sur la nappe IDE dans ton PC) et regarder ce que ça donne : en t'affranchissant de la connectique USB et des éventuels drivers, ça pourrait résoudre le problème (ou en tout cas simplifier la réflexion...)

Goldorak2024 05/09/2007 09:49 Auteur :
Réponse le :
Message :
romsk a écrit :c'est la dernière option qui est la bonne, c'est à dire le scan sur la partition I que tu veux récupérer (et pas le scan sur tout le DD...)oui, les occurences intéressantes sont celles qui contiennent file au début et MFTmirr au milieu, puis reste plus qu'à convertir ça en cluster et comparer ces valeurs avec celles qui se trouvent dans le secteur de boot de la partition...



Donc ce sont les trois capture d'écrans que j'ai mise qu'on prend, comment je les transformes en cluster, et les compare avec celles du secteur de boot??
Secteur N° 6291458 - 6778202 - 72854742
Merci romsk.
romsk 05/09/2007 13:49 Auteur :
Réponse le :
Message :
affiche le secteur de boot de cette partition (PTEDIT > boot record), le nombre de secteur par cluster y est indiqué... 
Goldorak2024 05/09/2007 22:45 Auteur :
Réponse le :
Message :
Voila Mr, j'espere que c'est bien ça que tu veut.

romsk 06/09/2007 06:21 Auteur :
Réponse le :
Message :
désolé goldorak, mais l'image passe pas...
Goldorak2024 06/09/2007 10:01 Auteur :
Réponse le :
Message :
Tho.....
Voila le lien direct:
http://picasaweb.google.fr/Goldorak2024/MesImages/photo#s5106822926415076482
Sinon: http://picasaweb.google.fr/Goldorak2024
Merci
romsk 06/09/2007 11:49 Auteur :
Réponse le :
Message :
la copie d'écran de ce que montre getdataback pour cette partition donne la taille du cluster (8 signifie 8 secteurs par cluster), ce qui permet de calculer le cluster de départ de ta MFT et MFT mirror pour les 3 valeurs que tu donnes : or, les 2 premières valeurs donnent exactement celles qui apparaissent déjà dans getdataback (786 432 et 8 472 275) et la 3ème ne donne pas de chiffre juste (chiffre avec virgule) et ne peut donc pas correspondre à une adresse de MFT pour cette partition (ça doit être la MFT de l'autre partition qui commençe au CHS 11175...).on ne peut donc pas faire de manip sur l'adresse de la MFT pour cette partition 

par contre, quand je vois ce que montre getdataback (59 % de concordance entre MFT et fichiers), ça me rappelle la manip qu'a tentée FLO4 dans son "étape 2", et peut être comme lui qu'il te suffirait d'élargir la recherche secteurs pour avoir une meilleure concordance et retrouver ainsi tes données ? (81 % de concordance lui a apparemment permie de tout retrouver...). En tout cas ça vaut le coup d'approfondir la recherche avec getdataback...ICI
sinon reste plus que les logiciels de récupération...
Goldorak2024 06/09/2007 22:39 Auteur :
Réponse le :
Message :
Non me dit pas ça romskJe compte vraiment sur toi pour m'en sortir
J' avais vu le cas de FLO4, mais dans son cas on vois bien que les deux résultat se resemble sauf qu'ils ne sont pas en face.
Mais bon je m'étai dit essaye on ne sai jamais, malheureusement pour moi ça n'a pas marché.
Mais ce qui est le plus étonnant c'est que avec 59% de conordance je n'ai pu que récupérer qu'une dizaine de Giga sur plus de 60 
Et je ne comprend pas pourquoi.Ce qui est le plus rageant c'est quand même de voir tous les fichiers et dossier sur le disque dur et de
Ne pouvoir rien utiliser et récupérer et tout ça c'est que a cause de la MTF???
En tout cas merci, si tu as d'autres idés ou besoin que je fasse d'autre manip n'hésite pas je suis près a m'arracher les cheveux si
Ca peut me sauver quleques dossier....
Encore merci Romsk.
romsk 07/09/2007 00:26 Auteur :
Réponse le :
Message :
garde tes cheveux et essaye, comme déjà suggéré, d'autres ... logiciels de récupération
baclown 07/09/2007 16:15 Auteur :
Réponse le :
Message :
bonjours a toi Romsk,
je suis tombé hier sur ce forum très interessant tu fait du très bon travail, ca m'a beaucoup servis mais malgès cela je n'est pas encore pu récupérer mes données. 500g perdu dans les oubliettes de mon disque musique travail et compagnie qu'elle déception mais je ne pêrd pas espoir et vient soliciter ton aide bon pour récapituler g essayer
- chkdsk
-démontage du boitier (dde)pour le brancher en sata direct car avt usb.
-test disk je lance un analyse en create: intel il reconnait le disque en HFS avec une partition mais pas de fichié qui apparait.(la je voulai tinsérer des scans mais je crois qu'il faut avoir une URL...)continue: structure ok avec A et L comme choix.EEnsuite g relancé une analyse en mode none comme je n'est qu'une seul partition dans ce dde. la premiere fois je l'arrete au bout de 10 minute toujours 0% et la miracle des nom de fichié apparaisse et je peut le sélectionner le format du disque je le passe en FAT32 (reconnue en raw avant dans la gestion des diques) et je quitte.la j'ai pu accéder a mon dd et les fichié trouvé par testdisk étai la mais inutilisable se sont des films 700mo environ et c'était en ko juste la taille des icones. J'ai relancé le meme analyse mais cette fois ci en étant plus patient? malheureusement le PC c'est éeid a la fin de l'analyse(oublier de passer en mode toujours actif) donc je n'est pu voir le résultat de cette analyse.
Je vais le relancer mtn et essayer de te l'insérer avec les autres scans que j'ai pu faire afin que tout ca soit plus claire pour toi.Si quelqu'un peu m'aider pour cela.
merci de votre aide
baclown 08/09/2007 12:58 Auteur :
Réponse le :
Message :
Salut ROmsk,
voila les résultat qui apparaissait lors du test dans /create - nono - analyse -bakup.Malheureusement l'analyse n'a pu se terminer après plus de 10heure a tourner. Si tu peuxx m'aider je te serai très reconnaissant car là j'en perd mon latin.

leigz 08/09/2007 19:25 Auteur :
Réponse le :
Message :
Bonjour, j'ai par erreur supprimé une partition d'un disque (j'me suis trompé le lecteur), le disque avait donc disparru du poste de travail, j'ai donc voulu recréer une partition avec partition magic mais maintenant le disque est totalement vide.
J'ai effectué une analyse avec Testdisk mais il n'a rien trouvé.
Comment dois-je faire ? 
romsk 09/09/2007 07:51 Auteur :
Réponse le :
Message :
baclown, puisque ton DD était partitionné tu n'avais aucune raison d'utiliser "none", il fallait faire intel comme tu as fait au début... j'ai bien compris que t'avais rien retrouvé avec intel, mais avais-tu bien fait search ? as-tu vérifié sur le tableau d'"analyse" que t'avais pas de problème de geometrie qui puisse expliquer ton histoire ? bref, le mieux est de refaire intel > analyse : copie d'écran > proceed : copie d'écran > entrée > search : copie d'écran...
salut , la mauvaise idée, après avoir effacé ta partition, est d'en avoir recréé une... toi aussi fais analyse > proceed : copie d'écran > entrée > search : copie d'écran...leigz
baclown 09/09/2007 16:17 Auteur :
Réponse le :
Message :
je viens de terminer l'analyse en mode intel voila ce que ça ma donné.


j'avai plus de résultat en mode none dans qu'elle cas peut ont l'utiliser?après cette copie j'ai essayé d'aller dans advanced "no partition advailable" et comme seul coix "quit".
romsk 09/09/2007 19:10 Auteur :
Réponse le :
Message :
c'est normal qu'advanced ne trouve rien si analyse ne trouve rien... je vois ta 1ère capture qui correspond à analyse > puis j'imagine que t'as fait proceed, mais le 2ème écran que tu montres correspond à quoi ? à ce que tu obtiens après proceed ?? tu ne vois pas search ???
baclown 09/09/2007 19:28 Auteur :
Réponse le :
Message :
oui c le résultat après avoir lancer l'analyse mais je remarquer aujourd'hui que sur ptedit les coordonnée du disque était toute a zéro et je ne pouvait accéder au disque a partir du poste de travail je les est donc remise comme je les avait trouvé au début du bug(sf pour le 06 ou gmit 0b ppour FAT32.)
après le disque est denouveau reconnu dans le poste de travail mais pas possible de l'ouvrir toujours reconnu en RAW dans les propriété.
baclown 09/09/2007 19:35 Auteur :
Réponse le :
Message :
C bon j'ai put acceder a search après l'analyse  
je vien de lancer search je te transmet les résultats dès que c'est terminer.
Encore merci m'aider.
baclown 09/09/2007 20:11 Auteur :
Réponse le :
Message :
bon je commence a mes découragé c 'est les mêmes résutats:que faire de plus...
baclown 09/09/2007 21:43 Auteur :
Réponse le :
Message :
Bon la je suis aller dans advanced et cette fois si il m'a sorti des fichiés avec le choix de réponse y ou n(7 cluster de trouver).J'ai mit no de manière a en rechercher plus. et voici le résultat.pourkoi ces fichiés sont sorti? avant de cliquer sur No j'avai des Films qui était présent ur mn DD.il norait pas du apparaitre enplus des nouveaux résultats?

romsk 10/09/2007 00:33 Auteur :
Réponse le :
Message :
je sais pas de quel Y, N ou A tu parles, mais la (relativement) bonne nouvelle c'est qu'advanced te retrouve une partition en fat32 que rien ne retrouvait jusqu'à présent (peut être grâce à tes réécritures sous ptedit ?...)donc retourne dans le menu analyse > proceed pour vérifier qu'elle apparait bien toujours (si ce n'est pas le cas il faut la recréer par la touche "A" = add partition) > et si c'est le cas retourne dans le menu advanced > boot pour voir comment apparaissent secteur de boot et backup BS (tous les deux OK et identiques ?...)
baclown 10/09/2007 02:13 Auteur :
Réponse le :
Message :
 
La j'ai lancé Rebuild Bs et voila ce qui est apparu:
romsk 10/09/2007 07:27 Auteur :
Réponse le :
Message :
c'est ça que tu cherches ou non ?si c'est le cas, il faut faire write après rebuild BS > puis fermer testdisk, éteindre et redémarrer ton DD externe et alors voir si t'as tout retrouvé...
baclown 10/09/2007 12:56 Auteur :
Réponse le :
Message :
c'est une parti des fichiés que j'avai sur ce disque dur.Par contre je les retiré de son boitié et branché en SATA pourquoi est t-il reconnu en dev/sdb? j'ai donc fait ce que tu m'a dit(white et bs redémarer) le disque apparait toujours dans poste de travail mais impossible de l'ouvrir il fait ralentir considérablement le Pc. De plus lors du redémarage avant de rentrer dans windows il m'a ouvert une fênetre de vérification des erreurs pour le dd concerné avec un message du type: "le volume n'est pas un disque windows xp voulez vous continué?"la je m'est oui et il quite la vérification "erreur de sortie".
baclown 10/09/2007 13:02 Auteur :
Réponse le :
Message :
c ce que j'obtien dans analyse maintenant pourquoi FAT32LBA?
 
romsk 10/09/2007 14:18 Auteur :
Réponse le :
Message :
clique sur "P" pour lister les fichiers et répertoires sur cette partition, et si tu les vois tu dois pouvoir les copier sur une autre disque dur par la touche "C". quand ce sera fait il ne te restera plus qu'à formater ce DD...
TiBiDi31 11/09/2007 23:06 Auteur :
Réponse le :
Message :
(j'ai créé un compte exprès pour pouvoir te dire merci)
MERCI!! MERCI!! MERCI!! MERCI!! MERCI!! MERCI!!
avec ce post, tu as gagné ton entrée au paradis, Facile!
et merci aussi au créateur de testdisk, c'est cool!!
romsk 12/09/2007 06:59 Auteur :
Réponse le :
Message :
 ben ça c'est gentil TiBiDi31... ça me va droit au 
webj 12/09/2007 17:07 Auteur :
Réponse le :
Message :
Bonjour,
J'ai un problème avec un disque dur.
Le sytème arrive à voir qu'il sagit d'un partition ntfs, mais le chkdsk n'arrive pas à le tester/corriger ni tester testdisk à lire les fichiers.
Je pense que le problème se situe au niveau de mft.
Pouvez vous me donner des pistes pour mon problème ?
Merci
romsk 12/09/2007 20:37 Auteur :
Réponse le :
Message :
salut webj,
une ou plusieurs partitions sur ce DD ? une ou plusieurs partitions qui posent problème ?commence par tester ce DD avec le logiciel constructeur et avec hd-tune
MATHOS-91 12/09/2007 20:40 Auteur :
Réponse le :
Message :

Bonsoir, je m'insère danc cette discution car je me bagarre avec un disque de portable TOSHIBA de 2.5" de 6 Go qui me servait de stockage et est passé en RAW, je tente de reconstruire la geometrie mais les données écrites sur le HDD different de celles trouvées sur le site du fabricant,
pour exemple sur le disque:
Numbers of logical cylinders 12416
Numbers of logical heads 15
Sur le site :
Number of cylinders 15,200
Number of heads 2 (???)DATA
Bytes per sectors 512 (valeur absente sur l'étiquette du disque)
Quelles données dois je entrer, celles du disque ou les autres?
Peut être cela a t'il été déja évoqué sur ce topic mais c'est devenu un vrai roman feuilleton et je n'ai pas relu les 25 dernières pages.
Je ne souhaite pas récupérer les fichiers présents mais juste le formater pour le rendre de nouveau opérationnel!
Merci d'avance

romsk 12/09/2007 23:08 Auteur :
Réponse le :
Message :
salut mathos-91,
il faut toujours croire ce qui figure sur le DD (et d'ailleurs 12416 cylindres x 15 têtes x 63 secteurs par tête x 512 octets par secteurs = 6 Go) si ce n'est que les valeurs de têtes et de cylindres sont souvent différentes et sont extrapolées par le BIOS grâce aux extensions de l'interruption logicielle 13h qui va gérer les données en mode LBA (Logical Block Addressing). en d'autres termes, même si c'est "15 heads" qui figure sur le DD, la geométrie de ce DD peut très bien être à 256 (cas le plus fréquent), 240, ou encore 16, 32, 64...le plus simple est d'utiliser le menu geometry en modifiant uniquement "heads" (en commençant par 255...) puisque "cylinder" sera calculé automatiquement quand tu valideras, et de regarder ce que ça donne...

MATHOS-91 13/09/2007 19:06 Auteur :
Réponse le :
Message :

Merci ROMSK pour ta réponse, hélas TestDisk ne trouve pas de partition et ce HDD de 2,5" n'est pas reconnu par le bios quand je le met dans un PC de bureau avec un adapteur 2,5/3,5" mais seulement lorsqu'il est placé dans un boitier externe USB2, aussi je n'arrive pas à créer une partition à partir du CD de XP Pro ni avec une disquette d'installation, ni d'ailleurs avec Partition Magic 8.0.
Je vais me résoudre à le mettre à la poubelle, la mort dans l'àme car ça faisait une belle clé USB!

romsk 13/09/2007 21:10 Auteur :
Réponse le :
Message :
MATHOS-91 a écrit :

...reconnu ...seulement lorsqu'il est placé dans un boitier externe USB2...
s'il est reconnu de cette manière par ton PC, testdisk doit pouvoir aussi le voir dans cette configuration
MATHOS-91 13/09/2007 21:13 Auteur :
Réponse le :
Message :

Oui mais avec TestDisk je n'arrive pas à recréer une partition, il est toutefois possible que je sois une quiche!
CHKDSK ne permet pas la réparation non plus.

romsk 14/09/2007 09:19 Auteur :
Réponse le :
Message :
MATHOS-91 a écrit :

Oui mais avec TestDisk je n'arrive pas à recréer une partition,

peut être qu'il faut au préalable modifier la geométrie dans le menu geometry et/ou refaire un MBR par le menu MBR code...
MATHOS-91 14/09/2007 17:45 Auteur :
Réponse le :
Message :
romsk a écrit :

MATHOS-91 a écrit :

Oui mais avec TestDisk je n'arrive pas à recréer une partition,

peut être qu'il faut au préalable modifier la geométrie dans le menu geometry et/ou refaire un MBR par le menu MBR code...

C'est bien ce que j'ai tenté de faire, sans résultat visible car j'ai bien eu le message que la MBR avait été reconstruite mais le HDD est toujours RAW.
romsk 14/09/2007 20:02 Auteur :
Réponse le :
Message :
sans copie d'écran de testdisk je peux pas t'en dire beaucoup plus (sinon, poubelle... )
yacouba85 18/09/2007 17:52 Auteur :
Réponse le :
Message :
Bonjour romsk, tout d'abord bravo pour ces explications détaillées.
Cependant j'aurai besoin de ton aide.
J'ai un sata 160Go, après un plantage lors d'une analyse avec un anti virus,
aparament le mbr est crashé.
A l'origine j'ai 3 partition sur ce disques ( Win Xp :mon OS: 40Go ~, Donées1 : 50Go ~ et Données 2 : 50Go ~)
voila le résultat de l'analyse avec TestDisk:

Là j'avou que je ne sais vraiment pas quoi faire, et où est ma partition Win Xp.
Si tu peu me guider pour la suite je t'en serai reconnaissant.
merci
amicalement
romsk 18/09/2007 19:16 Auteur :
Réponse le :
Message :
salut yacouba, et bravo pour tes explications claires et concises (ça change... )
manifestement données 1 et 2 sont là, mais c'est ta partition système qui a disparu : fais search : copie d'écran...
yacouba85 18/09/2007 22:42 Auteur :
Réponse le :
Message :
Ok mais de ttes façon j'ai rien d'important dans ma partition système.
J'ai essayer de faire search mais la recherche bloque à 31% sans raison et sans message d'erreur.
Je vais réessayer et mettre le résultat.
merci
A suivre
Voici le résultat de la fonction search, même blocage que lors de la première fois:

J'ai attendu 5min pour voir si ça allais se débloquer, même résultat.
si tu as une autre chose à me faire tester je suis preneur merci
raf64flo 19/09/2007 13:46 Auteur :
Réponse le :
Message :
Très bon ce tuto !! Merci beaucoup romsk !
De mon côté, j'ai toujours un petit problème et je préfère avoir un avis expert avant de toucher à quoi que ce soit.J'ai installé Ubuntu en dualboot avec Vista, j'ai réussi à lancer une fois Ubuntu, mais la deuxième fois je suis tombé sur un écran d'erreur juste après grub : 

CodeEnd : 0x3EF2C 0
root(hd0,3)
Warning : Unrecognized partition table for drive80. Please rebuild it by using a Microsoft-compatible fdisk tool (err=22). Current C/H/S=16383/129/63Error 19 : cannot mount selected partition.
Press any key to continue...
J'ai donc lancé TestDisk, et voici quelques screenshots...
 
On voit le CHS qui ne semble pas très normal. 

Ici, le message d'erreur relatif au CHS, le nombre de têtes pas cylindres est de 129, mais la valeur correcte devrait être 8. Mais il n'est rien mentionné pour les secteurs par pistes (4 au lieu de 63 ?)


Là on constate que TestDisk estime le la partition bootable est la Recovery, or en pratique, c'est la partition Vista qui est chargée, enfin, c'est qu'il me semble... A moins que la partition Recovery soit celle qui boot et qui charge ensuite la partition Vista ?Donc, faudrait-il que je modifie la géométrie des partitions concernées ? 


Merci de ton aide.  
yacouba85 19/09/2007 20:25 Auteur :
Réponse le :
Message :
salut romsk j'ai fais un search et toujours pareil il bloque a 31%,
pour la partition système ce n'est pas trop grave si je n'arrive pas a la récupéter cependant les 2 partitions données
me sont assez importantes, peut tu me guider s'il te plait.
Je voulais ajouter, si ça peut aider, que mon disque entier est reconnu en slave en étant qu'une partition et son système de fichiers est RAW, puis quand je veux y accéder il me dit : ce disque n'est pas formater voulez vous le formater?
Si ça peut t'aider à cèrner mon problème.
merci d'avance
amicalement
Romsk j'ai vraiment besoin de toi 
romsk 19/09/2007 22:18 Auteur :
Réponse le :
Message :
yacouba, ton disque est peut être abîmé (témoin de blocage à 31 % ?)...tu pourrais commencer par une analyse de ce DD avec hd-tune et avec le logiciel constructeur, mais si seules tes données 1 et 2 sont importantes, on devrait pouvoir les récupérer sous testdisk : vérifie que ces 2 partitions apparaissent bien dans le menu advanced, et si c'est le cas met toi sur chacune d'entre elle (à tour de rôle) et 1) vérifie que boot sector et backup Boot Sector sont OK et identiques, 2) quand tu es sur ces partitions fait "list" pour vérifier si t'accèdes bien à tes données...
salut ,effectivement c'est bizarre cette histoire de partition bootable qui semble être une fois ta recovery et une fois ta vista ?!... ceci dit, dans un 1er temps, il me semble nécessaire de remettre une géométrie plus conforme à ce qu'on trouve d'habitude, c'est à dire 255 et 63... pour ce, va dans le menu geometry &gt; met 255 à head et 63 à sector (sans te préoccuper de cylinder qui s'ajustera automatiquement) &gt; done &gt; entrée &gt; write &gt; menu analyse &gt; proceed : copie d'écran...raf64flo
yacouba85 20/09/2007 12:15 Auteur :
Réponse le :
Message :
Merci beaucoup Romsk j'ai réussi à récupérer mes deux partition données en intégrale. Ouahouuu 
En ce qui concerne la partition système je suis dessus, par curiosité je vais quand même essayer
de la récupérée.
Merci encore et franchement magic ce petit soft de Christophe Grenier.
amicalement Yacouuba
Et a la prochaine. 
raf64flo 20/09/2007 13:31 Auteur :
Réponse le :
Message :
romsk a écrit :
salut ,effectivement c'est bizarre cette histoire de partition bootable qui semble être une fois ta recovery et une fois ta vista ?!... ceci dit, dans un 1er temps, il me semble nécessaire de remettre une géométrie plus conforme à ce qu'on trouve d'habitude, c'est à dire 255 et 63... pour ce, va dans le menu geometry &gt; met 255 à head et 63 à sector (sans te préoccuper de cylinder qui s'ajustera automatiquement) &gt; done &gt; entrée &gt; write &gt; menu analyse &gt; proceed : copie d'écran...
raf64flo

Ok, voici les copies d'écran :


 
Voilà, à cet écran, je dois faire write ou pas ?
Car dans les écrans précédents, je n'ai pas eu l'occassion d'écrire quoi que ce soit.
Je garde le logiciel ouvert en attendant ta réponse. Merci bien.  
romsk 21/09/2007 13:54 Auteur :
Réponse le :
Message :
non, pas la peine de faire write puisque search ne retrouve rien de plus que ce que montrait déjà proceed (le tableau avec les lignes vertes). je sais que sous vista les décomptes CHS sont différents de sous XP (dixit c.grenier), et finalement les coordonnées CHS qui apparaissent ne sont peut être pas si fantaisistes que ça ???quand tu es sur le tableau de proceed (avec les lignes vertes) > met toi sur chaque ligne à tour de rôle > et clique sur "P" pour voir si t'accèdes à tes fichiers et répertoires...
raf64flo 21/09/2007 18:06 Auteur :
Réponse le :
Message :
Ok, donc les coordonnées CHS j'en fais quoi finalement ?
Pour les partitions, j'arrive à les lister sans soucis au niveau contenu :
 
 
 
 http://site.voila.fr/bladeut64/testdisk/List_partitions.jpg" />
Avec cette liste de partition :
 Ce te donne une idée pour me conseiller ? Tu veux que je teste pour redémarrer ?  

romsk 21/09/2007 21:56 Auteur :
Réponse le :
Message :
c'est bon signe si tu vois tes données...quand tu es sur le tableau lignes vertes, fais entrée > write > menu advanced > met toi sur chaque ligne à tour de rôle et fais "boot" pour voir si, pour chaque partition, boot sector et backup boot sector sont > si c'est le cas tu peux fermer testdisk, éteindre puis redémarrer ton PC et regarder si t'accèdes à tes données, sinon fais copie d'écran...
OKetidentiques
raf64flo 21/09/2007 23:31 Auteur :
Réponse le :
Message :
Ok, voilà ce que ça donne en image :
http://site.voila.fr/bladeut64/testdisk/4/boot_sector_1.jpg
http://site.voila.fr/bladeut64/testdisk/4/boot_sector_2.jpg
http://site.voila.fr/bladeut64/testdisk/4/Superblock_Linux.jpg
http://site.voila.fr/bladeut64/testdisk/4/LBA.jpg
http://site.voila.fr/bladeut64/testdisk/4/boot_sector_3.jpg
Pour la partition Linux, je ne peux pas vérifier comme tu peux le voir, il ne me propose que de quitter, de localiser les backup de Superblock et de changer le type de la partition.
Pour la partition extended LBA, je n'ai le choix qu'entre modifier le type et quitter.
Par contre sur l'image 2, il est précisé :
A valid NTFS boot sector must be present in order to access data
C'est précisé pour totues les partitions compatibles Windows, est-ce que ça se un soucis en ce qui concerne la parttion bootable ?
Bon, je redémarre, et je te dis.
EDIT : Bon, problème, il n'a pas aimé là. Il a redémarrer et a biooté sous Windows sans passer par l'écran de dual-boot. Ensuite, après avoir chargé Windows, je suis tombé sur une fenêtre pour rétablir l'installation de Windows Vista avec la partition Recovery semble-t-il.
Je vais voir avec testdisk via Live-CD si il n'a pas laissé la partition Recovery en bootable au lieu de la partition NTFS...
raf64flo 22/09/2007 01:18 Auteur :
Réponse le :
Message :
Ok, en relançant via UltimateCD et TestDisk, j'ai pu relancer Vista correctement.
En revanche, j'ai toujours le même soucis au démarrage de Linux avec le même message d'erreur précisé dans mon premier post ici.
romsk 22/09/2007 08:44 Auteur :
Réponse le :
Message :
pour "l'extended LBA", c'est normal que tu n'ais pas "boot" (y'en a pas...).pour le "warning" concernant "a ntfs boot must be present...", il faut pas y prêter attentionpour le reste c'est déjà bien que tu puisses à nouveau booter sous windows, mais je ne peux plus te conseiller car je connais rien à linux : pose la question sur le forum linux concernant ce message d'erreur au démarrage et/ou réinstalle linux ? (mais n'y a t'il pas une impossibilité ou des précautions à prendre avec vista ?)

raf64flo 22/09/2007 13:25 Auteur :
Réponse le :
Message :
Si il y avait bien des problèmes entre Vista et Ubuntu, mais d'autre y sont arrivés.
Bon, je vais tenter de réinstaller une dernière fois Linux. Et si ça ne marche pas, je verrais pour virer Vista et y mettre un XP. J'espérais pouvoir régler ce problème de partition, mais cela ne fonctionne pas...
Merci pour ton aide Romsk.  
Mr_GT 24/09/2007 14:13 Auteur :
Réponse le :
Message :
Bonjour tout le monde,
Apres l'analyse testdisk me dis " No partition is bootable ", je ne peux pas lister les répertoires et dossiers de mon dd... Normal ?
romsk 24/09/2007 18:54 Auteur :
Réponse le :
Message :
salut Mr GT,
non pas normal... as-tu fait proceed et search ?
Mr_GT 24/09/2007 19:30 Auteur :
Réponse le :
Message :
Oui, rien n'apparais enfaite.
romsk 24/09/2007 21:05 Auteur :
Réponse le :
Message :
vu les nombreux renseignements que tu donnes je peux pas plus t'aider : relie le sujet en 1ère page...
Medoudou 27/09/2007 12:20 Auteur :
Réponse le :
Message :
Bonjour,
Malgré toute l'aide apportée par les précédents posts et surtout le tutorial de romsk, mon disque dur me fait des misères.
Mon disque fait 300 Go: une partition principale en NTFS de 260Go, et une logique de 40Go en FAT32 (qui ne contient pas de fichiers).
Problème: les deux partitions sont visibles et accessibles sous windows. La NTFS indique un espace utilisé de 90Go (ce qui est normal) ; en cliquant desssus un seul dossier s'affiche, qui ne fait que 500Mo. Où est le reste?
J'ai déjà un peu testé avec testdisk, voilà ma démarche:
Choix du bon disque -&gt; Intel -&gt; Analyse
Là ça semble normal, les partitions apparaissent.
 
Proceed -&gt; un warning(?)
 
A la fin de l'analyse encore le même warning.
 
Une seule partition apparait, qui n'est pas la bonne. . .EnterSearch
 
A la fin toujours le même warning. .Continue
La première partition est bizarre, la deuxième correspond à ma partition FAT mis à part le head (254 au lieu de 15) (en troisième powsition en blanc sur l'image d'après). La dernière partition est juste. Je ne peux pas mettre en logical cette partition FAT en même temps que la NTFS en principale.
Je passe en P la dernière et je fait un add pour avoir la Fat32 (0 / 17 / 1 / 4864 / 15 / 63 / 0c) (je ne suis pas sûr de ces valeurs, je les ai trouvées dans un ancien log de testdisk, mais je ne sais pas si c'est al configuration normale du disque).

Là je peux la mettre en Logical, et tout est ok. Je vois en faisant un liste sur ma partition NTFS que les fichiers sont présents. Dans cette fenêtre, ? J'aimerais bien sauvegarder quelques trucs mais j'arrive pas à voir d'autres pages... (parce qu'il n'y en a pas, cf Edit) comment faire pour faire défiler la liste

Puis enter et write, passage par advanced, boot: ok/ok (identiques) pour la NTFS et ok/ok (identiques) pour la FAT32.
Tout à l'air ok. . Windows me propose un chkdisk sur la partition NTFS (que je refuse) et rien de différent par rapport au début.Elles apparaissent toutes les deux, la Fat vide est vide et la NTFS est occupée sur 90Go, mais un seul répertoire, le premire dans la liste précédente, apparaît dans cette partition. Reboot
Des suggestions? Ca m'a pas l'air trop impossible comme j'arrive à voir la liste des fichiers, mais ça dépasse mes compétences...
Merci d'avance, (et merci aussi pour le tutorial et les posts précédents)
Edit:
A propos de la liste des fichiers, j'ai fait une copie de ce qu'il trouve sur le disque, ça représente à peu près la moitié des données (et pas la plus intéressante ). Pourtant tout ce qu'il trouve à l'air complet, juste il ne retrouve que la moitié. Problème de définition des partitions?
Edit 2:
Je continue à chercher sur ce disque. Je crois que les partitions sont bien fausses, puisque la NTFS devrait commencer en 0 1 1, il me semble avoir crée la NTFS en premier sur le disque. Du coup la partition qui m'apparait fausse (cf plus haut) serait peut-être la bonne. Quand je demande une liste des fichiers sur cette partition, il me répond "". Et si je sauve quand même, que je reboot, je ne peux pas faire un chkdsk dessus. Du coup je suis revenu à ma configuration bâtarde ou j'ai quand même quelques fichiers. Je crois par ailleurs avoir réécrit la MFT hier soir (heure du drame), ce qui n'a pas amélioré mes affaires. Can't open filesystem. filesystem seems damaged
Franck31500 28/09/2007 15:10 Auteur :
Réponse le :
Message :
Bonjour à tous. Je suis nouveau sur ce forum et j’ai besoin de beaucoup d’aide.
Mon PC c’est arrête avec un écran bleu à la fermeture.*
Depuis impossible de bouter sur mon disque.
Packard bell easynote 1245.J’ai une partition de backup mais je ne veux pas l’utiliser pour le moment car la deuxième partition sera formater et de configurée d’usine.
J’ai lancé testdisk et voilà le résultat :
[no log] je suis sur un cd
Résultat :
Disk 80 – 30 GB / 27 GiB
[Procceed]
Disk 80 – 30 GB / 27 GiB
[Intel] Intel/PC partition
[Analyse]
Checking current partition structure
3 P FAT32 0 1 1 522 254 63 8401932 [BACKUP]
4* HPFS – NTFS 523 0 1 3646 254 63 50187060 [TMPHDD]
[Proceed]
* 3 P FAT32 0 1 1 522 254 63 8401932 [BACKUP]
4* HPFS – NTFS 523 0 1 3646 254 63 50187060 [TMPHDD] Maintenant j’ai besoin de votre aide.
J’ai les photos de mes deux petits et le travail de mon épouse.
Merci d’avance
romsk 28/09/2007 15:46 Auteur :
Réponse le :
Message :
salut ,c'est à partir du tableau suivant qu'il faut raisonner :met toi sur chaque partition à tour de rôle en faisant "P" à chaque fois pour voir si t'accèdes à tes fichiers et répertoires (pour explorer les répertoires il faut te mettre sur les lignes correspondantes et faire fleche droite) : et dès que tu as localisé la ou les bonnes partitions il faudra voir si elles ne se chevauchent pas pour pouvoir les "activer"...si t'as pas de données sur ta partition FAT et que seule la partition NTFS est importante, regarde uniquement les 2 propositions NTFS, c'est à dire la 1ère et la 4ème ligne, sans te soucier des 2ème et 3ème lignes...medoudou



salut ,la configuration CHS de tes partitions semblent correctes et ton problème de boot peut venir de tout autre chose qu'une partition perdue (fichiers systèmes corrompus, problème matériel,...) : . mais si ce qui t'importe est de récupérer tes photos (ou autres documents), tu dois pouvoir le faire sans problème à partir de testdisk, sous réserve d'avoir un autre DD pour pouvoir y transférer tes données : met toi sur chaque partition et fais "P" pour lister tes fichiers et répertoires, et dès que tu retrouves tes données il te suffit de faire "C" pour copier ces données sur un autre support de ton choix...franck31500
dans ce cas testdisk ne sera d'aucune utilité pour faire remarcher ton système
Medoudou 28/09/2007 16:10 Auteur :
Réponse le :
Message :
Merci bien de répondre aussi promptement romsk.
Sur la première partition NTFS, en faisant un list j'ai "Can't open filesystem. Filesystem seems damaged".
Sur la deuxième je ne vois qu'une partie des dossiers, ce qui me fait penser qu'il manque le début de la partition (car il me semble que cette partition commençait au début du disque). Et donc que la première partition doit être la bonne (mais inaccessible).
Merci de ton aide, je ne serais pas là ce week-end, je ne verrais tes éventuelles réponses que lundi.
Et bon week-end.
Franck31500 28/09/2007 16:18 Auteur :
Réponse le :
Message :
Merci ,romsk
Mais je ne suis pas un pro en info. Je suis allé dans sur les fichiers, j'ai fait "c" puis je suis sorti du prog.
Retour sur mon CD, mais aprés, que fais-je?
J'ai bien une clef usb de 4Go mais elle n'est reconnue.
Encore merci.
PS : serait-il possible de résoudre mon erreure autrement
Givit 29/09/2007 18:12 Auteur :
Réponse le :
Message :
Bonjour,
J'ai un problème avec mon disc dure de 250 Go. J'ai souvent utilisé testdisc pour récupérer mes données, mais là je n'y parviens pas.
J'ai lu se qui se dit ici au sujet de la récupération et j'ai fait une première manip en voici la capture :
En faisant : Advenced =&gt; Boot

Puis en faisant : Analyse =&gt; Proseed

Mais la ligne est en vert avec un " * " à la place du D et en faisant " P " j'obtiends ceci :

Que dois-je faire maintenant ?
Merci d'avance
Givit 30/09/2007 13:24 Auteur :
Réponse le :
Message :
Bonjour, Est-ce que quelqu'un pourrait m'aider s'il vous plait ?
Merci 
djall 01/10/2007 21:00 Auteur :
Réponse le :
Message :
bonjour,
Bon apres 3 jours de cogite, je decide de me lancer afin de trouver uune precieuse aide.
Je possede une clé USB Verbatim de GO avec des infos tres importante pour mon activité (bien sur tres confiant dans le matos, je n'avais realisé aucune sauvegarde). Suite à un redemarrage d'ordi avec clé connecté, la catastrophe est arrivée. Clé reconnu dans le poste de travail, impossible d'y acceder (disque non formaté, voulez-vous formater.....), en propriéte, la clé est en format raw.
J'ai beaucoup lu sur les forum afin de m'en sortir, telecharger beaucoup de softs pour recuperer mes infos, rien n'y fait. j'ai essayer testdisk en vain. J'en suis dans testdisk apres avoir suivi le tuto à l'info "No partition bootable".
Je vais chercher les infos pour comment realiser des copies d'écran.
En attendant si cette info peut aider
Disk /dev/sdb - 2105 MB / 2008 Mib - CHS 256 255 63
Current partition structure :
Partition Start End Size in sectors
No partition is bootable
Voila les infos que je possede et serait donc tres heureux de trouver un pro pour m'aiser à remettre ma clé nickel et surtout retrouver mes infos.
Merci
Fleutchao 02/10/2007 13:27 Auteur :
Réponse le :
Message :
Bonjour
Grand merci a romsk c'est bien le seul forum ou j ai pu trouver une reponse a mes questions
Mais voila apres moultes tentatives je me vois dans l obligation de demander de l aide
Donc voici un disque de 80go qui comme vous avez pu peut etre le deviner c est transformé en raw malheureseusement ce disque n est pas le mien et je ne connais pas l'organisation original des partitions c'est un disque dur d'un portable MSI
Suite a ca j ai utilisé ptedit32 pour changer dans le descripteur de partition l octet codant le system dans la colonne type car j avais comme valeur 27 au lieu de 07 mais ca n'a pas resolu le probleme
Apres quelques tentatives j ai pu réacceder a la premiere partition K: mais il manque des données dans les repertoires et la partition n: reste inaccessible sous windows
A savoir que k: (partition avec des fichiers system vista et un utilitaire recovery de chez MSI) de 5go et n: de 35go ne represente que 50% de la taille du disque soit 40go pour 2 partitions et que dans le gestionnaire des disques il est marqué 34.18go d espace non alloué
DOnc pour resumer k: = 5go apparement partition Os vista qui est maintenant accessible mais il manque des données
et n: partition de 35go non accessible et 34.18go d espace non alloué
Donc voici les screen pour testdisk si quelqu un peut m aider ca sauvera la vie de quelqu un qui a perdu 2 mois de travail sur sa thèse
 
http://www.casimages.com/img.php?prov=ano&i=0710021249191328040.jpg
http://www.casimages.com/img.php?prov=ano&i=0710021250131328046.jpg
http://www.casimages.com/img.php?prov=ano&i=0710020126291328188.jpg
http://www.casimages.com/img.php?prov=ano&i=0710020127461328193.jpg
et la je bloque une idée SVp c est assez important merci de m'accorder un peu de votre temp
Cordialement
timer 02/10/2007 15:13 Auteur :
Réponse le :
Message :
Fleutchao a écrit :

oups pour les liens
rectif
[url=http://www.casimages.com/img.php?prov=ano&i=0710021249191328040.jpg]
[url=http://www.casimages.com/img.php?prov=ano&i=0710021250131328046.jpg]
[url=http://www.casimages.com/img.php?prov=ano&i=0710020126291328188.jpg]
[url=http://www.casimages.com/img.php?prov=ano&i=0710020127461328193.jpg]
bonjour
si tu fais avec casimages il faut prendre la façon "lien vers l'image en grand "Exmple: . tu fais copie coller mais il est plus préférable de travailler avec (il y en a d'autres) sur les forums les images sont plus petites il suffit de cliquer dessus pour les agrandir .Simple remarque
http://....http://imageshack.us/
mets ça au clair pour romsk
Fleutchao 02/10/2007 15:31 Auteur :
Réponse le :
Message :
 je n ai pas vraiment fait attention car j ai un peu posté en vitesse et je n avais meme pas vu le bouton pour modifier mon post 
Merci quand meme!!
djall 03/10/2007 22:38 Auteur :
Réponse le :
Message :
Bonsoir
J'ai fais un post lundi soir concernant ma cle usb verbatim de 2 go qui ne repond plus. disque au format RAW, "voulez vous formater... etc".
J'ai donc utilisé TestDisk que je ne maitrise pas pour m'en sortir. J'ai donc réalisé quelques copies d'ecran pour etre plus clair afin de trouver le pro qui me sortira de
ma galere
 
 

 
 
 
Voila j'ai fais le tour et remercie d'avance les aides que vous pourriez m'apporter
MERCI
djall 03/10/2007 22:44 Auteur :
Réponse le :
Message :
Ce n'est pas que je paraitre lourd, mais l'image 6 n'est pas passée
La voici donc

romsk 03/10/2007 23:55 Auteur :
Réponse le :
Message :
salut tlm 
medoudou, il est difficile de te conseiller sans savoir la place exacte qu'occupait cette partition NTFS : - était-elle avant ta partition FAT32 ? dans ce cas c'est effectivement la 1ère ligne qui est la bonne et après l'avoir remise en "P" il faudra aller vérifier le BS dans le menu advanced...- ou était-elle après ta partition FAT32 ? dans ce cas il faut là aussi aller dans le menu advanced pour vérifier le BS et éventuellement réparer la MFT- dernière chose, si windows te proposait un chkdsk il ne faut pas le refuser (comme tu le disais dans ton 1er message) car c'est souvent le seul moyen de retrouver ses données (même si on risque d'en perdre au passage...)


Franck31500, relis le sujet en 1ère page pour l'utilisation de "c" (si t'es sorti du programme après avoir cliqué sur "c" ça risque pas de marcher...). ceci dit si t'as pas de périphérique USB reconnu sous testdisk, tu ne pourras pas utiliser la fonction "copier", sauf à démonter ce DD et à le mettre en esclave dans un autre ordi... Quant à ton problème de base, comme je te le disais il peut s'agir d'un problème matériel ou de tout autre chose, mais tu peux aussi tenter une réparation du MBR sous testdisk ou en bootant sur le CD d'XP, voire une réparation de ton secteur de boot (par la commande fixboot), mais je t'invite à ouvrir un autre post car ce sujet sort du cadre du topic et d'autres astuciens auront peut être d'autres idées...
Givit, ton 1er tableau montre BS et backup BS OK, mais ce "sectors are not identical" peut expliquer ton problème : fais "dump" : copie d'écran
djall, sur la toute dernière image que tu montres (ce soir à 22h44) il y a "search" : t'as fait ce search ?
, la copie d'écran intéressante est celle ci :où on voit bien tes 2 partitions...c'est vrai que les coordonnées CHS sont fantaisistes, mais je sais que sous Vista c'est particulier et peut être devrais-tu demander son avis à C.grenier en lui envoyant ton log ? (dans ce cas tiens nous au courant, je serai curieux de voir ce qu'il te propose)* ceci dit, tu peux déjà Fleutchao



mettre yes à "Allows partial last Cylinder" dans le menu Options de Testdisk (option à activer sous vista) et regarder ce que ça donne...* tu peux aussi, sur ce tableau, faire entrée &gt; write si demandé &gt; menu advanced &gt; met toi sur chaque ligne à tour de rôle et fait "boot" pour regarder si BS et backup BS sont OK et identiques pour chaque partition...* tu peux enfin, toujours sur ce tableau, faire "P" sur chaque partition pour voir si t'accèdes à tes données (plus d'explications en 1ère page)

Fleutchao 04/10/2007 14:29 Auteur :
Réponse le :
Message :
Merci Romsk pour ta réponse
Romsk a dit:
* ceci dit, tu peux déjà mettre yes à "Allows partial last Cylinder" dans le menu Options de Testdisk (option à activer sous vista) et regarder ce que ça donne...
Deja activé
Concernant l'option p pour lister les dossiers elle fonctionne malheureusement la plupart des dossiers comme document and settings sont vides
Je pense qu'a la base il y avait seulement deux partitions (surement 1 de 38go et la 2eme de 35go) mais que la premiere est passée de 38go a 5go et que les données doivent etre sur les 33go restant indisponible
Cela dit je vais testé tes solutions et voir avec le createur de testdisk


Et sans vouloir te passer de la crême je te remercie infiniment pour ce tuto et pour ta réponse
Cordialement
Medoudou 04/10/2007 16:48 Auteur :
Réponse le :
Message :
romsk : merci de ton aide, malheureusement pour moi ça ne sert plus à rien d'essayer de le sauver, mon disque est tombé par terre lors d'un transport, du coup il ne boot plus, n'est plus détecté, la totale quoi. Pas trop grave, j'avais un backup pas trop vieux. Je ferais plus de backup à l'avenir, c'est la seule solution qui me semble sûre.
En tout cas merci pour tout, et chapeau pour l'animation de ce topic.
Givit 04/10/2007 18:35 Auteur :
Réponse le :
Message :
Bonjour romsk,
Voici l'image de dump :

Pour moi c'est du chinois 
djall 04/10/2007 21:09 Auteur :
Réponse le :
Message :
Bonsoir Romsk
Je te remercie de prendre en considération ma demande. Sur les conseils que tu me prodigues ( valider sur "search"), c'est une opération que j'ai deja realisé et qui me ramène à l'écran précédent; soit celui-ci

Je valide ensuite sur "Enter" et je me rtrouve encore sur l'ecran qui informe "No partition found or selected for recovery" et là, je n'ai plus que l'option "Quit" qui me ramène au premier ecran de Testdisk (celui avec les choix sur "Analyse","Advance","Géometry","Options",......)
Je tourne donc en rond.
Merci pour ton boulot remarquable.
romsk 06/10/2007 23:09 Auteur :
Réponse le :
Message :
djall, refait un MBR avec le menu MBR code > puis retourne sur proceed > clique sur la touche "A" et recrèe la partition en mettant successivement les valeurs suivantes : 0 1 1 255 254 63 * cylinder : 0* head : 1* sector : 1* cylinder : 255* head : 254* sector : 63* type : entrée > sélectionne FAT32 avec les fleches > entrée > done > write ou OK > menu advanced > boot: (ne ferme pas testdisk)






copie d'écran
Givit, ce dump ne montre pas de différence : fait "next" pour afficher les lignes suivantes (au delà de la ligne 0068)
Givit 06/10/2007 23:19 Auteur :
Réponse le :
Message :
Bonsoir romsk,
Voici le dump dans sont intégralité...




Encore merci pour ton aide Romsk
romsk 06/10/2007 23:32 Auteur :
Réponse le :
Message :
alors là j'y comprends plus rien : tous les dump sont identiques ???vérifie que tu ais bien toujours "sectors are not identical"... si c'est le cas commence par refaire un MBR neuf par le menu MBR code > et si ça change rien et qu'il y a toujours "sectors are not identical", fais "backup BS" et regarde ce que ça donne > si partition toujours pas accessible tente "rebuild BS"... 



Givit 06/10/2007 23:40 Auteur :
Réponse le :
Message :
Re,
Tu as raison, il y a eu un changement regarde

Que dois-je faire ? Les secteurs sont identique...
ive 07/10/2007 10:52 Auteur :
Réponse le :
Message :
Bonjour à tous,
Romsk, je sollicite ton aide encore une fois
pour dépanner un jeune avec un portable sous 98 avec un DD 20GO dont le SMART "est en alerte",
j'ai fais une image que j'ai restauré sur un DD de récup, c'est un 40GO
redémarrage impec, j'ai lancé partition magiq pour créer une 2ème partition avec la place restante
PM me signale une erreur LBA que j'ai refusé de corriger.
Testdisk sous DOS m'affiche cela

je n'ai aucun disfonctionnement mais j'ai peur de tout avoir à réinstaller, il a des programmes en place sans avoir les CD.
Merci par avance de ton avis
bon dimanche
altemis 07/10/2007 14:13 Auteur :
Réponse le :
Message :
bonjour,
je rencontre un soucis sur un systeme RAID 0.
j'ai deux disque hitachi 160G SATA branché en raid 0 sur une carte assus P5N32E sli plus;tout est correctement configuré dans le bios,et je vois la grappe en bonne état lors du message post bios,mais sous xindows xp, je vois apparairte dans les propriété des disques les deux disques séparement (au lieu de un) et un des deux disques apparait comme étant non initialisé dans le gestionnaire de disque , l'autre y apparait avec la taille de ma grappe (320Go alors que le disque fait réellement 160Go) , il apparait une partition illisible (marqué sain cependant) et une partie non alloué correspondant a ma deuxieme partition, je l ai initialisé par le gestionnaire de disk mais rien de plus si ce n'est que maintenant il est marqué comme non alloué.
apriori, que je fasse ou non la grappe dans le bios,sous windows le résultat et le même???
merci.
si besoin, je peux ajouter des copie d'écran ou ajouter des infos supplémentaires.
djall 07/10/2007 19:55 Auteur :
Réponse le :
Message :
Bonsoir Romsk
Suite aux conseils que tu m'as prodigués, voici quelques screens

La j'ai hesite entre les deux fat 32, Enfin j'en ai pris une (je ne sais plus laquelle)

Là pas de probleme j'ai validé

Là J'ai booter

Arrivé ici j'ai cale, je n'ai pas pris de decision entre "Rebuild","Dump", "repair FAT" alors là j'ai quitté.
J'ai relancer testdisk pour voir par rapport a avant ce que donnait ma cle, et j'ai ceci

Voila, j'ai l'impression d'avoir avancé, mais pas encore au bout de mes peines.
Merci
romsk 10/10/2007 00:09 Auteur :
Réponse le :
Message :
givit, la dernière copie d'écran que tu montres est bonne, donc si t'accèdes toujours pas à tes données, tu peux tenter de refaire un MBR (par le menu MBRcode ou en bootant sur le CD d'XP), et si ça donne rien fais un "repair MFT" sous testdisk...
djall, je pense que t'aurais plutôt dû mettre 0b (FAT32 normale) et pas 0c (FAT32 LBA) qui n'a d'intérêt qu'au delà des 1023 cylindres (...)vu le message d'erreur final (comme quoi il te manque le AA55), il ne te reste plus qu'à tenter un "rebuild BS" sur l'avant-dernier écran que tu montresmais je suis pas sûr que ça ait d'importance
salut , 1) si t'as gardé l'image initiale du 20 Go qqpart tu pourras toujours la restaurer en cas de problème,2) testdisk se "trompe" parfois, et dans ton exemple le head 240 semble bon même s'il préfèrerait que tu mettes 255...3) tout a l'air bon dans les coordonnées CHS > vérifie simplement que tout soit OK et identique dans le menu advanced-boot, et si c'est bon y'a pas de raison que ça merdoit...ive


altemis, ton histoire est mal barrée le RAID 0 ne donne aucune sécurité et si tu perds un des 2 disques durs, ce qui est ton cas, ben tu perds tout et ça explique que tu ne puisses plus accéder à tes 2 partitions...le fait qu'un des 2 disques apparaisse en 320 Go est normal car c'est probablement sur celui ci que les infos de volume global ont été inscrites (dans le MBR), et je dirai que c'est non moins normal que le 2ème apparaisse en non initialisé puisqu'il n'est pas censé avoir de MBR (c'est le MBR du 1er disque qui donne les infos pour tout ton volume de 320 Go) : t'aurais d'ailleurs peut être mieux fait de ne pas l'initialiser...j'aurai d'ailleurs tendance à penser que c'est plutôt un problème de configuration BIOS que de DD ? mais j'avoue que je peux pas t'en dire beaucoup plus... as-tu des données à récupérer ? dans le cas contraire repart à zéro...



Givit 10/10/2007 02:18 Auteur :
Réponse le :
Message :
Bonjour Romsk,
En te lisant je croyais enfin arrivé à la fin de l'horreure, mais non... Je t'avais dit que j'avais à l'origine un disc dure de 250 Go et bien regarde ce que je viens de voir maintenant...

750 Go incroyable... J'ai peur d'avoir tout perdu... voici la suite...

Boot...

Dump...

Voilà, a ton avis, ça se présente comment ?
Encore merci pour ta patience Romsk
ive 10/10/2007 07:40 Auteur :
Réponse le :
Message :
Bonjour,
ok et merci bien, je n'ai rien touché. 
l'image ne pèse pas lourd, je la garde sur un DVD au cas ou.
bonne continuation
romsk 10/10/2007 18:55 Auteur :
Réponse le :
Message :
givit, t'es bien sûr d'avoir sélectionné le bon DD sur le 1er écran de testdisk ? si c'est le cas les coordonnées CHS affichées sont fantaisistes et ça explique que les secteurs soient bad et le dump totalement faux...
va dans le menu geometry pour modifier cylinder (met 30401) > write > retourne dans le menu analyse > proceed...
djall 10/10/2007 21:33 Auteur :
Réponse le :
Message :
Bonsoir Romsk
J'ai fais un rbuild bs comme tu me l'as conseillé, et voici ou j'en suis.
"Dump" ou "Repair Fat"
That is the question. (excuses, on fini par peter un peu les plombs tellement on est perdu)
Mais encore un grand MERCI
 

Givit 10/10/2007 22:51 Auteur :
Réponse le :
Message :
Bonjour Romsk,
Voilà, j'ai fait comme tu me l'as dit et apparement c'est bon à ce niveau regarde...

Revoici la suite...

Boot...

Dump...

Voilà...
romsk 10/10/2007 23:28 Auteur :
Réponse le :
Message :
djall, tente d'abord "rebuild BS"
givit, quand t'es sur le 1er tableau, fais proceed > entrée > search
djall 10/10/2007 23:43 Auteur :
Réponse le :
Message :
Bonsoir Romsk
J'ai fais un rebuild et reviens aux screns precedents
djall 11/10/2007 00:20 Auteur :
Réponse le :
Message :
Romsk
Pour etre plus precis, j'ai realisé le built bs, et arrive sur l'ecran qui m'indique "Can't find cluster size"
Je suis allez sur "dump" pour voir et voici l'ecran
Plutot vide !!!

Givit 11/10/2007 00:57 Auteur :
Réponse le :
Message :
Sa y est, j'ai fini search, que dois-je faire maintenant ?
J'ai essayé de voir si je pouvais voir mes données, mais toujours rien...
romsk 11/10/2007 19:06 Auteur :
Réponse le :
Message :
manifestement rebuild BS n'a rien rebuildé et le secteur de boot reste vide.puisque search n'est pas plus contributif, reste plus que les logiciels récupérateurs de données...
djall 11/10/2007 21:56 Auteur :
Réponse le :
Message :
Bonsoir Romsk
Je viens de prendre connaissance de ton dernier post de 19:06
Je ne sais pas vraiment s'il m'est destiné ou pour Givit.
Si celui-ci m'est destiné, connais-tu un bon logiciel qui pourrait recuperer mes données sachant que j'en ai deja pas mal utilisé.
De plus est ce que ma clé est foutue ou je peux la recuperer en faisant un "repair Fat".
Merci de ton aide
altemis 12/10/2007 10:28 Auteur :
Réponse le :
Message :
Bonsoir romsk et tout le monde ;-)
J'ai des données a récupérer sur le disque montée en RAID 0 oui ; bon , j'ai réussit a récuperer mes partition grâce a FileScavenger (quetek.com) en recréant ma grappe "virtuellement" par le logiciel, apres un scan (comme TestDisk) récupération des données .
Il faut savoir avec filescavenger que l'ordre d'ajout des Disques est important pour recréer la grappe, je m'explique par un exemple : j'ai brancher mes disques sata au hassard et recréer ma grappe de la meme maniere, dans le logiciel, j'ai recrée ma grappe non reconnu par XP en prenant le disque 0 puis le 1,apres une recherche 'quick' je vois peux de choses, c'est lent et il voit des partitions tres ancienne qui normalement n'existait plus, je recrée ma grappe dans le logiciel mais cette fois ci avec le disque 1 puis le 0 et la, la recherche est bien plus rapide et je vois toutes mes partitions (et fichiers) d'avant le crash, et ce sans même passer par une recherche longue (qui elle retrouve de tres vieilles partitions , des fichiers supprimés mais tout n'est pas exploitable pour autant).
J'avais bien regler dans le bios mais un des deux DD a dut perdre, comme tu dit, la configuartion du RAID , je n'ai pas encore remit mes DD en état de marche pour l'instant mais pour moi l'important était de retrouver l'intégralité des mes données, ce qui a été le cas, il existe d'autres logiciels de récupération de données pour les systemes RAID comme celui que j'ai cité précédament (r-studio entres autres), je n'en fait pas la promotion pour autant, mais dans mon cas celui ci m'a sauvée la vie, cependant, il faut savoir qu'il est payant est disponible en version démo afin de s'assurer que l'ont pourra extraire ses données avant de passer à la caisse (moins de 100$) .
Je pensais passé en RAID 5 mais au vu de différent posts dans les forum,j'en ai conclu qu'il est préférable de resté en RAID 0 avec un DD externe pour faire des back up via logiciel dédiée, ce qui permet de conserver les perfs du RAID 0 et d'avoir un sécurité de données.
Merci pour ton aide, et c'est vraiment bien ce que tu fais vis a vis de ta contribution à ce forums .
J'espere que ce petit message pourra aider d'autres personnes en RAID ayant rencontrés le même soucis que moi.
romsk 12/10/2007 23:39 Auteur :
Réponse le :
Message :
oui , le message t'était destiné, et pour les logiciels de récupération, voir ...djallICI
givit, la partition en 1 6 5 30402 5 4 488.... était manifestement fausse, et si je t'ai suggéré le "search", c'était pour retrouver la partition que tu avais précédemment et qui avait de bonnes coordonnées, à savoir : est-ce que le search t'a permis de retrouver cette partition ???0 1 1 30400 254 63 488....
 : content que t'ai pu retrouver tes données (et ton message pourra effectivement peut être bien aider d'autres personnes dans la même galère...)altemis
djall 13/10/2007 00:01 Auteur :
Réponse le :
Message :
Bonsoir Romsk
Merci pour l'ensemble de ces logiciels de recupération de donnée que je m'empresse d'essayer.
Petit question; Puis-je recuperer ma cle ou la mettre à la benne?
merci
Givit 13/10/2007 01:19 Auteur :
Réponse le :
Message :
Salut Romsk,
Oui, à la fin de search, j'ai bien cette ligne de code que voici

Que dois-je faire après ? Write peut-être ?
J'ai un très gros problème maintenant... J'ai fait Gérer sur le poste de travail pour voir les disques et ce disc est à présent coupé en trois !!??? une partie a 8 Mo non alloué, une seconde a 232,88 Go saint (actif) et la troisième a 511,99 Go Non alloué Ce qui donne les 750 Go qu'on voit... Dit moi Romsk, est-ce que j'ai perdu toutes mes données ?
romsk 13/10/2007 09:32 Auteur :
Réponse le :
Message :
djall, dès que t'auras récupéré tes données (en espérant qu'un de ces logiciels y arrive), formate cette clé (en FAT32) et regarde si elle fonctionne à nouveau normalement...
Givit, je crois que tant que t'as pas fini avec testdisk il faut éviter de "stimuler" le MBR avec un autre programme qui y accède (genre le "gérer" de windows...), et il ne faut pas le fermer testdisk.sur l'écran de testdisk que tu montres (en espérant qu'il apparaisse toujours), est-ce que tu vois tes données quand tu cliques sur "P" ?
Givit 13/10/2007 17:31 Auteur :
Réponse le :
Message :
Non toujours pas...
Est-ce que je dois faire write après search ?
zemylenium 14/10/2007 15:52 Auteur :
Réponse le :
Message :
Bonjour,
Suite au plantage (raison inconnue à cette heure) d'un de mes disques, je vous sollicite pour m'apporter une aide sur l'utilisation de TestDisk. Je lance l'analyse, et il me retourne les résultats suivants :
D HPFS - NTFS 0 1 1 1274 254 63 20482812 [2_1_PARTITION1]D HPFS - NTFS 1274 210 24 2549 254 63 20485687 [2_2_PARTITION2]D HPFS - NTFS 2549 164 47 3824 254 63 20488562 [2_3_PARTITION3]D HPFS - NTFS 3824 119 7 6374 254 63 40974312 [2_4_PARTITION4]D HPFS - NTFS 6374 27 53 7011 254 63 10247717 [2_5_PARTITION5]D HPFS - NTFS 7011 132 33 7648 254 63 10241122 [2_6_PARTITION6]D HPFS - NTFS 7648 237 13 8286 254 63 10250592 [2_7_PARTITION7]





Après l'analyse avancée, j'ai les informations suivantes :
D HPFS - NTFS 0 1 1 1274 254 63 20482812 [2_1_PARTITION1]D HPFS - NTFS 0 1 1 9728 254 63 156296322 D HPFS - NTFS 1274 210 24 2549 254 63 20485687 [2_2_PARTITION2]D HPFS - NTFS 1275 0 1 2549 254 63 20482875D HPFS - NTFS 2549 164 47 3824 254 63 20488562 [2_3_PARTITION3]D HPFS - NTFS 2550 0 1 3824 254 63 20482875 [2_3_PARTITION3]D HPFS - NTFS 3824 119 7 6374 254 63 40974312 [2_4_PARTITION4]D HPFS - NTFS 6374 27 53 7011 254 63 10247717 [2_5_PARTITION5]D HPFS - NTFS 7011 132 33 7648 254 63 10241122 [2_6_PARTITION6]D HPFS - NTFS 7648 237 13 8286 254 63 10250592 [2_7_PARTITION7]








A savoir que la structure est toujours OK, si je ne change pas les caractéristiques de la partiton (-, P, L, E ou D) ; les partitions se chavauchant (début de la partition là même où finit la précédente), je ne sais que faire.
Pourriez-vous me donner un coupe de main ?
D'avance merci
romsk 14/10/2007 19:15 Auteur :
Réponse le :
Message :
salut ,ben comme d'hab t'en dis pas assez sur ton DD pour qu'on t'aide efficacement... : XP ou vista ? as-tu une partition système ou ne sont-ce que des partitions de données ? combien de partitions avais-tu ? combien en principale et combien en logique ? bref l'important étant avant tout qu'elles ne se chevauchent pas, je pense qu'il faut d'abord aller dans le menu, si "P" ne voit pas tes fichiers, il faut retourner dans le menu advanced > boot et regarder si BS et backup BS sont OK et identiques, et si c'est le cas tenter la manip de dernière chance = repair MFTzemylenium
"options" > mettre à "NoCylinder Boundary" et mettre à "Allows partial last Cylinder" > puis tu refais une copie d'écran de ce tableau pour voir comment apparaissent les coordonnées CHS :Yes
D HPFS - NTFS 0 1 1 9728 254 63 156296322 DD HPFS - NTFS 3824 119 7 6374 254 63 40974312 [2_4_PARTITION4]D HPFS - NTFS 6374 27 53 7011 254 63 10247717 [2_5_PARTITION5]D HPFS - NTFS 7011 132 33 7648 254 63 10241122 [2_6_PARTITION6]D HPFS - NTFS 7648 237 13 8286 254 63 10250592 [2_7_PARTITION7]D HPFS - NTFS 0 1 1 1274 254 63 20482812 [2_1_PARTITION1]

HPFS - NTFS 1274 210 24 2549 254 63 20485687 [2_2_PARTITION2]D HPFS - NTFS 1275 0 1 2549 254 63 20482875D HPFS - NTFS 2549 164 47 3824 254 63 20488562 [2_3_PARTITION3]D HPFS - NTFS 2550 0 1 3824 254 63 20482875 [2_3_PARTITION3]








Givit
zemylenium 14/10/2007 20:33 Auteur :
Réponse le :
Message :
Re,
Alors, je suis sous Windows XP Pro SP2. Il s'agit d'un disque dur interne où je ne stocke que des programmes et des données. J'ai un premier disque système sur lequel se trouve mon OS. Le second (celui qui me fait du soucis) comportait 7 partitions (une en principal et les autres en logique si je me souviens bien). Ce plantage est arrivé suite à un plantage de Firefox ; j'ai décidé de rebooter le PC, et depuis, Windows ne voit plus les partitions du 2e volume.
Au lancement de TestDisk, j'ai obtenu les écrans suivants :


Il m'est possible de passer la première partition sur "P", mais ne peut passer sur "L" celle qui suit (puisqu'elle débute là où finit la premiére).Je ne peux, pour résumer, changer les caractéristiques d'une partition sur deux.
En suivant tes indications, voici les captures d'écran faites après avoir changé les options :

 
Je peux changer les caractéristiques de certaines partitions comme suit :



Que dois-je faire après ces écrans ?
Merci d'avance
romsk 14/10/2007 21:53 Auteur :
Réponse le :
Message :
l'écran intéressant est le 3ème que tu montres, celui obtenu après avoir fait les changements dans le menu option :

met toi sur chaque partition à tour de rôle et regarde si t'accèdes à tes données en cliquant sur "P"
zemylenium 14/10/2007 23:35 Auteur :
Réponse le :
Message :
Ben, j'accède aux données, du moins, c'est ce qu'il me semble... Y a-t-il une manipulation que je pourrais faire pour que Windows reconnaisse à nouveau mon disque et les partitions qui s'y trouvent ? Si ça peut aider, il semble qu'un plantage de talkback.exe soit du, en partie, au plantage général de mon disque (cf. capture ci-après).


Mais bon, je ne suis pas sûr que ce programme en soit la cause. Une chose est sûre, ça commence à me prendre le chou mais je voudrais éviter de formater le disque et de devoir ré-installer les programmes que j'avais, et surtout les derniers fichiers que je n'ai, évidemment, pas sauvegardés. Bon, là, je vais aller me coucher et je verrais ça demain. N'hésitez pas à me faire part de vos suggestions. Merci d'avance.
Givit 15/10/2007 00:14 Auteur :
Réponse le :
Message :
Salut Romsk,
J'ai regardé BS et Backup BS et ils ne sont pas OK et les secteurs ne sont pas identique.
Donc, si j'ai bien compris, j'ai tout perdu... :-(
Et merde...
Merci quand même Romsk pour ta très grande patience envers nous autres les discs trop dure...
P.S. : Petite question... Est-ce que tu sais pourquoi lorsqu'on branche un nouveau disc avec déjà des données sur les IDE, windows se sent obligé de trouver un problème sur celui-ci et soit efface toutes les données, soit nicke le disc ?
Y-a-t-il un moyen d'éviter une bonne fois pour toute ce désagrément ?
P.S. 2 : Il fait chier ce Bill Gueste, je suis sur que c'est l'un de ces nombreux délires... faire chier son ptit monde...
romsk 15/10/2007 10:13 Auteur :
Réponse le :
Message :
givit, non c'est pas forcément foutu... relance testdisk > vérifie que dans analyse t'ais bien toujours ta partition avec les bonnes coordonnées CHS > puis sans fermer testdisk va dans le menu advanced > boot, et fais une copie d'écran sans fermer testdisk
zemylenium, compte tenu que toutes tes partitions se suivent , je ne vois pas comment les réanimer toutes ensemble (P ou L poseront problème car on ne peut mettre que 4 P dans le MBR et les L nécessitent des EBR qui ne peuvent pas trouver leur place vu qu'elles se collent au secteur près...). t'as 2 solutions :- soit on les récupères en 2 fois, en mettant d'abord les 4 premières en P > write > fermer testdisk > redémarrer le PC > récupérer les données de ces 4 partitions sous windows en les copiant sur un autre DD > ouvrir testdisk > retrouver le même tableau que précédemment > laisser les 4 premières en D et mettre que les 3 dernières lignes en P > write > fermer testdisk > redémarrer le PC > récupérer les données de ces 3 partitions sous windows en les copiant sur un autre DD > puis reformater proprement ce DD quand t'as tout récupéré,- soit tu copies directement tes données par la touche "C" sous testdisk comme expliqué en 1ère page > et quand t'as tout récupéré, tu retournes sous windows pour reformater proprement ce DD...au secteur près

Givit 16/10/2007 12:07 Auteur :
Réponse le :
Message :
Salut Romsk,
Excuse pour ma réponse tardive... alors voici ce que tu m'as demandé... analyse :

et boot :

Quand penses-tu ?
Je garde testdisk ouvert...
romsk 16/10/2007 18:20 Auteur :
Réponse le :
Message :
j'en pense que t'es encore revenu à cette foutu partition commençant au CHS 1 6 5 (et qui se termine au delà des limites de ton DD), et qu'il faut donc refaire "search" dans le menu analyse pour retrouver la bonne partition qui commence au CHS 0 1 1 > puis write > puis aller dans le menu advanced > boot : copie d'écran sans fermer testdisk...
Givit 16/10/2007 23:06 Auteur :
Réponse le :
Message :
Salut Romsk,
J'ai suivie tes indications et j'ai l'impression que sa n'a rien changé...

romsk 17/10/2007 12:58 Auteur :
Réponse le :
Message :
Givit a écrit :

Salut Romsk,
Oui, à la fin de search, j'ai bien cette ligne de code que voici

Que dois-je faire après ? Write peut-être ?
voilà ce que tu écrivais le 13.10 à 01h19...tu ne retrouves plus cette partition ?
Givit 17/10/2007 20:28 Auteur :
Réponse le :
Message :
Bonjour Romsk,
En faite, lorsque je fais la manip " Géometrie " 30401 => " search " => " write " j'ai bien ceci

Mais dès que je fais " Advence " j'ai ceci

Or cela ne va pas du tout avec ce qu'on voudrait...
romsk 17/10/2007 22:26 Auteur :
Réponse le :
Message :
quand tu as la bonne partition après search > entrée > > menu advanced > boot...write
soltan 18/10/2007 16:51 Auteur :
Réponse le :
Message :
Bonjour à tous , suite a une mauvaise manip j'ai supprimé une partition sur mon disk dur externe en USB , avec testdisk , 'ai pu voir tous mes repertoires et mes fichiers mais comment réactiver cette partition si c'est possible , ou dois je copier un à un les répertoires ?
Merci d'avance
romsk 18/10/2007 22:52 Auteur :
Réponse le :
Message :
salut soltan,fais menu analyse > > entrée > 
proceed : copie d'écransearch : copie d'écran
C-AM25 21/10/2007 20:29 Auteur :
Réponse le :
Message :
Bonsoir à tous !!!
J'ai un problème avec mon ordinateur (Ordi ACER avec Windows XP Pro SP2). Suite à une coupure de courrant lors de la répération de mon OS. Mon PC redémarre en boucle. J'ai fait un test avec TESTDISK est voilà ce que ça donne :
*FAT 32 0 1 1 382 254 63 6152832 [PQSERVUCE]
P HPFS-NTFS 383 0 1 9868 254 63 152392590 [ACER]
L FAT 32 LBA 9869 1 1 19456 254 63 154031157 [ACERDATA]
Avec la commande LIST je trouve mes documents sur chaque partition.
Autre message : a vaild NTFS/FAT boot sector must be present in order to access any data ; even if the partition is not bootable pour les deux partitions.
Merci de ce que vous pourrez faire pour moi.
romsk 21/10/2007 20:49 Auteur :
Réponse le :
Message :
salut cam25,
ben va vérifier à tout hasard tes secteurs de boot dans le menu advanced (cf 1ère page), mais à priori tout a l'air bon (faut pas croire que testdisk peut résoudre tous les problèmes d'informatique... )
Raptor2-3 23/10/2007 12:16 Auteur :
Réponse le :
Message :
Salut ,
un grand merci au créateur du soft et a pour ce post bien détaillé , j'me permet de poser une question , j'me trouve devant un petit problème que je n'arrive pas a corrigé !romsk
voila hier ma fille me dit que son pc ne s'allume plus , avec comme message je crois error disk ou chek cable , je vais dans le bios et voit au post bios que le disque fait quelques Mo alors qu'il contient 74 Go , je lui demande quel programe ou périférique a été lancer avant , en réponse un utilitaire de restauration pour une clé USB de 256 Mo , je commence a comprendre le problème c'est que le soft de la clé a été décompresser sur C avec le fichier boot de la clé mais ce fichier est cacher par le sytème ! une foi fait elle suprime ou recompresse , je sais pas eactement , le soft mais pas ce fichier cacher et au re-démarrage le disque dur n'est plus vu comme un disque mais comme un clé de 256 Mo !
donc a partir de mon pc j'ai pris tesdisk et fait une récupération de toutes les données de son disque dur suprimer le mauvais fichier boot et est formater le disque dur mais maintenant je ne peut plus booter sur ce disque je peut copier des fichiers effacer mais plus booter , la partition est bien de 74 Go et au démarrage de mon pc je voit bien le disque dur !Samsung SP0802N 80 GO
d'ou peut venir cette erreure , sachant que j'ai bien supprimer le bon fichier boot enfin celui de la clé qui était facilement reconnaissable ? si une âme charitable pouvait m'orienté ce serai super gentil car c'est vrai que la je sèche !
a bientot bye !
romsk 23/10/2007 19:02 Auteur :
Réponse le :
Message :
salut raptor,à mon avis faut commencer par faire fixmbr et fixboot sous la console de récupération et vérifier (avec ptedit par exemple) que la partition système soit bien active
Albi_one 24/10/2007 01:27 Auteur :
Réponse le :
Message :
Bonjour,
Je suis désolé, je n'ai pas eu le courage de lire les 31 pages de cette discussion qui d'ailleur m'a calmé dès la premier. Le Tuto est super mais comme je ne sais pas ce qu'il faut fair pour résoudre mon problème, j'ai été trés vite largué.
Donc voila, je solicite votre aide.
Je n'arive plus a ouvrire mon disque dure externe, j'ai systematiquement un message me disant que celui-ci n'est pas formater et me demande de le formater. Or c'est une option qui me serai extrement préjudiciable professionelement.
Sur des Forums j'ai lu que cela pouvai s'arranger avec testdisk mais j'ai pas trouvé comment.
Alors je suis assez desespérer.
PLEASE HELP  
EDIT: C'est bon j'y suis arrivé, ça marche YATA
Mercie pour le TUTO, j'ai tatonné mais y suis arrivé.
Soulagement  
romsk 24/10/2007 12:54 Auteur :
Réponse le :
Message :
 (je vois que la nuit a été courte )albi_one
Super_Mac-3 25/10/2007 12:28 Auteur :
Réponse le :
Message :
Bonjour à tous.J'ai un problème avec une partition supprimée par erreur. Voici le schéma de mon disque dur: [parition principale] [partition principale] [partition principale] [partition étendu]



/ T \
[partition logique1] [partition logique2] [partition logique3]

En fait je voulais supprimé la partition logique 1, mais ça m'a également supprimé la partition logique 3. Aucune idée du pourquoi ni comment, peut être une fausse manip de ma part. Ou peut être ai-je aussi supprimé la table de la partion étendue en même temps?Pour l'instant je me retrouve avec la partition logique 3 éffacée, la 2 intact et la 1 reformatée rapidement en ntfs.J'ai utilisé Testdisk pour scanner mon disque et voilà mes screen:





On peut voir mon disque actuel, sauf la partition logique 3 effacée. 


Même chose en plus détaillé.
C'est là que je bloque, la partition logique 3 est celle surlignée, mais elle est indiquée comme étant non effacée "L". En plus de ça, d'autre partitions sont marquées comme étant effacées "D". Mes 2 premières partitions principales linux swap/linux, et la logique 1: Lnx_Temp.La 3ème partition principale est marquée comme étant bootable "*", ici, ça devrait plutôt être la partition principale linux. en gros presque tout est inversé.Voilà, c'est à peu près tout, maintenant la question du jour est:Comment m'y prendre pour retrouver ma partition logique 3 sans perdre les autres? Sachant que la logique 1 est dispensable.Un grand Merci pour toute réponse ou aide.








romsk 25/10/2007 17:22 Auteur :
Réponse le :
Message :
salut super_mac,quand tu es sur ce tableau :


met les lignes 1, 4 et 6 en "P" et les lignes 7, 10 et 11 en "L" > entrée > > menu advanced > boot sur chaque partition et vérifie que BS et backup BS sont à chaque fois OK et identiques...write
Super_Mac-3 26/10/2007 00:52 Auteur :
Réponse le :
Message :
Salut Romsk, merci pour ton aide.
J'ai bien fait la manip mais testdisk m'indique juste après:

Je quit, refais une recherche et voilà ce que ça donne :
 
 
Après la manip que tu m'as conseillé, testdisk m'indique que "les changement s'effectueront après un reboot". Est que je peux faire une autre écriture juste après ou est ce qu'il faut que je reboot avant?
Je pense qu'il faudrait que je mette * pour linux swap pour qu'il y ait une partition bootable.
EDIT: Bon j'ai refais une manip sans rebooter, exactement comme tu m'as indiqué sauf linux swap que j'ai passé en *.
Résultat aucune amélioration...
 
EDIT 2: Bon je sais pas, je devais avoir de la merde dans les yeux hier soir. Bref, j'ai fais backup sector boot, un redémarrage et c'est nickel! J'ai recupèrer ma partoche.
je m'interroge quand même sur ma partition linux swap passée en active, ça devrait pluôt être ma partition avec la distib linux?J'ai pas encore essayé de booter sur nux, j'essaierais ce soir.En tout cas un grand merci à toi Romsk pour ton aide et surtout pour cet excellent tuto sur testdisk. 





romsk 26/10/2007 13:53 Auteur :
Réponse le :
Message :
 c'était effectivement "backup BS" qu'il fallait faire...pour le reste, windows a besoin d'avoir "*" pour pouvoir booter, mais quid de linux ? (
en tout cas c'est certainement inutile que ta partition swap soit activée...)
milouze312 29/10/2007 09:55 Auteur :
Réponse le :
Message :
Bonjour, pouvez vous m'aidez car voilà ce que ça m'affiche !!!

romsk 29/10/2007 10:29 Auteur :
Réponse le :
Message :
salut milouze,dis-en un peu plus sur ton problème : combien de partition sur ce DD ? problème d'accès ?
milouze312 29/10/2007 11:08 Auteur :
Réponse le :
Message :
Voilà ce que j'ai
 
romsk 29/10/2007 13:43 Auteur :
Réponse le :
Message :
romsk a écrit :dis-en un peu plus sur ton problème : combien de partition sur ce DD ? problème d'accès ?


ça peut durer encore longtemps comme ça... 
milouze312 29/10/2007 14:22 Auteur :
Réponse le :
Message :
il n'y a qu'une partition et je n'arrive pas a y accéder car il me demande de le formater.
milouze312 29/10/2007 15:14 Auteur :
Réponse le :
Message :
Je n'ai que la partition NTFS
Etquand je veut le BOOT il me met Qu'il ne peut pas lire le bacckup boot sector
romsk 29/10/2007 15:51 Auteur :
Réponse le :
Message :
DD de 160 Go avec une seule partition NTFS de 80 Go et le reste (80 Go) non alloué , c'est ça ? dans ce cas, quand tu es sur le 1er tableau que tu montrais, fais "list" pour vérifier que t'accèdes bien à tes fichiers, et si c'est le cas fais "org. BS" > write > ferme testdisk et redémarre le PC.
milouze312 29/10/2007 16:10 Auteur :
Réponse le :
Message :
non je me suis trompé c'est un dd de 80g c'est qu'il me mettais too small alors j'ai changé mes cylender mais je ne savais pas quoi mettre!
milouze312 29/10/2007 16:12 Auteur :
Réponse le :
Message :
Il marque Disk/dev/sdb 33 Gb alors que c'est un 80Gb normalement
milouze312 29/10/2007 16:21 Auteur :
Réponse le :
Message :
Voilà ce qu'il me met

romsk 29/10/2007 16:46 Auteur :
Réponse le :
Message :
10 réponses pour arriver au début de l'explication : sans commentaires...met 9733 à cylinder > valide > puis fais ce que je suggérais au dessus (
fais "list" pour vérifier que t'accèdes bien à tes fichiers, et si c'est le cas fais "org. BS" > write > ferme testdisk et redémarre le PC)
milouze312 29/10/2007 17:02 Auteur :
Réponse le :
Message :
Je fais list mais voilà ce que ça me met

Puis quand je fais Org.BS voilà ce qui s'affiche

romsk 29/10/2007 18:48 Auteur :
Réponse le :
Message :
navigue avec les fleches droite gauche pour explorer tes répertoires (mais apparemment il n'y a rien sauf 2 fichiers boot.ini et oem.tag ?)met 9734 à cylinder et réessaye org.BS...
Si ça donne toujours rien, reste plus que les logiciels de récupération ou éventuellement linux (dans ma signature)
milouze312 29/10/2007 19:19 Auteur :
Réponse le :
Message :
Quand je bouge avec les flèche ça change rien et j'ai mis 9734 et ça change rien non plus je vais essayer se que tu m'a dis merci pour ton aide
romsk 29/10/2007 19:38 Auteur :
Réponse le :
Message :
t'aurais pas touché et mis le jumper en "cap limit" à l'arrière du DD ???
milouze312 30/10/2007 07:38 Auteur :
Réponse le :
Message :
Si maintenant ça marche merci pour tout!!
romsk 30/10/2007 12:06 Auteur :
Réponse le :
Message :

asubert 01/11/2007 18:54 Auteur :
Réponse le :
Message :
juste pour vous remercier car ce post m'a permis de récupérer tous mes documents
romsk 02/11/2007 07:29 Auteur :
Réponse le :
Message :
content pour toi asubert (et n'oublie pas de remercier C.Grenier...)
yam-fzr 04/11/2007 19:11 Auteur :
Réponse le :
Message :
bonjour et pour ce topic !!!BRAVO
Je viens de faire une erreur grossière, j'ai copier une partition [stockage] sur ma partition système (windows XP)!!!
Ma partition système à donc disparue, la partition stockage ayant pris ça place.
La manip a était effectuée avec gparted à partir du CD live d'ubuntu 7.10
Est il possible de tout remettre dans l'ordre avec testdisk ?
J'ai essayé mais testdisk ne retrouve pas la partition d'origine même après deux recherches. Je pense que c'est normal puisqu'elles se sont "supperposées".
D'autre par, le secteur de boot est "ok" mais le backup est "bad, je n'ai pas osé le modifier pensant qu'il était peut-être lié à mon ancienne partition. 
L'idée de supprimer la copie de la partition "stockage" m'a effleuré mais je préfère demander l'avis des spécialites "es partition" .
Merci de vos réponses.
tizeff 04/11/2007 21:16 Auteur :
Réponse le :
Message :
Bonjour,Je crains d'avoir fait une grosse boulette.En voulant modifier la taille de mes partitions, j'ai planté ma machine, et je ne parviens plus à retrouver mes données, tout du moins pas en intégralité.Historique : Mon disque de 250 Go est initialement partitionné en C : pour système et programmes et D: pour données (toutes deux NTFS) d'environ 98 Go chacune, le reste étant sous Linux.J'ai voulu modifier en réduisant C: et redistribuer l'espace libre sur D: Mauvaise manip ? Impossible de retrouver D: Mes quatre lecteurs USB sont devenus D à G (que j'ai renommés de L à O), et apparait un lecteur H signalé non formatté.Le gestionnaire de disques Windows fait apparaître le partitionnement suivant : C: 58,59 Go NTFS Sain ('Système) puis 38,89Go non alloué (la somme correspondant à mon ancien C:), et H: 86.17 Go Sain, avec 100% de libre, puis 10,67 Go non alloué (le tout correspondant à mon ancien D:).J'ai regardé avec testdisk, mais il me semble qu'il y a chevauchement de partitions. Avant de faire une bêtise, j'aimerais avoir un avis sur la façon de procéder.Voici ce que donne le backupaprès première recherche, j'obtiens Puis Après recherche approfondie














#1193911055 Disk /dev/sda - 250 GB / 232 GiB - CHS 30401 255 63 1 : start= 63, size=122881122, Id=07, * 2 : start=204443190, size=180715185, Id=07, P 3 : start=407536920, size= 80855145, Id=05, E 5 : start=407536983, size= 12273597, Id=83, L 6 : start=419810643, size= 2249037, Id=82, L 7 : start=422059743, size= 66332322, Id=83, L#1194201479 Disk /dev/sda - 250 GB / 232 GiB - CHS 30401 255 63 1 : start= 63, size=122881122, Id=07, * 2 : start=204443190, size=180715185, Id=07, P 3 : start=407536920, size= 80855145, Id=05, E 5 : start=407536983, size= 12273597, Id=83, L 6 : start=419810643, size= 2249037, Id=82, L 7 : start=422059743, size= 66332322, Id=83, L
















Partition Start End Size in sectors* HPFS-NTFS 0 1 1 7648 254 63 122881122P HPFS-NTFS 7649 0 1 18897 254 63 180715185 [DONNéES ]L Linux 25368 1 1 26131 254 63 12273597L Linux swap 26132 1 1 26271 254 63 2249037L Linux 26272 1 1 30400 254 63 66332322








Partition Start End Size in sectors1* HPFS-NTFS 0 1 1 7648 254 63 1228811222P HPFS-NTFS 7649 0 1 18897 254 63 180715185 [DONNéES ]3E Extended LBA 25368 1 1 30400 254 63 808551455L Linux 25368 1 1 26131 254 63 122735976L Linux swap 26132 1 1 26271 254 63 22490377L Linux 26272 1 1 30400 254 63 66332322







Partition Start End Size in sectors* HPFS-NTFS 0 1 1 7648 254 63 122881122D HPFS-NTFS 7649 0 1 18897 254 63 180715185 [DONNéES ]

D HPFS-NTFS 12726 0 1 23974 254 63 180715185
D HPFS-NTFS 12726 0 1 25367 254 63 203093730
L Linux 25368 1 1 26131 254 63 12273597L Linux swap 26132 1 1 26271 254 63 2249037L Linux 26272 1 1 30400 254 63 66332322

Sur le Menu "Advanced"


Partition Start End Size in sectors* HPFS-NTFS 0 1 1 7648 254 63 1228811222P HPFS-NTFS 12726 0 1 23974 254 63 180715185 [DONNéES ]3E Extended 25368 1 1 30400 254 63 808551455L Linux 25368 1 1 26131 254 63 12273597 X extended 26132 0 1 30400 254 63 68581485 6L Linux swap 26132 1 1 26271 254 63 2249037 X extended 26272 0 1 30400 254 63 66332385 7L Linux 26272 1 1 30400 254 63 66332322







Je ne sais plus très bien que faire



tizeff 05/11/2007 09:38 Auteur :
Réponse le :
Message :
Bonjour à tous,
Mon problème est résolu grâce à Christophe Grenier, que je remercie ici au passage. Son aide m'a été très précieuse.
Si cela peut aider quelqu'un d'autre: Il a suffi d'écrire les partitions retrouvées par testdisk après "Search", et ensuite de procéder à un "chkdsk /f c:" puis d: afin de vérifier et réparer mon disque. Il ne me reste plus qu'à créer une nouvelle partition avec l'espace libre entre d: et ma partition linux.
Bonne journée
romsk 05/11/2007 10:37 Auteur :
Réponse le :
Message :
content pour toi ...tizeff
salut ,heureusement pour toi Gparted n'a fait, je pense, que réécrire le secteur de boot (et pas "copier" stockage sur win XP car dans ce cas ce serait foutu : tous les secteurs seraient réécrits...)fait une copie d'écran de ce que montre proceed et search...yam-zfr

yam-fzr 05/11/2007 12:00 Auteur :
Réponse le :
Message :
Re,
Pour utiliser testdisk j'ai branché mon disque dur en externe via un adaptateur IDE/USB.
Voici les screens que me donne testdisk :
En surbrillance, c'est le disque dur incriminé

Partitions détectées.
C'est "dessous" la partition 1 que se trouve la partition à récupérer.
La partition 1 étant une copie exacte de la partition 5 elle m'est d'aucune utilité.


Les commandes "proceed" puis "search" (faite 4 fois) me donnent exactement le même résultat :
Ma partition "disparue" n'est toujours pas visible.
 
La commande advanced/boot me donne ceci :
Dois-je faire "Org. BS" ?

Je ne mets pas le résultat de la commande "Dump" mais les valeurs sont toutes différentes entre "Boot" et "Backup boot".
J'espère que ces détails vous permettrons de m'aider.
Merci d'avance.
 
yam-fzr 05/11/2007 12:04 Auteur :
Réponse le :
Message :
Bonjour Romsk,
Désolé de ne pas t'avoir salué plus tôt mais j'étais en train de rédiger mon post !!!  
yam-fzr 05/11/2007 12:29 Auteur :
Réponse le :
Message :
Comme c'est le secteur boot qui t'interresse, je te mets la première page de "Dump"

romsk 05/11/2007 17:04 Auteur :
Réponse le :
Message :
autant pour moi : testdisk ne peut plus rien pour toi, car comme expliqué tu as fait l'irréparable, à savoir ta partition stockage sur XP qui est donc irrécupérable... tout au plus peux-tu essayer de récupérer qques fichiers avec des logiciels de récupération sur l'espace qui va du cylindre 1300 au cylindre 7225 (c'est à dire l'espace au delà de ce qu'a copié Gparted) ou éventuellement remettre dans le secteur de boot les coordonnées de l'ancienne MFT et MFTmirror (à rechercher avec Edithexa dans ma signature), car si par chance elles sont au delà du cylindre 1300 alors tu pourras peut être accéder aux données intactes au delà du cylindre 1300... ICItu as effectivement copié
Alaga 05/11/2007 20:41 Auteur :
Réponse le :
Message :
Bonsoir à tous.
Au risque de paraître stupide en reposant pour la Nième fois une question de ce genre, je vous demande svp de m'aider.
J'ai récupéré un disque dur externe d'ordinateur portable de 60Go, il est partitioné en deux disques (un J: et un L:). J'ai acheté un boitier externe et l'ai branché sur mon PC. Le partition J: fonctionne correctement, j'entend par là, que toutes les informations qui devaient y être, sont toujours là. Par contre pour la partition L:, j'ai utilisé un logiciel de restauration appelé "Restoration" qui m'a permis de récupérer les 14Go qui avaient disparu (ne me demandé pas comment, je ne sais pas, j'ai juste récupéré le disque dur). A ce moment là, je suis donc très content car tout fonctionne parfaitement (les informations que je viens de récupérer sont des photos auxquelles je tiens énormément).
Le lendemain, je vais chez une amie pour montrer les photos et lorsque je branche mon DD externe sur son , il ne prend pas en compte le disque. Je me dis alors que ce n'est rien, je retourne chez moi pour graver les photos sur un cd et là gros problème. Lorsque je branche mon DD, la partition J: s'ouvre mais la partition L: ne s'ouvre plus. Le lecteur m'indique "Disque local (L:)", quand je vais dans "Propriétés", c'est écrit "Système de RAW" et quand je veux l'ouvir, cela dit "Le disque dans le lecteur L: n'est pas formaté / Voulez-vous le formater maintenant?".Mac
Ma question est donc, comment faire pour de nouveau accèder à cette partition?
Merci d'avance.
romsk 06/11/2007 07:26 Auteur :
Réponse le :
Message :
salut alaga,regarde le sujet raw dans ma signature et fais les copies d'écran qui vont bien...
Alaga 06/11/2007 12:09 Auteur :
Réponse le :
Message :
D'abord un grand merci à toi Romsk pour tout ce que tu fais sur ce forum.
Ensuite je vais t'embéter encore un peu...  
Quand je lance Testdisk, il prend en compte mon DD externe mais il ne m'affiche pas les deux partitions, c'est normal?? (comment fait on pour faire une capture d'écran? cela permettra de mieux visualiser ce que je dis).
Je ne suis pas un professionnel de l'informatique mais je suis prêt à tout pour récupérer les données que contient ce disque. Par contre je ne voudrais pas faire de mauvaise manipulation afin d'éviter la mauvaise surprise qui serait de tout perdre.
PS: quand tu me dis d'aller voir dans ta signature, ce sont les sujets qui sont inscrits juste en dessous de la boite de dialogue ou c'est autre chose?
romsk 06/11/2007 14:32 Auteur :
Réponse le :
Message :
pour les captures d'écran, voir paragraphe 1pour les sujets "dans ma signature", ben c'est juste en dessous de la réponse que t'es en train de lire ICI

yam-fzr 08/11/2007 12:23 Auteur :
Réponse le :
Message :
Encore merci et mes félicitations à romsk même si j'ai dû reformater mon disque !!!
A bientôt sur le forum  
romsk 08/11/2007 22:29 Auteur :
Réponse le :
Message :

Pluton8 09/11/2007 22:16 Auteur :
Réponse le :
Message :
Merci...

    
</entry>
<entry [Sat 2012:10:27 02:58:11 EST] INTRO TO HARD DISKS>

http://www.unix.com/unix-dummies-questions-answers/204613-analyse-fdisk-l.html
    

Short introduction to disks:

A "hard disk" is (classically - the logic is still used even if it doesn't look like that any more) a stack of rotating platters mounted on a common spindle. On these platters there are concentric rings ("tracks") of magnetic coating. These concentric rings are divided in "sectors".

As the spindle is rotating a device goes in between the platters which looks like a comb, carrying a read/write head on every tip.

The output now tells you the geometry of this disk - at least, as it is told by the disk device to the controller: it has 255 heads, meaning there are are 128 such platters. (Every platter has a lower and an upper side to read from and has 2 [read-write-] heads therefore.)

There are 6527 concentric tracks (=cylinders) on every disk. Because the corresponding tracks on all the platters build a logical unit it is easy to see why this is called a "cylinder".

Lastly, every such track is divided into 63 sectors. Note that sectors occupy a certain angle rather than a certain area of magnetic material. The inner sectors are therefore shorter than the outer sectors, but still can carry the same amount of data. This is the reason why every track is divided into the same number of sectors.
    
</entry>
<entry [Sat 2012:10:27 00:04:26 EST] CLONEZILLA>

http://clonezilla.org/downloads.php

http://sourceforge.net/projects/clonezilla/files/clonezilla_live_stable/1.2.12-67/clonezilla-live-1.2.12-67-amd64.iso/download

clonezilla-live-1.2.12-67-amd64.iso



USB setup with GNU/Linux

Choose one of the following methods to setup Clonezilla Live on your USB flash drive using GNU/Linux:

GNU/Linux Method A: Tuxboot
GNU/Linux Method B: Manual
GNU/Linux Method C: Unetbootin (Not recommended)
GNU/Linux Method A: Tuxboot

Download Tuxboot on your GNU/Linux computer.
From GNU/Linux, follow the instructions and the GUI to run Tuxboot to install Clonezilla Live on your USB flash drive.
GNU/Linux Method B: Manual

WARNING!   Confirm you have the correct path name before executing commands!
Failure to do so could cause loss of data or your GNU/Linux not to boot!!!
/dev/sdd is a device path name
/dev/sdd1 is a partition path name

Download the Clonezilla Live zip file.
If you already have a FAT16 or FAT32 partition on your USB flash drive then skip to the next step (3).
Otherwise prepare at least a 200 MB partition formatted with either a FAT16 or FAT32 file system.
If the USB flash drive or USB hard drive does not have any partition, you can use a partitioning tool (e.g. gparted, parted, fdisk, cfdisk or sfdisk) to create a partition with a size of 200 MB or more.
Here we assume your USB flash drive or USB hard drive is /dev/sdd (You have to comfirm your device name, since it's _NOT_ always /dev/sdd) on your GNU/Linux, so the partition table is like:
      # fdisk -l /dev/sdd
      Disk /dev/sdd: 12.8 GB, 12884901888 bytes
      15 heads, 63 sectors/track, 26630 cylinders
      Units = cylinders of 945 * 512 = 483840 bytes
      Disk identifier: 0x000c2aa7

         Device Boot      Start         End      Blocks   Id  System
         /dev/sdd1   *           1       26630    12582643+   b  W95 FAT32
    
Then format the partition as FAT with a command such as "mkfs.vfat -F 32 /dev/sdd1"
WARNING! Executing the mkfs.vfat command on the wrong partition or device could cause your GNU/Linux not to boot. Be sure to confirm the command before you run it.
      # mkfs.vfat -F 32 /dev/sdd1
      mkfs.vfat 2.11 (12 Mar 2005)
    
Insert your USB flash drive or USB hard drive into the USB port on your Linux machine and wait a few seconds. Next, run the command "dmesg" to query the device name of the USB flash drive or USB hard drive. Let's say, for example, that you find it is /dev/sdd1. In this example, we assume /dev/sdd1 has FAT filesystem, and it is automatically mounted in dir /media/usb/. If it's not automatically mounted, manually mount it with commands such as "mkdir -p /media/usb; mount /dev/sdd1 /media/usb/".
Unzip all the files and copy them into your USB flash drive or USB hard drive. You can do this with a command such as: "unzip gparted-live-0.4.5-2.zip -d /media/usb/"). Keep the directory architecture, for example, file "COPYING" should be in the USB flash drive or USB hard drive's top directory (e.g. /media/usb/COPYING).
To make your USB flash drive bootable, first change the working dir, e.g. "cd /media/usb/utils/linux", then run "bash makeboot.sh /dev/sdd1" (replace /dev/sdd1 with your USB flash drive device name), and follow the prompts.
WARNING! Executing makeboot.sh with the wrong device name could cause your GNU/Linux not to boot. Be sure to confirm the command before you run it.

NOTE: There is a known problem if you run makeboot.sh on Debian Etch, since the program utils/linux/syslinux does not work properly. Make sure you run it on newer GNU/Linux, such as Debian Lenny, Ubuntu 8.04, or Fedora 9.
TIP:   If your USB flash drive or USB hard drive is not able to boot, check the following:

Ensure that your USB flash drive contains at least one FAT partition.
Ensure that the partition is marked as "bootable" in the partition table.
Ensure that the partition starts on a cylinder boundary.
For the first partition this is usually sector 63.

    
</entry>
<entry [Fri 2012:10:26 23:38:44 EST] TRIED mk2fs AND e2fsck>

PROBLEM

1. OVERWROTE ORIGINAL PARTITION TABLE USING TESTDISK 'ADD PARTITION'

2. DON'T KNOW THE ORIGINAL PARTITION'S START/STOP POINTS


SOLUTION

Re: recovering partition table

Postby carandraug » 2012-10-01 07:46

Thank you all for you help. I finally managed to fix this. Just for the record here's how I did it. Part of the solution I found at

http://linuxexpresso.wordpress.com/2010/03/31/repair-a-broken-ext4-superblock-in-ubuntu/

and it involves knowing the settings used to create the filesystem (I was pretty sure I didn't change the defaults).

Basically I first had to fix the partition table to reflect what I actually had there (I used testdisk for this but parted, cfdisk or fdisk should work fine as well).

I just removed the wrong partitions and replaced by a single ext4 type partition covering the whole disk with the correct CHS values.

The rest is mostly from the link at start (read it for details) but basically I ran


mke2fs -n /dev/xxx


to find the positions for the superblocks backup. Then used the last backup closest to the end of the disk (only the ones at the start of the disk had been overwritten with dd) to run fsck. This generated a lof of errors but fsck has a -y option (not the same as -a).


sudo e2fsck -b backup_block_number /dev/xxx



I thought this had not worked because I couldn't see any files but actually they had all been saved to the lost+found directory.

So in the end I did salvage most of my files while keeping their filenames and directory structure. Hope this may help others in the future.




sudo dumpe2fs /dev/sda | grep -i superblock





    
</entry>
<entry [Fri 2012:10:26 23:38:00 EST] AFTER 'ADD PARTITION, TESTDISK SHOWS DUPLICATE PARTITIONS>

TestDisk 6.13, Data Recovery Utility, November 2011
Christophe GRENIER < grenier@cgsecurity.org >
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63
Current partition structure:
     Partition                  Start        End    Size in sectors

No ext2, JFS, Reiser, cramfs or XFS marker
 1 * Linux                38913   0  1 38913 254 63      16065
 1 * Linux                38913   0  1 38913 254 63      16065



    
</entry>
<entry [Fri 2012:10:26 23:35:17 EST] TESTDISK 'DEEPER' SCAN>

RAN DEEPER SEARCH IN TESTDISK:

TestDisk 6.13, Data Recovery Utility, November 2011
Christophe GRENIER grenier@cgsecurity.org
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38913 255 63

The harddisk (320 GB / 298 GiB) seems too small! (< 440 GB / 410 GiB)
Check the harddisk size: HD jumpers settings, BIOS detection...

The following partition can't be recovered:
     Partition               Start        End    Size in sectors
>  Linux                22848   0  1 53601 232  7  494061568

</entry>
<entry [Fri 2012:10:26 23:32:57 EST] TESTDISK SCAN>

TestDisk 6.13, Data Recovery Utility, November 2011
Christophe GRENIER grenier@cgsecurity.org
http://www.cgsecurity.org

Disk /dev/sda - 320 GB / 298 GiB - CHS 38914 255 63

Warning: the current number of heads per cylinder is 255
but the correct value may be 16.
You can use the Geometry menu to change this value.
It's something to try if
- some partitions are not found by TestDisk
- or the partition table can not be written because partitions overlaps.

cat /proc/partitions
major minor  #blocks  name

   8        0  312571224 sda
   8        1  308788224 sda1
   8        2          1 sda2
   8        5    3780608 sda5
  11        0    1048575 sr0
   8       16  488386584 sdb
   8       17  450426758 sdb1
   8       18          1 sdb2
   8       21    8658944 sdb5
   8       22   29298688 sdb6
syoung@syoung-Satellite-C675D:~$ sudo fdisk -l /dev/sda
[sudo] password for syoung: 

Disk /dev/sda: 320.1 GB, 320072933376 bytes
255 heads, 63 sectors/track, 38913 cylinders, total 625142448 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x000765db

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048   617578495   308788224   83  Linux
/dev/sda2       617580542   625141759     3780609    5  Extended
/dev/sda5       617580544   625141759     3780608   82  Linux swap / Solaris
syoung@syoung-Satellite-C675D:~$ 




    
</entry>
<entry [Fri 2012:10:26 23:33:28 EST] gpart SCAN>
    
    
gpart /dev/sda

Begin scan...
^X^C
root@syoung-Satellite-C675D:~# time gpart /dev/sda

Begin scan...
Possible partition(Windows NT/W2K FS), size(152470mb), offset(152775mb)
End scan.

Checking partitions...

* Warning: partition(OS/2 HPFS, NTFS, QNX or Advanced UNIX) ends beyond disk end.
Partition(OS/2 HPFS, NTFS, QNX or Advanced UNIX): invalid primary 
Ok.

Guessed primary partition table:
Primary partition(1)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r

Primary partition(2)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r

Primary partition(3)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r

Primary partition(4)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r


   real38m43.329s
   user2m13.684s
   sys22m33.981s


</entry>
<entry [Fri 2012:10:26 23:24:10 EST] Extundelete>

    extundelete is a utility that can recover deleted files from an ext3 or ext4 partition



I've recently used the command line tool foremost for recovering 9000 photos off a SD card.

    Install foremost: sudo apt-get install foremost
    Mount and create the target directory for storing recovered data, make sure it's large enough to hold the data. I assume it's located at /media/backup/recover now.

    Assuming your flash drive to be named /dev/sdb, run:

    sudo foremost -i /dev/sdb -o /media/backup/recover

    Do something else, it might take a while to read and recover the data over USB.



https://help.ubuntu.com/community/DataRecovery




If you made a mistake while partitioning and the partition no longer appears in the partition table, so long as you have not written data in that space, all your data is still there.

GNU Parted

Run Parted from the command line to recover your partition.

When changing the partition table on your hard drive, you must ensure that no partition on the disk is mounted. This includes swap space. The easiest way to accomplish this is to run the live cd. Parted is installed on the base Ubuntu system. Once at the desktop, open a terminal and run_:

sudo swapoff -a

Next run parted and tell it to use the device in question. For example, if your /dev/sda drive is the drive from which you want to recover, run:

sudo parted /dev/sda

Then, use the rescue option:

rescue START END


where Start is the area of the disk where you believe the partition began and END is its end. If parted finds a potential partition, it will ask you if you want to add it to the partition table. 




CAUTION

You should NOT write to the failed device, as it can worsen a hardware failure, and overwrite existant data in case of lost files.

Shut down the affected machine as soon as possible, and restart it from a LiveCD or LiveUSB. Be certain that the "live" cd does not automatically mount any partition or swap space. 

    
</entry>

