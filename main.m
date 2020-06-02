disp('========================')
disp('Face Emotion Recognition')
disp('========================')
disp('By:')
disp('Fauzan Akmah Hariz - 140181080005')
disp('Asep Budiyana Muharam - 140810180029')
disp('Natasya Rizki Maharani - 140810180004')
disp('Shania Salsabila - 140810180014')
disp('Nurul Maarif - 140810180040')
%disp('Save your picture to TestData')

TrainImagePath = 'TrainData';
TestImagePath = 'TestData';
LabelPath = 'Labelling.txt';

[NumTrainImg,TrainImg] = loadImage( TrainImagePath );
[NumTestImg,TestImg] = loadImage( TestImagePath );

[C,minDist,minDistIndex] = eigenFaceRecognition(TrainImg,TestImg,NumTrainImg,NumTestImg );

% Menampilkan hasil
RecognizedExpression = strcat(int2str(minDistIndex),'.jpg');
    
    % Membaca labelling.txt
    fid=fopen(LabelPath);
    imageLabel=textscan(fid,'%s %s','whitespace',',');
    fclose(fid);
    
    % Mengluarkan foto yang cocok
    Best_Match = cell2mat(imageLabel{1,1}(minDistIndex));
    ExprLabel = cell2mat(imageLabel{1,2}(minDistIndex));

str1 = strcat('Emosi Mu Seperti Gambar Ini:  ',RecognizedExpression);
str2 = strcat('Berarti Emosi Kamu:  ',ExprLabel);
disp(str1)
disp(str2)

figure,imshow('TestData/captured.jpg');
str3 = strcat('Emosi Kamu : ',ExprLabel);
title(str3);
%SelectedImage = strcat(TrainImagePath,'\',RecognizedExpression);
%SelectedImage = imread(SelectedImage);
%imshow(SelectedImage)