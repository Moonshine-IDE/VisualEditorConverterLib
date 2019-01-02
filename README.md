## Installation

### Prerequisites
Visual Editor is built with [Apache Flex® SDK 4.16.1](https://flex.apache.org/installer.html), using [Adobe AIR and Flash Player 28.0](https://helpx.adobe.com/flash-player/release-note/fp_28_air_28_release_notes.html).

### VisualEditorConverterLib swc library

1. Download and install [Apache Ant®](https://ant.apache.org/)
2. Setup environment variable `FLEX_HOME` or add path to the Apache Flex SDK in build.xml -> [here](https://github.com/prominic/VisualEditorConverterLib/blob/727849d17704108e26aa6a1e345e2469aae63733/build.xml#L4)
3. If you would like to have debuggable swc please set [IsDebug](https://github.com/prominic/VisualEditorConverterLib/blob/b57e17c3bbba455bd94bb8745d19220ae0bd5202/build.xml#L12) variable to true
4. Run in command line `ant`
