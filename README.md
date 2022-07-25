## Installation

### Prerequisites
Visual Editor is built with [Apache Flex® SDK 4.16.1](https://flex.apache.org/installer.html), using [Adobe AIR and Flash Player 28.0](https://helpx.adobe.com/flash-player/release-note/fp_28_air_28_release_notes.html).

### VisualEditorConverterLib swc library

1. Download and install [Apache Ant®](https://ant.apache.org/)
2. Setup environment variable `FLEX_HOME` or add path to the Apache Flex SDK in build.xml -> [here](https://github.com/prominic/VisualEditorConverterLib/blob/727849d17704108e26aa6a1e345e2469aae63733/build.xml#L4)
3. If you would like to have debuggable swc please set [IsDebug](https://github.com/prominic/VisualEditorConverterLib/blob/b57e17c3bbba455bd94bb8745d19220ae0bd5202/build.xml#L12) variable to true
4. Run in command line `ant`

Note that VisualEditorConverterLib swc will be copied automatically to [libs](https://github.com/Moonshine-IDE/MockupVisualEditor#moonshine-swc-library) folder of [MockupVisualEditor](https://github.com/Moonshine-IDE/MockupVisualEditor) if that folder is placed in `../MockupVisualEditor/libs`.

## Domino & Royale Geberated code introduce

### 1. issue reference
Royale:
	https://github.com/Moonshine-IDE/Moonshine-IDE/issues/675
	
Domino:
	https://github.com/Moonshine-IDE/Moonshine-IDE/issues/646

### 2. branch 
Royale:https://github.com/Moonshine-IDE/Moonshine-IDE/tree/features/issue_675_royale_generate_domino_visual_editor

Domino:https://github.com/Moonshine-IDE/Moonshine-IDE/tree/features/issue_646_ve_notes_domino_support_fresh

### 3. main entery point and how to trigger
Domino :
	According to the design structure of moonshine ide.When user work with Visual Editors and clciks the "save" action or click the "code' tab from the Visual Editor,it will trigger the Domino convert.
	
- [getMxmlCode()](https://github.com/Moonshine-IDE/Moonshine-IDE/blob/c4548fd104d734aa8d672fba4764a7c00a024e78/ide/MoonshineDESKTOPevolved/src/actionScripts/plugins/ui/editor/VisualEditorViewer.as#L423),

	getMxmlCode() method will identify projects and files, and perform domino conversions based on project and file types.


Royale :
	According to the requirements, the Royale project will be generated from the opened Domino Visual project, therefore, the user will click "Project->Generate Apache Royale Project" in the menu to generate a new Royale project.

- [edit.visualEditor.editingSurface.toRoyaleCode(pvo.projectName,edit.visualEditor.editingSurface);](https://github.com/Moonshine-IDE/Moonshine-IDE/blob/4363a2a14cfb8623d07937c0d2d12ad3fa7b7ccf/ide/MoonshineDESKTOPevolved/src/actionScripts/plugins/as3project/CreateProject.as#L989)

	This line code will convert the current open Domino Visual Editor project to Royale project.
