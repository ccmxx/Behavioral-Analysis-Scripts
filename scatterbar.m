function scatterbar(plottype,designtype,rawdata,betweengroupvariables,withinsubjectsvaraiblelevels,xticklabelnames,ylabelname,lengendname,xname,allvariablenames)
%% This script creates scatterbar figures widely used in contemporary journals
% author: Changming Chen, Xinyang Normal University, 
% contact: email: chenchangmingswu@163.com, ccmxx@xynu.edu.cn, wechat: 15565551954
% version: v1, revised: 2019/05/10

%% example 1: scatter bar for a two-factor between-subject design, attention: xticklabelnames should be the levels for the second variable,  lengend name should be the levels for the first variable
% rawdata=[1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2;1 1 1 1 2 2 2 2 1 1 1 1 2 2 2 2; 87 88 87 89 93 93 95 96 82 82 83 81 101 120 114 115]';
% plottype=2; designtype=1;betweengroupvariables=[1 2];withinsubjectsvaraiblelevels=[0];xticklabelnames={'training1','training2'};ylabelname='IQ'; lengendname={'group1','group2'}; xname='training'; allvariablenames={'training','group'};
% scatterbar(plottype,designtype,rawdata,betweengroupvariables,withinsubjectsvaraiblelevels,xticklabelnames,ylabelname,lengendname,xname,allvariablenames);

%% example 2: scatter bar for a mixed-design (one between-subject variable and one within-subject variable) attention: xticklabelnames should be the levels for the second variable,  lengend name should be the levels for the first variable
% rawdata=[1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2;97 98 97 99 103 102 103 104 72 72 73 74 101 102 103 104; 87 88 87 89 93 93 95 96 82 82 83 81 101 120 114 115]';
% plottype=2; designtype=2;betweengroupvariables=[1];withinsubjectsvaraiblelevels=[2];xticklabelnames={'training1','training2'};ylabelname='IQ'; lengendname={'group1','group2'}; xname='training'; allvariablenames={'training','group'};
% scatterbar(plottype,designtype,rawdata,betweengroupvariables,withinsubjectsvaraiblelevels,xticklabelnames,ylabelname,lengendname,xname,allvariablenames);

%% example 3: scatter bar for a within-subject design (two within-subject variables), attention: xticklabelnames should be the levels for the second variable,  lengend name should be the levels for the first variable
% rawdata=[99	13	33	35	66	95	72	76	60	89	30	50	16	44	16	42	45	6	25	92	76	16	28	25	25	61	95	72	73	95	58;
% 64	78	63	73	77	58	65	10	35	25	58	85	7	20	59	40	27	94	92	76	3	78	22	65	46	61	10	80	55	59	90;
% 69	46	56	77	94	38	20	6	95	88	22	68	64	61	20	79	35	94	3	66	62	5	54	37	85	8	47	24	43	60	71;
% 95	85	67	1	17	57	79	77	77	30	74	73	28	79	78	95	24	73	80	3	92	38	92	47	46	65	13	28	57	3	47;
% 73	28	16	22	10	31	20	21	57	66	73	79	11	34	42	64	38	26	87	8	15	40	34	3	76	13	35	97	76	69	27;
% 27	23	59	79	28	25	45	7	44	58	99	52	3	36	77	79	92	81	29	61	77	27	15	82	5	63	13	33	10	14	19]';
% plottype=2; designtype=3;betweengroupvariables=[0];withinsubjectsvaraiblelevels=[2 3];xticklabelnames={'training1','training2','training3'};ylabelname='IQ'; lengendname={'group1','group2'}; xname='training'; allvariablenames={'training','group'};
% scatterbar(plottype,designtype,rawdata,betweengroupvariables,withinsubjectsvaraiblelevels,xticklabelnames,ylabelname,lengendname,xname,allvariablenames);

%% notes
% attention: maximum 2 independent factors
% plottype: 1 if bar; 2 if plot
% designtype: 1, 2 or 3, the data in each designtype MUST be orgainzed as follow
%     1)  betweenvariable1,betweenvariable2,dependent variable (rawdata should have only 3 columns in this case, dependent variable was in the last column)
%     2)  betweenvariable1,wv1lv1,wv1lv2,wv1lv3,... (there should be one column for between-subject variable, and several columns for within-subject variable)
%     3)  wv1lv1*wv2lv1,wv1lv1*wv2lv2,...,wv1lv2*wv2lv1,wv1lv2*wv2lv2; (there should be no column for between-subject variable, but several columns for within-subject variable)
% rawdata: the order of the columns
%     designtype1)  betweenvariable1,betweenvariable2,dependent variable
%     designtype2)  betweenvariable1,wv1lv1,wv1lv2,wv1lv3,...
%     designtype3)  wv1lv1*wv2lv1,wv1lv1*wv2lv2,...,wv1lv2*wv2lv1,wv1lv2*wv2lv2;
% betweengroupvariables: indicates the indices of variables of betweengroupvariables
%     e.g1)  [1 2] means the first and second columns are between-subject varaibles
%     e.g2)  [1] means the first column is between-subject varaible
%     e.g3)  [0] means there was no between-subject variable
% withinsubjectsvariables: indicate the levels of within-subject variables,
%     e.g1). [2 4] means there are two within-subject factors, the first
%     factor has 2 levels, the second has 4 levels, and the order of
%     columns should be a1b1 a1b2 a1b3 a1b4 a2b1 a2b2 a2b3 a2b4;
%     e.g2).  [3] means there are only one within-subject factor, it has 3
%     levels, the order of 3 columns should be a1 a2 a3;
%     e.g3)  [0] means there is no within-subject factor;
% lengendname={'g1','g2'};
% xticklabelnames={'x1','x2'};
% xname={'xcondition'};
% ylabelname={'yname'};
% betweengroupvariables=[1 2];
% withinsubjectsvariables=[4 5];
% allvariablenames={'group','condition'};

global ms;
ms.plottype=plottype;
ms.xticklabels=xticklabels;
ms.xticklabelnames=xticklabelnames;
ms.ylabelname=ylabelname;
ms.lengendname=lengendname;
ms.allvariablenames=allvariablenames;
ms.figureBKcolor=[0.8314 0.8157 0.8235];

