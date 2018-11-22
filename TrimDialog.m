function varargout = TrimDialog(varargin)
% TRIMDIALOG MATLAB code for TrimDialog.fig
%      TRIMDIALOG, by itself, creates a new TRIMDIALOG or raises the existing
%      singleton*.
%
%      H = TRIMDIALOG returns the handle to a new TRIMDIALOG or the handle to
%      the existing singleton*.
%
%      TRIMDIALOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRIMDIALOG.M with the given input arguments.
%
%      TRIMDIALOG('Property','Value',...) creates a new TRIMDIALOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TrimDialog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TrimDialog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TrimDialog

% Last Modified by GUIDE v2.5 23-Jul-2014 22:13:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TrimDialog_OpeningFcn, ...
                   'gui_OutputFcn',  @TrimDialog_OutputFcn, ...
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


% --- Executes just before TrimDialog is made visible.
function TrimDialog_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TrimDialog (see VARARGIN)

% Choose default command line output for TrimDialog
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TrimDialog wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TrimDialog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function startField_Callback(hObject, eventdata, handles)
% hObject    handle to startField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startField as text
%        str2double(get(hObject,'String')) returns contents of startField as a double
global startTime
startTime = str2double(set(handles.startField,'String'));
setappdata(handles.startField,'startTime',startTime);

% --- Executes during object creation, after setting all properties.
function startField_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function endField_Callback(hObject, eventdata, handles)
% hObject    handle to endField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of endField as text
%        str2double(get(hObject,'String')) returns contents of endField as a double
global endTime
endTime = str2double(set(handles.endField,'String'));
setappdata(handles.endField,'endTime',endTime);

% --- Executes during object creation, after setting all properties.
function endField_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in startPopup.
function Popup_Callback(hObject, eventdata, handles)
% hObject    handle to startPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns startPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from startPopup
global unit
unit = get(handles.Popup,'value');

% --- Executes during object creation, after setting all properties.
function Popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in trimOK.
function trimOK_Callback(hObject, eventdata, handles)
% hObject    handle to trimOK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%startTime = getappdata(handles.startField,'startTime');
%endTime = getappdata(handles.endField,'endTime');
%fs = getappdata(0,'fs');
%sec = getappdata(handles.startPopup,'string');
global startTime
global endTime
global fs
global sec
global unit
fs = 48000;
if unit == 1
    startTime = startTime*fs;
    endTime = endTime*fs;
else
    ;
end
setappdata(0,'startTime',startTime);
setappdata(0,'endTime',endTime);
close TrimDialog;

% --- Executes on button press in trimCancel.
function trimCancel_Callback(hObject, eventdata, handles)
% hObject    handle to trimCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close TrimDialog;
