## Overall

[keterangan neraca](https://docs.google.com/spreadsheets/d/1GVi1LWD_Agzt1jity-GR054ZJ96Z-wJYgSQC2RztsY0/edit#gid=2069663655 ':include :type=iframe width=100% height=800px')

### Hitung Total Crr / Bobot
$$
\begin{align}
TotalKeuangan &= (25 * CRRKeuangan) / 100 \\
&= (25 * 70) / 100 \\
&= 17.5 \\
\newline
TotalKarakter &= (30 * CRRKarakter) / 100 \\
&= (30 * 70) / 100 \\
&= 21 \\
\newline
TotalJenisUsaha &= (10 * CRRJenisUsaha) / 100 \\
&= (10 * 70) / 100 \\
&= 7 \\
\newline
TotalBisnis &= (25 * CRRBisnis) / 100 \\
&= (25 * 70) / 100 \\
&= 17.5 \\
\newline
TotalAgunan &= (10 * CRRAgunan) / 100 \\
&= (10 * 70) / 100 \\
&= 7 \\
\end{align}
$$

### Hitung Total CRR
$$
\begin{align}
TotalCRR &= TotalKeuangan + TotalKarakter + TotalJenisUsaha + TotalBisnis + TotalAgunan \\
&= 17.5 + 21 + 7 + 17.5 + 7 \\
&= 70
\end{align}
$$

### Hitung Rating (Keterangan)
$$
\begin{align}
if \; TotalCrr > 90.1 \;\&\; TotalCrr <= 100 \; then \; Rating &= Excellent \\
else if \; TotalCrr > 79.01 \;\&\; TotalCrr <= 90 \; then \; Rating &= Baik Sekali \\
else if \; TotalCrr > 69.01 \;\&\; TotalCrr <= 79 \; then \; Rating &= Baik \\
else if \; TotalCrr > 64.01 \;\&\; TotalCrr <= 69 \; then \; Rating &= Cukup Baik \\
else if \; TotalCrr > 59.01 \;\&\; TotalCrr <= 64 \; then \; Rating &= Cukup \\
else if \; TotalCrr > 54.01 \;\&\; TotalCrr <= 59 \; then \; Rating &= Agak Kurang \\
else if \; TotalCrr > 49.01 \;\&\; TotalCrr <= 54 \; then \; Rating &= Kurang \\
else \; Rating &= Kurang Sekali \\
\end{align}
$$


### Hitung Rating (Alphabetical)
$$
\begin{align}
if \; TotalCrr > 90 \; then \; Rating &= AAA \\
else if \; TotalCrr > 80 \; then \; Rating &= AA \\
else if \; TotalCrr > 70 \; then \; Rating &= A \\
else if \; TotalCrr > 65 \; then \; Rating &= BB \\
else if \; TotalCrr > 60 \; then \; Rating &= B \\
else if \; TotalCrr > 54 \; then \; Rating &= C \\
else if \; TotalCrr > 50 \; then \; Rating &= D \\
else \; Rating &= E \\
\end{align}
$$