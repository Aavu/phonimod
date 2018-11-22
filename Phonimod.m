function varargout = Phonimod(varargin)
% Phonimod MATLAB code for Phonimod.fig
%      Phonimod, by itself, creates a new Phonimod or raises the existing
%      singleton*.
%
%      H = Phonimod returns the handle to a new Phonimod or the handle to
%      the existing singleton*.
%
%      Phonimod('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Phonimod.M with the given input arguments.
%
%      Phonimod('Property','Value',...) creates a new Phonimod or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Phonimod_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Phonimod_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Phonimod

% Last Modified by GUIDE v2.5 23-Jul-2014 11:16:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Phonimod_OpeningFcn, ...
                   'gui_OutputFcn',  @Phonimod_OutputFcn, ...
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


% --- Executes just before Phonimod is made visible.
function Phonimod_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Phonimod (see VARARGIN)

% Choose default command line output for Phonimod
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Phonimod wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Phonimod_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in selectAudio.
function selectAudio_Callback(hObject, eventdata, handles)
% hObject    handle to selectAudio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectAudio(handles);

% --- Executes on button press in modulate.
function modulate_Callback(hObject, eventdata, handles)
% hObject    handle to modulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
global y
global fileName
%x = getappdata(handles.filePath,'fileName');
x = audioread(x);
left = x;
right = x;
left(:,2) = [];
right(:,1) = [];
left = left(1:2160000);
right = right(1:2160000);
left = (left-min(left));
left = left/max(left);
right = (right-min(right));
right = right/max(right);
mix(:,:,3) = left;
mix(:,:,2) = right;
mix(:,:,1) = zeros;
y = reshape(mix,1080,2000,3);
setappdata(0,'y',y);
[file,path] = uiputfile('png','Save image As', 'Mod.png');
fileName = [path file];
imwrite(y,fileName,'png','BitDepth',16);
set(handles.imPath,'String', fileName);
setappdata(0,'dirName',fileName); 


% --- Executes on button press in choosePath.
function choosePath_Callback(hObject, eventdata, handles)
% hObject    handle to choosePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = getappdata(0,'y');
% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function New_Callback(hObject, eventdata, handles)
% hObject    handle to New (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Phonimod.fig;

% --------------------------------------------------------------------
function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function preview_Callback(hObject, eventdata, handles)
% hObject    handle to preview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function howTo_Callback(hObject, eventdata, handles)
% hObject    handle to howTo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Help.fig;

% --------------------------------------------------------------------
function checkForUpdates_Callback(hObject, eventdata, handles)
% hObject    handle to checkForUpdates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function playAudio_Callback(hObject, eventdata, handles)
% hObject    handle to playAudio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
global fs
%fs = getappdata(0,'fs');
%x = getappdata(0,'x');
p = audioplayer(x,fs);
play(p)
% --------------------------------------------------------------------
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function rewind_Callback(hObject, eventdata, handles)
% hObject    handle to rewind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function cut_Callback(hObject, eventdata, handles)
% hObject    handle to cut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function copy_Callback(hObject, eventdata, handles)
% hObject    handle to copy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function paste_Callback(hObject, eventdata, handles)
% hObject    handle to paste (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function trimAudio_Callback(hObject, eventdata, handles)
% hObject    handle to trimAudio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open TrimDialog.fig
% --------------------------------------------------------------------
function preferences_Callback(hObject, eventdata, handles)
% hObject    handle to preferences (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function importAudio_Callback(hObject, eventdata, handles)
% hObject    handle to importAudio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectAudio(handles);

% --------------------------------------------------------------------
function saveImageAs_Callback(hObject, eventdata, handles)
% hObject    handle to saveImageAs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y
%y = getappdata(0,'y');
[file,path] = uiputfile('*png','Save Image As','Mod.png');
fileName = [path file];
imwrite(y,fileName,'png');

% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Phonimod;

function selectAudio(handles)
global x
global fs
global startTime
global endTime
global fileName
[name path] = uigetfile('*.wav','Select the audio file');
fileName = [path name];
[x,fs] = audioread(fileName);
setappdata(0,'x',x);
setappdata(0,'fs',fs);
left = x;
right = x;
%startTime = getappdata(handles.startField,'startTime');
%endTime = getappdata(handles.endField,'endTime');
if startTime ==[]
    startTime = 1;
else
    return;
end
if endTime ==[]
    endTime = 2160000;
else
    return;
end
left = left(startTime:endTime);
right = right(startTime:endTime);
left(:,2) = [];
right(:,1) = [];
n = length(x);
set(handles.filePath,'String', fileName);
setappdata(handles.filePath,'fileName',fileName); 
setappdata(0,'fs',fs);
axes(handles.leftPlot);
plot(left);
axis([0 n -1 1]);
axes(handles.rightPlot);
plot(right);
axis([0 n -1 1]);


% --------------------------------------------------------------------
function play_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs
global x
global p
%fs = getappdata(0,'fs');
%x = getappdata(0,'x');
p = audioplayer(x,fs);
play(p);

% --------------------------------------------------------------------
function stop_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
%p = getappdata(0,'p');
delete(p);

% --------------------------------------------------------------------
function pause_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
