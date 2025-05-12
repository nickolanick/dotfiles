# Global exports.
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

### Common aliases
alias pip="pip3"
alias vim="nvim"
alias k="kubectl"
alias axbrew='arch -x86_64 /usr/local/homebrew/bin/brew'

### ZSH setup.
#
ZSH_THEME="robbyrussell"
plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
	git
	kube-ps1
)

source $ZSH/oh-my-zsh.sh
KUBE_PS1_NS_ENABLE=false
RPROMPT='$(kube_ps1)'
eval "$(direnv hook zsh)"

### GIT shortcuts.
alias gittree='git log --oneline --decorate --graph --all'

gch() {
	if [[ -z "${1}" ]]; then
		git checkout $(git branch --all | fzf | tr -d '"')
	else
		git checkout $1 || git checkout -b $1
	fi
}

gitl() {
	git log --oneline --decorate --graph --all
}

### K8S shortcuts
kx () {
  kubectx $@
  if [[ $# -eq 1 ]]; then
    profile=$(echo $1 | cut -d "-" -f 1)
    echo $profile > ~/.tsh/current-profile
  fi
}

k8s_debug_pod() {
  cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: mykola-debug-pod
  labels:
    purpose: debug
    app.kubernetes.io/instance: e2e
    app.kubernetes.io/name: engines-e2e
spec:
  containers:
  - name: curl-container
    image: nicolaka/netshoot:latest
    command: ["/bin/sh", "-c", "sleep 3600"]
    tty: true
    stdin: true
  restartPolicy: Never
EOF

  # Wait for the pod to be ready
  echo "Waiting for pod curl-debug to be ready..."
  kubectl wait --for=condition=Ready pod/mykola-debug-pod --timeout=60s

  # Exec into the pod if it's ready
  echo "Exec'ing into the curl-debug pod..."
  kubectl exec -it mykola-debug-pod -- /bin/sh
}

connectToPodNode() {
	podName=$1
	nsName=$2
	export nodeName=$(kubectl get pods -n $nsName -o jsonpath='{.spec.nodeName}' $podName)
	aws ssm start-session --target $(aws ec2 describe-instances --filters "Name=tag:Name,Values=$nodeName" --query "Reservations[*].Instances[*].InstanceId" --output text)
}

connectToNode() {
	export nodeName=$1
	aws ssm start-session --target $(aws ec2 describe-instances --filters "Name=tag:Name,Values=$nodeName" --query "Reservations[*].Instances[*].InstanceId" --output text)
}

sso() {
    aws sso login --profile "$1"
}

# Ollivanders shortcuts
upE2EOllivandersPorts() {
	pkill -f "port-forward svc/engines-e2e"
	pkill -f "port-forward svc/accounts-e2e"
	kubectl port-forward svc/accounts-e2e 9999 &
	kubectl port-forward svc/engines-e2e 9090 &
	kubectl port-forward svc/engines-e2e 9095 &
}

downE2EOllivandersPorts() {
	pkill -f "port-forward svc/engines-e2e"
	pkill -f "port-forward svc/accounts-e2e"
}

upOllivandersPorts () {
	kubectx -c
	downOllivandersPorts
	kubectl port-forward -n ollivanders svc/accounts-ollivanders 9999 2>&1 1>/dev/null &
	kubectl port-forward -n ollivanders svc/engines-ollivanders 9090 2>&1 1>/dev/null &
	kubectl port-forward -n ollivanders svc/engines-ollivanders 9095 2>&1 1>/dev/null &
}

downOllivandersPorts () {
	pkill -f "port-forward -n ollivanders svc/accounts-ollivanders 9999" 2>&1 1>/dev/null
	pkill -f "port-forward -n ollivanders svc/engines-ollivanders 9090" 2>&1 1>/dev/null
	pkill -f "port-forward -n ollivanders svc/engines-ollivanders 9095" 2>&1 1>/dev/null
}

# Tmux shortcuts.
tm() {
  [ -z "${TMUX}" ] && tmux new-session -A -s $1 && exit(0)
  tmux detach -E "tmux new-session -A -s $1"
}

# Jump completion setup.
j() {
  local dir="$(jump cd $@)"
  test -d "$dir" && cd "$dir"
}

__jump_chpwd() {
  jump chdir
}

jump_completion() {
  reply="'$(jump hint "$@")'"
}

typeset -gaU chpwd_functions
chpwd_functions+=__jump_chpwd

compctl -U -K jump_completion j

# FZF integration with cntrl + r search.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
