package interfaces.dominoComponents
{
    import interfaces.IComponent;
    import interfaces.IDominoVisualHideOption;

    /**
     * Domino table row dxl format ,more detail please view follow url
     * https://www.ibm.com/support/knowledgecenter/en/SSVRGU_9.0.1/basic/H_TABLEROW_ELEMENT_XML.html
     * Contained by: <table>
     * Contains: <tablecell>
     */

    public interface IDominoTableRow  extends IDominoVisualHideOption,IComponent
    {  
        /**
         * tablabel
         * Translatable name of a tab in a tabbed table that you click to display the specified row.
         */
        function get tablabel():String;
		function set tablabel(value:String):void;

        /**
         * name
         * Value of the field named $table-name that determines which row is displayed.
         */
        function get name():String;
		function set name(value:String):void;
  
    }
}
