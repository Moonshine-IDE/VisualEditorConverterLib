package components.domino
{
    /**
     * The %table.cell.border.styles; entity defines the choices to set the border style around a table cell. 
     * <!ENTITY % table.cell.border.styles "solid | ridge | groove">
     */
  public class TableCellBorderStyles
  {
      public static const SOLID:TableCellBorderStyles    = new TableCellBorderStyles(SOLID);
      public static const RIDGE:TableCellBorderStyles    = new TableCellBorderStyles(RIDGE);
      public static const GROOVE:TableCellBorderStyles   = new TableCellBorderStyles(GROOVE);
      /* Constructor */
      public function TableCellBorderStyles(d:TableCellBorderStyles)
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
                case TableCellBorderStyles.SOLID:
                    return "solid";
                case TableCellBorderStyles.RIDGE:
                    return "ridge";
                case TableCellBorderStyles.GROOVE:
                    return "groove";
                default:
                    /* CellBackgroundRepeat.NONE is considered 'undefined' (no direction) */
                    return "undefined";
            }
        }

  }
}