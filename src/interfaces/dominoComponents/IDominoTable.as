package interfaces.dominoComponents
{
    import interfaces.IComponent;

    /**
     * Domino table dxl element, more details access follow url:
     * https://www.ibm.com/support/knowledgecenter/SSVRGU_9.0.1/basic/H_TABLE_ELEMENT_XML.html
     * Contains an optional <tablerowstyle> element, an optional <border> element, 
     * followed by any number of <tablecolumn> and <tablerow> elements.
     */

    public interface IDominoTable  extends IComponent
    {  
        
        function get minrowheight():String;
		function set minrowheight(value:String):void;

        function get rowspacing():String;
		function set rowspacing(value:String):void;

        function get columnspacing():String;
		function set columnspacing(value:String):void;

        function get cellborderstyle():String;
		function set cellborderstyle(value:String):void;

        function get colorstyle():String;
		function set colorstyle(value:String):void;

        function get bgcolor():String;
		function set bgcolor(value:String):void;

        function get altbgcolor():String;
		function set altbgcolor(value:String):void;
        
        function get leftmargin():String;
		function set leftmargin(value:String):void;

        function get rightmargin():String;
		function set rightmargin(value:String):void;

        function get r4spacing():String;
		function set r4spacing(value:String):void;

        function get rowdisplay():String;
		function set rowdisplay(value:String):void;

        function get rowtimer():String;
		function set rowtimer(value:String):void;

        function get sizetabsequally():String;
		function set sizetabsequally(value:String):void;

        function get tablocation():String;
		function set tablocation(value:String):void;

        function get outsidewrap():String;
		function set outsidewrap(value:String):void;

        function get insidewrap():String;
		function set insidewrap(value:String):void;

        function get insidewrapheight():String;
		function set insidewrapheight(value:String):void;


        /** % html.core.attrs "
         *htmlid,htmlclass,htmlstyle
         *htmltitle,extrahtmlattrs
         */

         /** %
          *  direction.attrs
         */
    }
}
