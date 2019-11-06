# Random-Phase-Test-for-Coherence
A Matlab script to calculate a Random Phase Test for coherence between two signals.

Function:

```Matlab
[coh, th] = rptest(signal1,signal2,wsize,overlap,f,fs,nrep,alpha)
```

Signal1 and Signal2 are 2D matrices. Rows represent time, columns windowed version of the time series.
Wsize is the size of the window used to windowing the signals.
f is the vector defining the frequency of intrest in the calculation of the coherence.
fs is the sample rate of the signals.
nrep is the number of iteration to claculate a random distribution.
alpha is the desired level of confidence. (pvalue)

coh is the coherence (mean squared)
th is the threshold below which the coherence values in coh are not statistically significant at alpha.

The random phase test generate a ranom signal with the same amplitude spectra but with random phase asignaments, this takes into consideration the correlations due to amplitude, also the autocorrelation function is similar to that of the original signal.



