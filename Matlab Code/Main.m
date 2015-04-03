function [ ] = Main( dirPath, categories)

categoriesCellStr = cellstr(categories);
imageSetInfo = TrainingSet(dirPath, categoriesCellStr);
[featureSetInfo, trainingImageSetInfo] = CategoryFeatureExtraction(imageSetInfo);
[clusterInfo, centroidInfo] = CombineCategoryFeatures(featureSetInfo);
trainingImageSetInfo = CreateBOF(trainingImageSetInfo, clusterInfo,centroidInfo);
bofAllImages = double(vertcat(trainingImageSetInfo.bof));
categories = vertcat(trainingImageSetInfo.category);
multisvm(bofAllImages,categories);
end

