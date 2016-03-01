#! /usr/local/bioinfo/src/R/current/bin/Rscript
args = commandArgs(TRUE);

if (args[1]=="-h" || length(args)==0){
	cat("\nplop_hist.R \"title_graph\" \"xlabel\" \"ylabel\" outfile_prefix infile col_count\n\n" )
}else{

	titre=args[1]
	xlabel=args[2]
	ylabel=args[3]
	outfile=args[4]
	infile=args[5]
	col_index=as.numeric(args[6])

	t=read.table(infile)
	
	pdf(paste(outfile,".pdf",sep=""))
	barplot(t[,col_index],xlab=xlabel, ylab=ylabel, main=titre)
	dev.off()
	jpeg(paste(outfile,".jpeg",sep=""))
	barplot(t[,col_index],xlab=xlabel, ylab=ylabel, main=titre)
	dev.off()
}
