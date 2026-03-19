import { App, Editor, MarkdownView, Plugin, PluginSettingTab, Setting } from 'obsidian';

/*
interface BetterTemplatesSettings {
	mySetting: string;
}

const DEFAULT_SETTINGS: BetterTemplatesSettings = {
	mySetting: 'default'
}
*/

export default class BetterTemplates extends Plugin {
	//settings: BetterTemplatesSettings;

	looking_at_markdown(checking: boolean) {
		// Conditions to check
		const markdownView = this.app.workspace.getActiveViewOfType(MarkdownView);
		if (markdownView) {
			// This command will only show up in Command Palette when the check function returns true
			return true;
		}
	}

	async onload() {
		console.log("Better Templates plugin says Hello!");
		//await this.loadSettings();

		// This adds an editor command that can perform some operation on the current editor instance
		this.addCommand({
			id: 'insert-mathalign-template',
			name: 'beginalign',
			editorCallback: (editor: Editor, _view: MarkdownView) => {
				console.log(editor);
				// TODO strings from file
				// TODO find a way to undo both operations at once
				editor.replaceSelection('$$\n\\begin{align}\n\t');
				editor.replaceRange("\n\\end{align}\n$$", editor.getCursor());
			},
			checkCallback: this.looking_at_markdown
		});
		

		this.addCommand({
			id: 'insert-mathalignat-template',
			name: 'beginalignat',
			editorCallback: (editor: Editor, _view: MarkdownView) => {
				console.log(editor);
				// TODO strings from file
				// TODO find a way to undo both operations at once
				editor.replaceSelection('$$\n\\begin{alignat}{1}\n\t');
				editor.replaceRange("\n\\end{alignat}\n$$", editor.getCursor());
			},
			checkCallback: this.looking_at_markdown
		});


		this.addCommand({
			id: 'insert-mathgather-template',
			name: 'begingather',
			editorCallback: (editor: Editor, _view: MarkdownView) => {
				console.log(editor);
				// TODO strings from file
				// TODO find a way to undo both operations at once
				editor.replaceSelection('$$\n\\begin{gather}\n\t');
				editor.replaceRange("\n\\end{gather}\n$$", editor.getCursor());
			},
			checkCallback: this.looking_at_markdown
		});

		this.addCommand({
			id: 'insert-mathcases-template',
			name: 'begincases',
			editorCallback: (editor: Editor, _view: MarkdownView) => {
				console.log(editor);
				// TODO strings from file
				// TODO find a way to undo both operations at once
				editor.replaceSelection('$$\n\t\\begin{cases}\n\t\t');
				editor.replaceRange("\n\t\\end{cases}\n$$", editor.getCursor());
			},
			checkCallback: this.looking_at_markdown
		});


		// This adds a settings tab so the user can configure various aspects of the plugin
		//this.addSettingTab(new SampleSettingTab(this.app, this));
	}

	onunload() {

	}

	/*
	async loadSettings() {
		this.settings = Object.assign({}, DEFAULT_SETTINGS, await this.loadData());
	}

	async saveSettings() {
		await this.saveData(this.settings);
	}
	*/
}

/*
class SampleSettingTab extends PluginSettingTab {
	plugin: BetterTemplates;

	constructor(app: App, plugin: BetterTemplates) {
		super(app, plugin);
		this.plugin = plugin;
	}

	display(): void {
		const {containerEl} = this;

		containerEl.empty();

		new Setting(containerEl)
			.setName('Setting #1')
			.setDesc('It\'s a secret')
			.addText(text => text
				.setPlaceholder('Enter your secret')
				.setValue(this.plugin.settings.mySetting)
				.onChange(async (value) => {
					this.plugin.settings.mySetting = value;
					await this.plugin.saveSettings();
				}));
	}
}
*/
