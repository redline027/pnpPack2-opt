clear; clc;
addpath(genpath('toolbox\rpnp1.0'));
addpath(genpath('toolbox\DLT'));
addpath(genpath('toolbox\UPnP'))
addpath(genpath('toolbox'));
addpath(genpath('epnpfr'));
addpath(genpath('levmar\matlab'))

warning off;
% experimental parameters
nl= 2;
npts= 7:1:15;
num= 100;

% compared methods

A= zeros(size(npts));
B= zeros(num,length(npts));
name= {'HOMO', 'UPnPf', 'GPnPf',   'GPnPf+GN', 'RPnP', 'EPnPR_{opt}', 'EPnPR'};
f= {   @HOMO, @upnp_planar_interface, @GPnP_f, @GPnP_f_GN, @RPnP_interface, @epnpfr_planar, @epnpfr_planar_orig};
marker= { 'x', 'o', '>', 's', '+','<','x'};
color= {'r','g', 'm','k','c','b','r'};
markerfacecolor=  {'r','g','m','n','n','r','g'};
linestyle= {'-','-','-','-','-','-','-'};

inds = [6 7];
% inds = [2 4 5 6];
% inds = [1:7]
f = f(inds);
marker = marker(inds);
color = color(inds);
markerfacecolor = markerfacecolor(inds);
linestyle = linestyle(inds);
name = name(inds);

method_list= struct('name', name, 'f', f, 'mean_r', A, 'mean_t', A, 'mean_foc', A, 'mean_reproj', A, ...
    'med_r', A, 'med_t', A, 'med_foc', A, 'med_reproj', A, 'r', B, 't', B,...
    'foc', B, 'reproj', B, 'marker', marker, 'color', color, ...
    'markerfacecolor', markerfacecolor, 'linestyle', linestyle);

% experiments
for i= 1:length(npts)
    
    npt= npts(i);
    fprintf('npt = %d: ',npt);
    
  
    index_fail = [];
    
    for j= 1:num
        
        % camera's parameters
        width= 640;
        height= 480;
        f= rand(1)*1800+200; %random focal length in [200,2000]
        
        % generate 3d coordinates in camera space        
        XXw= [xrand(2,npt,[-2 2]); zeros(1,npt)];
         
        R= rodrigues(randn(3,1));
        t= [rand-0.5;rand-0.5;rand*8+4];
        Xc= R*XXw+repmat(t,1,npt);
        
        % projection
        xx= [Xc(1,:)./Xc(3,:); Xc(2,:)./Xc(3,:)]*f;
        xxn= xx+randn(2,npt)*nl;
        

        if npt >= 6
            % pose estimation
            for k= 1:length(method_list)
                 time1=tic;
                 if strcmp(method_list(k).name, 'RPnP') %using ground-truth focal length
                     [f1,R1,t1]= method_list(k).f(XXw,xxn,diag([f,f,1]));
                 else
                    try
                        [f1,R1,t1]= method_list(k).f(XXw,xxn);
                    catch
                        fprintf(['   The solver - ',method_list(k).name,' - encounters internal errors! \n']);
                        index_fail = [index_fail, j];
                        continue;
                    end
                 end
                 
                %no solution
                while size(t1,2) < 1
                    [f1,R1,t1]= method_list(k).f(XXw,xxn);                    
                end
                s = toc(time1);      
                %choose the solution with smallest error 
                index_best = 1;
                error = inf;
                for jjj = 1:size(R1,3)
                    tempy = cal_pose_err([R1(:,:,jjj) t1(:,jjj)],[R t]);
                    if sum(tempy) < error
                        y = tempy;
                        error = sum(tempy);
                        index_best = jjj;
                    end
                end

                method_list(k).r(j,i)= y(1);
                method_list(k).t(j,i)= y(2);
                method_list(k).foc(j,i)= abs(f1(index_best)-f)/f*100;
                method_list(k).tm(j, i) = s;
                reproj = R1(:,:,index_best)*XXw+t1(:,index_best)*ones(1,npt);
                reproj = reproj./repmat(reproj(3,:),3,1);
                err = xxn-f1(index_best)*reproj(1:2,:);
                err = sqrt(sum(sum(err.*err))/npt);
                method_list(k).reproj(j,i) = err;
                
