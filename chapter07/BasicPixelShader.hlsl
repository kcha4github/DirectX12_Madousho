#include "BasicType.hlsli"
Texture2D<float4> tex:register(t0);
SamplerState smp:register(s0);

float4 BasicPS(BasicType input) : SV_TARGET
{
	return float4(input.normal.xyz, 1);
	//return float4(0, 0, 0, 1);
	//return float4(tex.Sample(smp,input.uv));
}