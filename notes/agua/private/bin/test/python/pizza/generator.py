def multipliers():
    for i in range(4): yield lambda x : i * x
    
    
print [m(2) for m in multipliers()]