if matlabpool('size')<=0 %�жϲ��м��㻷���Ƿ���Ȼ����
    matlabpool('open','local',4); %����δ���������������л���
else
    disp('Already initialized'); %˵�����л����Ѿ�������
end

Feat_Types = [1 3];
Methods = {'CS' 'OLS' 'PLS' 'PCA'};

for m = 4:4
    for t = 1:1 % length(Feat_Types)
        %    for m = 1:length(Methods)
        train_PSModels_withSubNum(Feats_train_SL, Labels_train_SL, Feats_devel_SL, Labels_devel_SL, Feats_test_SL, Labels_test_SL, Feat_Types(t), Methods{m});

        % train_PSModels_fusion_withSubNum(Feats_train_SL, Labels_train_SL, Feats_devel_SL, Labels_devel_SL, Feats_test_SL, Labels_test_SL, Feat_Types, Methods{m});
    end
    train_PSModels_withSubNum_fusion(Feats_train_SL, Labels_train_SL, Feats_devel_SL, Labels_devel_SL, Feats_test_SL, Labels_test_SL, Feat_Types, Methods{m});
end

% train_FRModels(Feats_train_SL, Labels_train_SL, Feats_devel_SL, Labels_devel_SL, Feats_test_SL, Labels_test_SL, Feat_Types(t));
% end
% train_PSModels_withSubNum_fusion(Feats_train_SL, Labels_train_SL, Feats_devel_SL, Labels_devel_SL, Feats_test_SL, Labels_test_SL, Feat_Types);
