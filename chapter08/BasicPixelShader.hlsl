#include "BasicType.hlsli"
Texture2D<float4> tex:register(t0);//0番スロットに設定されたテクスチャ（ベース）
Texture2D<float4> sph:register(t1);//1番スロットに設定されたテクスチャ（乗算）

SamplerState smp:register(s0);

float4 BasicPS(BasicType input) : SV_TARGET
{
	float3 light = normalize(float3(1, -1, 1)); // 右下奥向きの光源ベクトル
	float brightness = dot(-light, input.normal);
	float2 normalUV = (input.normal.xy + float2(1, -1)) * float2(0.5, -0.5);
	return float4(brightness, brightness, brightness, 1) 
		* diffuse //ディフューズ色
		* tex.Sample(smp, input.uv) //テクスチャカラー
		* sph.Sample(smp, normalUV);
	//return float4(0, 0, 0, 1);
	//return float4(tex.Sample(smp,input.uv));
}