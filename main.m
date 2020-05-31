% This is a sample script
% It demos the face expression recognition using the Eigenface method

disp('Face Emotion Recognition, by:')
disp('Fauzan Akmah H')
disp('Asep Budiyana M (029)')
disp('Shania Salsabila')
disp('Natasya Rizki Maharani')
disp('Nurul Maarif')
%disp('After your face appeared in the camera window, please left click your mouse to take a picture of youself')
%disp('Please save your cute picture to D:\Direktori Blablabla\TestImage')

%pictureCapture

%TrainImagePath = 'TrainingImage';
%TestImagePath = 'TestImage';
%LabelPath = 'ImageLabel.txt';

TrainImagePath = 'TrainData';
TestImagePath = 'TestData';
LabelPath = 'Labelling.txt';

[NumTrainImg,TrainImg] = loadImage( TrainImagePath );
[NumTestImg,TestImg] = loadImage( TestImagePath );

[C,minDist,minDistIndex] = eigenFaceRecognition(TrainImg,TestImg,NumTrainImg,NumTestImg );

% Display the result
RecognizedExpression = strcat(int2str(minDistIndex),'.jpg');
    
    % read in the image label
    fid=fopen(LabelPath);
    imageLabel=textscan(fid,'%s %s','whitespace',',');
    fclose(fid);
    
    % export the matched label
    Best_Match = cell2mat(imageLabel{1,1}(minDistIndex));
    ExprLabel = cell2mat(imageLabel{1,2}(minDistIndex));

str1 = strcat('Emosi mu seperti gambar ini:  ',RecognizedExpression);
str2 = strcat('Berarti emosi kamu:  ',ExprLabel);
disp(str1)
disp(str2)

figure,imshow('TestData/captured.jpg');
str3 = strcat('Emosi Kamu : ',ExprLabel);
title(str3);
%SelectedImage = strcat(TrainImagePath,'\',RecognizedExpression);
%SelectedImage = imread(SelectedImage);
%imshow(SelectedImage)