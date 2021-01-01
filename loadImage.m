function [numImage,img] = loadImage( strImagePath )

structImages = dir(strImagePath);
lenImages = length(structImages);
Images='';

if (lenImages==0)
    disp('Error: No image was detected in the Image Folder');
    return;
end

i=0;
for j = 3:lenImages
    if ((~structImages(j).isdir))
        if  (structImages(j).name(end-3:end)=='.jpg')
            i=i+1;
            Images{i,1} = [strImagePath,'\',structImages(j).name];
        end
    end
end
numImage = i;

imageSize = [280,180];

img = zeros(imageSize(1)*imageSize(2),numImage);
for i = 1:numImage
    aa = imresize(faceDetection(imresize(imread(Images{i,1}),[375,300])),imageSize);
    img(:,i) = aa(:);
    disp(sprintf('Loading Image # %d',i));
end
meanImage = mean(img,2);

img = (img - meanImage*ones(1,numImage))';
end

