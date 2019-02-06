function varargout = untitled(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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

function untitled_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

axes(handles.axes1);
imshow('C:\Users\afurk\Desktop\150224015robot_ödev1\KUKA_logo.png'); %logo arayuze aktarildi.
axes(handles.axes2);
imshow('C:\Users\afurk\Desktop\150224015robot_ödev1\KUKA_KR_5_sixx_R850.jpg');%robot resmini arayuze aktarýldý

guidata(hObject, handles);

function varargout = untitled_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)


function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function slider_q1_Callback(hObject, eventdata, handles)
%Sliderdan alinan datalar texte aktarýlmasi
angle=get(hObject,'Value'); 
set(handles.edit_q1,'string',num2str(angle)); 
guidata(hObject,handles);

function slider_q1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_q1_Callback(hObject, eventdata, handles)

edit=get(hObject,'string');
set(handles.slider,'value',str2num(edit));
guidata(hObject,handles);

function edit_q1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)

function edit5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)

function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function slider2_Callback(hObject, eventdata, handles)

function slider2_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider3_Callback(hObject, eventdata, handles)

function slider3_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider4_Callback(hObject, eventdata, handles)

function slider4_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider5_Callback(hObject, eventdata, handles)

function slider5_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider6_Callback(hObject, eventdata, handles)

function slider6_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function clear_Callback(hObject, eventdata, handles)
%Datalarin temizlenmesi
set(handles.edit_q1,'String','')
set(handles.edit_q2,'String','')
set(handles.edit_q3,'String','')
set(handles.edit_q4,'String','')
set(handles.edit_q5,'String','')
set(handles.edit_q6,'String','')

set(handles.trans_table,'Data','') %tablodaki degerler silindi.
set(handles.table_jac,'Data','')
set(handles.symbol_table,'Data','')

function calculate_Callback(hObject, eventdata, handles)

 L1=203; L2=75; L3=365; L4=90; L5=405; L6=80; %Robotun eklemlerinin uzunluklarý

q1= str2num(get(handles.edit_q1,'String'));    %Edit texteki stringi q1 e aktarimi
q2= str2num(get(handles.edit_q2,'String'));
q3= str2num(get(handles.edit_q3,'String'));
q4= str2num(get(handles.edit_q4,'String'));
q5= str2num(get(handles.edit_q5,'String'));
q6= str2num(get(handles.edit_q6,'String'));

if q1>=-170 && q1<=170     %Robotun sinirlari

T01 = [cosd(q1) -sind(q1)   0        0 ;
       sind(q1)   cosd(q1)    0        0 ;
           0           0        1      L1 ;
           0           0        0        1 ]
       
else
    msgbox('Robot Cannot Reach to Position!!!)','ERROR','Error');
       
end

if q2>=-190 && q2<=45

T12 = [cosd(q2-90) -sind(q2-90)   0        L2 ;
       0            0             1        0 ;
 -sind(q2-90)    -cosd(q2-90)     0       0 ;
           0           0        0        1 ]
       
else
    msgbox('Robot Cannot Reach to Position!!!)','ERROR','Error');
       
end


if q3>=-119 && q3<=165

T23 = [cosd(q3) -sind(q3)     0        L3 ;
       sind(q3)   cosd(q3)    0        0 ;
           0           0        1      0 ;
           0           0        0        1 ]
       
else
    msgbox('Robot Cannot Reach to Position!!!)','ERROR','Error');
       
end

if q4>=-190 && q4<=190

T34 = [cosd(q4) -sind(q4)      0        L4 ;
       0           0           1        L5 ;
   -sind(q4)     -cosd(q4)       0        0 ;
           0           0       0        1 ]
       
else
    msgbox('Robot Cannot Reach to Position!!!)','ERROR','Error');
       
end

if q5>=-120 && q5<=120

