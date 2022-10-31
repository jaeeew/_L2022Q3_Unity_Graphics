Shader "My/Lambert/2Pass"
{
    Properties
    {

        _MainTex("Albedo (RGB)", 2D) = "white" {}

    }
        SubShader
    {
        Tags { "RenderType" = "Opaque" }


        /*// 1 pass : CGPROGRAM ~ ENDCG
        cull front // ���� rendering X

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf NoLight noambient

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };




        void surf(Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }

        void vert(inout appdata_full v) // ������
        {
            v.vertex.xyz += v.normal.xyz * 0.001; // 1pass���� �׷��� ���� 0.001��ŭ ŭ
        
        }

        float4 LightingNoLight(SurfaceOutput s, float3 lightDir, float atten)
        {
            return float4(0, 0, 0, 1);

        }
        ENDCG */


         /*   // 2 pass : CGPROGRAM ~ ENDCG
           cull back // �޸� rendering X. ���� ���̰�

             CGPROGRAM
            // Physically based Standard lighting model, and enable shadows on all light types
            #pragma surface surf Lambert

// Use shader model 3.0 target, to get nicer looking lighting
#pragma target 3.0

sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };




        void surf(Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }

        float4 LightingNoLight(SurfaceOutput s, float3 lightDir, float atten)
        {
            return float4(0, 0, 0, 1);

        }
        ENDCG
    }
        FallBack "Diffuse"

}

*/

// 2 pass : CGPROGRAM ~ ENDCG
cull back // �޸� rendering X. ���� ���̰�

CGPROGRAM
// Physically based Standard lighting model, and enable shadows on all light types
#pragma surface surf Toon

// Use shader model 3.0 target, to get nicer looking lighting
#pragma target 3.0

sampler2D _MainTex;

struct Input
{
    float2 uv_MainTex;
};




void surf(Input IN, inout SurfaceOutput o)
{
    // Albedo comes from a texture tinted by color
    fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
    o.Albedo = c.rgb;
    o.Alpha = c.a;
}

float4 LightingToon(SurfaceOutput s, float3 lightDir, float atten)
{
    float result = dot(s.Normal, lightDir) * 0.5 + 0.5;

    // else if�� �̿��� ���
    /*if (result > 0.7) {
        result = 0.7;
    }
    else if (result > 0.3) {
        result = 0.5;

    }
    else {
        result = 0.2;

    }
    */

    result = result * 5;
    result = ceil(result) / 5;

    return result;

}
ENDCG
    }
    FallBack "Diffuse"

}