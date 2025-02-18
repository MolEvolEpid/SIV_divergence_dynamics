**SIV proviruses seeded later in infection are harbored in short-lived CD4+ T cells**

Narmada Sambaturu (a,b) , Emily J. Fray (c), Vivek Hariharan (c), Fengting Wu (c), Carolin Zitzmann (a), Francesco R. Simonetti (c), Dan H. Barouch (d), Janet D. Siliciano (c), Robert F. Siliciano (c,e), Ruy M. Ribeiro (a), Alan S. Perelson (a), Carmen Molina-París (a), and Thomas Leitner (a) 

(a) Theoretical Biology and Biophysics Group, Los Alamos National Laboratory, Los Alamos, NM 87545, USA

(b) School of Systems Science and Industrial Engineering, State University of New York at Binghamton, Binghamton, NY, USA

(c) Department of Medicine, Johns Hopkins University School of Medicine, Baltimore, MD 21205, USA

(d) Center for Virology and Vaccine Research, Beth Israel Deaconess Medical Center, Boston, MA 02215, USA

(e) Howard Hughes Medical Institute, Baltimore, MD 21205, USA.

**Abstract**

The human immunodeficiency virus (HIV) can persist in a latent form as integrated DNA (provirus) in resting CD4+ T cells unaffected by antiretroviral therapy. Despite being a major obstacle for eradication efforts, it remains unclear which infected cells survive, persist, and ultimately enter the long-lived reservoir. Here, we determine the genetic divergence and integration times of simian immunodeficiency virus (SIV) envelope sequences collected from infected macaques. We show that the proviral divergence as well as phylogenetically estimated integration times display a biphasic decline over time. Investigating the dynamics of the mutational distributions, we show that SIV genomes in short-lived cells are on average more diverged, while long-lived cells contain less diverged virus. The change in the mutational distributions over time explain the observed biphasic decline in divergence of the proviruses. This suggests that long-lived cells harbor virus deposited earlier in infection, while short-lived cells predominantly harbor more recent virus.


**Usage notes**
The data folder contains (i) the aligned fasta files for the SIV-infected macaques, with the consenses sequence of the infecting stock as the reference, (ii) the half-lives of the short- and long-lived CD4+ T cells estimated using IPDA data for the number of intact proviruses over time (IPDA data published in Fray et. al. [1]), (iii) the sampling times and number of sampled sequences, and (iv) the mutational bins to be used for histograms.

The R code uses these data to estimate the distribution of mutations in the short- and long-lived CD4+ T cells at the start of ART. The Python code in the Jupyter notebooks then uses these estimated histograms and half-lives to simulate the dynamics of divergence over time.


**Contact**
The lead contact and corresponding author is Thomas Leitner (tkl@lanl.gov). Any additional information required to reanalyze the data reported here is available from the lead contact upon request.