function [ clusterIndex, centroidVector ] = CombineCategoryFeatures( featureSetInfo )

combinedFeatureSet = vertcat(featureSetInfo.feature);
k = 800;
[clusterIndex, centroidVector] = kmeans(combinedFeatureSet, k);
kd = KDTreeSearcher(centroidVector);
save('KD','kd');
end

