#include "BasicType.hlsli"
Texture2D<float4> tex:register(t0);//0�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`���i�x�[�X�j
Texture2D<float4> sph:register(t1);//1�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`���i��Z�j
Texture2D<float4> spa:register(t2);//2�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`���i���Z�j

SamplerState smp:register(s0);

float4 BasicPS(BasicType input) : SV_TARGET
{
	float3 light = normalize(float3(1, -1, 1)); // �E���������̌����x�N�g��
	float brightness = dot(-light, input.normal);
	//float2 normalUV = (input.normal.xy + float2(1, -1)) * float2(0.5, -0.5);

	//�X�t�B�A�}�b�v�pUV
	float2 sphereMapUV = input.vnormal.xy;
	sphereMapUV = (sphereMapUV + float2(1, -1)) * float2(0.5, -0.5);

	float4 texColor = tex.Sample(smp, input.uv);//�e�N�X�`���J���[

	return float4(brightness, brightness, brightness, 1)
		* diffuse //�f�B�t���[�Y�F
		* texColor //�e�N�X�`���J���[
		* sph.Sample(smp, sphereMapUV)//�X�t�B�A�}�b�v�i��Z�j
		+ spa.Sample(smp, sphereMapUV)//�X�t�B�A�}�b�v�i���Z�j
		+ float4(texColor*ambient, 1);
	//return float4(0, 0, 0, 1);
	//return float4(tex.Sample(smp,input.uv));
}