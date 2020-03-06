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

        /* Constructor */
		public function ColorName(d:ColorName)
		{
        }


        public function toString()
        {
            switch(this) {
                case CellBackgroundRepeat.AQUA:
                    return "aqua";
                case CellBackgroundRepeat.BLACK:
                    return "black";
                case CellBackgroundRepeat.FUCHSIA:
                    return "fuchsia";
                case CellBackgroundRepeat.GRAY:
                    return "gray";
                case CellBackgroundRepeat.GREEN:
                    return "green";
                case CellBackgroundRepeat.LIME:
                    return "lime";
                case CellBackgroundRepeat.MAROON:
                    return "maroon";
                case CellBackgroundRepeat.NAVY:
                    return "navy";
                case CellBackgroundRepeat.OLIVE:
                    return "olive";
                case CellBackgroundRepeat.PURPLE:
                    return "purple";
                case CellBackgroundRepeat.RED:
                    return "red";
                default:
                    /* CellBackgroundRepeat.NONE is considered 'undefined' (no direction) */
                    return "undefined";
            }
        }
    }
}