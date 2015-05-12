%{
if matlabpool('size')<=0 %�жϲ��м��㻷���Ƿ���Ȼ����
    matlabpool('open','local',4); %����δ���������������л���
else
    disp('Already initialized'); %˵�����л����Ѿ�������
end
%}

Feat_Types = [1 3];
Methods = {'NULL' 'CS' 'OLS' 'PLS' 'PCA'};
Quality_Type = {'M'};

%{
for t = 1:length(Feat_Types)
    for m = 2:length(Methods)
        train_GenericModel_sep_specific_quality(Feats_train_SL, Labels_train_SL, Feats_devel_SL, Labels_devel_SL, Feats_test_SL, Labels_test_SL, ...
    Feats_enroll_SL, Labels_enroll_SL, Feat_Types(t), Methods{m});
    end
end


for m = 2:length(Methods)
    train_GenericModel_fusion_specific_quality(Feats_train_SL, Labels_train_SL, Feats_devel_SL, Labels_devel_SL, Feats_test_SL, Labels_test_SL, ...
    Feats_enroll_SL, Labels_enroll_SL, Feat_Types, Methods{m});
end
%}

% train models with subject number

for t = 1:1 % length(Feat_Types)
    for m = 2:3 % 4:length(Methods)
        train_GenericModel_withSubNum_specific_quality(Feats_train_SL, Labels_train_SL, Feats_devel_SL, Labels_devel_SL, Feats_test_SL, Labels_test_SL, ...
    Feats_enroll_SL, Labels_enroll_SL, Feat_Types(t), Methods{m});
    end
end

%{
for m = 1:length(Methods)
    train_GenericModel_withSubNum_fusion_specific_quality(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Types, Quality_Type, Methods{m});
end
%}

