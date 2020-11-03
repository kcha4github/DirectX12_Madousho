#include "BasicType.hlsli"
Texture2D<float4> tex:register(t0);//0�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`���i�x�[�X�j
Texture2D<float4> sph:register(t1);//1�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`���i��Z�j
Texture2D<float4> spa:register(t2);//2�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`���i���Z�j

SamplerState smp:register(s0);

float4 BasicPS(BasicType input) : SV_TARGET
{
	float3 light = normalize(float3(1, -1, 1)); // �E���������̌����x�N�g��

	// �f�B�t���[�Y�v�Z
	float diffuseB = saturate(dot(-light, input.normal));

	//���̔��˃x�N�g��
	float3 refLight = normalize(reflect(light, input.normal.xyz));
	float specularB = pow(saturate(dot(refLight, -input.ray)), specular.a);

	//�X�t�B�A�}�b�v�pUV
	float2 sphereMapUV = input.vnormal.xy;
	sphereMapUV = (sphereMapUV + float2(1, -1)) * float2(0.5, -0.5);

	float4 texColor = tex.Sample(smp, input.uv);//�e�N�X�`���J���[

	return max(saturate(diffuseB //�P�x
		* diffuse //�f�B�t���[�Y�F
		* texColor //�e�N�X�`������[
		* sph.Sample(smp, sphereMapUV)) //�X�t�B�A�}�b�v�i��Z�j
		+ saturate(spa.Sample(smp, sphereMapUV) * texColor //�X�t�B�A�}�b�v�i���Z�j
		+ float4(specularB * specular.rgb, 1)) //�X�y�L����
		, float4(texColor * ambient, 1)); //�A���r�G���g
}