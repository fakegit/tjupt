<?php
if (!defined('IN_TRACKER'))
    die('Hacking attempt!');

function get_global_sp_state()
{
    global $Cache;
    static $global_promotion_state;
    if (!$global_promotion_state) {
        if (!$global_promotion_state = $Cache->get_value('global_promotion_state')) {
            $res = mysql_query("SELECT * FROM torrents_state");
            $row = mysql_fetch_assoc($res);
            $global_promotion_state = $row["global_sp_state"];
            $Cache->cache_value('global_promotion_state', $global_promotion_state, 57226);
        }
    }
    return $global_promotion_state;
}

// IP Validation
function validip($ip)
{
    return substr_count($ip, ':') > 1 ? validateIPv6($ip) : validateIPv4($ip);
}

/*** Replace '::' with appropriate number of ':0'*/
function ExpandIPv6Notation($ip)
{
    if (strpos($ip, '::') !== false)
        $ip = str_replace('::', str_repeat(':0', 8 - substr_count($ip, ':')) . ':', $ip);
    if (strpos($ip, ':') === 0) $ip = '0' . $ip;
    return $ip;
}

/*
 * Convert IPv6 address to an integer
 * Optionally split in to two parts.
 * @see http://stackoverflow.com/questions/420680/
 */
function IPv6ToLong($ip, $DatabaseParts = 2)
{
    $ip = preg_replace('/[.]/', ':', $ip);
    $ip = ExpandIPv6Notation($ip);
    $Parts = explode(':', $ip);
    $ip = array('', '');
    for ($i = 0; $i < 8; $i++) $ip[$i] .= str_pad(base_convert($Parts[$i], 16, 2), 16, 0, STR_PAD_LEFT);
    if ($DatabaseParts == 2)
        return array(base_convert($ip[0], 2, 10), base_convert($ip[1], 2, 10), base_convert($ip[2], 2, 10), base_convert($ip[3], 2, 10), base_convert($ip[4], 2, 10), base_convert($ip[5], 2, 10), base_convert($ip[6], 2, 10), base_convert($ip[7], 2, 10));
    else    return base_convert($ip[0], 2, 10) + base_convert($ip[1], 2, 10) + base_convert($ip[2], 2, 10) + base_convert($ip[3], 2, 10) + base_convert($ip[4], 2, 10) + base_convert($ip[5], 2, 10) + base_convert($ip[6], 2, 10) + base_convert($ip[7], 2, 10);
}

function LongToIPv6($ip)
{

    $IP1 = dechex($ip[0]);
    $IP2 = dechex($ip[1]);
    $IP3 = dechex($ip[2]);
    $IP4 = dechex($ip[3]);
    $IP5 = dechex($ip[4]);
    $IP6 = dechex($ip[5]);
    $IP7 = dechex($ip[6]);
    $IP8 = dechex($ip[7]);
    $ip = $IP1 . ':' . $IP2 . ':' . $IP3 . ':' . $IP4 . ':' . $IP5 . ':' . $IP6 . ':' . $IP7 . ':' . $IP8;
    return $ip;
}

function getip()
{
    if (isset($_SERVER)) {
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR']) && validip($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } elseif (isset($_SERVER['HTTP_CLIENT_IP']) && validip($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
    } else {
        if (getenv('HTTP_X_FORWARDED_FOR') && validip(getenv('HTTP_X_FORWARDED_FOR'))) {
            $ip = getenv('HTTP_X_FORWARDED_FOR');
        } elseif (getenv('HTTP_CLIENT_IP') && validip(getenv('HTTP_CLIENT_IP'))) {
            $ip = getenv('HTTP_CLIENT_IP');
        } else {
            $ip = getenv('REMOTE_ADDR');
        }
    }

    return $ip;
}

function validateIPv6($IP)
{
    $IP = filter_var($IP, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6);
    if ($IP) {
        $IP = IPLib\Address\IPv6::fromString($IP)->toString(true);
        return filter_var($IP, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE);
    } else return false;
}

function validateIPv4($IP)
{
    $IP = filter_var($IP, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4);
    if ($IP) {
        $address = IPLib\Address\IPv4::fromString($IP);
        if ($address->matches(IPLib\Range\Subnet::fromString('100.64.0.0/10'))) return false;
        if ($address->matches(IPLib\Range\Subnet::fromString('172.16.0.0/12'))) return true;
        return filter_var($IP, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 | FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE);
    } else return false;
}

function sql_query($query)
{
    global $query_name;
    $query_name[] = $query;
    return mysql_query($query);
}

function sql_multi_query($query)
{
    global $query_name;
    $query_name[] = $query;
    mysql_multi_query(implode(';', $query) . ";");
    mysql_refresh_multi_query();
    return True;
}

function sqlesc($value)
{
    // Quote if not a number or a numeric string
    if (!is_numeric($value) || $value[0] == '0' || $value[0] == '+') {
        $value = "'" . mysql_real_escape_string($value) . "'";
    }
    return $value;
}

function hash_pad($hash)
{
    return str_pad($hash, 20);
}

function hash_where($name, $hash)
{
    $shhash = preg_replace('/ *$/s', "", $hash);
    return "($name = " . sqlesc($hash) . " OR $name = " . sqlesc($shhash) . ")";
}

if (!function_exists('getallheaders')) {
    function getallheaders()
    {
        $headers = [];
        foreach ($_SERVER as $name => $value) {
            if (substr($name, 0, 5) == 'HTTP_') {
                $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
            }
        }
        return $headers;
    }
}

if (!function_exists('is_indexed_array')) {
    /** 索引数组：所有键名都为数值型，注意字符串类型的数字键名会被转换为数值型。
     * 判断数组是否为索引数组
     * @param array $arr
     * @return bool
     */
    function is_indexed_array(array $arr): bool
    {
        if (is_array($arr)) {
            return count(array_filter(array_keys($arr), 'is_string')) === 0;
        }
        return false;
    }
}

function ip_to_location($ip)
{
    if (validateIPv6($ip)) {
        $result = Rhilip\Ipv6Wry\IpLocation::searchIp($ip);
        return $result['area'] ? $result['area'] : $result['error'];
    } else if (validateIPv4($ip)) {
        $result = itbdw\Ip\IpLocation::getLocation($ip);
        return $result['area'] ? $result['area'] : $result['error'];
    } else
        return "Invalid IP address";
}