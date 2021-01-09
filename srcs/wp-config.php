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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'pikachu' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pikachu' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define( 'AUTH_KEY',         '$Lg1m1hRZ6B%eberDEj82|V5*w!pQX*9n~-8lR&1iO?Pt{BFseK>JvU>T[$-#48J' );
define( 'SECURE_AUTH_KEY',  '0V@73 j{*%{ZGSK,2$#UlE*SZ`xSZKS9LoP$t.R:Lz><+q(DMjIN~;)bG)StND[a' );
define( 'LOGGED_IN_KEY',    'a]=*pXij`kv!93O`Zf5c.G<7uk|S)v&R_)%7Ku7h5#.Nv~LR%s;dVWA&f59vZr.D' );
define( 'NONCE_KEY',        'HyA2uOu~&nKByx< .2[$Au@w$wy&y^XW,fX:kfhDlfI6A8G99q&]!_G|`tJyW$e1' );
define( 'AUTH_SALT',        'uRvjUr=E!lQ|SpvK-2w0q4Z/2za_X+}[8~F<@hMZc;-c~>d94_9*TLxu1f7tMgB/' );
define( 'SECURE_AUTH_SALT', 'b+iB:S+LA;2QGIZFT3S1:7SKk&Ylsr#ZB!z }-E<paC>=BsoT/ZM=pF7<a/|1Spn' );
define( 'LOGGED_IN_SALT',   '2L8~;JjO,!5@uy81;sLtJKZ$}83<u_v%8Mn#^%j*#fDLrMmrAnZ!tZkvmJWX]4ET' );
define( 'NONCE_SALT',       'RW61g?dk~d/goGuXCpMF=B%;5&~p4M[E7oX%0jgVJ9xS1)`IDdP+3rZ*?kmeA5=[' );

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
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';