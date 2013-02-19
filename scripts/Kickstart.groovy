includeTargets << grailsScript("_GrailsInit")

def code = "confirm.kickstart"
def confirmCount = 0
def confirmAll = false
def deleteAll = false

/*********************************************************************************
 * Kickstart's main script to copy files into the project                        *
 * Note: The following files are accessible via the plugin (and are not copied): *
 * Kickstart's Taglib for Bootstrap, Bootstrap's CSS/JS files, KickstartFilter   *
 * Kickstart's own CSS/JS files, Datepicker's CSS/JS files, resources.groovy     *
 *********************************************************************************/
target(kickstart: "Installs the Kickstart scaffolding templates and other files") {
	depends(checkVersion, parseArguments)

	event "StatusUpdate", ['\nNOTE: execution in eclipse (STS, GGTS) might result in the erroneous messages "Invalid input. Must be one of" --> Just ignore them!\n']
	
	sourceDir = "${kickstartWithBootstrapPluginDir}/src"
	targetDir = "${basedir}/grails-app/conf/"
	copy("${sourceDir}/UrlMappings.groovy",	targetDir,			"URLMappings.groovy",	code)
	copy("${sourceDir}/resources.groovy",	targetDir+"spring/","resources.groovy",		code)
	
	// copy less files into project
	sourceDir = "${kickstartWithBootstrapPluginDir}/web-app/less"
	targetDir = "${basedir}/web-app/less"
	copy(sourceDir, targetDir, "less files in /web-app", "copy-less")

	sourceDir = "${kickstartWithBootstrapPluginDir}/src/templates/"
	targetDir = "${basedir}/src/templates/"
	copy(sourceDir, targetDir, "scaffolding templates", code)

	sourceDir = "${kickstartWithBootstrapPluginDir}/grails-app/views"
	targetDir = "${basedir}/grails-app/views"
	copy(sourceDir, targetDir, "layouts & base GSPs files", code)
	delete(targetDir+'/index.gsp', "index.gsp in /views", code)
	delete(targetDir+'/error.gsp', "error.gsp in /views", code)

	// inject plugin specific configs into Config.groovy
	def configFile = new File("${basedir}/grails-app/conf/Config.groovy")
	configFile.append("\ngrails.config.defaults.locations = [KickstartResources]")
	event "StatusUpdate", ["... appended include line at the end of Config.groovy!"]
		
	event "StatusUpdate", ["Kickstart install ended!"]

}
setDefaultTarget kickstart


/****************************************************
 *  Helper methods to copy directories, files, etc. *
 ****************************************************/

copy = {String source, String target, String confirmText, String confirmCode ->
	def overwrite = confirmAll ? true : false
//	def newCode = confirmCode + confirmCount++
	def input = ""
	
	// only if dir already exists in, ask to overwrite it
	if (new File(target).exists()) {
		// TODO: copy existing files / dirs into a "trash" directory
		if (isInteractive && !overwrite) 						input = grailsConsole.userInput('Overwrite '+confirmText+'? ', ["y","n","a"] as String[])
		if (!isInteractive || input == "y" || input == "a" )	overwrite = true
		if (input == "a")										confirmAll = true
	} else {
		ant.mkdir(dir: target)
		overwrite = true	// nothing to overwrite but will be copied (state this in the event message)
	}
	
	if (new File(source).isDirectory()) ant.copy(todir: "$target", overwrite: overwrite) { fileset dir:  "$source" }
	else 								ant.copy(todir: "$target", overwrite: overwrite) { fileset file: "$source" }  

	event "StatusUpdate", ["... ${confirmText} ${overwrite ? '' : 'not '}installed!"]
}

delete = {String file, String confirmText, String confirmCode ->
	def deleteFile = deleteAll ? true : false
//	def newCode = confirmCode + confirmCount++
	def input = ""

	if (new File(file).exists()) {
		if (isInteractive && !deleteFile) 						input = grailsConsole.userInput('Delete '+confirmText+'? ', ["y","n","a"] as String[])
		if (!isInteractive || input == "y" || input == "a" )	deleteFile = true
		if (input == "a")										deleteAll = true
		// TODO: copy existing files / dirs into a "trash" directory
		if (deleteFile)											ant.delete(file: file)
		event "StatusUpdate", ["... ${confirmText} was ${delete ? '' : 'not '}deleted!"]
	}
}
