/** 
 * Represents a few lines of selected or highlighted text. 
 * To apply a formatting style to a large block of text, use the <block> element. 
 * run dxl details please review follow url: 
 * https://www.ibm.com/support/knowledgecenter/SSVRGU_10.0.1/basic/H_RUN_ELEMENT_XML.html
 * Contained by: %richtext.nonhot.inline;
 * Contains: &lt;font&gt;, %richtext.inline;
 */
package interfaces.dominoComponents
{
    import interfaces.IComponent;
    import interfaces.IDominoVisualHideOption;
    import interfaces.IIsSelected;

    public interface IDominoSubForm  extends  IDominoVisualHideOption,IComponent,IIsSelected
    {  
        //subform name
        function get subFormName():String;
        function set subFormName(value:String):void;

    }
}

