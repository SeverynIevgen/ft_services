<?php
 /**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'zdawnsta' );

/** MySQL database password */
define( 'DB_PASSWORD', '12345' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-serv' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

define( 'FS_METHOD', 'direct');

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'J-HQc9] ~`4$jOro~7NjQ>++26JarG +UG%(qPP`JnCF^OQF&#%1a)n8fa[1g,l<');
define('SECURE_AUTH_KEY',  '7A0`ehD(J:Oonu8M1Pil(T/JI1gRG|Bu+F3|`[r5eW@mzV (|}yvC~5kz}-+?~}&');
define('LOGGED_IN_KEY',    ':Y+(#K[>bQ_=h8O#E~)1`L7`c{c>ANv|.+B[eLF$2}l4U.o<~RG=WC5YZ|y|6L-i');
define('NONCE_KEY',        'Ns,uw[Uv|h,{VB>ISX?O[Sq|((a) !w80-Xz& C}o$T/`}Ep]S^AQl}F<kBX{9]}');
define('AUTH_SALT',        'nnKgIbOG||-<6d++90;yr:8jHM~[_2f;0L,2PdN(0mn{$>%+06LZtF<TYCG=8,dL');
define('SECURE_AUTH_SALT', '; -[>eF{l0O[ +w!+#i0|Yg]5~c]QU%q?G4_Dz2JM%A&W-:h{nuHaxLslkLoH[OE');
define('LOGGED_IN_SALT',   'IIm>QIMd#8cEymMYG-mIL$7`w,j;kFxL)(m7KJ>>+8w`+#`3Cb/fibxl|K(}4I!G');
define('NONCE_SALT',       'E+V:ODf3#V<+2+|)HNX!o|LBwdP~+jJBSNHE-]]<V8]vT=D]j65nceY09.aup[Ko');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