% ms.lvnames4xvs=lvnames4xvs;
means=[]; sde=[]; datas=cell(1);
switch designtype
    case 1   % between-subject design
        % get the mean
        if size(betweengroupvariables,2)==2
            levelsvar1=unique(rawdata(:,betweengroupvariables(1)));levelsvar2=unique(rawdata(:,betweengroupvariables(2)));size1=numel(levelsvar1);size2=numel(levelsvar2);
            for i=1:size1
                for j=1:size2
                    trialscur= rawdata(:,betweengroupvariables(1))==levelsvar1(i) & rawdata(:,betweengroupvariables(2))==levelsvar1(j);
                    datas{i,j}=rawdata(trialscur,3);
                    means(i,j)=mean(datas{i,j});
                    sde(i,j)=std(datas{i,j})/sqrt(numel(datas{i,j}));
                end
            end
        elseif size(betweengroupvariables,2)==1
            levelsvar1=unique(rawdata(:,betweengroupvariables(1)));size1=numel(levelsvar1);
            for i=1:size1
                trialscur= rawdata(:,betweengroupvariables(1))==levelsvar1(i);
                datas{i}=rawdata(trialscur,2);
                means(i)=mean(datas{i});
                sde(i)=std(datas{i})/sqrt(numel(datas{i}));
            end
        end
    case 2   % mixed design
        if size(betweengroupvariables,2)==1
            levelsvar1=unique(rawdata(:,betweengroupvariables(1)));size1=size(levelsvar1); size2=withinsubjectsvaraiblelevels;
            for i=1:size1
                for j=1:size2
                    trialscur= rawdata(:,betweengroupvariables(1))==levelsvar1(i);
                    datas{i,j}=rawdata(trialscur,j+1);
                    means(i,j)=mean(datas{i,j});
                    sde(i,j)=std(datas{i,j})/sqrt(numel(datas{i,j}));
                end
            end
        elseif size(betweengroupvariables,2)~=1
            warndlg('The number of between-subject variable should be 1');
            return;
        end
    case 3   % within-subject design
        if betweengroupvariables~=0
            warndlg('The number of between-subject variable should be 0');
            return;
        end
        if size(withinsubjectsvaraiblelevels,2)==1
            size1=withinsubjectsvaraiblelevels;
            for i=1:size1
                datas{i}=rawdata(:,i);
                means(i)=mean(datas{i});
                sde(i)=std(datas{i})/sqrt(numel(datas{i}));
            end
        elseif size(withinsubjectsvaraiblelevels,2)==2
            size1=withinsubjectsvaraiblelevels(1); size2=withinsubjectsvaraiblelevels(2);n=0;
            for i=1:size1
                for j=1:size2
                    n=n+1;
                    datas{i,j}=rawdata(:,n);
                    means(i,j)=mean(datas{i,j});
                    sde(i,j)=std(datas{i,j})/sqrt(numel(datas{i,j}));
                end
            end
        end
end

sizea=size(means);
a=ndims(means);
ylim(1)=min(means(:))-5*max(abs(sde(:)));
ylim(2)=max(means(:))+3*max(abs(sde(:)));
if a==2 && size(means,1)==1
    a=1;
elseif a==2 && size(means,1)~=1
    a=2;
end
% f1=figure('Name',figtitle,'tag','errorbarN','resizefcn',@resizefcnoutfig);
fx1=figure('ResizeFcn',{@resizefr,a,lengendname});
setappdata(gcf,'ms',ms);
set(fx1,'UserData',get(fx1,'Position'));
c=uicontextmenu;
set(gcf,'uicontextmenu',c);
uimenu(c, 'Label', 'Change Background Color', 'Callback',@changefigcolor);

if size(means)~=size(sde)
    errordlg('The sizes of means and sde don''t match!!');
    return;
elseif a==1
    if plottype==2
        handles.bars = plot((1:size(means,2)),means(:,1),'ButtonDownFcn',@changeplotproperties,'Color',[1 0 0],'LineWidth',2);
        hold on;
        errorbar(1:size(means,2),means(1,:),sde(1,:), 'LineStyle','none','ButtonDownFcn',@changeerrorbarproperties,'tag','errorbars');
    else
        handles.bars = bar(means, 'edgecolor','k', 'linewidth', 1,'barwidth',0.6,'ButtonDownFcn',@changebarproperties,'BaseValue',ylim(1),'Tag','mingbar');
        hold on;
        x =handles.bars(1).XData+handles.bars(1).XOffset;
        errorbar(1:size(means,2),means(1,:),sde(1,:), 'LineStyle','none','ButtonDownFcn',@changeerrorbarproperties,'tag','errorbars');
        hold on;
        barwidth1=get(handles.bars(1),'BarWidth');
        for jj=1:length(x)
            scatter(linspace(x(jj)-barwidth1/2.5,x(jj)+barwidth1/2.5,length(datas{1,jj})),datas{1,jj},'Marker','.','ButtonDownFcn',@changescatterproperties,'Tag','mingmarkers');
            hold on;
        end
    end
    set(gca,'ButtonDownFcn',@changeaxesproperties);
    box off;
    set(gca,'XLim',[0.5,size(means,2)+0.5],'XTick',(1:size(means,2)),'XTickLabel',xticklabelnames,'YLim',ylim);
    ylb=ylabel(ylabelname,'ButtonDownFcn',@changelegendproperties,'tag','absolute');
    ylpos=get(ylb,'Position');    yticks=get(gca,'YTick'); ylpos(2)=max(yticks)-range(yticks)*0.15; set(ylb,'Position',ylpos,'FontWeight','bold');
    xt=get(gca,'XLim');  ylmt=get(gca,'YLim');  xlb=xlabel(xname,'ButtonDownFcn',@ChangePosition,'tag','absolute');  pos=get(xlb,'Position');    pos(1)=xt(2);  pos(2)=ylmt(1)-abs(range(ylmt))*0.07;  set(xlb,'Position',pos,'FontWeight','bold');
    title(['Effect of ',allvariablenames{end}],'ButtonDownFcn',@ChangePosition,'tag','absolute');
