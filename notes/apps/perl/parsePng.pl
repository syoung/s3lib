#!/usr/bin/perl -w

use strict;
use Data::Dumper;

$/ = undef;
my $contents = <DATA>;
$contents =~ s/^\s*Content-Type[^\n]+\n\s*\n//ms;
$contents =~ s/[\r\n\-]+$//ms;
#print "contents: \n\n**$contents**\n\n";


my $details = qq{Content-Disposition: form-data; name="username" 

aguatest

-----------------------------1310873792764
Content-Disposition: form-data; name="sessionId" 

9999999999.9999.999

-----------------------------1310873792764
Content-Disposition: form-data; name="path" 

Project1/Workflow1/uploads

-----------------------------1310873792764--
};

my $boundary_number = 1310873792764;
my $params;

    #### OTHERWISE, STORE DETAILS
    while ($details =~ /^.+?name="([^"]+).?\s+(\S+).+?$boundary_number(.*)$/ms )
    {
        my $param = $1;
        my $value = $2;
        $details = $3;
        $value =~ s/\n[\-]+$boundary_number[\-]+$//msi;
        $value =~ s/\s+$//;
        $value =~ s/\s*[\-]+$//;
        $params->{$param} = $value;
        $params->{$param} = '' if not defined $params->{$param};
        #print "upload.cgi    param: $param\n";
        #print "upload.cgi    value: $value\n";
        #print "upload.cgi    details: $details\n";
    }

print "upload.cgi    params:\n";
print Dumper $params;
exit;


__DATA__
(�(5(���<���#�8n8�ӗ;�1c���k��bq˖�D���P����Mt�t���}(ݼ�a�0�F�����<��h
�nߩ�{�7Wl��(��
�3�?�b��)$����}��7M\�HѨ~�ZQo�1[�$����������9�`�&c�G�w��>�k�]¶Ys`NN�|�Ā�h�;�ʻu�7[	��s������5���o�vHPa�[(�2y�ZFi�q�q�nagY��GaY-?e�����`l�Ó������\V^�u�K����)V=ԙ��z�پ#������(�{	�����{�%�p�����и������K]�sm���L?��~�2+�k��.���B"�V7:��?���=�LƖ\v���I���M�z�qw~�׋],��F�`[��A��/��޶xvĮ�e�y�myk��]��-$ȩ�wގ{��lz�m��j�XK�©lx�+n�:�3��>��t��v�mi��j��������C��Du`4�zKŶT��և���)����_���!AE�ޔ65#��_l`�kö�!��O���T�8����x��E2�c/�}�D��Ҡ́5�J��0�G�NV��<��tF���Xl8Ud�v`[A5��7��b�{q��>��Rlŏ/�������_̂�������<�v?N�r�Fl<8��§��$gʛ
,_�.�6ҙ���1�q8�����ǲ�]�:������ޚ<�F3�o_��9�$WX��J%��<��Fc�?�JLg��Pf,���y>L��ô��X�9�������W�q5��v�?�\IP!E/�-������+	*$���e����G���RT!l���&A%�¦IP	!��i�T����3�s�IEND�B`�
-----------------------------
-----------------------------
