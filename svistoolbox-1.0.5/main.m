function main(maparcs, file_name)
% SVISTEST   Test space variant imaging system functions

% Copyright (C) 2004-2006
% Center for Perceptual Systems
%
% jsp Thu Apr  8 15:59:22 CDT 2004

temp=strsplit(char(file_name),'_');
saveFolderName=strcat(temp(1),'_',temp(2),'_FV_', maparcs)
maparcs = str2double(maparcs);

command = char(strcat('tar xjf',{' '},file_name,'.tar.bz2'));
system(command);
folder=strcat(file_name,'/');
ascFile=strcat(file_name,'.asc');

saveFolder=char(strcat(saveFolderName,'/'));
mkdir(saveFolder);
fid=fopen(ascFile,'r');

filenames=dir(strcat(folder,'*.png'));
filenames={filenames.name};
filenames=natsortfiles(filenames); %sort files according to frameid numerically
num_files = size(filenames,2);
num_files
svisinit;

for f=1:num_files
    if mod(f, 500)==0
        svisrelease;
        svisinit;
        fprintf('%i images has been processed\n',f)
    end
    temp=strsplit(char(filenames(f)),'_');
    utid=strcat(temp(1),'_',temp(2));
    temp2=strsplit(char(temp(3)),'.');
    frameid=temp2(1);
    
    foundKeyPress=false;
    foundFrameID=false;
    target=strcat('FRAMEID',{' '},frameid, {' '});
    % read line by line to get gaze position
    while ~foundKeyPress || ~foundFrameID
        line=fgets(fid);
        if size(strfind(line,char(target)),2) ~= 0
            foundFrameID=true;
        end
        % get xpos,ypos if this is a gaze dataline
        if size(strfind(line,'...'),2) ~= 0
            gaze_pos=strsplit(line);
            xpos=str2double(gaze_pos(2))/8; % xscale: x is column
            ypos=str2double(gaze_pos(3))/4; % yscale: y is row
        end
        if size(strfind(line,'key_pressed'),2) ~= 0 % find last gaze pos
            foundKeyPress=true;
        end
    end
    
    img=imread(strcat(folder,char(filenames(f))));
    img=rgb2gray(img);
    ROWS=size(img,1);
    COLS=size(img,2);   

    c=sviscodec(img);

    r=svisresmap(ROWS*2,COLS*2,'maparc',maparcs);
    %r2=svisresmap(ROWS*2,COLS*2,'halfres',10.0,'maparc',80.0);
    %r2=uint8(255-r2);
    svissetresmap(c,r);
  
    dest=svisencode(c,ypos,xpos);
    imwrite(dest, strcat(saveFolder,char(filenames(f))));

end

svisrelease; 
fclose(fid);

tar(char(strcat(saveFolderName,'.tar.gz')), saveFolder)


