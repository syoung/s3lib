thunderbird


<entry [Sun 2014:02:09 12:09:18 EST] FIXED SENT MAIL ON OUTLOOK NOT SAVED ON SERVER>

1. CHANGED IMAP SERVER TO outlook.office365.com

CURRENT office365 SERVER 
Thunderbird --> Edit -->Accounts --> Server Settings --> Server Name
	
	pod51010.outlook.com
	PORT 993

CHANGED TO NEW SERVER

	#https://outlook.office365.com/WES/Exchange.asmx
	outlook.office365.com
	#PORT 443
	993
	USE SSL TO CONNECT

2. SET TO USE DEFAULT SERVER

Thunderbird --> Edit -->Accounts --> Account Settings --> Outgoing Server --> Default 


3. SUBSCRIBE TO 'Sent Items'

THUNDERBIRD FOLDERS --> Rightclick --> Subscribe --> Sent Items


4. SAVE SEND MESSAGES TO 'Sent Items' *** i.e., NOT 'Sent' ***


Thunderbird --> Edit -->Accounts --> Server Settings --> Copies and Folders

When Sending Messages Automatically --> Place a copy in --> Other --> Sent Items on StuartY@annaisystems.com



NOTES
-----

SERVER SETTINGS EXTRACTED FROM office365.com

Login --> Outlook --> Cog --> Options --> Account --> My Account --> Settings for POP or IMAP access...

	POP setting
	Server name: outlook.office365.com
	Port: 995
	Encryption method: SSL
	
	IMAP setting
	Server name: outlook.office365.com
	Port: 993
	Encryption method: SSL
	
	SMTP setting
	Server name: smtp.office365.com
	Port: 587
	Encryption method: TLS





	
</entry>
<entry [Fri 2012:07:13 18:20:37 EST] MARK MESSAGE AS 'NOT JUNK'>

HIT 'SHIFT + J'

http://kb.mozillazine.org/Junk_Mail_Controls#Training_the_Junk_Mail_Controls

Activating the Junk Mail Controls

To start using the Junk Mail Controls in Thunderbird:

Note: Controls are divided between two locations:

(a) Tools -> Options -> Security -> Junk, and

(b) Tools -> Account Settings -> *each account* -> Junk Settings.

Click Tools -> Options -> Security -> Junk

Change settings as desired

Caution: "Reset Training Data" applies to ALL of your accounts. There is only one set of training data, so don't reset it thinking it will only affect one account.
When finished, click the "OK" button

'In Account Settings, choose the email account for which you want to activate the Junk Mail Controls. "Email account" means the folder structure under which the emails are saved. So if you use the Global Inbox for a pop account, you must select "Local Folders" as the account. (This is different from the message filters, where you select the account that retrieves the email.)

Click the "Junk Settings" tab

Make sure that the checkbox for "Enable adaptive junk mail" is checked.
Choose your settings for Whitelists at "Do not mark mail as junk...".
It only supports whitelisting specific email addresses, and only those in your address books. However, message filters may be used to test whether the sender "contains" a domain, and set the junk status accordingly, because filters are run before the junk mail controls.

Make sure that the checkbox for "Move junk messages to" is checked, unless you want junk mail kept in your Inbox. (Junk folder normally will not appear alongside your other mail folders until you mark your first message as Junk.)
Enable retention settings if desired. But if you do not enable it, then you must periodically Empty Junk.
If you have more than one email account, repeat the above steps for each account with which you want to use the Junk Mail Controls.
When finished with account settings, click the "OK" button.
Proceed next to training ...
[edit]
Training the Junk Mail Controls

Junk processing must be well trained for it to work correctly. Training involves marking many messages as "junk" and many messages as "not junk". It is important to mark both types of messages, both good and bad, not just the ones that are junk.
Initially, incoming messages might not be accurately junked because you have not trained it enough.
Check your Junk folder to see if any non-junk messages have been detected as junk, and mark non-junk ones as not junk.
Bayesian filtering requires at least 100 bad messages be marked as spam and 100 good messages marked as not junk to function. To work best, it needs a few hundred of each marked.
If you mark a thousand spam messages but do not mark legitimate messages, or very few, it won't work well.
It's best to mark different types of messages good and bad - marking 500 messages from the same source is not as good as marking 500 messages from different people.
After an initial training period
You should find that Junk Mail Controls are effectively detecting unwanted junk emails and keeping them from your Inbox. If it is not, see the tweaking information below.
You should occasionally train non-junk messages - doing it when you mark bad messages as junk is a good habit.
There are various ways that you can mark messages:
Select a message and type "Shift+J" (for not Junk) or "J" (for Junk).
Right-click on a message and choose "Mark -> As Junk" (or "As Not Junk").
Select a message and from the "Message" menu, choose "Mark -> As Junk" (or "As Not Junk").
Select a message and click on the "Junk" icon on the toolbar.
Select a message and click on the "Junk Status" column in the message-list pane (which will show a small "Junk" icon if the message is marked as junk).
You don't need to keep the messages you have marked - marking stores the information it needs as tokens in the training.dat file. Training data for the Junk Mail Controls is stored in "training.dat" in your profile folder. You can view the Junk Mail Log by selecting "Junk Mail Log" in "Tools -> Junk Mail Controls -> Logging", and then use the mouse to 'grab' any corner and stretch it until it expands enough for you to see the log data.

Tweaking the Junk Mail Controls

mail.adaptivefilters.junk_threshold is the preference that determines at what "level" messages are classified as junk. It defaults to 90 in version 3.1.7. Lowering this value will make it easier to recognize messages as spam, though it increases the risk that it will classify a legitimate message as spam. This might help get more messages marked; for example, messages that look like text but are actually clickable images. (Note however, adaptive processing does NOT examine images nor care about whether a message has an image - it is not part of the junk algorithm)

You can change the preference using Tools -> Options -> Advanced -> General -> Config Editor. Enter junk in the Filter field to show only the preferences that contain junk in their name, and then double-click on mail.adaptivefilters.junk_threshold, enter a value lower than the default 90 in the edit field and press the OK button. Many users report good results with values of 30 or lower.

JunQuilla is an add-on which can help you tweak junk processing and help you better understand how it is working. It provides a column that shows the odds that a message is spam, enhances the junk status column, and adds a Uncertain folder for messages requiring a users decision. It requires Thunderbird version 3 and newer.

Bayes Junk Tool can also be used to examine and modify the raw training data. Sometimes it helps to get rid of tokens that are just as likely to occur in spam and legitimate messages, especially if the training data file gets very large. The web site also has several sets of training data that you can import or merge with your existing training data.

Bayesian filters are useful, but they are not always the best tool. Sometimes checking whether the message was sent by somebody on a DNSBL list is more effective. See this article for how to integrate SpamPal and the junk mail controls, and control which messages are downloaded.

The FolderFlags extension can set various internal flags that Thunderbird uses to classify folders. If you set the "Junk" flag on a folder (other than the one spam is moved to) it won't scan that folder for spam.

The Delete Junk Context Menu extension adds "Delete Mail Marked as Junk" to a folders context menu. It can be configured to delete mail without moving it to using the Trash folder.


</entry>