Shader "My/Lambert/Starter2"
{
    Properties
    {
        
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
       

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf MyFunction noambient

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }

        float4 LightingMyFunction(SurfaceOutput s, float3 lightDir, float atten){
            float result = dot(s.Normal, lightDir); //내적. dot범위: -1 ~ 1
            result = result * 0.5 + 0.5; // 범위 : 0 ~ 1

            float4 final;
            final.rgb = result * s.Albedo;
            final.a = s.Alpha;
            // return float4(1, 0, 0, 1); 빨간색
            return final;
        
        }
        ENDCG
    }
    FallBack "Diffuse"
}
