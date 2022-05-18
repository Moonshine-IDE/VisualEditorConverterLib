/**
 * From the DTD document , it show , we need some generic Key Token
 * For some proeprty setting, so I create the file in here.
 *  
 */

package global.domino
{
    import mx.collections.ArrayList;
    public class DominoGlobalTokens {
         public static var FontNames:ArrayList = new ArrayList([
              {label: "monospace",description: "monospace",value:"monospace",enabled:true,"selected": false},
              {label: "multilingual",description: "multilingual",value:"multilingual",enabled:true,"selected": false},
              {label: "sans-serif",description: "sans-serif",value:"sans-serif",enabled:true,"selected": false},
              {label: "serif",description: "serif",value:"serif",enabled:true,"selected": false},
              {label: "user-interface",description: "user-interface",value:"strikeuser-interfacethrough",enabled:true,"selected": false}
              
        ])

        public static var Colors:ArrayList = new ArrayList([
        {label: "aqua",description: "aqua color.",htmlcolor:"#00FFFF"},
        {label: "black",description:"",htmlcolor:"#000000"},
        {label: "blue",description:"",htmlcolor:"#0000FF"}, 
        {label: "fuchsia",description:"",htmlcolor:"#FF00FF"},
        {label: "gray",description:"",htmlcolor:"#808080"},
        {label: "green",description:"",htmlcolor:"#008000"},
        {label: "lime",description:"",htmlcolor:"#00FF00"},
        {label: "maroon",description:"",htmlcolor:"#800000"},
        {label: "navy",description:"",htmlcolor:"#000080"},
        {label: "olive",description:"",htmlcolor:"#808000"},
        {label: "purple",description:"",htmlcolor:"#800080"},
        {label: "red",description:"",htmlcolor:"#FF0000"},
        {label: "silver",description:"",htmlcolor:"#C0C0C0"},
        {label: "teal",description:"",htmlcolor:"#008080"},
        {label: "white",description:"",htmlcolor:"#ffffff"},
        {label: "yellow",description:"",htmlcolor:"#FFFF00"},
        {label: "none",description:"",htmlcolor:"#000000"},
        {label: "system",description:"A preset color. For instance, the font color of a hotspot link is 'system' because it is determined by the %link.color.attrs; property settings for a form.",
        htmlcolor:"#4B0082"}
        ]);


        public static var FontStyles:ArrayList = new ArrayList([
             {label: "Plain",description: "normal",value:"normal",enabled:true,"selected": false},
              {label: "Bold",description: "bold",value:"bold",enabled:true,"selected": false},
              {label: "Italic",description: "italic",value:"italic",enabled:true,"selected": false},
              {label: "Underline",description: "underline",value:"underline",enabled:true,"selected": false},
              {label: "Strikethrough",description: "strikethrough",value:"strikethrough",enabled:true,"selected": false},
              {label: "Superscript",description: "superscript",value:"superscript",enabled:true,"selected": false},
              {label: "Shadow",description: "shadow",value:"shadow",enabled:true,"selected": false},
              {label: "Emboss",description: "emboss",value:"emboss",enabled:true,"selected": false},
              {label: "Extrude",description: "extrude",value:"extrude",enabled:true,"selected": false},
              {label: "Subscript",description: "subscript",value:"subscript",enabled:true,"selected": false},
              
        ])

    }
}