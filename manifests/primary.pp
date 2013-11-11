#
# Define mongodb::primary
#
define mongodb::primary(
  $username = undef,
  $password = undef, 
) {
  
  exec { "iniatilize_replica" :
    command   => "mongo admin -u ${username} -p '${password} --eval \"rs.initiate()\"",
    path      => "/usr/bin:/usr/sbin:/bin:/sbin",
    logoutput => true,
  }
 
}
