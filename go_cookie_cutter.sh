#
# Go Project cookie cutter
#
# Author: Sidharth Mishra <sidmishraw@gmail.com>
#
# Description: This script genrates the bare minimum of a skeleton for a Go project with the specified GOPATH, configuring VS CODE
# This has been made for making my life easy, I can't vouch for it for making anyone else's life easy though.
# I'm open to any suggestions for this script though.
#
# Created: 9/26/2017 11:00 AM PT


# The entry point of the script
main() {

	if [ -z "$2" ] 
	then
		case "$1" in
			"h" | "H" | "-help" | "--help")
				echo "./go_cookie_cutter.sh <GO_PATH you want> <project-name>";
				exit 0;
			       ;;
			 *)
				 echo "command was not used properly, please run with --help switch to view the help/usage informatio exit";
				 exit 1;
				 ;;
	       	esac
	else
		generate_project $1 $2
	fi
}

# The project generation logic
generate_project() {

	echo "Generating project named: $2 inside $1/src";

	if [ -d "$1" ]
		then
			echo "Creating project...";
			mkdir -p "$1/src/$2";

			project_root="$1/src/$2";

			mkdir -p "$project_root"/".vscode";

			touch "$project_root/.vscode/settings.json";

			echo "{
	\"go.gopath\": \"$1\",
	\"go.buildOnSave\": \"workspace\"
}" > "$project_root/.vscode/settings.json";

			echo "Generating project specific directories, start coding inside $project_root/src/";

			touch "$project_root/Readme.md";

			echo "
# $2
This project has all the dependencies built into the project location, it forces VS-Code to treat the workspace to be a standalone location and downloads all the dependencies.

Your code goes into the directory "src/$2".

• Sid" >  "$project_root/Readme.md";
			
			# creating the .gitignore file
			echo "src/github.com/*
src/golang.org/*
src/sourcegraph.com/*
bin/*
pkg/*" > "$project_root/.gitignore";

			echo "\n The Go project:: $2 has been successfully created \n\n";
		else
			echo "$1 is not a directory";
			exit 1;
	fi

}

# script begins

main $1 $2


