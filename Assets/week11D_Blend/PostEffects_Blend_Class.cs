using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PostEffects_Blend_Class : MonoBehaviour
{
    Material myMaterial;
    Shader myShader;
    public Texture2D BlendTex;

    // Start is called before the first frame update
    void Start()
    {
        myShader = Shader.Find("My/PostEffects/Blend_Class");
        myMaterial = new Material(myShader);
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        myMaterial.SetTexture("_BlendTex", BlendTex);
        Graphics.Blit(source, destination, myMaterial, 0);
    }

    private void OnDisable()
    {
        if (myMaterial)
        {
            DestroyImmediate(myMaterial);
        }
    }
}
