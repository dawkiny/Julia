addprocs(3);
d  = drand(300,300);
nd = length(d.chunks);

� = reduce(+, map(fetch, 
	{@spawnat p mean(localpart(d)) for p in procs(d) }))/nd;
	
s = reduce(+, map(fetch, 
	{@spawnat p std(localpart(d)) for p in procs(d) }))/nd;