elseif a==2
    if plottype==2
        num2holdson=size(means,1);
        sm1=size(means,2);
        for ib=1:num2holdson
            handles.bars = plot(1:sm1,means(ib,:),'ButtonDownFcn',@changeplotproperties,'Color',[1-(ib-1)/num2holdson 0 0+(ib-1)/num2holdson],'LineWidth',2);
            hold on;
        end
        for ib=1:num2holdson
            errorbar(1:sm1,means(ib,:),sde(ib,:), 'LineStyle','none','tag','errorbars','ButtonDownFcn',@changeerrorbarproperties,'Color',[1-(ib-1)/num2holdson 0 0+(ib-1)/num2holdson],'LineWidth',2);
            hold on;
        end
    else
        means=means';
        sde=sde';
        sm1=size(means,1);
        num2holdson=size(means,2);
        handles.bars = bar(means, 'edgecolor','k', 'linewidth', 1,'barwidth',0.6,'ButtonDownFcn',@changebarproperties,'BaseValue',ylim(1),'Tag','mingbar');
        barwidth1=get(handles.bars(1),'BarWidth');
        hold on;
        for ib = 1:num2holdson
            x =handles.bars(ib).XData+handles.bars(ib).XOffset;
            barwidth2=handles.bars(2).XOffset-handles.bars(1).XOffset;  barwidth=barwidth1*barwidth2;
            errorbar(x,means(:,ib),sde(:,ib), 'LineStyle','none','tag','errorbars','ButtonDownFcn',@changeerrorbarproperties);
            hold on;
            for jj=1:length(x)
                scatter(linspace(x(jj)-barwidth/2.5,x(jj)+barwidth/2.5,length(datas{ib,jj})),datas{ib,jj},'Marker','.','ButtonDownFcn',@changescatterproperties,'Tag','mingmarkers');
                hold on;
            end
        end
    end
    box off;
    set(gca,'XLim',[0.5,sm1+0.5],'XTick',(1:sm1),'XTickLabel',xticklabels,'YLim',ylim);
    ylb=ylabel(ylabelname,'ButtonDownFcn',@ChangePosition,'tag','absolute');
    ylpos=get(ylb,'Position');    yticks=get(gca,'YTick'); ylpos(2)=max(yticks)-range(yticks)*0.15; set(ylb,'Position',ylpos,'FontWeight','bold');
    xt=get(gca,'XLim');  ylmt=get(gca,'YLim');  xlb=xlabel(xname,'ButtonDownFcn',@ChangePosition,'tag','absolute'); set(gca,'XTickLabel',xticklabelnames);   pos=get(xlb,'Position');    pos(1)=xt(2);  pos(2)=ylmt(1)-abs(range(ylmt))*0.07;  set(xlb,'Position',pos,'FontWeight','bold');
    if isnumeric(lengendname)
        lengendname1=cell(1);
        lengendname1=arrayfun(@num2str,lengendname,'UniformOutput',false);
        clear lengendname;
        lengendname=lengendname1;
    end
    lgd=legend(lengendname{:},'Location','NorthEast');
    c1 = uicontextmenu;
    color=get(gca,'Color');
    set(lgd,'Units','normalized','Uicontextmenu',c1,'Color',color,'EdgeColor',color,'tag','relative');    %%
    uimenu(c1,'Label','Legend: Background Color','Callback',{@setproperties,lgd,'Color'});
    uimenu(c1,'Label','Legend: Position','Callback',{@ChangePosition1,lgd});
    uimenu(c1,'Label','Legend: Box EdgeColor','Callback',{@setproperties,lgd,'EdgeColor'});
    uimenu(c1,'Label','Legend: Box LineWidth','Callback',{@setproperties,lgd,'LineWidth'});    %%
    uimenu(c1,'Label','Legend: Label Names','Callback',{@setproperties,lgd,'String'});    %%
    uimenu(c1,'Label','Legend: Label Color','Callback',{@setproperties,lgd,'TextColor'});    %%
    uimenu(c1,'Label','Legend: Label Font','Callback',{@setproperties,lgd,'FontName'});
    set(gca,'ButtonDownFcn',@changeaxesproperties);
    title(['Interaction Between ',allvariablenames{end-1},' by ', allvariablenames{end}],'ButtonDownFcn',@ChangePosition);
elseif  a>2
    extrav=a-2;
    combs=1;
    dindex=prod(sizea(3:end));
    for dorder=1:extrav
        combs=combvec(combs,1:sizea(2+dorder));
    end
    combscolumn=combs(2:end,:)';
    maxrows= floor(sqrt(dindex));
    maxcols = ceil(dindex/maxrows);
    for spindex=1:dindex
        [r,c]=ind2sub([maxcols,maxrows],spindex);   % spsize(1)=rows,   spsize(2)=columns
        indcol=r;
        indrow=c;
        sp=subplot(maxrows,maxcols,spindex);
        possp=get(sp,'Position');
        possp(1)=possp(1)-0.03;
        set(sp,'Position',possp);
        if spindex==1
            pos=get(sp,'Position');
        end
        temp=combscolumn(spindex,:);
        tempc=num2cell(temp);
        clear temp;
        datac=means(:,:,tempc{:});
        datae=sde(:,:,tempc{:});
        if plottype==2
            sm1=size(means,2);
            num2holdson=size(datac,1);
            for ib=1:num2holdson
                handles.bars = plot((1:sm1),datac(ib,:),'ButtonDownFcn',@changeplotproperties,'Color',[1-(ib-1)/num2holdson 0 0+(ib-1)/num2holdson],'LineWidth',2);
                hold on;
            end
            for ib=1:num2holdson
                x=hb(ib).XData+hb(ib).XOffset;
                errorbar(x,datac(:,ib),datae(:,ib), 'LineStyle','none','tag','errorbars','ButtonDownFcn',@changeerrorbarproperties,'Color',[1-(ib-1)/num2holdson 0 0+(ib-1)/num2holdson],'LineWidth',2);
                hold on;
            end
        else
            datac=datac';
            datae=datae';
            num2holdson=size(datac,2);
            handles.bars = bar(datac, 'edgecolor','k' ,'linewidth', 1,'ButtonDownFcn',@changebarproperties,'Tag','mingbar');
            hold on;
            for ib = 1:num2holdson
                x=hb(ib).XData+hb(ib).XOffset;
                errorbar(x,datac(:,ib),datae(:,ib), 'LineStyle','none','tag','errorbars','ButtonDownFcn',@changeerrorbarproperties);
                hold on;
            end
        end
        box off
        set(gca,'XLim',[0.5,size(means,2)+0.5],'XTickLabel','','YLim',ylim);
        if spindex==1
            ylb=ylabel(ylabelname,'ButtonDownFcn',@ChangePosition,'tag','absolute');
            ylimt=get(gca,'YLim');
            posylb=get(ylb,'Position');
            assignin('base','posylb',posylb);
            posylb(2)=ylimt(1)+range(ylimt)*0.80;
            set(ylb,'Position',posylb,'FontWeight','bold');
        end
        if indrow==maxrows
            set(gca,'XLim',[0.5,size(means,2)+0.5],'XTick',(1:size(means,2)),'XTickLabel',xticklabels);
            if indrow==maxrows && indcol==maxcols
                handles.xlabel=text(1.01,0,xticklabelnames,'units','normalized','FontWeight','bold','ButtonDownFcn',@ChangePosition,'tag','relative');
            end
        end
        if indrow==1  && indcol==maxcols
            handles.ne=gca;
            poslgendrc=getpixelposition(handles.ne);
            posfig=getpixelposition(gcf);
            handles.lg1=legend(lengendname{:});
            poslgend=[(poslgendrc(1)+poslgendrc(3))/posfig(3),(poslgendrc(2)+poslgendrc(4)-20*numel(lengendname))/posfig(4),poslgendrc(3)*0.15/posfig(3),20*numel(lengendname)/posfig(4)];
            set(handles.lg1,'Position',poslgend,'tag','relative');
            c1 = uicontextmenu;
            color=get(gcf,'Color');
            set(handles.lg1,'Uicontextmenu',c1,'Color',color,'EdgeColor',color);    %%
            uimenu(c1,'Label','Legend: Background Color','Callback',{@setproperties,handles.lg1,'Color'});
            uimenu(c1,'Label','Legend: Position','Callback',{@ChangePosition1,handles.lg1});
            uimenu(c1,'Label','Legend: Box EdgeColor','Callback',{@setproperties,handles.lg1,'EdgeColor'});
            uimenu(c1,'Label','Legend: Box LineWidth','Callback',{@setproperties,handles.lg1,'LineWidth'});    %%
            uimenu(c1,'Label','Legend: Label Names','Callback',{@setproperties,handles.lg1,'String'});    %%
            uimenu(c1,'Label','Legend: Label Color','Callback',{@setproperties,handles.lg1,'TextColor'});    %%
            uimenu(c1,'Label','Legend: Label Font','Callback',{@setproperties,handles.lg1,'FontName'});
        end
        set(gca,'ButtonDownFcn',@changeaxesproperties);
        %         title(vns{spindex},'ButtonDownFcn',@ChangePosition,'tag','absolute');
    end