%                 if (err > 100)
%                     err;
%                 end
            end
        else
            for k= 1:length(method_list)
                 if strcmp(method_list(k).name, 'DLT') || strcmp(method_list(k).name, 'UPnPf') || strcmp(method_list(k).name, 'UPnPf+GN') 
                     method_list(k).r(j,i)= nan;
                     method_list(k).t(j,i)= nan;
                     method_list(k).foc(j,i) = nan;
                     method_list(k).reproj(j,i) = nan;
                 elseif strcmp(method_list(k).name, 'RPnP') 
                     [f1,R1,t1]= method_list(k).f(XXw,xxn,diag([f,f,1]));
                     
                    %choose the solution with smallest error 
                    index_best = 1;
                    error = inf;
                    for jjj = 1:size(R1,3)
                        tempy = cal_pose_err([R1(:,:,jjj) t1(:,jjj)],[R t]);
                        if sum(tempy) < error
                            y = tempy;
                            error = sum(tempy);
                            index_best = jjj;
                        end
                    end

                    method_list(k).r(j,i)= y(1);
                    method_list(k).t(j,i)= y(2);
                    method_list(k).foc(j,i)= abs(f1(index_best)-f)/f*100;
                    reproj = R1(:,:,index_best)*XXw+t1(:,index_best)*ones(1,npt);
                    reproj = reproj./repmat(reproj(3,:),3,1);
                    err = xxn-f1(index_best)*reproj(1:2,:);
                    err = sqrt(sum(sum(err.*err))/npt);
                    method_list(k).reproj(j,i) = err;
                    
                 else
                    try
                        [f1,R1,t1]= method_list(k).f(XXw,xxn);
                    catch
                        fprintf(['   The solver - ',method_list(k).name,' - encounters internal errors! \n']);
                        index_fail = [index_fail, j];
                        break;
                    end
                    %no solution
                    while size(t1,2) < 1
                        [f1,R1,t1]= method_list(k).f(XXw,xxn);
                    end
                    
                    %choose the solution with smallest error 
                    index_best = 1;
                    error = inf;
                    for jjj = 1:size(R1,3)
                        tempy = cal_pose_err([R1(:,:,jjj) t1(:,jjj)],[R t]);
                        if sum(tempy) < error
                            y = tempy;
                            error = sum(tempy);
                            index_best = jjj;
                        end
                    end

                    method_list(k).r(j,i)= y(1);
                    method_list(k).t(j,i)= y(2);
                    method_list(k).foc(j,i)= abs(f1(index_best)-f)/f*100;
                    reproj = R1(:,:,index_best)*XXw+t1(:,index_best)*ones(1,npt);
                    reproj = reproj./repmat(reproj(3,:),3,1);
                    err = xxn-f1(index_best)*reproj(1:2,:);
                    err = sqrt(sum(sum(err.*err))/npt);
                    method_list(k).reproj(j,i) = err;                    
                 end
            end
        end
    
        showpercent(j,num);
    end
    fprintf('\n');
    
    % save result
    for k= 1:length(method_list)
       
        method_list(k).mean_r(i)= mean(method_list(k).r(:,i));
        method_list(k).mean_t(i)= mean(method_list(k).t(:,i));
        method_list(k).mean_foc(i)= mean(method_list(k).foc(:,i));
        method_list(k).mean_reproj(i)= mean(method_list(k).reproj(:,i));
        
        method_list(k).med_r(i)= median(method_list(k).r(:,i));
        method_list(k).med_t(i)= median(method_list(k).t(:,i));
        method_list(k).med_foc(i)= median(method_list(k).foc(:,i));
        method_list(k).med_reproj(i)= median(method_list(k).reproj(:,i));
        
        method_list(k).avg_t(i)= sum(method_list(k).tm(:,i)) / size(method_list(k).tm, 1);
    end
end


