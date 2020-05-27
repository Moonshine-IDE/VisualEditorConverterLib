package interfaces.dominoComponents
{
    import interfaces.IComponent;
    import interfaces.IIsSelected;
    /** dxl example of text 
    <par def='6'><run><font color='blue'/>
    Example string...
    </run></par>
        */

    public interface IDominoLabel extends IComponent, IIsSelected
    {
        function get text():String;
        function set text(value:String):void;

        function get size():String;
        function set size(value:String):void;

        function get color():String;
        function set color(value:String):void;

        function get fontStyle():String;
        function set fontStyle(value:String):void;

    }
}
