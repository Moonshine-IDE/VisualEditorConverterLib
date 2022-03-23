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

    public interface IDominoRun  extends IComponent
    {  
        //If true, the block of text is in passthru HTML format. 
        function get html():Boolean;
        function set html(value:Boolean):void;

        //Highlight color option, as defined in the %highlights; entity.
        function get highlight():String;
        function set highlight(value:String):void;

    }
}