end
guidata(fx1, handles);

function changeaxesproperties(hObject,~)
global ms;
allchildren=allchild(gca);
cup=get(gca,'currentpoint');
xlimv=get(gca,'XLim');
ylimv=get(gca,'YLim');
cYLabel=get(gca,'YLabel');
cXLabel=get(gca,'XLabel');
if cup(1)<xlimv(1) && cup(3)>ylimv(1) ;
    temp=get(gca,'Uicontextmenu');
    delete(temp);
    c1 = uicontextmenu;
    set(gca,'Uicontextmenu',c1);    %%
    uimenu(c1,'Label','YLabel Name','Callback',{@setproperties,gca,'YLabel'});    %%
    uimenu(c1,'Label','YLabel: Color','Callback',{@setproperties,cYLabel,'Color'});
    uimenu(c1,'Label','YLabel: Font','Callback',{@setproperties,cYLabel,'FontName'});
    uimenu(c1,'Label','YLabel Change Position','Callback',{@ChangePosition1,cYLabel});
    uimenu(c1,'Label','YLabel Delete','Callback',{@deletepanel,cYLabel});
    uimenu(c1,'Label','YLim','Callback',{@setproperties,gca,'YLim'});    %%
    uimenu(c1,'Label','YTick','Callback',{@setproperties,gca,'YTick'});    %%
    uimenu(c1,'Label','YTickLabel','Callback',{@setproperties,gca,'YTickLabel'});    %%
    uimenu(c1,'Label','ZTickLabel','Callback',{@setproperties,gca,'ZTickLabel'});    %%
    uimenu(c1,'Label','Font for XTickLabel, YTickLabel,ZTickLabel','Callback',{@setproperties,gca,'FontName'});    %%
    uimenu(c1,'Label','Color for Y Axis,Ticks and TickLabels','Callback',{@setproperties,gca,'YColor'});    %%
    uimenu(c1,'Label','Color for Z Axis,Ticks and TickLabels','Callback',{@setproperties,gca,'ZColor'});    %%
    uimenu(c1,'Label','YMinorTick on','Callback',{@setproperties,gca,'YMinorTick','on'});
    uimenu(c1,'Label','YMinorTick off','Callback',{@setproperties,gca,'YMinorTick','off'});
    uimenu(c1,'Label','ZMinorTick on','Callback',{@setproperties,gca,'YMinorTick','off'});
    uimenu(c1,'Label','ZMinorTick off','Callback',{@setproperties,gca,'YMinorTick','off'});
    uimenu(c1,'Label','YGrid on','Callback',{@setproperties,gca,'YGrid','off'});
    uimenu(c1,'Label','YGrid off','Callback',{@setproperties,gca,'YGrid','off'});
    uimenu(c1,'Label','ZGrid on','Callback',{@setproperties,gca,'ZGrid','off'});
    uimenu(c1,'Label','ZGrid off','Callback',{@setproperties,gca,'ZGrid','off'});
elseif cup(1)>xlimv(1) && cup(3)<ylimv(1);
    temp=get(gca,'Uicontextmenu');
    delete(temp);
    c2 = uicontextmenu;
    set(gca,'Uicontextmenu',c2);    %%
    uimenu(c2,'Label','XLabel Name','Callback',{@setproperties,gca,'XLabel'});    %%
    uimenu(c2,'Label','XLabel Color','Callback',{@setproperties,cXLabel,'Color'});
    uimenu(c2,'Label','XLabel Font','Callback',{@setproperties,cXLabel,'FontName'});
    uimenu(c2,'Label','XLabel Change Position','Callback',{@ChangePosition1,cXLabel});
    uimenu(c2,'Label','XLabel Delete','Callback',{@deletepanel,cXLabel});
    uimenu(c2,'Label','XLim','Callback',{@setproperties,gca,'XLim'});    %%
    uimenu(c2,'Label','XTick','Callback',{@setproperties,gca,'XTick'});    %%
    uimenu(c2,'Label','XTickLabel','Callback',{@setproperties,gca,'XTickLabel'});    %%
    uimenu(c2,'Label','XTickLabel Font','Callback',{@setproperties,gca,'FontName'});    %%
    uimenu(c2,'Label','Color for X Axis,Ticks and TickLabels','Callback',{@setproperties,gca,'XColor'});    %%
    uimenu(c2,'Label','XMinorTick on','Callback',{@setproperties,gca,'XMinorTick','on'});
    uimenu(c2,'Label','XMinorTick off','Callback',{@setproperties,gca,'XMinorTick','off'});