%{

close all;
yrange= [0 5];

i= 0; w= 300; h= 300;

figure('color','w','position',[w*i,100,w,h]);i=i+1;
xdrawgraph(npts,yrange,method_list,'med_r','Rotation',...
    'Number of Points','Rotation Error (degrees)',2);

yrange= [0 10];
figure('color','w','position',[w*i,100,w,h]);i=i+1;
xdrawgraph(npts,yrange,method_list,'med_t','Translation',...
    'Number of Points','Translation Error (%)',2);

figure('color','w','position',[w*i,100,w,h]);i=i+1;
xdrawgraph(npts,yrange,method_list,'med_foc','Focal Length',...
    'Number of Points','Focal Length Error (%)',2);

figure('color','w','position',[w*i,100,w,h]);i=i+1;
xdrawgraph(npts,yrange,method_list,'med_reproj','Reprojection',...
    'Number of Points','Reprojection Error (pixels)',2);
yrange= [0 0.05];
figure('color','w','position',[w*i,100,w,h]);i=i+1;
xdrawgraph(npts,yrange,method_list,'avg_t','Time',...
    'Average Runtime (sec)','Average Runtime (sec)',2);


%draw the boxplot of rotation error
close all;
yrange = [0 10];
i= 0; w= 300; h= 300;
for i = 1:length(inds)
    methodInd = inds(i);
    figure('color','w','position',[w*i,100,w,h]);
    boxplot(method_list(i).reproj,npts);
    ylim(yrange); set(gca,'xtick',npts);
    title(method_list(i).name,'FontSize',12,'FontName','Arial');
    xlabel('Number of Points','FontSize',11);
    ylabel('Reprojection Error (pixels)','FontSize',11);
end

figure('color','w','position',[w*(i+1),100,w,h]);
hold('all');
for i = 1:length(method_list)
    p(i) = plot(npts, method_list(i).mean_reproj,'marker',method_list(i).marker,...
        'color',method_list(i).color,...
        'markerfacecolor',method_list(i).markerfacecolor,...
        'displayname',method_list(i).name, ...
        'LineWidth',2,'MarkerSize',8,'LineStyle',method_list(i).linestyle)
end
title('Mean Reprojection Error','FontSize',12,'FontName','Arial');
xlabel('Number of Points','FontSize',11);
ylabel('Reprojection Error (pixels)','FontSize',11);


%draw the boxplot of rotation error
close all;
yrange = [0 10];
i= 0; w= 300; h= 300;

% figure('color','w','position',[w*i,100,w,h]);i=i+1;
% boxplot(method_list(2).r,npts);
% ylim(yrange); set(gca,'xtick',npts);
% title('UPnPf','FontSize',12,'FontName','Arial');
% xlabel('Number of Points','FontSize',11);
% ylabel('Rotation Error (degrees)','FontSize',11);

% figure('color','w','position',[w*i,100,w,h]);i=i+1;
% boxplot(method_list(3).r,npts);
% ylim(yrange); set(gca,'xtick',npts);
% title('UPnPf+GN','FontSize',12,'FontName','Arial');
% xlabel('Number of Points','FontSize',11);
% ylabel('Rotation Error (degrees)','FontSize',11);
% 
% figure('color','w','position',[w*i,100,w,h]);i=i+1;
% boxplot(method_list(4).r,npts);
% ylim(yrange); set(gca,'xtick',npts);
% title('GPnPf','FontSize',12,'FontName','Arial');
% xlabel('Number of Points','FontSize',11);
% ylabel('Rotation Error (degrees)','FontSize',11);
% 
figure('color','w','position',[w*i,100,w,h]);i=i+1;
boxplot(method_list(1).r,npts);
ylim(yrange); set(gca,'xtick',npts);
title('GPnPf+GN','FontSize',12,'FontName','Arial');
xlabel('Number of Points','FontSize',11);
ylabel('Rotation Error (degrees)','FontSize',11);

figure('color','w','position',[w*i,100,w,h]);i=i+1;
boxplot(method_list(2).r,npts);
ylim(yrange); set(gca,'xtick',npts);
title('EPnPfr','FontSize',12,'FontName','Arial');
xlabel('Number of Points','FontSize',11);
ylabel('Rotation Error (degrees)','FontSize',11);


vars = zeros(length(npts), 2);
for i = 1:length(npts)
    for k = 1:2
        vars(i,k) = var(method_list(k).reproj(:,i));
    end
end

figure('color','w','position',[w,100,w,h]);
hold('all');
markerlist = {'o-', '*-'};
for i = 1:2
    p(i) = plot(npts, vars(:,i), markerlist {i}, 'displayname',method_list(i).name);
end
title('Variance of Errors','FontSize',12,'FontName','Arial');
xlabel('Number of Points','FontSize',11);
ylabel('Variance (pixels)','FontSize',11);
legend(p,1);

rmpath(genpath('rpnp1.0'));
rmpath(genpath('DLT'));
rmpath(genpath('C:\zheng\work0919\PnP+f\UPnP'))

% close all;
% yrange= [0 15];
% 
% i= 0; w= 300; h= 300;
% 
% figure('color','w','position',[w*i,100,w,h]);i=i+1;
% xdrawgraph(npts,yrange,method_list,'mean_r','Mean Rotation Error',...
%     'Number of Points','Rotation Error (degrees)');
% 
% figure('color','w','position',[w*i,100,w,h]);i=i+1;
% xdrawgraph(npts,yrange,method_list,'med_r','Median Rotation Error',...
%     'Number of Points','Rotation Error (degrees)');
% 
% figure('color','w','position',[w*i,100,w,h]);i=i+1;
% xdrawgraph(npts,yrange,method_list,'mean_t','Mean Translation Error',...
%     'Number of Points','Translation Error (%)');
% 
% figure('color','w','position',[w*i,100,w,h]);i=i+1;
% xdrawgraph(npts,yrange,method_list,'med_t','Median Translation Error',...
%     'Number of Points','Translation Error (%)');
% 
% i= 0; w= 300; h= 300;
% 
% figure('color','w','position',[w*i,400,w,h]);i=i+1;
% xdrawgraph(npts,yrange,method_list,'mean_foc','Mean Focal Length Error',...
%     'Number of Points','Focal Length Error (%)');
% 
% figure('color','w','position',[w*i,400,w,h]);i=i+1;
% xdrawgraph(npts,yrange,method_list,'med_foc','Median Focal Length Error',...
%     'Number of Points','Focal Length Error (%)');
% 
figure('color','w','position',[w*i,400,w,h]);i=i+1;
xdrawgraph(npts,yrange,method_list,'mean_reproj','Mean Reproj Error',...
    'Number of Points','Reproj Error (pixels)');
% 
% figure('color','w','position',[w*i,400,w,h]);i=i+1;
% xdrawgraph(npts,yrange,method_list,'med_reproj','Median Reproj Error',...
%     'Number of Points','Reproj Error (pixels)');
% 
%}


