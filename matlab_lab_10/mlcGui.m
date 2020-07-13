function varargout = mlcGui(varargin)
% MLCGUI MATLAB code for mlcGui.fig
%      MLCGUI, by itself, creates a new MLCGUI or raises the existing
%      singleton*.
%
%      H = MLCGUI returns the handle to a new MLCGUI or the handle to
%      the existing singleton*.
%
%      MLCGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MLCGUI.M with the given input arguments.
%
%      MLCGUI('Property','Value',...) creates a new MLCGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mlcGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mlcGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mlcGui

% Last Modified by GUIDE v2.5 04-Dec-2019 09:50:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mlcGui_OpeningFcn, ...
                   'gui_OutputFcn',  @mlcGui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before mlcGui is made visible.
function mlcGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mlcGui (see VARARGIN)

% Choose default command line output for mlcGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mlcGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mlcGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtFileName_Callback(hObject, eventdata, handles)
% hObject    handle to txtFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFileName as text
%        str2double(get(hObject,'String')) returns contents of txtFileName as a double


% --- Executes during object creation, after setting all properties.
function txtFileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnBrowse.
function btnBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to btnBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName,filePath] = uigetfile('*.mlc', 'Select an mlc file'); % Open a browse dialog window

if isequal(fileName,0) 
    errordlg('You did not choose a file!');
else
    fullFilePath = fullfile(filePath,fileName); % Obtain the full path of the mlc file
    set(handles.txtFileName,'String',fullFilePath); % Show full path in the file path textbox
    myStructure = mlcRead(fullFilePath); % Read the mlc file
    set(handles.txtFirstName,'String',myStructure.firstName); % Show patient first name
    set(handles.txtLastName,'String',myStructure.lastName); % Show patient last name
    set(handles.txtPatientID,'String',num2str(myStructure.patientID)); % Show patient id
    set(handles.txtModel,'String',myStructure.model); % Show devide model
    set(handles.txtTolerance,'String',num2str(myStructure.tolerance)); % Show device tolerance
    set(handles.sliderFields,'Max',myStructure.numberOfFields); % Set max value of the slider
    set(handles.sliderFields,'SliderStep',[1/myStructure.numberOfFields 5/myStructure.numberOfFields]); % Set small and large slider steps
    handles.structureData = myStructure; % add myStructure to handles as a new field
    guidata(hObject,handles); % Save the structure 'handles' so that the field 'structureData' can be used by other functions
    plotLeaves(handles, 1); % Plot the first field
end
% --- Executes on slider movement.
function sliderFields_Callback(hObject, eventdata, handles)
% hObject    handle to sliderFields (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
sliderValue = get(hObject,'Value'); % Get the value of the slider
sliderValueInteger = round(sliderValue); % Round the value to the nearest integer
set(hObject,'Value',sliderValueInteger); % Set the slider's value to computed integer value
plotLeaves(handles,sliderValueInteger);  % Plot the leaves for field = sliderValueInteger


% --- Executes during object creation, after setting all properties.
function sliderFields_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderFields (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function plotLeaves(handles,k)
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

%bh.FaceColor = 'red';
%hold on
%bh2 = barh(handles.structureData.data(k).leaf.b);
%bh2.BaseValue=20;
