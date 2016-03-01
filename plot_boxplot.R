#! /usr/local/bioinfo/src/R/current/bin/Rscript
args = commandArgs(TRUE);

if (args[1]=="-h" || length(args)==0){
	cat("\nplop_boxplot.R \"title_graph\" outfile_prefix infile col_count\n\n" )
}else{

	titre=args[1]
	outfile=args[2]
	infile=args[3]
	col_index=as.numeric(args[4])

	t=read.table(infile)
	
	pdf(paste(outfile,".pdf",sep=""))
	boxplot(t[,col_index], main=titre)
	title(sub=sub("Max.", "Max.\n", capture.output(summary(t[,col_index]))))
	dev.off()
	jpeg(paste(outfile,".jpeg",sep=""))
	boxplot(t[,col_index], main=titre)
	title(sub=sub("Max.", "Max.\n", capture.output(summary(t[,col_index]))))
	dev.off()
}
