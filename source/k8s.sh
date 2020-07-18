k8s_admin_token() {
	admin_token="$(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')"

  kubectl -n kube-system \
		describe secret "$admin_token" \
		| grep "^token:" \
		| sed -e 's/^token: *//' \
		| pbcopy
}

k8s_current_ns() {
	echo "$(kubectl config view --minify --output 'jsonpath={..namespace}')"
}
