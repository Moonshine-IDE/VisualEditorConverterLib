package interfaces.dominoComponents
{
    import interfaces.IComponent;
    /**
     * Domino table cell background dxl format ,more detail please view follow url
     * https://www.ibm.com/support/knowledgecenter/SSVRGU_9.0.1/basic/H_CELLBACKGROUND_ELEMENT_XML.html
     * Contained by: <tablecell>
     * Contains: %image.formats;, <imageref> 
     */

    public interface IDominoCellBackground  extends IComponent
    {  
        //"once | vrepeat | hrepeat | tile | center | resize"

       // repeat
  
    }
}