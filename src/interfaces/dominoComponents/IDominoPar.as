/** 
 * Represents a paragraph as a rich text element. Paragraphs do not have implicit style attributes. 
 * They instead reference a <pardef> element, 
 * which defines the style of the paragraph's text.
 * par dxl details please review follow url: 
 * https://www.ibm.com/support/knowledgecenter/SSVRGU_10.0.1/basic/H_PARAGRAPH_ELEMENT_XML.html
 * Contained by: %richtext.block;, <richtext>
 * Contains: <border>, %richtext.inline;
 */
package interfaces.dominoComponents
{
    import interfaces.IComponent;
        
    public interface IDominoPar  extends IComponent
    {  
        function get def():String;
        function set def(value:String):void;
    }
}
