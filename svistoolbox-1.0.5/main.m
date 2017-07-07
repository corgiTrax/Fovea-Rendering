<<<<<<< HEAD
function main(maparcs, file_name)
=======
function svistest
>>>>>>> ac558b5382ec91179aee6ad2338a946a1ac7afde
% SVISTEST   Test space variant imaging system functions

% Copyright (C) 2004-2006
% Center for Perceptual Systems
%
% jsp Thu Apr  8 15:59:22 CDT 2004

<<<<<<< HEAD
temp=strsplit(char(file_name),'_');
saveFolderName=strcat(temp(1),'_',temp(2),'_FV_', maparcs)
maparcs = str2double(maparcs);

command = char(strcat('tar xjf',{' '},file_name,'.tar.bz2'));
system(command);
folder=strcat(file_name,'/');
ascFile=strcat(file_name,'.asc');

saveFolder=char(strcat(saveFolderName,'/'));
=======
%seaquest
%data='38_RZ_4886422_May-15-17-15-33'
%26393
%data='39_RZ_4981421_May-16-19-40-17'
%21155
data='36_RZ_4882422_May-15-16-08-32'
%data='37_RZ_4883794_May-15-16-37-01'

%pacman
%data='40_RZ_4983433_May-16-20-19-52'
%data='45_RZ_5134712_May-18-14-14-00'

%breakout
%data='42_RZ_4988291_May-16-21-33-46'
%: 15692 
%data='44_RZ_5131746_May-18-13-25-32'
%: 12377

%enduro
%data='41_RZ_4985749_May-16-20-51-18'

maparc = 89

maparc=maparcs(mi)
saveFolderName=strcat('36_FV_', num2str(maparc))

folder=strcat('/home/zharuvrl/Projects/Arcade-Learning-Environment/mypylink/screen_record/',data,'/'); % change these paths!
ascFile=strcat('/home/zharuvrl/Projects/Arcade-Learning-Environment/mypylink/screen_record/',data,'.asc');

saveFolder=strcat(saveFolderName,'/');
>>>>>>> ac558b5382ec91179aee6ad2338a946a1ac7afde
mkdir(saveFolder);
fid=fopen(ascFile,'r');

filenames=dir(strcat(folder,'*.png'));
filenames={filenames.name};
filenames=natsortfiles(filenames); %sort files according to frameid numerically
num_files = size(filenames,2);
num_files
svisinit;
<<<<<<< HEAD
=======
%svisrelease;
>>>>>>> ac558b5382ec91179aee6ad2338a946a1ac7afde

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
<<<<<<< HEAD
        if size(strfind(line,char(target)),2) ~= 0
=======
        if size(strfind(line,target),2) ~= 0
>>>>>>> ac558b5382ec91179aee6ad2338a946a1ac7afde
            foundFrameID=true;
        end
        % get xpos,ypos if this is a gaze dataline
        if size(strfind(line,'...'),2) ~= 0
            gaze_pos=strsplit(line);
<<<<<<< HEAD
            xpos=str2double(gaze_pos(2))/8; % xscale: x is column
            ypos=str2double(gaze_pos(3))/4; % yscale: y is row
=======
            xpos=str2double(gaze_pos(2))/8; %xscale: x is column
            ypos=str2double(gaze_pos(3))/4; %yscale: y is row
>>>>>>> ac558b5382ec91179aee6ad2338a946a1ac7afde
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

<<<<<<< HEAD
    r=svisresmap(ROWS*2,COLS*2,'maparc',maparcs);
=======
    r=svisresmap(ROWS*2,COLS*2,'maparc',maparc);
>>>>>>> ac558b5382ec91179aee6ad2338a946a1ac7afde
    %r2=svisresmap(ROWS*2,COLS*2,'halfres',10.0,'maparc',80.0);
    %r2=uint8(255-r2);
    svissetresmap(c,r);
  
    dest=svisencode(c,ypos,xpos);
    imwrite(dest, strcat(saveFolder,char(filenames(f))));
<<<<<<< HEAD

=======
    %h1=show(dest);
    %h4=show(img);

    %svissetsrc(c,fliplr(img));
    %dest=svisencode(c,ROWS,COLS);
    %h2=show(dest);
    % alloc another codec
    %c2=sviscodec(img);
    %r2=uint8(rand(size(r))*255);
    %svissetresmap(c2,r2);
    %dest=svisencode(c2,ROWS/2,COLS/2);
    %h3=show(dest);
  
>>>>>>> ac558b5382ec91179aee6ad2338a946a1ac7afde
end

svisrelease; 
fclose(fid);

<<<<<<< HEAD
tar(char(strcat(saveFolderName,'.tar.gz')), saveFolder)


=======
tar(strcat(saveFolderName,'.tar.gz'), saveFolder)

%close(h1);
%close(h2);
%close(h3);
%close(h4);

%disp 'Success';

function fail_function(s)
% Make a function call that should fail

caught=false;
try
    eval(s)
catch
    %fprintf([lasterr '\n']);
    caught=true;
end

if not(caught)
    error(['function call ''' s ''' did not fail, but should have'])
end

function h=show(i)

h=figure;
imagesc(i);
colormap(gray);
drawnow
>>>>>>> ac558b5382ec91179aee6ad2338a946a1ac7afde
