function [] = findFace(handles)
if ~isfield(handles, 'cam')
    warndlg('Start camera terlebih dahulu!') ;
    return
end

cam = handles.cam;
hImage = image(zeros(480, 640, 3), 'parent', handles.axes2);
preview(cam, hImage);

faceDetector = vision.CascadeObjectDetector;
NotYet = false;
while ~NotYet
    pause(2);
    I = snapshot(cam);
    disp('mengambil snapshot. melakukan pencarian orang buff ....')
    bboxes = step(faceDetector, I);
    if ~isempty(bboxes)
        NotYet = true;
        disp('Buff ditemukan!');
        break;
    end
    disp('Tidak ada wajah :(, mengulang...');
end
closePreview(cam);
clear('cam');
IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, 'Wajah');
handles.axes2, imshow(IFaces), title('Buff Terdeteksi');