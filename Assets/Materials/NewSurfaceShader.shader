// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/NewSurfaceShader" {
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            struct vertexInput {
                float4 vertex : POSITION;
                float2 uv     : TEXCOORD0;
            };

            struct fragmentInput {
                float4 position : SV_POSITION;
                float2 uv       : TEXCOORD0;
            };

            //uniform として宣言;
            uniform sampler2D _MainTex;

            fragmentInput vert(vertexInput v) {
                fragmentInput o;
                o.position = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            float4 frag(fragmentInput i) : COLOR {
                //インスペクタから入力された _MainTex を使ってる;
                //return tex2D(_MainTex, i.uv);
                //red;
                //return fixed4(1.0,0.0,0.0,1.0);
                //square
                float square = ceil(length(max(abs(i.uv - float2(0.5,0.5)) - 0.2,0.0)));
                fixed4 square_color = fixed4(square,square,square,1.0);
                fixed4 color = square_color + fixed4(0.0,0.0,0.0,1.0);
                return color;
            }
            ENDCG
        }
    }
}
