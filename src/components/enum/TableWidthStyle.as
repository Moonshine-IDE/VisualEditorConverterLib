package components.domino
{
    /**
     * The %table.widthtypes; entity defines the options for the width of a table. 
     * <!ENTITY % table.widthtypes "fixedleft | fixedcenter | fixedright | fitmargins | fitwindow">
     */
  public class TableWidthStyle
  {
    public static const FIXEDLEFT:TableWidthStyle    = new TableWidthStyle(FIXEDLEFT);
    public static const FIXEDRIGHT:TableWidthStyle   = new TableWidthStyle(FIXEDRIGHT);
    public static const FIXEDCENTER:TableWidthStyle  = new TableWidthStyle(FIXEDCENTER);
    public static const FITMARGINS:TableWidthStyle   = new TableWidthStyle(FITMARGINS);
    public static const FITWINDOW:TableWidthStyle    = new TableWidthStyle(FITWINDOW);


     /* Constructor */
		public function TableWidthStyle(d:TableWidthStyle)
		{
			/*
			 * Empty fake constructor
			 * The part that matter is that it accepts a 'copy' of itself
			 * For the recursive assignment to work
			 */
		}


        public function toString()
        {
            switch(this) {
                case TableWidthStyle.FIXEDLEFT:
                    return "fixedleft";
                case TableWidthStyle.FIXEDRIGHT:
                    return "fixedright";
                case TableWidthStyle.FIXEDCENTER:
                    return "fixedcenter";
                case TableWidthStyle.FITMARGINS:
                    return "fitmargins";
                case TableWidthStyle.FITWINDOW:
                    return "fitwindow";
                default:
                    /* CellBackgroundRepeat.NONE is considered 'undefined' (no direction) */
                    return "undefined";
            }
        }

  }   
}    