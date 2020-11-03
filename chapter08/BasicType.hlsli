struct BasicType {
	float4 svpos:SV_POSITION;//�V�X�e���p���_���W
	float4 pos:POSITION;//���_���W
	float4 normal:NORMAL0;//�@���x�N�g��
	float4 vnormal:NORMAL1;//�r���[�ϊ���̖@���x�N�g��
	float2 uv:TEXCOORD;//uv�l
};

//�萔�o�b�t�@0
cbuffer SceneData : register(b0) {
	matrix world; // ���[���h�ϊ��s��
	matrix view; // �r���[�s��
	matrix proj; // �v���W�F�N�V�����s��
};
//�萔�o�b�t�@1
//�}�e���A���p
cbuffer Material : register(b1) {
	float4 diffuse;
	float4 specular;
	float3 ambient;
};
