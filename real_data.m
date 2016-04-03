fid = fopen('projs.txt', 'r');
input = fscanf(fid,'%f');
fclose(fid);
projs = zeros(2, 8);
pts = [60 60 0 60 30 60 60 0; 0 0 0 30 30 60 60 60; 0 60 60 30 60 0 60 0];

fid = figure;
hold on
plot3(pts(1,:), pts(2,:),pts(3,:));
plot3(0,0,0,'g*');
orientation = [1     0     0;
               0     0    -1;
               0     1     0];
location = [700 700 700];
cam = plotCamera('Location',location,'Orientation',orientation,'Size',50);
%set(gca,'CameraUpVector',[0 0 -1]);
%camorbit(gca,-110,60,'data',[0 0 1]);
grid on
axis equal
axis manual

xlim([0, 1200]);
ylim([0, 1200]);
zlim([0, 1200]);

az = 155;
el = 30;
view(az, el);


ind = 1;
%while(1)
while(1)
    for i = 1:8
        projs(1,i) = input(ind);
        projs(2,i) = input(ind + 1);
        ind = ind + 2;
    end
    if (input(ind) ~= 27)
        print('Error');
    end
    ind = ind + 1;
    
    [f_est, R_est, t_est] = epnpfr_orig_real(pts, projs);
    
    pause(0.03);
    
    cam.Orientation = R_est';
    cam.Location = -t_est' * cam.Orientation;
    drawnow();
   
end
