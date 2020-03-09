package components.enum
{ 
    /**
     * The %table.tablocations; entity defintes the options for the placement
     *  of tabs on a row in a table if the Show only one row at a time option is selected as a table property. 
     */
    public class TabLocations
	{
        /**Displays the row tabs at the beginning of the currently displaying table row. Tabs look like rolodex index tabs. */
        public static const TOP:TabLocations          = new TabLocations(TOP);
        /**Displays the row tabs in a vertical list to the left of the table row.  */
        public static const LEFT:TabLocations         = new TabLocations(LEFT);
        /**Displays the row tabs at the end of the currently displaying table row. Tabs look like rolodex index tabs. */
        public static const BOTTOM:TabLocations       = new TabLocations(BOTTOM);
        /**Displays the row tabs in a vertical list to the right of the table row. */
        public static const RIGHT:TabLocations        = new TabLocations(RIGHT);
         /* Constructor */
		public function TabLocations(d:TabLocations)
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
                case TabLocations.TOP:
                    return "top";
                case TabLocations.LEFT:
                    return "left";
                case TabLocations.BOTTOM:
                    return "bottom";
                case TabLocations.RIGHT:
                    return "right";
                default:
                    /* TabLocations.NONE is considered 'undefined' (no direction) */
                    return "undefined";
            }
        }

    }
}    
