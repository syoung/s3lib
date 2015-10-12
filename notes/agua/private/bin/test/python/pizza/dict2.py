mydict = {
   'key2':'value2',
   'key1':'value1',
   'key3':'value3',
   'key4':'value4'
}

keys = mydict.keys();
print keys
keys.sort();
print "sorted keys: ", keys

for key in keys:
   print "%s: %s" % (key, mydict[key])
   print "%s: %s" % (key, mydict.get(key))


