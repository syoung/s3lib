#!/usr/bin/perl -w

use strict;

my $output = qq{Unexpected error:
org.codehaus.xfire.fault.XFireFault: Signature creation failed; nested exception is: 
	java.security.spec.InvalidKeySpecException: java.io.IOException: DER length more than 4 bytes: 7
	at org.codehaus.xfire.fault.XFireFault.createFault(XFireFault.java:89)
	at org.codehaus.xfire.client.Invocation.invoke(Invocation.java:83)
	at org.codehaus.xfire.client.Invocation.invoke(Invocation.java:114)
	at org.codehaus.xfire.client.Client.invoke(Client.java:336)
	at org.codehaus.xfire.client.XFireProxy.handleRequest(XFireProxy.java:77)
	at org.codehaus.xfire.client.XFireProxy.invoke(XFireProxy.java:57)
	at \$Proxy12.deleteKeyPair(Unknown Source)
	at com.amazon.aes.webservices.client.Jec2Impl.deleteKeyPair(Jec2Impl.java:1954)
	at com.amazon.aes.webservices.client.cmd.DeleteKeyPair.invokeOnline(DeleteKeyPair.java:48)
	at com.amazon.aes.webservices.client.cmd.BaseCmd.invoke(BaseCmd.java:854)
	at com.amazon.aes.webservices.client.cmd.DeleteKeyPair.main(DeleteKeyPair.java:58)
Caused by: org.apache.ws.security.WSSecurityException: Signature creation failed; nested exception is: 
	java.security.spec.InvalidKeySpecException: java.io.IOException: DER length more than 4 bytes: 7
	at org.apache.ws.security.message.WSSecSignature.computeSignature(WSSecSignature.java:678)
	at com.amazon.aes.webservices.client.Jec2Impl.signRequest(Jec2Impl.java:255)
	at com.amazon.aes.webservices.client.Jec2Impl.access\$000(Jec2Impl.java:69)
	at com.amazon.aes.webservices.client.Jec2Impl\$1.invoke(Jec2Impl.java:148)
	at org.codehaus.xfire.handler.HandlerPipeline.invoke(HandlerPipeline.java:131)
	at org.codehaus.xfire.client.Invocation.invoke(Invocation.java:79)
	... 9 more
Caused by: java.security.spec.InvalidKeySpecException: java.io.IOException: DER length more than 4 bytes: 7
	at org.bouncycastle.jce.provider.JDKKeyFactory\$RSA.engineGeneratePrivate(Unknown Source)
	at java.security.KeyFactory.generatePrivate(KeyFactory.java:372)
	at com.amazon.aes.webservices.client.CryptoProxy.getPrivateKeyByName(CryptoProxy.java:140)
	at com.amazon.aes.webservices.client.CryptoProxy.getPrivateKey(CryptoProxy.java:90)
	at org.apache.ws.security.message.WSSecSignature.computeSignature(WSSecSignature.java:671)
	... 14 more

};

$output = qq{Unexpected error:
org.codehaus.xfire.fault.XFireFault: Signature creation failed; nested exception is: "0};

$output = qq{Unexpected error:
is: "0};




sub shortenString  {
    my $string =   shift;
    my $length =   shift;
	print "string: $string\n";
	print "length: $length\n";
	$string =~ s/\n//g;
    my $templength = length($string);
	$string = substr($string, 0, $length);
	$string .= "..." if $templength > $length;
	print "string: $string\n";

	print "Returning string:  $string\n";
	return $string;
}


$output = shortenString($output, 150);

print "OUTPUT: $output\n";
