function plotLeaves(handles,k)
% Plots the positions of the leaves for a given field
% Usage: plotLeaves(handles, k)
%
% handles : GUI handle containing the data of mlc file
%           in the structure handles.myStructure
%
%       k : field ID to plot

axes(handles.axesLeaves);
cla;
bh = barh(-(1:10),20*ones(1,10));
bh.FaceColor = 'blue';
hold on;
bh.EdgeAlpha = 0;
bh.BarWidth = 0.8;
bh2 = barh(-(11:50),20*ones(1,40));
bh2.FaceColor = 'blue';
bh2.EdgeAlpha = 0;
bh2.BarWidth = 0.4;
bh3 = barh(-(51:60),20*ones(1,10));
bh3.FaceColor = 'blue';
bh3.EdgeAlpha = 0;
bh3.BarWidth = 0.8;
set(gca,'yticklabel',{[]})

bh4 = barh(-(1:10),handles.structureData.data(k).leaf.b(1:10));
bh4.FaceColor = 'white';
bh4.EdgeAlpha = 0;
bh4.BarWidth = 0.8;
bh5 = barh(-(11:50),handles.structureData.data(k).leaf.b(11:50));
bh5.FaceColor = 'white';
bh5.EdgeAlpha = 0;
bh5.BarWidth = 0.4;
bh6 = barh(-(51:60),handles.structureData.data(k).leaf.b(51:60));
bh6.FaceColor = 'white';
bh6.EdgeAlpha = 0;
bh6.BarWidth = 0.8;

bh7 = barh(-(1:10),-handles.structureData.data(k).leaf.a(1:10));
bh7.FaceColor = 'blue';

bh7.EdgeAlpha = 0;
bh7.BarWidth = 0.8;
bh8 = barh(-(11:50),-handles.structureData.data(k).leaf.a(11:50));
bh8.FaceColor = 'blue';
bh8.EdgeAlpha = 0;
bh8.BarWidth = 0.4;
bh9 = barh(-(51:60),-handles.structureData.data(k).leaf.a(51:60));
bh9.FaceColor = 'blue';
bh9.EdgeAlpha = 0;
bh9.BarWidth = 0.8;

bh9.BaseValue=-20;

bh.EdgeAlpha = 0;
bh2.EdgeAlpha = 0;
bh3.EdgeAlpha = 0;
bh4.EdgeAlpha = 0;
bh5.EdgeAlpha = 0;
bh6.EdgeAlpha = 0;
bh7.EdgeAlpha = 0;
bh8.EdgeAlpha = 0;
bh9.EdgeAlpha = 0;

bh.EdgeColor = 'white';
bh2.EdgeColor = 'white';
bh3.EdgeColor = 'white';
bh4.EdgeColor = 'white';
bh5.EdgeColor = 'white';
bh6.EdgeColor = 'white';
bh7.EdgeColor = 'white';
bh8.EdgeColor = 'white';
bh9.EdgeColor = 'white';
