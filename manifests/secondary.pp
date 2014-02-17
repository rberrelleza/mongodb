#
# Define mongodb::secondary
#
define mongodb::secondary(
  $username = undef,
  $password = undef,
  $priority = 1,
) {
  
  $replica_add_cmd="result=rs.add(\"${name\"); if (result.ok == 1 || result.errmsg == \"already initialized\"){ \"SUCCESS\"}"
  $noauth = "mongo admin --eval '${replica_add_cmd}' | grep SUCCESS -q"
  $auth = "if [ $? -eq 1 ]; then mongo admin -u ${username} -p ${password} --eval '${replica_add_cmd}' | grep SUCCESS -q;fi"
  $command = "${noauth};${auth}"
  exec { "add_secondary_${name}":
    command   => $command
    path      => "/usr/bin:/usr/sbin:/bin:/sbin",
    logoutput => true,
  }
 
}