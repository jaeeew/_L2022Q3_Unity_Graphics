using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class PostEffects_GrayScale_Class : MonoBehaviour
{
    Material myMaterial;
    Shader myShader;
    public float grayness;
    // Start is called before the first frame update
    void Start()
    {
        myShader = Shader.Find("My/PostEffects/GrayScale_Class");
        myMaterial = new Material(myShader);

    }
    private void Update()
    {
        grayness = Mathf.Clamp(grayness, 0.0f, 1.0f);
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        myMaterial.SetFloat("_Grayness", grayness);
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
