package interfaces.dominoComponents
{
    import interfaces.IComponent;
    import components.enum.ColorName;
    import interfaces.IDominoVisualHideOption;

    /**
     * Domino table cell dxl format ,more detail please view follow url
     * https://www.ibm.com/support/knowledgecenter/en/SSVRGU_9.0.1/basic/H_TABLECELL_ELEMENT_XML.html
     * Contained by: <tablerow>
     * Contains: <cellbackground>, %richtext.block;
     */

    public interface IDominoTableCell  extends IDominoVisualHideOption,IComponent
    {  

        function get bgcolor():ColorName
		function set bgcolor(value:ColorName):void
		

        function get rowspan():Number
	    function set rowspan(value:Number):void
		
		function get columnspan():Number
		function set columnspan(value:Number):void
		
		function get colorstyle():Number
		function set colorstyle(value:Number):void
        
  
    }
}
