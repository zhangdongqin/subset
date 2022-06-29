library(optparse)

option_list <- list(
    make_option(c("-i", "--input"    ), type="character", default = NULL                    , metavar="path"   , help="Input source file"  							   ),
    make_option(c("-l", "--list"     ), type="character", default = NULL                    , metavar="path"   , help="Tatget item list"  							   ),
    make_option(c("-c", "--col"      ), type="character", default = 4                       , metavar="integer", help="Col number of target colunm in source file"     ),
    make_option(c("-o", "--output"   ), type="character", default = "./Subset_results.csv"  , metavar="path"   , help="Output file/Directory"                          )
)

opt_parser <- OptionParser(option_list = option_list)
opt        <- parse_args(opt_parser)

if (is.null(opt$input)){
    print_help(opt_parser)
    stop("Please provide a source file.", call.=FALSE)
}
if (is.null(opt$list)){
    print_help(opt_parser)
    stop("Please provide a list file.", call.=FALSE)
}


source_file  = read.table(opt$input, sep="\t")
head(source_file)

#colnames(source_file) = 1:ncol(source_file)

#head(source_file)

list_file	 = as.vector((read.table(opt$list))$V1)
head(list_file)

col_number = as.integer(opt$col)

#head(colnames(source_file)[4])

#col = paste("V", col_number, sep ="")
#head(col)

#head(col)
#sub_source_file = as.matrix(source_file)

Subset_results = subset(source_file, as.data.frame(source_file)[ ,col_number] %in% list_file)
head(Subset_results)

write.csv(Subset_results, file = opt$output)







