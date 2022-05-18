function updateMsg(hLogFile, msg)
try
    if hLogFile == -1
        disp(['Could not write to log file: ' msg])
    elseif isnan(hLogFile)
        fprintf([strrep(strrep(msg,'\n',''),'\r',''), '\n']);
    else
        fprintf(hLogFile, msg);
    end
catch
    disp(['Really could not write to log file: ' msg])
end
