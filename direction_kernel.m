clear all;
srcFiles = dir('C:\Users\SAURADIP\Desktop\Journal\IEEE2018\Dataset\line\*.jpg');
for g=1:numel(srcFiles)
filename = strcat('C:\Users\SAURADIP\Desktop\Journal\IEEE2018\Dataset\line\',srcFiles(g).name);
img=imread(filename);
gray=rgb2gray(img);
F=double(gray);
bin=F./max(max(F));
dirker=zeros(size(bin,1) , size(bin,2));
kernel_x = [-1 0 1;-2 0 2;-1 0 1];
kernel_y = transpose(kernel_x);
thresh = [ 0.5 0.6 0.7 0.8 0.9 1.1];
limit=0;
for th=1:6
limit = thresh(th);
count=0;
count1=0;
for i = 2 : size(bin,1)-1
    
    for j= 2: size(bin,2)-1
        
        patch = bin(i-1:i+1,j-1:j+1);
        edge_x = patch.*kernel_x;
        edge_y = patch.*kernel_y;
        
        covar = cov(edge_x,edge_y);
        a= covar(1,1);
        b=covar(1,2);
       
        c=covar(2,2);
        k=0;l=0;
        for x=i-1:i+1
            k=x-i;
            for y= j-1:j+1
                l=y-j;
                if((a*k*k) + (2*b*k*l) + (c*l*l)>0 && (a*k*k) + (2*b*k*l) + (c*l*l) < limit)
                dirker(x,y) = 1;
                else
                    dirker(x,y)=0;
                end
            end
        end
    end
end
val=(10*g)+(10*limit);
save = fullfile('C:\Users\SAURADIP\Desktop\Journal\IEEE2018\Dataset\result', sprintf('line_removed_%05d.JPG',val));
imwrite(dirker, save);

end
disp("Round  "+sprintf('%0.1d',g)+"  Completed");
end