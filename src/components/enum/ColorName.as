package components.enum
{
    /**
     * The %color.names; 
     * entity lists the color names that can be used for values of the %color; 
     * entity.
     * <!ENTITY % color.names " aqua | black | blue | fuchsia | gray | green |
     *  lime | maroon | navy | olive | purple | red | silver | teal | white | 
     * yellow | none | system " >
     */
    public class ColorName
	{
        public static const AQUA:ColorName          = new ColorName(AQUA);
        public static const BLACK:ColorName         = new ColorName(BLACK);
        public static const FUCHSIA:ColorName       = new ColorName(FUCHSIA);
        public static const GRAY:ColorName          = new ColorName(GRAY);
        public static const GREEN:ColorName         = new ColorName(GREEN);
        public static const LIME:ColorName          = new ColorName(LIME);
        public static const MAROON:ColorName        = new ColorName(MAROON);
        public static const NAVY:ColorName          = new ColorName(NAVY);
        public static const OLIVE:ColorName         = new ColorName(OLIVE);
        public static const PURPLE:ColorName        = new ColorName(PURPLE);
        public static const RED:ColorName           = new ColorName(RED);
        public static const SILVER:ColorName           = new ColorName(SILVER);
        public static const TEAL:ColorName           = new ColorName(TEAL);
        public static const WHITE:ColorName           = new ColorName(WHITE);
        public static const YELLOW:ColorName           = new ColorName(YELLOW);
        public static const NONE:ColorName           = new ColorName(NONE);
        public static const SYSTEM:ColorName           = new ColorName(SYSTEM);
        /* Constructor */
		public function ColorName(d:ColorName)
		{
        }


        public function toString():String
        {
            switch(this) {
                case ColorName.AQUA:
                    return "aqua";
                case ColorName.BLACK:
                    return "black";
                case ColorName.FUCHSIA:
                    return "fuchsia";
                case ColorName.GRAY:
                    return "gray";
                case ColorName.GREEN:
                    return "green";
                case ColorName.LIME:
                    return "lime";
                case ColorName.MAROON:
                    return "maroon";
                case ColorName.NAVY:
                    return "navy";
                case ColorName.OLIVE:
                    return "olive";
                case ColorName.PURPLE:
                    return "purple";
                case ColorName.RED:
                    return "red";
                case ColorName.SILVER:
                    return "silver";
                case ColorName.TEAL:
                    return "teal";
                case ColorName.WHITE:
                    return "white";
                case ColorName.YELLOW:
                    return "yellow";
                case ColorName.NONE:
                    return "none";  
                case ColorName.SYSTEM:
                    return "system";    
                default:
                    /* ColorName.NONE is considered 'undefined' (no direction) */
                    return "undefined";
            }
        }
    }
}