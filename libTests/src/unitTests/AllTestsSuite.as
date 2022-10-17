////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2016-present Prominic.NET, Inc.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the Server Side Public License, version 1,
//  as published by MongoDB, Inc.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  Server Side Public License for more details.
//
//  You should have received a copy of the Server Side Public License
//  along with this program. If not, see
//
//  http://www.mongodb.com/licensing/server-side-public-license
//
//  As a special exception, the copyright holders give permission to link the
//  code of portions of this program with the OpenSSL library under certain
//  conditions as described in each individual source file and distribute
//  linked combinations including the program with the OpenSSL library. You
//  must comply with the Server Side Public License in all respects for
//  all of the code used other than as permitted herein. If you modify file(s)
//  with this exception, you may extend this exception to your version of the
//  file(s), but you are not obligated to do so. If you do not wish to do so,
//  delete this exception statement from your version. If you delete this
//  exception statement from all source files in the program, then also delete
//  it in the license file.
//
////////////////////////////////////////////////////////////////////////////////

package unitTests
{
    import unitTests.autoComplete.AutoCompleteTest;
    import unitTests.button.ButtonTest;
    import unitTests.calendar.CalendarTest;
    import unitTests.converter.ConverterTest;
    import unitTests.dataTable.DataTableTest;
    import unitTests.div.DivTest;
    import unitTests.fieldset.FieldsetTest;
    import unitTests.grid.GridTest;
    import unitTests.includes.IncludeTest;
    import unitTests.inputMask.InputMaskTest;
    import unitTests.inputNumber.InputNumberTest;
    import unitTests.inputText.InputTextTest;
    import unitTests.inputTextarea.InputTextareaTest;
    import unitTests.outputLabel.OutputLabelTest;
    import unitTests.panelGrid.PanelGridTest;
    import unitTests.selectBooleanCheckbox.SelectBooleanCheckboxTest;
    import unitTests.selectOneListbox.SelectOneListboxTest;
    import unitTests.selectOneMenu.SelectOneMenuTest;
    import unitTests.selectOneRadio.SelectOneRadioTest;
    import unitTests.tabView.TabViewTest;
    import unitTests.textEditor.TextEditorTest;
    import unitTests.tree.TreeTest;

    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class AllTestsSuite
    {
        public var converterTest:ConverterTest;
        public var buttonTest:ButtonTest;
        public var selectOneListboxTest:SelectOneListboxTest;
        public var autoCompleteTest:AutoCompleteTest;
        public var calendarTest:CalendarTest;
        public var dataTableTest:DataTableTest;
		public var inputTextTest:InputTextTest;
		public var outputLabelTest:OutputLabelTest;
		public var inputTextarea:InputTextareaTest;
		public var selectOneRadioTest:SelectOneRadioTest;
        public var panelGridTest:PanelGridTest;
		public var selectOneMenuTest:SelectOneMenuTest;
		public var tabViewTest:TabViewTest;
		public var selectBooleanCheckboxTest:SelectBooleanCheckboxTest;
		public var textEditorTest:TextEditorTest;
		public var gridTest:GridTest;
		public var fieldsetTest:FieldsetTest;
		public var includeTest:IncludeTest;
		public var treeTest:TreeTest;
		public var inputNumberTest:InputNumberTest;
		public var divTest:DivTest;
		public var inputMaskTest:InputMaskTest;
    }
}
