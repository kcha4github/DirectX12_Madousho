#include "BasicType.hlsli"
Texture2D<float4> tex:register(t0);//0番スロットに設定されたテクスチャ（ベース）
Texture2D<float4> sph:register(t1);//1番スロットに設定されたテクスチャ（乗算）
Texture2D<float4> spa:register(t2);//2番スロットに設定されたテクスチャ（加算）

SamplerState smp:register(s0);

float4 BasicPS(BasicType input) : SV_TARGET
{
	float3 light = normalize(float3(1, -1, 1)); // 右下奥向きの光源ベクトル

	// ディフューズ計算
	float diffuseB = saturate(dot(-light, input.normal));

	//光の反射ベクトル
	float3 refLight = normalize(reflect(light, input.normal.xyz));
	float specularB = pow(saturate(dot(refLight, -input.ray)), specular.a);

	//スフィアマップ用UV
	float2 sphereMapUV = input.vnormal.xy;
	sphereMapUV = (sphereMapUV + float2(1, -1)) * float2(0.5, -0.5);

	float4 texColor = tex.Sample(smp, input.uv);//テクスチャカラー

	return max(saturate(diffuseB //輝度
		* diffuse //ディフューズ色
		* texColor //テクスチャからー
		* sph.Sample(smp, sphereMapUV)) //スフィアマップ（乗算）
		+ saturate(spa.Sample(smp, sphereMapUV) * texColor //スフィアマップ（加算）
		+ float4(specularB * specular.rgb, 1)) //スペキュラ
		, float4(texColor * ambient, 1)); //アンビエント
}