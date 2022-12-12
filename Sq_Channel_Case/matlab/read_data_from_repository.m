function [my,mz,ubulk,utau,fnu,tstat,...
          y,z,...
          um,vm,wm,uu,uv,uw,vv,vw,ww]=read_data_from_repository(...
              name)
%-------------------------------------------------------------------%
% script for reading binary data files retrieved from dns repository of 
% fully developed flow in a duct with rectangular cross-section.
%
% m. uhlmann january 2013 (uhlmann@kit.edu)
%-------------------------------------------------------------------%
precision_int='int32';
precision_float='float64';
endian='ieee-le.l64'; %IEEE floating point with little-endian
                      %byte ordering and 64 bit long data type
%

disp(sprintf('reading from %s ...',name))
%
file1 = fopen(name,'r',endian);
%
% read two integers: my & mz
my=fread(file1,1,precision_int);
mz=fread(file1,1,precision_int);
%
% read 4 floats: ubulk, utau, fnu & tstat:
ubulk=fread(file1,1,precision_float);
utau=fread(file1,1,precision_float);
fnu=fread(file1,1,precision_float);
tstat=fread(file1,1,precision_float);
%
% read a vector of length 'my': 'y'
y=fread(file1,my,precision_float);
%
% read a vector of length 'mz': 'z'
z=fread(file1,mz,precision_float);
%
% read a 2d field of size 'my*mz': um
um=reshape(fread(file1,my*mz,precision_float),my,mz);
%...and so on for
vm=reshape(fread(file1,my*mz,precision_float),my,mz);
wm=reshape(fread(file1,my*mz,precision_float),my,mz);
uu=reshape(fread(file1,my*mz,precision_float),my,mz);
uv=reshape(fread(file1,my*mz,precision_float),my,mz);
uw=reshape(fread(file1,my*mz,precision_float),my,mz);
vv=reshape(fread(file1,my*mz,precision_float),my,mz);
vw=reshape(fread(file1,my*mz,precision_float),my,mz);
ww=reshape(fread(file1,my*mz,precision_float),my,mz);
%%
fclose(file1);
