fid = fopen('D:/pnpfmy_tests.dat', 'rb');

npts = fread(fid , 1, 'int');
num = fread(fid , 1, 'int');
q = 0;

for i = 1:npts
    npt = fread(fid , 1, 'int');
    for j = 1:num
        R = fread(fid , [3 3], 'double');
        t = fread(fid , [3 1], 'double');
        f = fread(fid , 1, 'double');
        pts = fread(fid , [3 npt], 'double');
        projs = fread(fid , [2 npt], 'double');
        R1 = fread(fid , [3 3], 'double');
        t1 = fread(fid , [3 1], 'double');
        f1 = fread(fid , 1, 'double');
        R_err = fread(fid , 1, 'double');
        t_err = fread(fid , 1, 'double');
        f_err = fread(fid , 1, 'double');
        try
            [f_est, R_est, t_est] = epnpfr(pts, projs);
        catch
            fprintf(['The solver - encounters internal errors! \n']);
            q = q+1;
            break;
        end
        disp((i-1)*num+(j-1));
        disp(f_est);
        disp(R_est);
        disp(t_est);
    end
end

disp(q);


fclose(fid);