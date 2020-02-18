function [ g ] = localhisteq(f, m, n )
    
%“g = localhisteq(f, m, n)” performs local histogram equalization on input image f using a window size 𝑚 × 𝑛 to produce the processed image g. If m and n are omitted, they default to 3. If n is omitted, it defaults to m. Both must be odd. %

if d == 1                              % there are no m and n defined
    m = 3; n = 3;
elseif d == 2                          % If n is not defined but f and m are given,
    if mod(m,2)~= 1 || mod(n,2)~=1          % check whether m and n both odd
        n=m;
    end
end

[rows, columns, numberOfColorChannels] = size(f);

f = padarray(f, [m,n], 'symmetric');        %To handle border effects, image f is extended by using the ‘symmetric’ option. The amount of extension is determined by the dimensions of the local window.%

x=0;
for i = (m+1)/2 + 1 : rows + (m+1)/2
  x = x + 1;
  y= 0;
  for j = (n+1)/2 + 1 : columns + (n+1)/2
    y = y +1;
    g = f(i:i+m-1, j: j+n-1);
    new_g = histeq(g);
    g(x,y)=new_g((m+1)/2, (n+1)/2);
  end
end
