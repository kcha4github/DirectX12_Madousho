struct Output {
	float4 pos:POSITION;
	float4 svpos:SV_POSITION;
};


//float4 BasicVS( float4 pos : POSITION ) : SV_POSITION
//{
//	return pos;
//}
Output BasicVS(float4 pos : POSITION)
{
	Output output;
	output.pos = pos;
	output.svpos = pos;
	return output;
}
