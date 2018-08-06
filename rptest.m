function [coh, th] = rptest(signal1,signal2,wsize,overlap,f,fs,nrep,alpha)


nfft = size(signal2,1);
y = fft(signal2,nfft);

ch = zeros(length(f),nrep);
for j = 1:nrep
    
    tmp1 = rand(nfft/2,size(y,2))*2*pi;
    tmp2 = flipud(tmp1);
    ang = [zeros(1,size(y,2)); tmp1;  -tmp2(2:end,:)];
    tmp = abs(y).*exp(1i*ang);
    tmp = real(ifft(tmp,nfft));
    
    ch(:,j) = mscohere(detrend(signal1(:)),detrend(tmp(:)),wsize,overlap,f,fs);
end

[h, c] = hist(ch',linspace(0,1,50));
h = bsxfun(@rdivide,h,sum(h,1));
tmp = cumsum(h,1);
ind = tmp>(1-alpha);
th = zeros(length(f),1);
for j = 1:size(ind,2)
    th(j) = c(find(ind(:,j),1,'first'));
end

coh = mscohere(detrend(signal1(:)),detrend(signal2(:)),wsize,overlap,f,fs);

end