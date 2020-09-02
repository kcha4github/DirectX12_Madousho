#include "BasicType.hlsli"
Texture2D<float4> tex:register(t0);//0番スロットに設定されたテクスチャ（ベース）
Texture2D<float4> sph:register(t1);//1番スロットに設定されたテクスチャ（乗算）

SamplerState smp:register(s0);

float4 BasicPS(BasicType input) : SV_TARGET
{
	float3 light = normalize(float3(1, -1, 1)); // 右下奥向きの光源ベクトル
	float brightness = dot(-light, input.normal);
	return float4(brightness, brightness, brightness, 1) * diffuse * tex.Sample(smp, input.uv);
	//return float4(0, 0, 0, 1);
	//return float4(tex.Sample(smp,input.uv));
}