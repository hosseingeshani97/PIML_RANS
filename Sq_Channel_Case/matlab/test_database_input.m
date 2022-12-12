clear all; close all;
linewidth=2;
fontsize=20;
set(0,'DefaultAxesFontName','Helvetica','DefaultAxesFontSize',fontsize);
%-------------------------------------------------------------------%
%
% sample script for testing data retrieved from dns repository of 
% fully developed flow in a duct with rectangular cross-section.
%
% m. uhlmann january 2013 (uhlmann@kit.edu)
%-------------------------------------------------------------------%
%dir='../tmp/';
dir='/media/hossein/F/Thesis/Validation_Case/Data/';
%
%file = 'statistics_01100_repo.bin';
%file = 'statistics_01150_repo.bin';
%file = 'statistics_01250_repo.bin';
%file = 'statistics_01300_repo.bin';
%file = 'statistics_01350_repo.bin';
%file = 'statistics_01400_repo.bin';
%file = 'statistics_01500_repo.bin';
%file = 'statistics_01600_repo.bin';
%file = 'statistics_01800_repo.bin';
%file = 'statistics_02000_repo.bin';
%file = 'statistics_02200_repo.bin';
%file = 'statistics192_02200_repo.bin';
%file = 'statistics_02400_repo.bin';
%file = 'statistics_02600_repo.bin';
%file = 'statistics_02900_repo.bin';
%file = 'statistics_03200_repo.bin';
file = 'statistics_03500_repo.bin';
%
name=[dir file]
%
[my,mz,ubulk,utau,fnu,tstat,...
 y,z,...
 um,vm,wm,uu,uv,uw,vv,vw,ww]=read_data_from_repository(...
     name);
%----------------------------------------------------------------
% the variables contain:
%
% my - (scalar) # of grid points in y-direction
% mz - (scalar) # of grid points in z-direction
% ubulk - (scalar) bulk velocity
% utau  - (scalar) friction velocity (average over perimeter)
% fnu   - (scalar)viscosity
% tstat - (scalar) sampling time
% y(1:my) - vector of grid points in y-direction
% z(1:mz) - vector of grid points in z-direction
% um(1:my,1:mz) - mean primary velocity (in axial direction 'x')
% vm(1:my,1:mz) - mean secondary velocity (in cross direction 'y')
% wm(1:my,1:mz) - mean secondary velocity (in cross direction 'z')
% uu(1:my,1:mz) - diagonal Reynolds stress component in x-direction
% vv(1:my,1:mz) - diagonal Reynolds stress component in y-direction
% ww(1:my,1:mz) - diagonal Reynolds stress component in z-direction
% uv(1:my,1:mz) - main Reynolds shear stress component (x-y)
% uw(1:my,1:mz) - secondary Reynolds shear stress component (x-z)
% vw(1:my,1:mz) - secondary Reynolds shear stress component (y-z)
%----------------------------------------------------------------
%
Ly=(max(y)-min(y))/2;
Lz=(max(z)-min(z))/2;
aspect=Lz/Ly;
lref=Ly;
%
disp(sprintf('Tstat*ubulk/lref=%g',tstat*ubulk/lref))
disp(sprintf('Re_bulk=%g',ubulk*lref/fnu))
disp(sprintf('Re_tau=%g',utau*lref/fnu))
disp(sprintf('1:Re_bulk 2:friction factor %g %g',ubulk*lref/fnu,8*(utau/ubulk)^2))
%--------------------------------------------------------------------%
% generate some plots (for checking)
%--------------------------------------------------------------------%
f1=figure;a1=axes;hold on;
nskip=2;
h=quiver(z(1:nskip:mz),y(1:nskip:my),wm(1:nskip:my,1:nskip:mz),...
         vm(1:nskip:my,1:nskip:mz),2);
set(h,'Color','k');
%
contour(z,y,um/max(max(abs(um))) ,[0.5 0.8],'k');
set(a1,'DataAspectRatio',[1 1 1],'Box','on');
set(a1,'XLim',[-aspect aspect],'YLim',[-1 1]);
set(a1,'TickDir','out','XTick',[-1 -0.5 0 0.5 1],'YTick',[-1 -0.5 0 ...
                    0.5 1]);
set(a1,'XTickLabel',{'-1' '' '0' '' '1'},'YTickLabel',{'-1' '' '0' ...
                    '' '1'});
%
title(sprintf('Re_b_u_l_k=%g Re_t_a_u=%g',...
              ubulk*lref/fnu,utau*lref/fnu),...
      'FontSize',fontsize);
xlabel('z');
ylabel('y');
%--------------------------------------------------------------------%
  




