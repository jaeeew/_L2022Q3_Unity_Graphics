Shader "MY/PostEffects/MultiPass_Class"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Grayness("Grayscale Amount", Range(0.0, 1.0)) = 1
    }
    SubShader
    {
        // No culling or depth
        //Cull Off ZWrite Off ZTest Always

        Pass
        {   Cull Off ZWrite Off ZTest Always
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;
            float _Grayness;

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                float grayness = col.r * 0.33 + col.g * 0.33 + col.b * 0.33;

                fixed4 finalColor = lerp(col, grayness, _Grayness);
                col.rgb = finalColor;
                return col;
            }
            ENDCG
        }

            Pass
        {   Cull Off ZWrite Off ZTest Always
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;
            float _Grayness;

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                float grayness = col.r * 0.33 + col.g * 0.33 + col.b * 0.33;

                fixed4 finalColor = lerp(col, grayness, _Grayness);
                col.rgb = finalColor;
                return col;
            }
            ENDCG
        }
    }
}
