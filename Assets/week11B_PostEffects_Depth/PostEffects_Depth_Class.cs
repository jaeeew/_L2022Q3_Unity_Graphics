using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PostEffects_Depth_Class : MonoBehaviour
{

    Material myMaterial;
    Shader myShader;

    public float depth = 1f;

    void Start()
    {
        myShader = Shader.Find("My/PostEffects/Depth_Class");
        myMaterial = new Material(myShader);

    }
    private void Update()
    {
        depth = Mathf.Clamp(depth, 0.0f, 1.0f);
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        
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
