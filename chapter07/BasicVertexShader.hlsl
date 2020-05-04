#include "BasicType.hlsli"
// �萔�o�b�t�@�[
cbuffer cbuff0 : register(b0) {
	matrix mat; // �ϊ��s��
}

BasicType BasicVS(float4 pos : POSITION, float4 normal : NORMAL, float2 uv:TEXCOORD, min16uint2 boneno:BONE_NO, min16uint weight:WEIGHT)
{
	BasicType output;
	output.svpos = mul(mat, pos);
	output.uv = uv;
	return output;
}
