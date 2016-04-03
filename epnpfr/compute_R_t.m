function [R, t]=compute_R_t(X1,Alph,Xw)

n=size(Xw,2); 

Cc_=X1;

Xc_=Cc_*Alph;

centr_w=mean(Xw,2);
centr_c=mean(Xc_,2);

dist_c = zeros(n,1);
dist_w = zeros(n,1);
M = zeros(3);
 
for i=1:n
    w_m = Xw(:,i)-centr_w;
    c_m = Xc_(:,i)-centr_c;
    
    dist_w(i) = sqrt(w_m(1)^2 + w_m(2)^2 + w_m(3)^2);
    dist_c(i) = sqrt(c_m(1)^2 + c_m(2)^2 + c_m(3)^2);
    
    M = M + c_m*w_m';
end

sc=(dist_c'*dist_c)/(dist_c'*dist_w);

neg_z=find(Xc_(3,:)/sc<0);
if size(neg_z,2)>=1
    sc=-sc;
end

M = M /sc;

[U S V]=svd(M);
R=U*V';

if det(R)<0
  R=-R;
end

t=centr_c/sc -R*centr_w;





        
        