else
    temp=get(gca,'Uicontextmenu');
    delete(temp);
    c3 = uicontextmenu;
    set(gca,'Uicontextmenu',c3);    %%
    m4=  uimenu(c3,'Label','Title');
    uimenu(m4,'Label','Title: Title Name','Callback',{@setproperties,allchildren(1),'String'});
    uimenu(m4,'Label','Title: Color','Callback',{@setproperties,allchildren(1),'Color'});
    m41=uimenu(m4,'Label','Title: FontName','Callback',{@setproperties,allchildren(1),'FontName'});
    m42=uimenu(m4,'Label','Title: FontSize','Callback',{@setproperties,allchildren(1),'FontSize'});
    setfontsize(m42,allchildren(1));
    m43=uimenu(m4,'Label','Title: FontWeight');
    setfontweight(m43,allchildren(1));
    m1=uimenu(c3,'Label','Box');
    uimenu(m1,'Label','on','Callback','box(''on'')');
    uimenu(m1,'Label','off','Callback','box(''off'')');
    m2 = uimenu(c3,'Label','Background Color of the Axes Pan','Callback',{@setproperties,gca,'Color'});
    m3 = uimenu(c3,'Label','FontProperties for X and Y Axes','Callback',{@setproperties,gca,'FontName'});
    m12 = uimenu(c3,'Label','Change GridLineStyle');
    uimenu(m12,'Label','-','Callback',{@setproperties,gca,'GridLineStyle','-'});
    uimenu(m12,'Label','--','Callback',{@setproperties,gca,'GridLineStyle','--'});
    uimenu(m12,'Label',':','Callback',{@setproperties,gca,'GridLineStyle',':'});
    uimenu(m12,'Label','-.','Callback',{@setproperties,gca,'GridLineStyle','-.'});
    uimenu(m12,'Label','none','Callback',{@setproperties,gca,'GridLineStyle','none'});
    m13 = uimenu(c3,'Label','Line Width for X and Y axes','Callback',{@setproperties,gca,'LineWidth'});
    m14 = uimenu(c3,'Label','Text: Insert/Change Extra texts, Font Style','Callback',{@inserttext,gca});
    m15 = uimenu(c3,'Label','Switch the X and Y axes','Callback',{@switchxy,gcf});
end

