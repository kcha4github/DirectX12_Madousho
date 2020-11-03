#include "BasicType.hlsli"

struct Output {
	float4 svpos:SV_POSITION;//システム用頂点座標
	float4 pos:POSITION;//頂点座標
	float4 normal:NORMAL0;//法線ベクトル
	float4 vnormal:NORMAL1;//ビュー変換後の法線ベクトル
	float2 uv:TEXCOORD;//uv値
};

BasicType BasicVS(float4 pos : POSITION, float4 normal : NORMAL, float2 uv:TEXCOORD)
{
	BasicType output;
	pos = mul(world, pos);
	output.svpos = mul(mul(proj, view), pos); // シェーダーでは列優先
	output.pos = mul(view, pos);
	normal.w = 0; // 平行移動成分を無効にする
	output.normal = mul(world, normal);
	output.vnormal = mul(view, output.normal);
	output.uv = uv;

	return output;
}
