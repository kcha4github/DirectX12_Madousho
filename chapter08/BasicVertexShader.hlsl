#include "BasicType.hlsli"

struct Output {
	float4 svpos:SV_POSITION;//�V�X�e���p���_���W
	float4 pos:POSITION;//���_���W
	float4 normal:NORMAL0;//�@���x�N�g��
	float4 vnormal:NORMAL1;//�r���[�ϊ���̖@���x�N�g��
	float2 uv:TEXCOORD;//uv�l
	float3 ray:VECTOR;//�x�N�g��
};

BasicType BasicVS(float4 pos : POSITION, float4 normal : NORMAL, float2 uv:TEXCOORD)
{
	BasicType output;
	pos = mul(world, pos);
	output.svpos = mul(mul(proj, view), pos); // �V�F�[�_�[�ł͗�D��
	output.pos = mul(view, pos);
	normal.w = 0; // ���s�ړ������𖳌��ɂ���
	output.normal = mul(world, normal);
	output.vnormal = mul(view, output.normal);
	output.uv = uv;
	output.ray = normalize(pos.xyz - mul(view, eye));//�����x�N�g��

	return output;
}