T45 = [cosd(q5) -sind(q5)      0        0 ;
       0           0           -1       0 ;
   sind(q5)     cosd(q5)       0        0 ;
           0           0       0        1 ]
       
else
    msgbox('Robot Cannot Reach to Position!!!)','ERROR','Error');
       
end

if q6>=-358 && q6<=358

T56 = [cosd(q6) -sind(q6)      0        0 ;
       0           0           1        L6 ;
   -sind(q6)     -cosd(q6)       0        0 ;
           0           0       0        1 ]
       
else
    msgbox('Robot Cannot Reach to Position!!!)','ERROR','Error');
       
end

T06 = T01*T12*T23*T34*T45*T56
set(handles.trans_table,'Data',T06);   %ileri kinematiginin tabloya aktarýlmasi.
 
 function edit_q2_Callback(hObject, eventdata, handles)

edit=get(hObject,'string');
set(handles.slider,'value',str2num(edit));
guidata(hObject,handles);

function edit_q2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_q3_Callback(hObject, eventdata, handles)

edit=get(hObject,'string');
set(handles.slider,'value',str2num(edit));
guidata(hObject,handles);

function edit_q3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_q4_Callback(hObject, eventdata, handles)

edit=get(hObject,'string');
set(handles.slider,'value',str2num(edit));
guidata(hObject,handles);

function edit_q4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_q5_Callback(hObject, eventdata, handles)

edit=get(hObject,'string');
set(handles.slider,'value',str2num(edit));
guidata(hObject,handles);

function edit_q5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_q6_Callback(hObject, eventdata, handles)

edit=get(hObject,'string');
set(handles.slider,'value',str2num(edit));
guidata(hObject,handles);

function edit_q6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function slider_q2_Callback(hObject, eventdata, handles)

angle=get(hObject,'Value');
set(handles.edit_q2,'string',num2str(angle));
guidata(hObject,handles);

function slider_q2_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider_q3_Callback(hObject, eventdata, handles)
angle=get(hObject,'Value');
set(handles.edit_q3,'string',num2str(angle));
guidata(hObject,handles);

    function slider_q3_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider_q4_Callback(hObject, eventdata, handles)
angle=get(hObject,'Value');
set(handles.edit_q4,'string',num2str(angle));
guidata(hObject,handles);

function slider_q4_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider_q5_Callback(hObject, eventdata, handles)

angle=get(hObject,'Value');
set(handles.edit_q5,'string',num2str(angle));
guidata(hObject,handles);

function slider_q5_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider_q6_Callback(hObject, eventdata, handles)

angle=get(hObject,'Value');
set(handles.edit_q6,'string',num2str(angle));
guidata(hObject,handles);

function slider_q6_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function edit18_Callback(hObject, eventdata, handles)

function edit18_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function jac_button_Callback(hObject, eventdata, handles)
%Sembolik olarak jacobiyen matrisi cikarilmasi
syms q1 q2 q3 q4 q5 q6;
syms L1 L2 L3 L4 L5 L6;

 T01 = [cos(q1)  -sin(q1)   0        0 ;
       sin(q1)   cos(q1)    0        0 ;
           0           0        1      L1 ;
           0           0        0        1 ]
       
       
T12 = [cos(q2-(pi/2)) -sin(q2-(pi/2))   0        L2 ;
       0            0             1        0 ;
 -sin(q2-(pi/2))    -cos(q2-(pi/2))     0       0 ;
           0           0        0        1 ]

       
T23 = [cos(q3)  -sin(q3)     0        L3 ;
       sin(q3)   cos(q3)    0        0 ;
           0           0        1      0 ;
           0           0        0        1 ]
       
       
T34 = [cos(q4) -sin(q4)      0        L4 ;
       0           0           1        L5 ;
   -sin(q4)     -cos(q4)       0        0 ;
           0           0       0        1 ]

       
       
T45 = [cos(q5) -sin(q5)      0        0 ;
       0           0           -1       0 ;
   sin(q5)     cos(q5)       0        0 ;
           0           0       0        1 ]
       

