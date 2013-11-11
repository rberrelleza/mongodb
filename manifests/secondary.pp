#
# Define mongodb::secondary
#
define mongodb::secondary(
  $username = undef,
  $password = undef,
  $priority = 1,
) {
  
  exec { "add_secondary_${name}":
    command   => "mongo -u ${username} -p ${password} admin --eval \"rs.add(\\\"${name}\\\")\"",
    path      => "/usr/bin:/usr/sbin:/bin:/sbin",
    logoutput => true,
  }
 
}