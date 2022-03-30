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

    public interface IDominoComputedText extends IDominoVisualHideOption,IComponent, IIsSelected
    {
        function get formula():String;
        function set formula(value:String):void;

        function get size():String;
        function set size(value:String):void;

        function get color():String;
        function set color(value:String):void;

        function get fontStyle():String;
        function set fontStyle(value:String):void;

        function get hidewhen():String
        function set hidewhen(value:String):void;

    }
}