T56 = [cos(q6) -sin(q6)      0        0 ;
       0           0           1        L6 ;
   -sin(q6)     -cos(q6)       0        0 ;
           0           0       0        1 ]
       
     
 T06=T01*T12*T23*T34*T56
 pos=T06(1:3,4)
 %%Jacobiyen %%
 Vx_q1=diff(pos(1,1),q1);%Hizlardan olusan jacobiyen matrisi icin pozisyon matrisini degiskenlere gore turevi alinir
 Vx_q2=diff(pos(1,1),q2);
 Vx_q3=diff(pos(1,1),q3);
 Vx_q4=diff(pos(1,1),q4);
 Vx_q5=diff(pos(1,1),q5);
 Vx_q6=diff(pos(1,1),q6);
 Vy_q1=diff(pos(2,1),q1);
 Vy_q2=diff(pos(2,1),q2);
 Vy_q3=diff(pos(2,1),q3);
 Vy_q4=diff(pos(2,1),q4);
 Vy_q5=diff(pos(2,1),q5);
 Vy_q6=diff(pos(2,1),q6);
 Vz_q1=diff(pos(3,1),q1);
 Vz_q2=diff(pos(3,1),q2);
 Vz_q3=diff(pos(3,1),q3);
 Vz_q4=diff(pos(3,1),q4);
 Vz_q5=diff(pos(3,1),q5);
 Vz_q6=diff(pos(3,1),q6);
 
 V_jac=[Vx_q1 Vx_q2 Vx_q3 Vx_q4 Vx_q5  Vx_q6;
        Vy_q1 Vy_q2 Vy_q3 Vy_q4 Vy_q5  Vy_q6;
        Vz_q1 Vz_q2 Vz_q3 Vz_q4 Vz_q5  Vz_q6  ] 
    
 V_jacstr=arrayfun(@char,V_jac,'uniform',0)
 
 i3=[0;0;1];
 R01=T01(1:3,1:3);
 T02=T01*T12;
 R02=T02(1:3,1:3);
 T03=T01*T12*T23;
 R03=T03(1:3,1:3);
 T04=T01*T12*T23*T34;
 R04=T04(1:3,1:3);
 T05=T01*T12*T23*T34*T45;
 R05=T05(1:3,1:3);
 R06=T06(1:3,1:3);
 
 Jw_q1=R01*i3  %acisal hizlardan olusan jacobiyen matrisini bulunmasi
 Jw_q2=R02*i3;
 Jw_q3=R03*i3;
 Jw_q4=R04*i3;
 Jw_q5=R05*i3;
 Jw_q6=R06*i3;
 
 W_jac=[Jw_q1 Jw_q2 Jw_q3 Jw_q4 Jw_q5 Jw_q6];
 W_jacstr=arrayfun(@char,V_jac,'uniform',0);
 
 matris_jac=[V_jacstr;W_jacstr];   
 
 set(handles.table_jac,'Data',matris_jac) %sembolik olarak jacobiyen matrisinin tabloya aktarilmasi
 
function symbol_jac_Callback(hObject, eventdata, handles)
      L1=203; L2=75; L3=365; L4=90; L5=405; L6=80;
      syms Q1 Q2 Q3 Q4 Q5 Q6;
      
      T01 = [cos(Q1)  -sin(Q1)   0        0 ;
       sin(Q1)   cos(Q1)    0        0 ;
           0           0        1      L1 ;
           0           0        0        1 ]
       
       
T12 = [cos(Q2-(pi/2)) -sin(Q2-(pi/2))   0        L2 ;
       0            0             1        0 ;
 -sin(Q2-(pi/2))    -cos(Q2-(pi/2))     0       0 ;
           0           0        0        1 ]

       
