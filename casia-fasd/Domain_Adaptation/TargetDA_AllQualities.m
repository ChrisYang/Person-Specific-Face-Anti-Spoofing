function TargetDA_AllQualities(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Type, method)
%TARGETDA_ALLQUALITIES Summary of this function goes here
%   Detailed explanation goes here

if matlabpool('size')<=0 %�жϲ��м��㻷���Ƿ���Ȼ����
    matlabpool('open','local',12); %����δ���������������л���
else
    disp('Already initialized'); %˵�����л����Ѿ�������
end

global Transform;
global Transform_CS;
name = {'MsLBP' 'LBP' 'HOG' 'LPQ'};

QualityTypes = {'HN' 'MN' 'LN'}

if ~strcmp(method, 'CS') && ~strcmp(method, 'PCA')
    T = load(strcat('..\Estimate_Transfomration_for_Expe\Transform_HP_HP_', name{Feat_Type}, '_', method, '.mat'));
    Transform = T.Transform;
    
    T = load(strcat('..\Estimate_Transfomration_for_Expe\Transform_HP_HP_', name{Feat_Type}, '_', 'CS', '.mat'));
    Transform_CS = T.Transform;
else
    T = load(strcat('..\Estimate_Transfomration_for_Expe\Transform_HP_HP_', name{Feat_Type}, '_', method, '.mat'));
    Transform = T.Transform;
end

for i = 1:3
    if ~strcmp(method, 'PCA')
        TargetDA(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Type, QualityTypes{i}, method);
        % TargetDAwithSubNum(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Type, QualityTypes{i}, method);
    else
        TargetDA_PCA_withSubNum(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Type, QualityTypes{i}, method);        
    end
end

end

