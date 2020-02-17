function [ g ] = localhisteq(f, m, n )
    
% G = LOCALHISTEQ(F, M, N) performs local histogram equalization
% on input image F using a window of (odd) size M-by-N to produce
% the processed image, G. To handle border effects, image F is
% extended by using the symmetric option in function padarray.
% The amount of extension is determined by the dimensions of the
% local window. If M and N are omitted, they default to
% 3. If N is omitted, it defaults to M. Both must be odd.
if nargin == 1 % f is the only input argument
    m = 3; n = 3;
elseif nargin == 2 % f & m are the input arguments
    if mod(m,2)~= 1 || mod(n,2)~=1 % check whether m and n both odd
        n=m;
    end
end
f = padarray(f, [m,n], 'symmetric');
g=
