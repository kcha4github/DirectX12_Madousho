struct BasicType {
	float4 svpos:SV_POSITION;//システム用頂点座標
	float4 pos:POSITION;//頂点座標
	float4 normal:NORMAL0;//法線ベクトル
	float4 vnormal:NORMAL1;//ビュー変換後の法線ベクトル
	float2 uv:TEXCOORD;//uv値
};

//定数バッファ0
cbuffer SceneData : register(b0) {
	matrix world; // ワールド変換行列
	matrix view; // ビュー行列
	matrix proj; // プロジェクション行列
};
//定数バッファ1
//マテリアル用
cbuffer Material : register(b1) {
	float4 diffuse;
	float4 specular;
	float3 ambient;
};
