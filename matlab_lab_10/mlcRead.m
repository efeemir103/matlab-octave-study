function [myStructure] = mlcRead(fileName)
%% 
fid = fopen(fileName,'r');   % open the file in workspace
k=0;
%% 
while(1)
    oneLine = fgetl(fid);    % read the first/current line
    if oneLine == -1         % check the non-empty file
        break;
    end
    [leftPart, rightPart] = strtok(oneLine,'=');   % seperate the right-left side of equality for the current line
    leftPart = strtrim(leftPart);                  % remove the leading whitespace
    rightPart = strtrim(rightPart(2:end));         % remove both the '=' marker and the leading whitespace
    if (strcmpi(leftPart,'File Rev'))              % write the knowledge of the non-repetition entrance on output file
        myStructure.fileRev = rightPart;
    elseif (strcmpi(leftPart,'Treatment'))
        myStructure.treatment = rightPart;
    elseif (strcmpi(leftPart,'Last Name'))
        myStructure.lastName = rightPart;
    elseif (strcmpi(leftPart,'First Name'))
        myStructure.firstName = rightPart;
    elseif (strcmpi(leftPart,'Patient ID'))
        myStructure.patientID = str2double(rightPart);
    elseif (strcmpi(leftPart,'Number of Fields'))
        myStructure.numberOfFields = str2double(rightPart);
    elseif (strcmpi(leftPart,'Model'))
        myStructure.model = rightPart;
    elseif (strcmpi(leftPart,'Tolerance'))
        myStructure.tolerance = str2double(rightPart);
    elseif (strcmpi(leftPart,'Field'))              % write the knowledge of the fields on output file
        k=k+1;                                      % assign the field index
        myStructure.data(k).field = rightPart;
        for i=1:4
            oneLine = fgetl(fid);
            [leftPart2, rightPart2] = strtok(oneLine,'=');
            leftPart2 = strtrim(leftPart2);
            rightPart2 = strtrim(rightPart2(2:end));
            if (strcmpi(leftPart2,'Index'))
                myStructure.data(k).index = str2double(rightPart2);
            elseif (strcmpi(leftPart2,'Carriage Group'))
                myStructure.data(k).carriageGroup = str2double(rightPart2);
            elseif (strcmpi(leftPart2,'Operator'))
                myStructure.data(k).operator = rightPart2;
            elseif (strcmpi(leftPart2,'Collimator'))
                myStructure.data(k).collimator = str2double(rightPart2);
            end
        end                                % write the knowledge of the entrance of the repetition fields on output file
        for i=1:2                                   % write the knowledge of the A&B of the repetition fields on output file
            for j=1:60                              % A:B:1-60 index
                if (i == 1)
                    oneLine = fgetl(fid);
                    [~, rightPart3] = strtok(oneLine,'=');
                    rightPart3 = strtrim(rightPart3(2:end));
                    myStructure.data(k).leaf.a(j) = str2double(rightPart3);   % write for the A part of output the files
                else
                    oneLine = fgetl(fid);
                    [~, rightPart4] = strtok(oneLine,'=');
                    rightPart4 = strtrim(rightPart4(2:end));
                    myStructure.data(k).leaf.b(j) = str2double(rightPart4);   % write for the B part of output the files
                end
            end
        end
        for i=1:3
            oneLine = fgetl(fid);
            [leftPart5, rightPart5] = strtok(oneLine,'=');
            leftPart5 = strtrim(leftPart5);
            rightPart5 = strtrim(rightPart5(2:end));
            if (strcmpi(leftPart5,'Note'))
                myStructure.data(k).note = rightPart5;
            elseif (strcmpi(leftPart5,'Shape'))
                myStructure.data(k).shape = rightPart5;
            elseif (strcmpi(leftPart5,'Magnification'))
                myStructure.data(k).magnification = str2double(rightPart5);
            end
        end

    end
end