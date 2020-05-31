function varargout = menuGUI(varargin)
% MENUGUI MATLAB code for menuGUI.fig
%      MENUGUI, by itself, creates a new MENUGUI or raises the existing
%      singleton*.
%
%      H = MENUGUI returns the handle to a new MENUGUI or the handle to
%      the existing singleton*.
%
%      MENUGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENUGUI.M with the given input arguments.
%
%      MENUGUI('Property','Value',...) creates a new MENUGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before menuGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to menuGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help menuGUI

% Last Modified by GUIDE v2.5 31-May-2020 10:27:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @menuGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @menuGUI_OutputFcn, ...
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


% --- Executes just before menuGUI is made visible.
function menuGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to menuGUI (see VARARGIN)

% Choose default command line output for menuGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes menuGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = menuGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openButton.
function openButton_Callback(hObject, eventdata, handles)
% hObject    handle to openButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vid = videoinput('winvideo',1,'YUY2_640x480');
vid.FramesPerTrigger = 1;
vid.ReturnedColorspace = 'rgb';
triggerconfig(vid, 'manual');
vidRes = get(vid, 'VideoResolution');
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = get(vid, 'NumberOfBands') ;
hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.aPreview);
preview(vid, hImage);
handles.vid = vid;
guidata(hObject, handles);

%set(frontCam,'TriggerRepeat',inf);


% --- Executes on button press in takeButton.
function takeButton_Callback(hObject, eventdata, handles)
% hObject    handle to takeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~isfield(handles, 'vid')
    warndlg('Open camera terlebih dahulu!') ;
    return
end

vid = handles.vid;
vid.FramesPerTrigger = 1;
vid.ReturnedColorspace = 'rgb';
triggerconfig(vid, 'manual');
vidRes = get(vid, 'VideoResolution');
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = get(vid, 'NumberOfBands');
hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.aPreview);
preview(vid, hImage);

start(vid);
pause(3);
trigger(vid);
stoppreview(vid);
capt1 = getdata(vid);
imwrite(capt1, 'TestData/captured.jpg');
warndlg('Done!');

% --- Executes on button press in recogButton.
function recogButton_Callback(hObject, eventdata, handles)
% hObject    handle to recogButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
main


% --- Executes on selection change in listKelompok.
function listKelompok_Callback(hObject, eventdata, handles)
% hObject    handle to listKelompok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listKelompok contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listKelompok


% --- Executes during object creation, after setting all properties.
function listKelompok_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listKelompok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editKelompok_Callback(hObject, eventdata, handles)
% hObject    handle to editKelompok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editKelompok as text
%        str2double(get(hObject,'String')) returns contents of editKelompok as a double


% --- Executes during object creation, after setting all properties.
function editKelompok_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editKelompok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
