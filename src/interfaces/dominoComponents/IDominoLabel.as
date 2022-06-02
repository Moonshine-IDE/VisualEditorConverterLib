package interfaces.dominoComponents
{
    import interfaces.IComponent;
    import interfaces.IIsSelected;
    import interfaces.IDominoVisualHideOption;
    /** dxl example of text 
    <par def='6'><run><font color='blue'/>
    Example string...
    </run></par>
        */

    public interface IDominoLabel extends IDominoVisualHideOption,IComponent, IIsSelected
    {
        function get text():String;
        function set text(value:String):void;

        function get size():String;
        function set size(value:String):void;

        function get color():String;
        function set color(value:String):void;

        function get fontStyle():String;
        function set fontStyle(value:String):void;


        function get fontName():String;
        function set fontName(value:String):void;

        function get hidewhen():String
        function set hidewhen(value:String):void;

        function get isNewLine():String
        function set isNewLine(value:String):void;

        function get truetype():String
        function set truetype(value:String):void;

        function get pitch():String
        function set pitch(value:String):void;

        function get familyid():String
        function set familyid(value:String):void;

        //HTML
		function get htmlId():String;
        function set htmlId(value:String):void;
		function get htmlClass():String;
        function set htmlClass(value:String):void;
		function get htmlStyle():String;
        function set htmlStyle(value:String):void;
		function get htmlTitle():String;
        function set htmlTitle(value:String):void;
		function get htmlOther():String;
        function set htmlOther(value:String):void;



    }
}
