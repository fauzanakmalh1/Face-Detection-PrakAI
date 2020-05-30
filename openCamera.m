function [] = openCamera(hObject, handles)

C = webcamlist;
cam=webcam(C{1});
%triggerconfig(cam, 'manual');
hImage = image(zeros(480, 640, 3), 'parent', handles.axes2);
preview(cam, hImage);

handles.cam = cam;
guidata(hObject, handles);