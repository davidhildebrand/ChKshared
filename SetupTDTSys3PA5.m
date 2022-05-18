function msg = SetupTDTSys3PA5(MainVarStr)
% This function setup TDT Sys3 PA5 programmable attenuator for later sound
% delivery
% information both in the LO (LoadOut) and GUI objects in the MainVarStr 
% ('Xin' or 'TP')
%       MainVarStr:     'Xin' or 'TP'
%       LoadSourceStr:  'Sound', 'AddAtts', 'CycleNumTotal', 'TrlOrder'
% The 
%   Sound, Additional Attenuations,  and generate according
% Trl play structures

global TP Xin

% create the PA5 object, [0 0 1 1] indicates the graphic size to be hidden
figure('Visible',   'off');
drawnow;
    str = [MainVarStr, '.HW.TDT.PA5 = actxcontrol(''PA5.x'',[0 0 1 1]);']; 
        %disp(str);
        eval(str);
    pause(0.2);
    str = ['con = invoke(', MainVarStr, '.HW.TDT.PA5,''ConnectPA5'',''GB'',1);'];
        %disp(str);
        eval(str);
        %disp(con);
        %disp(Xin.HW.TDT.PA5);
    if con ~= 1
        errordlg({...
            'PA5 connection is not successful.',...
            'Check the TDT PA5 rack power, or ',...
            'zBusmon can be used to validate if',...
            'PA5 is ready to be called from ActiveX or not'});
    end
    str = [MainVarStr, '.HW.TDT.PA5.Display(''...'', 0);'];
        eval(str);
    
%% LOG MSG
msg = [datestr(now, 'yyyy-mm-dd HH:MM:SS.FFF') '\tSetupTDTSys3PA5\tSetup TDT Sys3 PA5\r\n'];  
str = ['updateMsg(', MainVarStr, '.D.Exp.hLog, msg);'];
eval(str);

%     Xin.HW.TDT.PA5 = actxcontrol('PA5.x',[0 0 1 1]);
%     con = invoke(Xin.HW.TDT.PA5,'ConnectPA5','USB',1);