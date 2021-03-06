Feat_Types = [1 3];
Methods = {'NULL' 'CS' 'OLS' 'PLS' 'PCA'};
Quality_Type = {'M'};

%{
for t = 1:length(Feat_Types)
    for m = 1:length(Methods)
        test_GenericModel_specific_quality(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Types(t), Quality_Type, 'L', Methods{m});
    end
end



% for t = 1:length(Feat_Types)
    for m = 1:length(Methods)
        test_GenericModel_fusion_specific_quality(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Types, Quality_Type, 'L', Methods{m});
    end
% end

%}

for t = 1:length(Feat_Types)
    for m = 1:length(Methods)
        test_GenericModel_withSubNum_specific_quality(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Types(t), Quality_Type, 'L', Methods{m});
    end
end
%{
for m = 1:length(Methods)
    test_GenericModel_withSubNum_fusion_specific_quality(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Types, Quality_Type, 'L', Methods{m});
end
%}