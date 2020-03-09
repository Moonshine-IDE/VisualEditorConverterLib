package components.enum
{
    /**
     * https://www.ibm.com/support/knowledgecenter/SSVRGU_9.0.1/basic/H_DEFINED_ENTITIES_XML.html
     * This class is a enum class for domino dxl cell background repeat type list.
     * he %cellbackground.repeats; entity defines the style options for displaying the background image of a cell or view. 
     * This entity is used in the <cellbackground> and <viewbackground> elements.
     * once | vrepeat | hrepeat | tile | center | resize
     */
    public class CellBackgroundRepeat
	{
        /**Displays the image once, without repeating it. */
        public static const ONCE:CellBackgroundRepeat	        = new CellBackgroundRepeat(ONCE);
        /**Repeats the image vertically. */
        public static const VREPEAT:CellBackgroundRepeat	    = new CellBackgroundRepeat(VREPEAT);
		/**Repeats the image horizontally. */
        public static const HREPEAT:CellBackgroundRepeat	    = new CellBackgroundRepeat(HREPEAT);
		/**Tiles the image, filling the background with multiple copies of it. */
        public static const TILE:CellBackgroundRepeat	        = new CellBackgroundRepeat(TILE);
		/**Centers the image. */
        public static const CENTER:CellBackgroundRepeat     	= new CellBackgroundRepeat(CENTER);
        /**Allows resizing of the image. */
        public static const RESIZE:CellBackgroundRepeat	        = new CellBackgroundRepeat(RESIZE);

 
		/* Constructor */
		public function CellBackgroundRepeat(d:CellBackgroundRepeat)
		{
			/*
			 * Empty fake constructor
			 * The part that matter is that it accepts a 'copy' of itself
			 * For the recursive assignment to work
			 */
		}


        public function toString():String
        {
            switch(this) {
                case CellBackgroundRepeat.ONCE:
                    return "once";
                case CellBackgroundRepeat.VREPEAT:
                    return "vrepeat";
                case CellBackgroundRepeat.HREPEAT:
                    return "hrepeat";
                case CellBackgroundRepeat.TILE:
                    return "tile";
                case CellBackgroundRepeat.CENTER:
                    return "center";
                case CellBackgroundRepeat.RESIZE:
                    return "resize";
                default:
                    /* CellBackgroundRepeat.NONE is considered 'undefined' (no direction) */
                    return "undefined";
            }
        }

    }    

}