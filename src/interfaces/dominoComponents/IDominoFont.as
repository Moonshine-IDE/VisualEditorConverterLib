/** 
 * Represents a font in rich text. 
 * font dxl details please review follow url: 
 * https://www.ibm.com/support/knowledgecenter/SSVRGU_10.0.1/basic/H_FONT_ELEMENT_XML.html
 * Contained by: <actionbar>, <actionbarstyle>, <block>, <bordercaption>, <button>, <column>, <columnheader>, <embeddedcontrol>, <embeddedfolderpane>, <embeddeddatepicker>, <parstyle>, <run>, <sectiontitle>, <sparefont>, <sublevel>, <tablerowstyle>, <title>, <toplevel>
 * this font will work with so much element of dxl , it not work in single .
 * It must contain into other elements.
 */
package interfaces.dominoComponents
{
	import interfaces.IComponent;
    public interface IDominoFont  extends IComponent
	{   
         //Color of the font.
        function get color():String;
		function set color(value:String):void;
        //Size of the font, in points.
        function get size():String;
		function set size(value:String):void;
        /** 
         * <!ENTITY % font.styles "normal | bold | italic | underline | strikethrough | superscript | subscript | shadow | emboss | extrude">
         */
        //A list of tokens taken from the %font.styles; entity.
		function get style():String;
		function set style(value:String):void;
       
        /** 
         * Name of the font. See the %font.names; 
         * entity for some font names that can be used in addition to a specific font name.
         */
        function get name():String;
		function set name(value:String):void;

        function get truetype():Boolean;
		function set truetype(value:Boolean):void;
        /** 
         * Hexadecimal number identifying the family of a font as specified by the operating system header files. 
         * Some examples of family ids in DXL are: 
          Hexadecimal family id  |  Font family
                    10                  Roman
                    20                  Swiss
                    30                  Modern
                    40                  Script
                    50                  Decorative
         */
        
        function get familyid():String;
		function set familyid(value:String):void;
        /** 
         * <!ENTITY % font.pitches "fixed | variable">
         * fixed
         * Indicates that the number of characters that print per inch is fixed. For example, a common pitch value is Courier 12, which is a 10 point font that prints at exactly 12 characters per inch.
         * variable
         * Indicates that the number of characters that print per inch can change.
         */
        function get pitch():String;
		function set pitch(value:String):void;
        
    }
}