function format = getLocalDateFormat
% GETLOCALDATEFORMAT: Determines the local date format for the computer
% running the code.  This is particularly useful when reading dates from
% Excel into MATLAB with XLSREAD: in the U.S., the dates are typically
% returned in the format 'mm/dd/yyyy', while elsewhere they are returned in
% the format 'dd/mm/yyyy'.  This function will only work on Windows
% machines.
%
% EXAMPLE:
% (In the U.S.):
% format = getLocalDateFormat
%
% format = 
% mm/dd/yyyy

datefmt = winqueryreg('HKEY_CURRENT_USER', ...
    'Control Panel\International','sShortDate'); 

if isempty(datefmt)
    format = 'mm/dd/yyyy';
    warning('getLocalDateFormat:NoEcho',...
        'Unable to determine local date format.  Assuming mm/dd/yyyy')
else
    % Windows has date formats that differ from MATLAB's in two ways:
    % first: capital Ms have a different meaning, and second: Windows can
    % use a single 'M' and/or 'd' to indicate that leading zeros are
    % stripped off.  MATLAB automatically adjusts for leading zeros, so
    % these lines of code make all Ms lowercase and double ds and ms when
    % needed.
    format = regexprep(lower(datefmt),'(?<!d)d(?!d)','dd');
    format = regexprep(format,'(?<!m)m(?!m)','mm');
end

% ---------------------------------------

% Other possibilities:
% Using the WINQUERYREG function has other date-related uses.  I will
% simply list some options here; feel free to enhance this function with
% any combination of them:

% % Obtain Windows XP Regional date and time formats from the registry 
% timesep  = winqueryreg('HKEY_CURRENT_USER','Control Panel\International','sTime'); 
% datesep  = winqueryreg('HKEY_CURRENT_USER','Control Panel\International','sDate'); 
% timefmt  = winqueryreg('HKEY_CURRENT_USER','Control Panel\International','sTimeFormat'); 
% datefmt1 = winqueryreg('HKEY_CURRENT_USER','Control Panel\International','sShortDate'); 
% datefmt2 = winqueryreg('HKEY_CURRENT_USER','Control Panel\International','sLongDate'); 
% 
% % Convert the formats' specifiers to match those of MATLAB.  Using regular
% % expressions is more robust than a SWITCH/CASE model.
% mltimefmt = upper(timefmt); 
% mltimefmt = regexprep(mltimefmt,'H+','HH'); 
% mltimefmt = regexprep(mltimefmt,'M+','MM'); 
% mltimefmt = regexprep(mltimefmt,'S+','SS'); 
% mltimefmt = regexprep(mltimefmt,'T+','AM'); 
% 
% mldatefmt1 = regexprep(lower(datefmt1),'(?<!d)d(?!d)','dd'); 
% mldatefmt1 = regexprep(mldatefmt1,'(?<!m)m(?!m)','mm'); 
% 
% mldatefmt2 = regexprep(lower(datefmt2),'(?<!d)d(?!d)','dd'); 
% mldatefmt2 = regexprep(mldatefmt2,'(?<!m)m(?!m)','mm');