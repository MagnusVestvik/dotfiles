# remove start message from fish shell
set -U fish_greeting ""

starship init fish | source
if status is-interactive
    # Commands to run in interactive sessions can go here
end

function ndiff
    git diff origin/master | nvim
end

function update 
    yes Y | sudo apt update && sudo apt upgrade
end

function klogs
    set -l ns avvtd

    set -l pod (
        kubectl get pods -n $ns --no-headers \
        | awk '{print $1}' \
        | fzf
    )

    if test -n "$pod"
        kubectl logs -n $ns $pod | nvim -
    end
end

function keditdeploy
    set -l ns avvtd
    set -l deploy (
        kubectl get deploy -n $ns --no-headers \
        | awk '{print $1}' \
        | fzf
    )

    if test -n "$deploy"
        kubectl edit deploy -n $ns $deploy
    end
end

function kdescribepod
set -l ns avvtd

    set -l pod (
        kubectl get pods -n $ns --no-headers \
        | awk '{print $1}' \
        | fzf
    )

    if test -n "$pod"
        kubectl describe pod -n $ns $pod | nvim -
    end

end

function kn
    kubectl $argv -n avvtd
end

function knShowContainer
    kubectl get pod $argv -o jsonpath="{.spec.containers[*].name}"
end

function load_env
    set envfile (test -n "$argv[1]" && echo $argv[1] || echo ".env")
    for line in (cat $envfile | grep -v '^#' | grep '=')
        set key (echo $line | cut -d= -f1)
        set val (echo $line | cut -d= -f2-)
        set -gx $key $val
    end
end

function sdn
    shutdown now
end

function useJava21
    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64/
end

function useJava25
    export JAVA_HOME=/usr/lib/jvm/java-25-openjdk-amd64/
end

# Login to aws account
function awslogin
    aws sso login --profile m.vestvik-CloudDeveloper
end

function awsloginprod
    aws sso login --profile prod
end

# Usage: sship 10.200.12.9
function sship 
  ssh $(echo $argv[1] | awk -F. '{print "ip-"$1"-"$2"-"$3"-"$4".ip.sportradar.ag"}')
end

function sftpip
  sftp $(echo $argv[1] | awk -F. '{print "ip-"$1"-"$2"-"$3"-"$4".ip.sportradar.ag"}')
end
## Convert IP to zscaler compatible hostname.
## Usage: echoip 10.200.12.9
function echoip 
    echo $(echo $argv[1] | awk -F. '{print "ip-"$1"-"$2"-"$3"-"$4".ip.sportradar.ag"}')
end

function jdtls_clean
    rm -rf ~/.cache/jdtls/workspace
end
# Checks the syntax of chosen file from fuzzyfind list
function checkcpp
    fd -g '*.{cpp,h,hpp}' | fzf | xargs g++ -fsyntax-only
end

# Find the proper DNS name:
# Usage: lookupip 10.200.12.9
function lookupip
    dig +short -x $argv[1] @10.0.0.3
end

function mvnbuild
    mvn clean install -DbuildShadedJAR=true $argv
end

function mb
    mvn clean install -DbuildShadedJAR=true $argv
end

function mbnt
    mvn clean install -DbuildShadedJAR=true -DskipTests $argv
end

function mvnbuildnt
    mvn clean install -DbuildShadedJAR=true -DskipTests $argv
end

function mcint
    mvn clean install -DbuildShadedJAR=true -DskipTests $argv
end
function mci
    mvn clean install -DbuildShadedJAR=true $argv
end

function mt
    mvn test
end
# Function for javarunvod
function runVod
    java -cp conf:vt-vod-manager-app/target/vt-vod-manager-app-2.11.0-SNAPSHOT.jar com.sportradar.streaming.vod.VODManagerComponent 816 $argv
end

# Function for javarunctrlr
function runController
    java -cp conf:target/vt-java-controller-app-6.13.0-SNAPSHOT.jar com.sportradar.streaming.controller.VTControllerComponent 742
end

function debugController
    java -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005 -cp conf:target/vt-java-controller-app-6.7.0-SNAPSHOT.jar com.sportradar.streaming.controller.VTControllerComponent 1266
end

function jdbController
    java -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005 -cp va-controller-app-6.7.0-SNAPSHOT.jar com.sportradar.streaming.controller.VTControllerComponent 1266
end

function debugJava
    jdb -connect com.sun.jdi.SocketAttach:hostname=localhost,port=5005
end

# Abbreviations for simple aliases
abbr h history
abbr kctx kubectx
abbr a agent
abbr vim nvim
abbr n nvim
abbr vi nvim
abbr lg lazygit
abbr cat batcat
#abbr l ls
abbr l eza --icons=always -1
abbr t tmux
abbr ya yazi
abbr gs git stash
abbr oc opencode
abbr ktl kubectl
abbr k kubectl
abbr ks k9s
abbr zj zellij
abbr c clear
abbr gp git pull
abbr kx kubectx
abbr y yazi
abbr kl kubectl
# Function for fzf with preview
function fzf
    command fzf --preview "batcat --color=always --style=numbers --line-range=:500 {}" $argv
end

# Function for gitdiff
function gitdiff
    git diff --name-only --relative --diff-filter=d | xargs batcat --diff $argv
end

# For bat to work with fish
abbr -a --position anywhere -- --help '--help | batcat -plhelp'
abbr -a --position anywhere -- -h '-h | batcat -plhelp'

function gswitch
    git switch (git branch | fzf | string trim)
end

# Always attach to the main session, or create main session if it doesn't exist
alias tmux 'tmux new-session -A -s main'


set PATH /home/mvestvik/.config/nvm/versions/node/v23.10.0/bin /home/mvestvik/bin/google-java-format/ /home/mvestvik/bin/google-java-format/ /home/mvestvik/bin/google-java-format/ /home/mvestvik/.cargo/bin /home/mvestvik/.local/bin /home/mvestvik/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/games /usr/local/games /snap/bin /snap/bin /home/mvestvik/go/bin $PATH
set -x PATH ~/bin/google-java-format/ $PATH
set -x PATH ~/bin/format/ $PATH
set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -x PATH /home/mvestvik/dev/scripts/scripts $PATH
set -x PATH /custom/bin $PATH
set -x PATH /home/mvestvik/.zshrc $PATH
set -x PATH /home/mvestvik/.local/kitty.app/ $PATH

set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk-amd64/
set -gx TUNNELER3_MYSQL_HOST "127.0.0.1"
set -gx TUNNELER3_MYSQL_PORT 3307
set -gx TUNNELER3_MYSQL_SCHEMA "tunneler3_dev"
set -gx TUNNELER3_MYSQL_USERNAME "root"
set -gx TUNNELER3_MYSQL_PASSWORD "test"
set -gx TUNNELER3_CENTRAL_URL http://localhost:8000
set -gx TUNNELER3_AGENT_ID agent
set -gx TUNNELER3_BADGER_PATH ~/badger
set -gx TUNNELER3_CENTRAL_URL "http://localhost:8001"
set -gx PATH $HOME/.local/share/bob/nvim-bin $PATH
set -gx VAULT_ADDR https://global.vault.sportradar.ag
#set -gx NPM_CONFIG_REGISTRY https://cdproxy.sportradar.online/npm

set -gx EDITOR nvim
set -gx VISUAL nvim
#kubectl completion fish | source completions for kubectl, this does make tabbing slow though
zoxide init fish | source


## Should be at the bottom

