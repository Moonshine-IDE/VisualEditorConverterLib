package components.enum
{   
    /**
     * The %table.row.displays; entity defines the different options for displaying each row in a table. 
     * <!ENTITY % table.row.displays "all | tabs | timer | onclick | compute 
     * | tabscompute | onclicktimer | onopentimer | captions">
     */
    public class TableRowDisplays
	{
        public static const ALL:TableRowDisplays            = new TableRowDisplays(ALL);
        public static const TABS:TableRowDisplays           = new TableRowDisplays(TABS);
        public static const TIMER:TableRowDisplays          = new TableRowDisplays(TIMER);
        public static const ONCLICK:TableRowDisplays        = new TableRowDisplays(ONCLICK);
        public static const COMPUTE:TableRowDisplays        = new TableRowDisplays(COMPUTE);
        public static const TABSCOMPUTE:TableRowDisplays    = new TableRowDisplays(TABSCOMPUTE);
        public static const ONCLICKTIMER:TableRowDisplays   = new TableRowDisplays(ONCLICKTIMER);
        public static const ONOPENTIMER:TableRowDisplays    = new TableRowDisplays(ONOPENTIMER);
        public static const CAPTIONS:TableRowDisplays       = new TableRowDisplays(CAPTIONS);

        /* Constructor */
		public function TableRowDisplays(d:TableRowDisplays)
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
                case TableRowDisplays.ALL:
                    return "all";
                case TableRowDisplays.TABS:
                    return "tabs";
                case TableRowDisplays.TIMER:
                    return "timer";
                case TableRowDisplays.ONCLICK:
                    return "onclick";
                case TableRowDisplays.COMPUTE:
                    return "compute";
                case TableRowDisplays.TABSCOMPUTE:
                    return "tabscompute";
                case TableRowDisplays.ONCLICKTIMER:
                    return "onclicktimer";
                case TableRowDisplays.ONOPENTIMER:
                    return "onopentimer";
                case TableRowDisplays.CAPTIONS:
                    return "captions";
                default:
                    /* CellBackgroundRepeat.NONE is considered 'undefined' (no direction) */
                    return "undefined";
            }
        }
    }
}   
