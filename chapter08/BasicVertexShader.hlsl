#include "BasicType.hlsli"
// �萔�o�b�t�@�[
BasicType BasicVS(float4 pos : POSITION, float4 normal : NORMAL, float2 uv:TEXCOORD, min16uint2 boneno:BONE_NO, min16uint weight:WEIGHT)
{
	BasicType output;
	output.svpos = mul(mul(viewproj, world), pos); // �V�F�[�_�[�ł͗�D��
	normal.w = 0; // ���s�ړ������𖳌��ɂ���
	output.normal = mul(world, normal);
	output.uv = uv;
	return output;
}
