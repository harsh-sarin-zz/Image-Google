function varargout = imagegui(varargin)
%IMAGEGUI M-file for imagegui.fig
%      IMAGEGUI, by itself, creates a new IMAGEGUI or raises the existing
%      singleton*.
%
%      H = IMAGEGUI returns the handle to a new IMAGEGUI or the handle to
%      the existing singleton*.
%
%      IMAGEGUI('Property','Value',...) creates a new IMAGEGUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to imagegui_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      IMAGEGUI('CALLBACK') and IMAGEGUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in IMAGEGUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imagegui

% Last Modified by GUIDE v2.5 25-Nov-2014 23:57:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imagegui_OpeningFcn, ...
                   'gui_OutputFcn',  @imagegui_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before imagegui is made visible.
function imagegui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for imagegui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imagegui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imagegui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.*','Select the image file');
 image_path = fullfile(PathName,FileName);
 load('categories','categories');
getResults(image_path,'/Users/Harsh/Desktop/database', categories);