function inserttext(~,~,gca)
ans=inputdlg({'Text Content','Text Position (Two digits stating the X, Y values the Text Position Starts, Separated by space)'});
content=ans{1};
temp=regexp(ans{2},' ','split');
pos=cellfun(@str2num,temp');
pos=pos';
if strfind(ans{1},'\color')
    text(pos(1),pos(2),content,'Parent',gca,'ButtonDownFcn',@ChangePosition);
else
    b=uisetcolor;
    text(pos(1),pos(2),content,'Parent',gca,'Color',b,'ButtonDownFcn',@ChangePosition);
end

function shiftup(~,~,input)
a=get(input,'Position');
b=get(gcf,'SelectionType');
c=get(input,'tag');
if strcmpi(c,'absolute')
    yrange=range(get(gca,'Ylim'));
else
    yrange=1;
end
if strcmpi(b,'alt');
    a(2)=a(2)+0.01*yrange;
elseif  strcmpi(b,'normal');
    a(2)=a(2)+0.05*yrange;
end
set(input,'Position',a);

function shiftdown(~,~,input)
a=get(input,'Position');
b=get(gcf,'SelectionType');
c=get(input,'tag');
if strcmpi(c,'absolute')
    yrange=range(get(gca,'Ylim'));
else
    yrange=1;
end
if strcmp(b,'alt');
    a(2)=a(2)-0.01*yrange;
elseif  strcmp(b,'normal');
    a(2)=a(2)-0.05*yrange;
end
set(input,'Position',a);

function shiftleft(~,~,input)
a=get(input,'Position');
b=get(gcf,'SelectionType');
c=get(input,'tag');
if strcmpi(c,'absolute')
    xrange=range(get(gca,'Xlim'));
else
    xrange=1;
end
if strcmp(b,'alt');
    a(1)=a(1)-0.01*xrange;
elseif  strcmp(b,'normal');
    a(1)=a(1)-0.05*xrange;
end
set(input,'Position',a);

function shiftright(~,~,input)
a=get(input,'Position');
b=get(gcf,'SelectionType');
c=get(input,'tag');
if strcmpi(c,'absolute')
    xrange=range(get(gca,'Xlim'));
else
    xrange=1;
end
if strcmp(b,'alt')
    a(1)=a(1)+0.01*xrange;
elseif  strcmp(b,'normal')
    a(1)=a(1)+0.05*xrange;
end
set(input,'Position',a);

function deletepanel(~,~,up1)
delete(up1);

function changefigcolor(hObject, evendata)
handles=guidata(hObject);
b=uisetcolor;
set(gcf,'Color',b);
a=findobj(gcf,'tag','fig');
set(a,'Color',b);
guidata(hObject,handles);

function resizefr(hObject, eventdata,a,lengendname)
handles=guidata(hObject);
posfig=getpixelposition(gcf);
if a>2
    poslgendrc=getpixelposition(handles.ne);
    poslgend=[(poslgendrc(1)+poslgendrc(3))/posfig(3),(poslgendrc(2)+poslgendrc(4)-20*numel(lengendname))/posfig(4),poslgendrc(3)*0.15/posfig(3),20*numel(lengendname)/posfig(4)];
    set(handles.lg1,'Position',poslgend);
end
guidata(hObject, handles);

function changebarproperties(hObject, ~)
handles=guidata(hObject);
a=get(gcf,'SelectionType');
if strcmp(a,'alt')
    c=uicontextmenu;
    set(hObject,'UIcontextMenu',c);
    m1=uimenu(c,'Label','Change FaceColor','Callback',{@setproperties,hObject,'FaceColor'});
    m2=uimenu(c,'Label','Change EdgeColor','Callback',{@setproperties,hObject,'EdgeColor'});
    m3=uimenu(c,'Label','Change EdgeLineStyle');
    uimenu(m3,'Label','solid','Callback',{@setproperties,hObject,'LineStyle','-'});
    uimenu(m3,'Label','dash','Callback',{@setproperties,hObject,'LineStyle','--'});
    uimenu(m3,'Label','dotted','Callback',{@setproperties,hObject,'LineStyle',':'});
    uimenu(m3,'Label','No Line','Callback',{@setproperties,hObject,'LineStyle','none'});
    m4=uimenu(c,'Label','Change BarWidth','Callback',{@setproperties,hObject,'BarWidth'});
    m5=uimenu(c,'Label','Change EdgeLineWidth','Callback',{@setproperties,hObject,'LineWidth'});
    m6=uimenu(c,'Label','Change BaseValue','Callback',{@setproperties,gco,'BaseValue'});
end
guidata(hObject,handles)

function changescatterproperties(hObject,~)
handles=guidata(hObject);
a=get(gcf,'SelectionType');
if strcmp(a,'alt')
    c=uicontextmenu;
    set(hObject,'UIcontextMenu',c);
    m1=uimenu(c,'Label','Change LineWidth','Callback',{@setproperties,gco,'LineWidth'});
    m2 = uimenu(c,'Label','Change Marker');
    uimenu(m2,'Label','o','Callback',{@setproperties,gco,'Marker','o'});
    uimenu(m2,'Label','+','Callback',{@setproperties,gco,'Marker','+'});
    uimenu(m2,'Label','*','Callback',{@setproperties,gco,'Marker','*'});
    uimenu(m2,'Label','.','Callback',{@setproperties,gco,'Marker','.'});
    uimenu(m2,'Label','x','Callback',{@setproperties,gco,'Marker','x'});
    uimenu(m2,'Label','square','Callback',{@setproperties,gco,'Marker','square'});
    uimenu(m2,'Label','diamond','Callback',{@setproperties,gco,'Marker','diamond'});
    uimenu(m2,'Label','^','Callback',{@setproperties,gco,'Marker','^'});
    uimenu(m2,'Label','v','Callback',{@setproperties,gco,'Marker','v'});
    uimenu(m2,'Label','>','Callback',{@setproperties,gco,'Marker','>'});
    uimenu(m2,'Label','<','Callback',{@setproperties,gco,'Marker','<'});
    uimenu(m2,'Label','None','Callback',{@setproperties,gco,'Marker','None'});    %%
    m3=uimenu(c,'Label','Change MarkerEdgeColor','Callback',{@setproperties,hObject,'MarkerEdgeColor'});
    m4=uimenu(c,'Label','Change MarkerFaceColor','Callback',{@setproperties,hObject,'MarkerFaceColor'});
    m5=uimenu(c,'Label','Change MarkersXSpanceRatio','Callback',{@setproperties,gco,'MarkersXSpanceRatio'});
end
guidata(hObject,handles)

function setproperties(~,~,target,property,varargin)
if ~isempty(varargin)
    set(target,property,varargin{1});
elseif contains(property,'Color')
    b=uisetcolor;
    set(target,property,b);
elseif strcmp(property,'MarkersXSpanceRatio')
    allbars=findobj('Tag','mingmarkers');
    temp1=inputdlg({'Old Value','New Value'},'Set Value',1,{'1',''}); eval(['b=[',temp1{2},'];']);
    for i=1:numel(allbars)
        x=get(allbars(i),'XData');    y=get(allbars(i),'YData'); 
        x1=linspace((x(end)+x(1))/2-(x(end)-x(1))*b/2,(x(end)+x(1))/2+(x(end)-x(1))*b/2,numel(x));
    set(allbars(i),'XData',x1,'YData',y);
    end
elseif strcmp(property,'FontName')
    b=uisetfont(target);
    set(target,b);
elseif contains(property,'Width') || contains(property,'MarkerSize')
    ans1=num2str(get(target,property));
    ans=inputdlg({'Old Value','New Value'},'Set Value',1,{ans1,''});
    b=str2num(ans{2});
    set(target,property,b);
elseif contains(property,'BaseValue')
    ans1=num2str(get(target,'BaseValue'));
    ans=inputdlg({'Old Value','New Value'},'Set Value',1,{ans1,''});
    b=str2num(ans{2});
    set(target,property,b);
elseif contains(property,'Data') || contains(property,'Lim') || strcmp(property,'XTick')|| strcmp(property,'YTick')
    str='';
    a=get(target,property);
    for i=1:numel(a)
        str=[str,' ',num2str(a(i))];
    end
    temp1=inputdlg({'Old Value','New Value'},'Set Value',1,{str,''});
    eval(['b=[',temp1{2},'];']);
    if contains(property,'Data')
        set(target,property,b');
    elseif contains(property,'Lim') ||(contains(property,'Tick')  ||~contains(property,'Label'))
        set(target,property,b);
    end
elseif contains(property,'TickLabel')
    str='';
    a=get(target,property);
    for i=1:numel(a)
        if iscell(a)
            str=[str,',',a{i}];
        elseif isnumeric(a)
            str=[str,',',num2str(a(i))];
        end
    end
    tickp=property(1:end-5);
    b=get(target,tickp);
    strtck='';
    for i=1:numel(b)
        if iscell(b)
            strtck=[strtck,',',a{i}];
        elseif isnumeric(b)
            strtck=[strtck,',',num2str(b(i))];
        end
    end
    temp1=inputdlg({'Old Value for Ticks','New Value for Ticks','Old Value for TickLabels','New Value for TickLabels'},'Set Value, The symbol betwen two values must be '',''',1,{strtck(2:end),'',str(2:end),''});
    temp2=regexp(temp1{2},',','split');
    b=strtrim(temp2');
    b=b';
    b=cellfun(@str2num,b,'UniformOutput',false);
    temp3=regexp(temp1{4},',','split');
    c=strtrim(temp3);
    set(target,tickp,cell2mat(b),property,c);
elseif contains(property,'Tickspan')
    errorchildren=get(target,'children');
    xda=get(errorchildren(2),'XData');
    ratio=(xda(1)-xda(4))/abs(xda(10)-xda(1));
    ans=inputdlg({'Old Value','New Value'},'Set Value',1,{num2str(ratio),''});
    b=str2num(ans{2});
    xda(4:9:end)=xda(1:9:end)-b*(xda(10)-xda(1));
    xda(5:9:end)=xda(1:9:end)+b*(xda(10)-xda(1));
    xda(7:9:end)=xda(1:9:end)-b*(xda(10)-xda(1));
    xda(8:9:end)=xda(1:9:end)+b*(xda(10)-xda(1));
    set(errorchildren(2),'XData',xda);
elseif  contains(property,'Lim') || contains(property,'extent')
    str='';
    a=get(target,property);
    for i=1:numel(a)
        str=[str,' ',num2str(a(i))];
    end
    temp1=inputdlg({'Old Value','New Value'},'Set Value',1,{str,''});
    temp2=regexp(temp1{2},' ','split');
    b=cellfun(@str2num,temp2);
    set(target,property,b');
elseif contains(property,'Title') || strcmp(property,'XLabel')  ||strcmp(property,'YLabel')
    a=get(gca,property);
    a1=get(a,'String');
    if ~isempty(a)
        if iscell(a1)
            temp1=inputdlg({'Old Value','New Value'},'Set Value',1,{a1{1},''});
        elseif ischar(a1)
            temp1=inputdlg({'Old Value','New Value'},'Set Value',1,{a1,''});
        end
    else
        temp1=inputdlg({'Old Value','New Value'},'Set Value',1,{'',''});
    end
    set(a,'String',temp1{2},'ButtonDownFcn',@ChangePosition);
elseif contains(property,'String')
    a=get(target,property);
    if ~isempty(a)
        temp1=inputdlg({'Old Value','New Value'},'Set Value',1,{a,''});
    else
        temp1=inputdlg({'Old Value','New Value'},'Set Value',1,{'',''});
    end
    set(target,property,temp1{2},'ButtonDownFcn',@ChangePosition);
    
    % elseif contains(property,'LineWidth')
    %     a=get(target,property);
    %     if ~isempty(a)
    %         temp1=inputdlg({'Old Value','New Value'},'Set Value',1,{a,''});
    %     else
    %         temp1=inputdlg({'Old Value','New Value'},'Set Value',1,{'',''});
    %     end
    %     set(target,property,temp1{2},'ButtonDownFcn',@ChangePosition);
end

function ChangePosition(input,~)
a=get(gcf,'SelectionType');
if strcmp(a,'alt');
    temp=get(gca,'Uicontextmenu');
    delete(temp);
    c2 = uicontextmenu;
    set(input,'Uicontextmenu',c2);    %%
    uimenu(c2,'Label','Change Label/Title Name','Callback',{@setproperties,input,'String'});
    uimenu(c2,'Label','Color','Callback',{@setproperties,input,'Color'});
    m51=uimenu(c2,'Label','FontName','Callback',{@setproperties,input,'FontName'});
    m52=uimenu(c2,'Label','FontSize','Callback',{@setproperties,input,'FontSize'});
    setfontsize(m52,input);
    m53=uimenu(c2,'Label','FontWeight');
    setfontweight(m53,input);
    m54=uimenu(c2,'Label','Change Position','Callback',{@ChangePosition1,input});
    m55=uimenu(c2,'Label','Delete','Callback',{@deletepanel,input});
end

function ChangePosition1(~,~,input)
global ms;
pos=getpixelposition(gcf);
if isempty(findobj(gca,'tag','up1'))
    up1=uipanel('Parent',gcf,'Title','','Units','pixels','Position',[pos(3)-46 pos(4)-53 52 52],'BackgroundColor',ms.figureBKcolor,'BorderType','none','tag','up1');
    uicontrol('Parent',up1,'Style','pushbutton','Units','pixels','Position',[15 33 19 15],'FontName','symbol','String',char(8743),'ForegroundColor',[0 0 0],'BackgroundColor',ms.figureBKcolor,'horizontal','left','Enable','inactive','FontWeight','bold','ButtonDownFcn',{@shiftup,input});
    uicontrol('Parent',up1,'Style','pushbutton','Units','pixels','Position',[15 0 19 15],'FontName','symbol','String',char(8744),'ForegroundColor',[0 0 0],'BackgroundColor',ms.figureBKcolor,'horizontal','left','Enable','inactive','FontWeight','bold','ButtonDownFcn',{@shiftdown,input});
    uicontrol('Parent',up1,'Style','pushbutton','Units','pixels','Position',[0 16 14 16],'FontName','symbol','String','<','ForegroundColor',[0 0 0],'BackgroundColor',ms.figureBKcolor,'horizontal','left','Enable','inactive','FontWeight','bold','ButtonDownFcn',{@shiftleft,input});
    uicontrol('Parent',up1,'Style','pushbutton','Units','pixels','Position',[35 16 14 16],'FontName','symbol','String','>','ForegroundColor',[0 0 0],'BackgroundColor',ms.figureBKcolor,'horizontal','left','Enable','inactive','FontWeight','bold','ButtonDownFcn',{@shiftright,input});
    uicontrol('Parent',up1,'Style','pushbutton','Units','pixels','Position',[14 16 21 16],'FontName','symbol','String','OK','ForegroundColor',[0 0 0],'BackgroundColor',ms.figureBKcolor,'horizontal','left','FontWeight','normal','callback',{@deletepanel,up1});
end

function setfontsize(ho,target)
for i=6:20
    uimenu(ho,'Label',num2str(i),'Callback',{@setproperties,target,'FontSize',i});
end

function setfontweight(ho,target)
uimenu(ho,'Label','normal','Callback',{@setproperties,target,'FontWeight','normal'});
uimenu(ho,'Label','bold','Callback',{@setproperties,target,'FontWeight','bold'});
uimenu(ho,'Label','light','Callback',{@setproperties,target,'FontWeight','light'});
uimenu(ho,'Label','demi','Callback',{@setproperties,target,'FontWeight','demi'});

function changeerrorbarproperties(hObject, ~)
a=get(gcf,'SelectionType');
if strcmp(a,'alt');
    c = uicontextmenu;
    set(hObject,'Uicontextmenu',c);    %%
    m1 = uimenu(c,'Label','Change Errorbar LineStyle');
    uimenu(m1,'Label','-','Callback',{@setproperties,gco,'LineStyle','-'});
    uimenu(m1,'Label','--','Callback',{@setproperties,gco,'LineStyle','--'});
    uimenu(m1,'Label',':','Callback',{@setproperties,gco,'LineStyle',':'});
    uimenu(m1,'Label','None','Callback',{@setproperties,gco,'LineStyle','None'});    %% marker
    m2 = uimenu(c,'Label','Change Marker');
    uimenu(m2,'Label','o','Callback',{@setproperties,gco,'Marker','o'});
    uimenu(m2,'Label','+','Callback',{@setproperties,gco,'Marker','+'});
    uimenu(m2,'Label','*','Callback',{@setproperties,gco,'Marker','*'});
    uimenu(m2,'Label','.','Callback',{@setproperties,gco,'Marker','.'});
    uimenu(m2,'Label','x','Callback',{@setproperties,gco,'Marker','x'});
    uimenu(m2,'Label','square','Callback',{@setproperties,gco,'Marker','square'});
    uimenu(m2,'Label','diamond','Callback',{@setproperties,gco,'Marker','diamond'});
    uimenu(m2,'Label','^','Callback',{@setproperties,gco,'Marker','^'});
    uimenu(m2,'Label','v','Callback',{@setproperties,gco,'Marker','v'});
    uimenu(m2,'Label','>','Callback',{@setproperties,gco,'Marker','>'});
    uimenu(m2,'Label','<','Callback',{@setproperties,gco,'Marker','<'});
    uimenu(m2,'Label','None','Callback',{@setproperties,gco,'Marker','None'});    %%
    m3 = uimenu(c,'Label','Change Color','Callback',{@setproperties,gco,'Color'});    %%
    m4 = uimenu(c,'Label','Change MarkerEdgeColor','Callback',{@setproperties,gco,'MarkerEdgeColor'});
    m5 = uimenu(c,'Label','Change MarkerFaceColor','Callback',{@setproperties,gco,'MarkerFaceColor'});    %% change width of T shape
    m6 = uimenu(c,'Label','Change the I shape Width of the Errorbar','Callback',{@setproperties,gco,'Tickspan'});    %%
    m7 = uimenu(c,'Label','Change Errorbar LineThickness','Callback',{@setproperties,gco,'LineWidth'});
    m8 = uimenu(c,'Label','Change MarkerSize','Callback',{@setproperties,gco,'MarkerSize'});
    m9 = uimenu(c,'Label','Change Errorbar Length Above the Bar Height','Callback',{@setproperties,gco,'UData'});
    m10 = uimenu(c,'Label','Change Errorbar Length Below the Bar Height','Callback',{@setproperties,gco,'LData'});
end

function changeplotproperties(hObject, ~)
a=get(gcf,'SelectionType');
if strcmp(a,'alt');
    c = uicontextmenu;
    set(hObject,'Uicontextmenu',c);    %%
    m1 = uimenu(c,'Label','LineStyle');
    uimenu(m1,'Label','-','Callback',{@setproperties,gco,'LineStyle','-'});
    uimenu(m1,'Label','--','Callback',{@setproperties,gco,'LineStyle','--'});
    uimenu(m1,'Label',':','Callback',{@setproperties,gco,'LineStyle',':'});
    uimenu(m1,'Label','None','Callback',{@setproperties,gco,'LineStyle','None'});    %% marker
    m7 = uimenu(c,'Label','Change LineThickness','Callback',{@setproperties,gco,'LineWidth'});
    m2 = uimenu(c,'Label','Marker');
    uimenu(m2,'Label','o','Callback',{@setproperties,gco,'Marker','o'});
    uimenu(m2,'Label','+','Callback',{@setproperties,gco,'Marker','+'});
    uimenu(m2,'Label','*','Callback',{@setproperties,gco,'Marker','*'});
    uimenu(m2,'Label','.','Callback',{@setproperties,gco,'Marker','.'});
    uimenu(m2,'Label','x','Callback',{@setproperties,gco,'Marker','x'});
    uimenu(m2,'Label','square','Callback',{@setproperties,gco,'Marker','square'});
    uimenu(m2,'Label','diamond','Callback',{@setproperties,gco,'Marker','diamond'});
    uimenu(m2,'Label','^','Callback',{@setproperties,gco,'Marker','^'});
    uimenu(m2,'Label','v','Callback',{@setproperties,gco,'Marker','v'});
    uimenu(m2,'Label','>','Callback',{@setproperties,gco,'Marker','>'});
    uimenu(m2,'Label','<','Callback',{@setproperties,gco,'Marker','<'});
    uimenu(m2,'Label','None','Callback',{@setproperties,gco,'Marker','None'});    %%
    m3 = uimenu(c,'Label','Change Color','Callback',{@setproperties,gco,'Color'});    %%
    m4 = uimenu(c,'Label','Change MarkerEdgeColor','Callback',{@setproperties,gco,'MarkerEdgeColor'});
    m5 = uimenu(c,'Label','Change MarkerFaceColor','Callback',{@setproperties,gco,'MarkerFaceColor'});    %% change width of T shape
    m8 = uimenu(c,'Label','Change MarkerSize','Callback',{@setproperties,gco,'MarkerSize'});
    m9 = uimenu(c,'Label','Visible');
    uimenu(m9,'Label','on','Callback',{@setproperties,gco,'Visible','on'});
    uimenu(m9,'Label','off','Callback',{@setproperties,gco,'Visible','off'});
end

function changelegendproperties(hObject,~)
a=get(gcf,'SelectionType');
if strcmp(a,'extend')
    temp=get(gco,'Uicontextmenu');
    delete(temp);
    c1 = uicontextmenu;
    set(gco,'Uicontextmenu',c1);    %%
    uimenu(c1,'Label','Legend: Background Color','Callback',{@setproperties,gco,'Color'});
    uimenu(c1,'Label','Legend: Position','Callback',{@ChangePosition1,gco});
    uimenu(c1,'Label','Legend: Box EdgeColor','Callback',{@setproperties,gco,'EdgeColor'});
    uimenu(c1,'Label','Legend: Box LineWidth','Callback',{@setproperties,gco,'LineWidth'});    %%
    uimenu(c1,'Label','Legend: Label Names','Callback',{@setproperties,gco,'String'});    %%
    uimenu(c1,'Label','Legend: Label Color','Callback',{@setproperties,gco,'TextColor'});    %%
    uimenu(c1,'Label','Legend: Label Font','Callback',{@setproperties,gco,'FontName'});
end

