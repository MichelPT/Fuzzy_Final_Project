function varargout = FIGDiabetes(varargin)
% FIGDIABETES MATLAB code for FIGDiabetes.fig
%      FIGDIABETES, by itself, creates a new FIGDIABETES or raises the existing
%      singleton*.
%
%      H = FIGDIABETES returns the handle to a new FIGDIABETES or the handle to
%      the existing singleton*.
%
%      FIGDIABETES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIGDIABETES.M with the given input arguments.
%
%      FIGDIABETES('Property','Value',...) creates a new FIGDIABETES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FIGDiabetes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FIGDiabetes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FIGDiabetes

% Last Modified by GUIDE v2.5 12-Jun-2023 23:21:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FIGDiabetes_OpeningFcn, ...
                   'gui_OutputFcn',  @FIGDiabetes_OutputFcn, ...
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


% --- Executes just before FIGDiabetes is made visible.
function FIGDiabetes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FIGDiabetes (see VARARGIN)

% Choose default command line output for FIGDiabetes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FIGDiabetes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FIGDiabetes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function umurInput_Callback(hObject, eventdata, handles)
% hObject    handle to umurInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
umur = str2double(get(hObject, 'string'));
handles.umurInput = umur;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of umurInput as text
%        str2double(get(hObject,'String')) returns contents of umurInput as a double


% --- Executes during object creation, after setting all properties.
function umurInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to umurInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bbInput_Callback(hObject, eventdata, handles)
% hObject    handle to bbInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bb = str2double(get(hObject, 'string'));
handles.bbInput = bb;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of bbInput as text
%        str2double(get(hObject,'String')) returns contents of bbInput as a double


% --- Executes during object creation, after setting all properties.
function bbInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bbInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tdInput_Callback(hObject, eventdata, handles)
% hObject    handle to tdInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
td = str2double(get(hObject, 'string'));
handles.tdInput = td;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of tdInput as text
%        str2double(get(hObject,'String')) returns contents of tdInput as a double


% --- Executes during object creation, after setting all properties.
function tdInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tdInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
a = readfis('FISDiabetes');
output = evalfis([handles.umurInput handles.bbInput handles.tdInput],a);
if output<0.75
    output='Sangat rendah';
else if output<1
        output='Rendah';
    else if output<3
            output='Menengah';
        else if output<4
                output='Tinggi';
            else 
                output='Sangat Tinggi';
            end
        end
    end
end
set(handles.result,'string', output);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function text21_CreateFcn(hObject, eventdata, handles)

% hObject    handle to text21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
