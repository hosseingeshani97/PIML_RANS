clear all; close all;
linewidth=2;
fontsize=20;symbolSize=8;
set(0,'DefaultAxesFontName','Helvetica','DefaultAxesFontSize',fontsize);
%---------------------------------------------------------
% reads friction factor vs. bulk reynolds number (from two-column text
% file) and plots a graph
%
% note: cf=8*utau^2/ubulk^2
%
% where 'utau' is the friction velocity averaged over the perimeter
% 'ubulk' is the mean velocity, averaged over the cross-section
% 'rebulk' is the bulk reynolds number: rebulk=ubulk*h/nu
% whre 'h' is the duct *half-width* and 'nu' the kinematic viscosity
%
% m.uhlmann 27-10-2017 (uhlmann@kit.edu)
%---------------------------------------------------------
% format: 1:re_bulk 2:cf
dat=load('cf.dat');
%--------------------------------------------------------------------%
f1=figure;a1=axes;hold on;
%
plot(dat(:,1),dat(:,2),'ko','LineWidth',linewidth,'MarkerSize',symbolSize);
%
%
% b) laminar value:
%the wall-gradient du/dy, integrated over all four planes and normalized
% by the wetted surface, divided by the bulk velocity per half-width:
% [tatsumi & yoshimura 1990, table 1]
dudy_lam=3.3935;
% therefore, cf=8*utau^2/ubulk^2=8*dudy_lam/Re_bulk
xxl=(0:10:1500);
plot(xxl,8*(dudy_lam)./xxl,...
     'b--','LineWidth',linewidth);
%
% c) 'fully turbulent' empirical data:
%jones relation: solved by maple: cf=1.325474528/lambertw(1.031260091*reb)^2
xxt=(1500:25:4000);
plot(xxt,1.325474528./lambertw(1.031260091*xxt).^2,...
     'r--','LineWidth',linewidth);
%
xlabel('Re_b_u_l_k');
ylabel('c_f');
legend('DNS',...
       'laminar',...
       'turbulent (Jones 1976)');
%
set(a1,'XLim',[500 4000]);
set(a1,'YLim',[.03 .045]);
set(a1,'Box','on','TickDir','out','XScale','lin','YScale','lin');
%--------------------------------------------------------------------%
% print -depsc cf_vs_rebulk.eps