close all;
yrange= [0 5];

i= 0; w= 300; h= 300;

figure('color','w','position',[w*i,100,w,h]);i=i+1;
xdrawgraph(npts,yrange,method_list,'med_r','Rotation',...
    'Number of Points','Rotation Error (degrees)',2);

yrange= [0 10];
figure('color','w','position',[w*i,100,w,h]);i=i+1;
xdrawgraph(npts,yrange,method_list,'med_t','Translation',...
    'Number of Points','Translation Error (%)',2);

figure('color','w','position',[w*i,100,w,h]);i=i+1;
xdrawgraph(npts,yrange,method_list,'med_foc','Focal Length',...
    'Number of Points','Focal Length Error (%)',2);

figure('color','w','position',[w*i,100,w,h]);i=i+1;
xdrawgraph(npts,yrange,method_list,'med_reproj','Reprojection',...
    'Number of Points','Reprojection Error (pixels)',2);
yrange= [0 0.05];
figure('color','w','position',[w*i,100,w,h]);i=i+1;
xdrawgraph(npts,yrange,method_list,'avg_t','Time',...
    'Average Runtime (sec)','Average Runtime (sec)',2);

%draw the boxplot of rotation error
close all;
yrange = [0 10];
i= 0; w= 300; h= 300;
for i = 1:length(inds)
    methodInd = inds(i);
    figure('color','w','position',[w*i,100,w,h]);
    boxplot(method_list(i).reproj,npts);
    ylim(yrange); set(gca,'xtick',npts);
    title(method_list(i).name,'FontSize',12,'FontName','Arial');
    xlabel('Number of Points','FontSize',11);
    ylabel('Reprojection Error (pixels)','FontSize',11);
end

figure('color','w','position',[w*(i+1),100,w,h]);
hold('all');
for i = 1:length(method_list)
    plot(npts(1):npts(length(npts)), method_list(i).mean_reproj(1:end),'marker',method_list(i).marker,...
        'color',method_list(i).color,...
        'markerfacecolor',method_list(i).markerfacecolor,...
        'displayname',method_list(i).name, ...
        'LineWidth',2,'MarkerSize',8,'LineStyle',method_list(i).linestyle)
end
title('Mean Reprojection Error','FontSize',12,'FontName','Arial');
xlabel('Number of Points','FontSize',11);
ylabel('Reprojection Error (degrees)','FontSize',11);

vars = zeros(length(npts), 2);
for i = 1:length(npts)
    for k = 1:2
        vars(i,k) = var(method_list(k).reproj(:,i));
    end
end

figure('color','w','position',[w,100,w,h]);
hold('all');
markerlist = {'o-', '*-'};
for i = 1:2
    p(i) = plot(npts, vars(:,i), markerlist {i}, 'displayname',method_list(i).name);
end
title('Variance of Errors','FontSize',12,'FontName','Arial');
xlabel('Gaussian Image Noise (pixels)','FontSize',11);
ylabel('Variance (pixels)','FontSize',11);
legend(p,1);


rmpath(genpath('rpnp1.0'));
rmpath(genpath('DLT'));
rmpath(genpath('C:\zheng\work0919\PnP+f\UPnP'))


