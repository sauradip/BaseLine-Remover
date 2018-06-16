clear all;
img=imread('C:\Users\SAURADIP\Desktop\Journal\IEEE2018\Dataset\line\2.jpg');
gray=rgb2gray(img);
F=double(gray);
for i=2:size(img,1)-2
    for j=2:size(img,2)-2
      %sum=0;
      x=0;
      y=0;
      t_scale=0;
      temp=zeros(3,3);
        for k=i-1:i+1
            x=x+1;
            y=0;
            for l=j-1:j+1
            y=y+1;
                temp(x,y)=(gray(i,j) - gray(k,l));

            end
        end
        s_local= sum(sum(temp))/9; 
        s_max=max(max(temp));
        
        if ( s_max > s_local )
            t_scale=1;
        end
        s = (s_local * t_scale)/s_max;
        h_HF = [ -s -s -s ; -s -s/8 -s; -s -s -s];
        %eig=cov(temp);
        F(i-1:i+1,j-1:j+1)= double(round(conv2(h_HF,gray(i-1:i+1,j-1:j+1), 'same')));
        
    end
end


F_hf=abs(F);
imshow(F_hf)
 x=0;
 y=0;
for ii=2:size(F,1)-2
    for jj=2:size(F,2)-2
       temp1=zeros(3,3);
        for k=ii-1:ii+1
            x=x+1;
            y=0;
            for l=jj-1:jj+1
            y=y+1;
                temp1(x,y)=(F(k,l));

            end
        end 
        max_val=max(max(temp1));
        min_val=min(min(temp1));
        if round(F(:,:)) > round(max_val )
            F(ii,jj)=max_val;
        elseif round(F(:,:)) > round(min_val)
            F(ii,jj)=min_val;
        end
    end
end

imshow(abs(F))