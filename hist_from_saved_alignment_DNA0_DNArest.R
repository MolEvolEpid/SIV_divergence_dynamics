library(ape)
library(ips)

# Get names of all SIV DNA fasta files
siv.dna.data <- list.files(path = "..\\data\\fasta_files_aligned", pattern = "_combined_aligned_consref_DNA0_DNArest.fasta", full.names = TRUE)[1:10]


# Get histograms for number of substitutions per site
# The population at start of ART is assumed to be a mix of slow- and fast-decaying cells
# The population at max time post-ART is assumed to be only the slow-decaying population
layout(matrix(1:10, ncol = 5))
hist1 <- list()
hist2 <- list()
monkey_IDs <- c()
n=0
for(siv.dna in siv.dna.data){
    n=n+1

    # Read data
    siv.ref.ali <- read.dna(siv.dna, format = "fasta")

    # Extract the monkey's name
    monkey_ID <- strsplit(strsplit(siv.dna, split = "\\/")[[1]][2], split = "\\_")[[1]][1]
    monkey_IDs[n] <- monkey_ID

    # Compute all-pairs distance and extract distance from patient seqs to ref (divergence)
    siv.dist <- dist.dna(siv.ref.ali, model = "raw", pairwise.deletion = TRUE, as.matrix = TRUE)
    siv.ref.dist <- siv.dist[1, 2:length(siv.dist[1,])]

    # Extract time when each sequence was sampled
    times <- as.numeric(sapply(1:length(siv.ref.dist), function(i) strsplit(labels(siv.ref.dist[i]), split = "\\_")[[1]][2]))

    # Get histogram for time t=0. This is a mix of fast- and slow-decaying cells
    hist(siv.ref.dist[times==0], breaks = seq(0, 0.02, 0.001), main = monkey_ID, xlab = "subst/site")
    hist1[[n]] <- hist(siv.ref.dist[times==0], breaks = seq(0, 0.02, 0.001), plot = FALSE)

    hist(siv.ref.dist[times==max(times, na.rm = T)], breaks = seq(0, 0.02, 0.001), main = "", xlab = "subst/site")
    hist2[[n]] <- hist(siv.ref.dist[times==max(times, na.rm = T)], breaks = seq(0, 0.02, 0.001), plot = FALSE)
}

# estimating fast pop distribution at t=0 by taking hist1 - 40% hist2
fast.hist <- list() # assume slow cell pop is 40% of total pop at t=0
slow.hist <- list() # scale the population at t=max such that it is 40%
for(n in 1:10){fast.hist[[n]] <- hist1[[n]]$counts - (hist2[[n]]$counts * (sum(hist1[[n]]$counts) / sum(hist2[[n]]$counts)) * 0.4)}
for(n in 1:10){slow.hist[[n]] <- hist2[[n]]$counts * (sum(hist1[[n]]$counts) / sum(hist2[[n]]$counts)) * 0.4}

# Redo the plots
layout(matrix(1:10, ncol = 5))
for(n in 1:10){
  plot(hist1[[1]]$mids, fast.hist[[n]], lwd = 2, xlab = "subst/site", ylab = "count", main = paste(monkey_IDs[n], "TypeA fast", sep = " "), type = "h")
  plot(hist1[[1]]$mids, slow.hist[[n]], lwd = 2, xlab = "subst/site", ylab = "count", main = paste(monkey_IDs[n], "TypeA slow", sep = " "), type = "h")
}

# Write histogram to file
index <- 1
for(n in 1:10){
   results <- cbind(hist1[[n]]$mids, fast.hist[[n]])
   write.table(results, paste("..\\results\\", monkey_IDs[index], "\\", monkey_IDs[index], "_DNA0_DNArest_fast_hist_3years.txt", sep = ""), append=FALSE)

   results <- cbind(hist1[[n]]$mids, slow.hist[[n]])
   write.table(results, paste("..\\results\\", monkey_IDs[index], "\\", monkey_IDs[index], "_DNA0_DNArest_slow_hist_3years.txt", sep = ""), append=FALSE)

   index <- index + 1
}
