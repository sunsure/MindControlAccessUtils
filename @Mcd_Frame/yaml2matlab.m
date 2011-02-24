function mcdf=yaml2matlab(file)
% This function reads in a yaml file produced by the MindControl Software
% and exports an array of MindControl Data Frames (mcdf's) that is easy to
% manipulate in matlab.
%
% Andrew Leifer
% leifer@fas.harvard.edu
% 2 November 2010


fid = fopen(file); 
if (fid==-1)
    error('ERROR YAML of that filename was not found.');
end

Mcd_Frame.seekToFirstFrame(fid);
k=1;
while(~feof(fid))
    mcdf(k)=Mcd_Frame.readOneFrame(fid); %#ok<AGROW>
    k=k+1;
    if ~mod(k,100)
        disp(k);
    end
end
fclose(fid);