T23 = [cos(Q3)  -sin(Q3)     0        L3 ;
       sin(Q3)   cos(Q3)    0        0 ;
           0           0        1      0 ;
           0           0        0        1 ]
       
       
T34 = [cos(Q4) -sin(Q4)      0        L4 ;
       0           0           1        L5 ;
   -sin(Q4)     -cos(Q4)       0        0 ;
           0           0       0        1 ]

       
       
T45 = [cos(Q5) -sin(Q5)      0        0 ;
       0           0           -1       0 ;
   sin(Q5)     cos(Q5)       0        0 ;
           0           0       0        1 ]
       

T56 = [cos(Q6) -sin(Q6)      0        0 ;
       0           0           1        L6 ;
   -sin(Q6)     -cos(Q6)       0        0 ;
           0           0       0        1 ]
       
     
 T06=T01*T12*T23*T34*T56
 pos=T06(1:3,4)
 %%Jacobiyen %%
 Vx_q1=diff(pos(1,1),Q1);
 Vx_q2=diff(pos(1,1),Q2);
 Vx_q3=diff(pos(1,1),Q3);
 Vx_q4=diff(pos(1,1),Q4);
 Vx_q5=diff(pos(1,1),Q5);
 Vx_q6=diff(pos(1,1),Q6);
 Vy_q1=diff(pos(2,1),Q1);
 Vy_q2=diff(pos(2,1),Q2);
 Vy_q3=diff(pos(2,1),Q3);
 Vy_q4=diff(pos(2,1),Q4);
 Vy_q5=diff(pos(2,1),Q5);
 Vy_q6=diff(pos(2,1),Q6);
 Vz_q1=diff(pos(3,1),Q1);
 Vz_q2=diff(pos(3,1),Q2);
 Vz_q3=diff(pos(3,1),Q3);
 Vz_q4=diff(pos(3,1),Q4);
 Vz_q5=diff(pos(3,1),Q5);
 Vz_q6=diff(pos(3,1),Q6);
 
 V_jac=[Vx_q1 Vx_q2 Vx_q3 Vx_q4 Vx_q5  Vx_q6;
        Vy_q1 Vy_q2 Vy_q3 Vy_q4 Vy_q5  Vy_q6;
        Vz_q1 Vz_q2 Vz_q3 Vz_q4 Vz_q5  Vz_q6  ] 
    
    
    i3=[0;0;1];
 R01=T01(1:3,1:3);
 T02=T01*T12;
 R02=T02(1:3,1:3);
 T03=T01*T12*T23;
 R03=T03(1:3,1:3);
 T04=T01*T12*T23*T34;
 R04=T04(1:3,1:3);
 T05=T01*T12*T23*T34*T45;
 R05=T05(1:3,1:3);
 R06=T06(1:3,1:3);
 
 Jw_q1=R01*i3
 Jw_q2=R02*i3;
 Jw_q3=R03*i3;
 Jw_q4=R04*i3;
 Jw_q5=R05*i3;
 Jw_q6=R06*i3;
 
 W_jac=[Jw_q1 Jw_q2 Jw_q3 Jw_q4 Jw_q5 Jw_q6];
 matris_jac=[V_jac;W_jac]
 
q1= str2num(get(handles.edit_q1,'String'));
q2= str2num(get(handles.edit_q2,'String'));
q3= str2num(get(handles.edit_q3,'String'));
q4= str2num(get(handles.edit_q4,'String'));
q5= str2num(get(handles.edit_q5,'String'));
q6= str2num(get(handles.edit_q6,'String'));

Q_matrix=[Q1 Q2 Q3 Q4 Q5 Q6 ]; 
q_matrix=[q1 q2 q3 q4 q5 q6];

ret_jac=subs(matris_jac,Q_matrix,q_matrix); %Q degiskenini edit textlerden aldigimiz q degiskenine atanmasi
jac_num=double(ret_jac); 

set(handles.symbol_table,'Data',jac_num);%matrisin tabloya aktarimi
