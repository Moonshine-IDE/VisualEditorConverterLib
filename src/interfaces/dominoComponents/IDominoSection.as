package interfaces.dominoComponents
{
    import interfaces.IComponent;
    import interfaces.IIsSelected;
    import interfaces.IDominoComponent;
    /** dxl example of text 
    <par def='6'><run><font color='blue'/>
    Example string...
    </run></par>
        */

    public interface IDominoSection extends IDominoComponent, IIsSelected
    {
        function get title():String;
        function set title(value:String):void;

        function get titleColor():String;
        function set titleColor(value:String):void;

        function get titleFontStyle():String;
        function set titleFontStyle(value:String):void;

        function get titleSize():String;
        function set titleSize(value:String):void;

        function get onread():String;
        function set onread(value:String):void;

        function get onedit():String;
        function set onedit(value:String):void;

        function get onpreview():String;
        function set onpreview(value:String):void;

        function get onprint():String;
        function set onprint(value:String):void;

        function get expanded():Boolean;
        function set expanded(value:Boolean):void;

        function get showastext():Boolean;
        function set showastext(value:Boolean):void;


        function get accessfieldkind():String;
        function set accessfieldkind(value:String):void;
        

        function get accessfieldname():String;
        function set accessfieldname(value:String):void;
    }
}