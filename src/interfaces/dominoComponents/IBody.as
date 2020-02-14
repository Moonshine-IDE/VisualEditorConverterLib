package interfaces.dominoComponents
{   
    /** 
	 * Represents the body of a form, 
	 * subform, page, or document as a design element. 
	 * https://www.ibm.com/support/knowledgecenter/en/SSVRGU_9.0.1/basic/H_BODY_ELEMENT_XML.html
	 * Contained by: <form>, <subform>, <page>, <helpaboutdocument>, <helpusingdocument>
	 * Contains: <richtext>
	 */
	
	import interfaces.IComponent;
    import interfaces.IIsSelected;

	public interface IBody extends IComponent, IIsSelected
	{

        	
	
		
	}
}