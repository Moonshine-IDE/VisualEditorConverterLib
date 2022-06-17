/**
 * From the DTD document , it show , we need some generic Key Token
 * For some proeprty setting, so I create the file in here.
 *  
 */

package global.domino
{
    import mx.collections.ArrayList;
    public class DominoGlobalTokens {
         public static var FontNames:ArrayList = new ArrayList([
              {label: "monospace",description: "monospace",value:"monospace",enabled:true,"selected": false},
              {label: "multilingual",description: "multilingual",value:"multilingual",enabled:true,"selected": false},
              {label: "sans-serif",description: "sans-serif",value:"sans-serif",enabled:true,"selected": false},
              {label: "serif",description: "serif",value:"serif",enabled:true,"selected": false},
              {label: "user-interface",description: "user-interface",value:"strikeuser-interfacethrough",enabled:true,"selected": false}
              
        ])

        public static var Colors:ArrayList = new ArrayList([
        {label: "aqua",description: "aqua color.",htmlcolor:"#00FFFF"},
        {label: "black",description:"",htmlcolor:"#000000"},
        {label: "blue",description:"",htmlcolor:"#0000FF"}, 
        {label: "fuchsia",description:"",htmlcolor:"#FF00FF"},
        {label: "gray",description:"",htmlcolor:"#808080"},
        {label: "green",description:"",htmlcolor:"#008000"},
        {label: "lime",description:"",htmlcolor:"#00FF00"},
        {label: "maroon",description:"",htmlcolor:"#800000"},
        {label: "none",description:"",htmlcolor:"#000000"},
        {label: "navy",description:"",htmlcolor:"#000080"},
        {label: "olive",description:"",htmlcolor:"#808000"},
        {label: "purple",description:"",htmlcolor:"#800080"},
        {label: "red",description:"",htmlcolor:"#FF0000"},
        {label: "system",description:"A preset color. For instance, the font color of a hotspot link is 'system' because it is determined by the %link.color.attrs; property settings for a form.",
        htmlcolor:"#4B0082"},
        {label: "silver",description:"",htmlcolor:"#C0C0C0"},
        {label: "teal",description:"",htmlcolor:"#008080"},
        {label: "white",description:"",htmlcolor:"#ffffff"},
        {label: "yellow",description:"",htmlcolor:"#FFFF00"}
       
      
        ]);


        public static var FontStyles:ArrayList = new ArrayList([
             {label: "Plain",description: "normal",value:"normal",enabled:true,"selected": false},
              {label: "Bold",description: "bold",value:"bold",enabled:true,"selected": false},
              {label: "Italic",description: "italic",value:"italic",enabled:true,"selected": false},
              {label: "Underline",description: "underline",value:"underline",enabled:true,"selected": false},
              {label: "Strikethrough",description: "strikethrough",value:"strikethrough",enabled:true,"selected": false},
              {label: "Superscript",description: "superscript",value:"superscript",enabled:true,"selected": false},
              {label: "Shadow",description: "shadow",value:"shadow",enabled:true,"selected": false},
              {label: "Emboss",description: "emboss",value:"emboss",enabled:true,"selected": false},
              {label: "Extrude",description: "extrude",value:"extrude",enabled:true,"selected": false},
              {label: "Subscript",description: "subscript",value:"subscript",enabled:true,"selected": false},
              
        ])

        public static var Separators:ArrayList = new ArrayList([
        {label:"space",value: "space",description: "space","selected": false},
        {label:"comma",value: "comma",description:"comma","selected": false},
        {label:"semicolon",value: "semicolon",description:"semicolon","selected": false},
        {label:"newline",value: "newline",description:"newline","selected": false},
        {label:"blankline",value: "blankline",description:"blankline","selected": false}
        ]);

        public  static var SecurityOptions:ArrayList = new ArrayList([
        {label:"Sign if mailed or saved in section",value: "sign",description: "sign","selected":false},
        {label:"Enable encryption for this field",value: "seal",description:"seal","selected":false},
        {label:"Must have at least Editor access to use",value: "protected",description:"protected","selected":false}
       
        ]);

        public static var LimitinputKinds:ArrayList = new ArrayList([
        {label:"picture",value: "picture",description: "picture", "selected": false},
        {label:"sharedimage",value: "sharedimage",description: "sharedimage", "selected": false},
        {label:"attachment",value: "attachment",description: "attachment", "selected": false},
        {label:"view",value: "view",description: "view", "selected": false},
        {label:"sharedapplet",value: "sharedapplet",description: "sharedapplet", "selected": false},
        {label:"text",value: "text",description: "text", "selected": false},
        {label:"object",value: "object",description: "object", "selected": false},
        {label:"calendar",value: "calendar",description: "calendar", "selected": false},
        {label:"inbox",value: "inbox",description: "inbox", "selected": false},
        {label:"datepicker",value: "datepicker",description: "datepicker", "selected": false}
        ]);

        public static var Types:ArrayList = new ArrayList([
            {label: "text",description:"A text field."}, 
            {label: "number",description:"A number field."},
            {label: "datetime",description:"A date/time field."}, 
            {label: "richtext",description:"A rich text field."},
            {label: "keyword",description:"Presents a list of keywords for entry into the field, as a result of a formula or a list of constants. The Dialog List field is a keyword field that can also display a list of choices from the address dialog, view dialog, or ACL."}, 
            {label: "names",description:"A computed or editable field that lists usernames."}, 
            {label: "authors",description:"Lists the users who can edit the documents that they created."},
            {label: "password",description:"A text field that displays text characters as a string of asterisks (*) to hide the content of the field. This type is often used for field in which users enter their passwords."},
            {label: "formula",description:"A field that contains an @function or @command formula."},
            {label: "timezone",description:"A field that displays a drop-down list of all available world time zones."},
            {label: "richtextlite",description:"A rich text field that a user can paste a limited number of objects into; a helper icon listing the available element types displays beside this field."},
            {label: "readers",description:"Lists the users who can read the documents created from a form."},
            {label: "color",description:"A field that displays a color picker."}
        ]);

        public static var Kinds:ArrayList = new ArrayList([
        {label: "editable",description: "A user can enter or change its value."},
        {label: "computed",description:"A formula calculates its value each time a user creates, saves, or refreshes a document."},
        {label: "computedfordisplay",description:"A formula recalculates its value each time a user opens or saves a document. "}, 
        {label: "computedwhencomposed",description:"A formula calculates its value only once: when a user first creates the document."}
        ]);

        public static var Formats:ArrayList = new ArrayList([
        {label: "general",description: "Displays numbers as they are entered; zeroes following the decimal point are suppressed. For example, 6.00 displays as 6."},
        {label: "currency",description:"Displays values with a currency symbol and two digits after the decimal symbol; for example, $15.00."},
        {label: "fixed",description:"Displays numbers with a fixed number of decimal places. For example, 6 displays as 6.00."}, 
        {label: "scientific",description:"Displays numbers using exponential notation; for example, 10,000 displays as 1.00E+04."}
        ]);

        public static var Shows:ArrayList = new ArrayList([
        {label: "Current date only.",value:"date",
        description: "Current date only."},
        {label: "Current time only.",value:"time",
        description:"Current time only."},
        {label: "Current date and time.",value:"datetime",
        description:"Current date and time."}
        ]);

        public static var Dates:ArrayList = new ArrayList([
        {label:"Only year month and day, where the year is in 2 digits.",value: "yearmonthday",description: "Current date only."},
        {label:"Only year and month, where the year is in 4 digits.",value: "year4monthday",description:"Current time only."},
        {label:"Only month and day",value: "monthday",description:"Current date and time."},
        {label:"Only month and year",value: "yearmonth",description:"Current date and time."},
        {label:"Only year and month, where the year is in 4 digits.",value: "year4month",description:"Current date and time."},
        {label:"Only weekday,month and year",value: "weekdaymonthdayyear",description:"Current date and time."},
        {label:"Only weekday,month and day",value: "weekdaymonthday",description:"Current date and time."},
        {label:"Only weekday",value: "weekday",description:"Current date and time."},
        {label:"Only month",value: "month",description:"Current date and time."},
        {label:"Only day",value: "day",description:"Current date and time."},
         {label:"Only year",value: "year",description:"Current date and time."}
         
        ]);

        public static var Times:ArrayList = new ArrayList([
        {label:"All",value: "hourminutesecondhundredths",description: "Current date only."},
        {label:"Hours,minutes,and seconds",value: "hourminutesecond",description:"Current time only."},
        {label:"Hours and minutes",value: "hourminute",description:"Current date and time."},
        {label:"Hours only",value: "hour",description:"Current date and time."}
        
        ]);

        public static  var Zones:ArrayList = new ArrayList([
        {label:"Adjust time to local time",value: "never",description: "never."},
        {label:"Show only if zone not local",value: "sometimes",description:"sometimes."},
        {label:"Always show time zone",value: "always",description:"always."}
        ]);

        public static var Calendars:ArrayList = new ArrayList([
        {label: "gregorian",description: "Christian calendar which is a revised version of the Julian calendar that incorporated leap years to keep sync with the lunar cycle."},
        {label: "hijri",description:"Islamic calendar based on twelve lunar months.."}
        ]);

        public static var Objects:ArrayList = new ArrayList([
        {label:"Default value",value: "defaultvalue",description: "Provides an initial value for a field."},
        {label:"Input Translation",value: "inputtranslation",description:"Converts the data entered in the field to make the field conform to a specified format."},
        {label:"Input Validation",value: "inputvalidation",description:"Checks the data entered in the field against criteria that you specify."},
        // {label:"Windows Title",value: "windowtitle",description:"Generates the text that appears in the title bar of documents using the form."},
        //{label:"Web QueryOpen",value: "webqueryopen",description:"Executes before a Web document is displayed."},
        //{label:"Web Querysave",value: "webquerysave",description:"Executes before a Web document is saved."},
        //{label:"Hide When",value: "hidewhen",description:"Hides the object if the formula you provide is true."},
        //{label:"Value",value: "value",description:"Specifies the contents of a computed field."},
        // {label:"Selection",value: "selection",description:"selects the documents that appear in a view."},
        // {label:"Html Attributes",value: "htmlattributes",description:"Specifies characteristics for the associated HTML object. Applies to fields."},
        // {label:"Html Head",value: "htmlhead",description:"Information that resides in the HTML Head tag for an object. Applies to forms and pages."},
        // {label:"Html Body",value: "htmlbody",description:"Information that resides in the HTML Body tag for an object. Applies to forms and pages."},
        // {label:"Target Frame",value: "targetframe",description:"Defines which frame in a frameset the result of a command should display in."},
        // {label:"Help Request",value: "helprequest",description:"Executes when Help is selected."},
        // {label:"Form",value: "form",description:"Defines which form to open from a view."},
        // {label:"Alternate Html",value: "alternatehtml",description:"Alternate text to display if the user's browser cannot execute the code. For example, if a Java applet cannot be run by the user's browser, this text would describe the applet and inform the user that their browser's capabilities do not support it."},
        // {label:"Form",value: "form",description:"Defines which form to open from a view."},
        // {label:"Showsinglecategory",value: "showsinglecategory",description:"In embedded views, limits the documents displayed in the view to those contained in one category. The category is defined by a formula or text."},
        // {label:"Label",value: "label",description:"Specifies the label to display on an action button."},
        {label:"Displayvalue",value: "displayvalue",description:"Determines the value that displays for an action checkbox."}

        ]);


        public static var Keyworduis:ArrayList = new ArrayList([
        {label:"checkbox",value: "checkbox",description: "Displays options in a list with checkboxes to the left of each option. Users click the checkbox to make a selection. Users can select more than one option."},
        {label:"combobox",value: "combobox",description:"Displays a drop-down list box. Users click the down-arrow button of the drop-down list box to display the available options, then click an option to make a selection. Users can select only one option."},
        {label:"dialoglist",value: "dialoglist",description:"Displays an empty field with a down-arrow button beside it. When users click the down-arrow button, a Select Keywords dialog box displays listing the options. A Notes dialoglist field can be set to enable users to select only one or more than one option."},
        {label:"listbox",value: "listbox",description:"Displays a single row of a list and up and down arrows that a user can click to view the other rows in the list. Users can select only one option."},
        {label:"radiobutton",value: "radiobutton",description:"Displays options in a list with circles to the left of each option. Users click the circle to make a selection. Users can select only one option. Selecting a second option deselects the first option automatically."}
         
        ]);

        public static var Choicesdialogs:ArrayList = new ArrayList([
        {label:"none",value: "none",description: "Generates no choice list for Names and Readers fields, supplies the name of the form author for an Authors field, and displays a list of choices or a formula entered by the designer for a dialog list field."},
        {label:"acl",value: "acl",description:"Displays names from a list of people, servers, groups, and roles in the Access Control List of a database."},
        {label:"addressbook",value: "addressbook",description:"Displays a list of names from a Personal Address Book or Domino Directory Names dialog box."},
        {label:"view",value: "view",description:"Displays names from a dialog box containing entries from a column in a view."}
        
        ]);

        public static var FontIds:ArrayList = new ArrayList([
        {label: "Roman",value: "10",description: ""},
        {label: "Swiss",value: "20",description:""},
        {label: "Modern",value: "30",description:""}, 
        {label: "Script",value: "40",description:""},
        {label: "Decorative",value: "50",description:""}
        ]);

         public static var Ptiches:ArrayList = new ArrayList([
        {label: "fixed",value: "fixed",description: "ndicates that the number of characters that print per inch is fixed."},
        {label: "variable",value: "variable",description:"Indicates that the number of characters that print per inch can change."}
        ]);

        //<!ENTITY % pardef.list.styles "none | bullet | number | check | uncheck | circle | square | alphaupper | alphalower | romanupper | romanlower">
         public static var Lists:ArrayList = new ArrayList([
        {label: "none",value: "none",description: "none."},
        {label: "bullet",value: "bullet",description:"bullet"},
        {label: "number",value: "number",description:"number"},
        {label: "check",value: "check",description:"check"},
        {label: "uncheck",value: "uncheck",description:"uncheck"},
        {label: "circle",value: "circle",description:"circle"},
        {label: "square",value: "square",description:"square"},
        {label: "alphaupper",value: "alphaupper",description:"alphaupper"},
        {label: "romanupper",value: "romanupper",description:"romanupper"},
        {label: "romanlower",value: "romanlower",description:"romanlower"}

        ]);

        public static var Spaceing:ArrayList = new ArrayList([
            {label: "single",value: "1",description: "one line"},
            {label: "half",value: "1.5",description:"a half of line"},
            {label: "double",value: "2",description:"two lines"}
        ]);

    }
}