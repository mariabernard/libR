#!/usr/local/bioinfo/src/R/current/bin/Rscript

##NAME = "plot_dist.R"
##SYNOPSIS = "plot_dist.R title_graph X_axis_legend Y_axis_legend outfile_prefix input_dist [input_dist2 put_dist3 ...]"
##DATE = "06/08/2013"
##AUTHORS= "Maria Bernard"
##KEYWORDS = "create JPEG and PDF distribution"
##DESCRIPTION = "plot_dist.R title_graph X_axis_legend Y_axis_legend outfile_prefix input_dist [input_dist2 put_dist3 ...]"

args = commandArgs(TRUE);

if (args[1]=="-h" || length(args)==0){
	cat("\nplot_dist.R \"title_graph\" \"X axis legend\" \"Y axis legend\" step outfile_prefix input_dist1 [input_dist2 put_dist3 ...] \n\n" )
}else{

	title=args[1]
	xlabel=args[2]
	ylabel=args[3]
	step=as.numeric(args[4])
	outfile=args[5]
	infile=args[6]
	
	
	maxY=0
	maxX=0
	for (a in args[-(1:5)]){
		maxY=max(maxY,read.table(a)[,2])
		maxX=max(maxX,read.table(a)[,1])
	}
	
	jpeg(paste(outfile,".jpg",sep=""))
	t = read.table(infile)
	cpt=1
	plot(t[,1], t[,2],xlab=xlabel, ylab=ylabel, type="h", col =cpt, main=title, xlim=c(0,maxX+step),ylim=c(0,maxY+10))
	if (length(args)>6){
		for (a in args[-(1:6)]){
			t2 = read.table(a)
			lines(t2[,1]+((cpt*step)/(length(args)-3)), t2[,2], type="h",col=cpt+1)
			cpt=cpt+1
		}
	}
    legend_title=c()
    for (a in args[-(1:5)]) {
        legend_title=c(legend_title,basename(a))
    }
	legend("top",legend_title,col=1:cpt,lty=rep(1,cpt))
	dev.off()
	
	pdf(paste(outfile,".pdf",sep=""))
	t = read.table(infile)
	cpt=1
	plot(t[,1], t[,2],xlab=xlabel, ylab=ylabel, type="h", col =cpt, main=title, xlim=c(0,maxX),ylim=c(0,maxY+10))
	if (length(args)>6){
		for (a in args[-(1:6)]){
			t2 = read.table(a)
			lines(t2[,1]+((cpt*step)/(length(args)-3)), t2[,2], type="h",col=cpt+1)
			cpt=cpt+1
		}
	}
	legend("top",legend_title,col=1:cpt,lty=rep(1,cpt))
	dev.off()
}
