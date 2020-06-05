package interfaces.dominoComponents
{
    import interfaces.IComponent;
    import interfaces.IIsSelected;
    /** dxl example of text 
    <par def='6'><run><font color='blue'/>
    Example string...
    </run></par>
        */

    public interface IDominoSection extends IComponent, IIsSelected
    {
        function get title():String;
        function set title(value:String):void;

        
    }
}