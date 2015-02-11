# AWS CLI
alias aws='aws --no-verify-ssl'
complete -C aws_completer aws
export AWS_CONFIG_FILE=$HOME/dotfiles_private/aws/credentials
#export AWS_DEFAULT_PROFILE='me'
export AWS_DEFAULT_REGION='us-east-1'
