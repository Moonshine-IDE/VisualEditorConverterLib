package interfaces.dominoComponents
{   
    /** 
	 * Represents the body of a form, 
	 * subform, page, or document as a design element. 
	 * https://www.ibm.com/support/knowledgecenter/en/SSVRGU_9.0.1/basic/H_BODY_ELEMENT_XML.html
	 * Contained by: <form>, <subform>, <page>, <helpaboutdocument>, <helpusingdocument>
	 * Contains: <richtext>
	 */
	
	import interfaces.IDominoComponent;
    import interfaces.IIsSelected;

	public interface IDominoBody extends IDominoComponent, IIsSelected
	{

        	
	
		
	}
}