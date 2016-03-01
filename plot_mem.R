#! /usr/local/bioinfo/src/R/current/bin/Rscript
args = commandArgs(TRUE);

if (args[1]=="-h" || length(args)==0){
	cat("\nplop_mem.R \"title_graph\" outfile_name.pdf outfile_from_memrec [outfile_from_memrec2 outfile_from_memrec3....]\n\n" )
}else{

	title=args[1]
	outfile=args[2]

	pdf(outfile)

	for (a in args){
		infile=a
		if (infile != title & infile != outfile){
			t = read.table(infile)
			plot(t[,1]/60, t[,2],xlab="time in min", ylab="mem in MB", type="l", col ="red", main=title, sub=infile)
		}
	}

	dev.off()
}
