<?php
require_once("include/bittorrent.php");
dbconn();
require_once(get_langfile_path());
global $cssupdatedate, $CURUSER, $sbmanage_class, $prfmanage_class;
$css_uri = get_css_uri();
$cssupdatedate = ($cssupdatedate ? "?" . htmlspecialchars($cssupdatedate) : "");
if (isset ($_GET ['del'])) {
    if (is_valid_id($_GET ['del'])) {
        if ((get_user_class() >= $sbmanage_class)) {
            sql_query("DELETE FROM shoutbox WHERE id=" . mysql_real_escape_string($_GET ['del']));
        }
    }
}
$where = preg_replace("/[^A-Za-z0-9 ]/", '', $_POST ["type"] ? $_POST ["type"] : $_GET ["type"]);
$refresh = ($CURUSER ['sbrefresh'] ? $CURUSER ['sbrefresh'] : 120) ?>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Refresh"
          content="<?php echo $refresh ?>; url=shoutbox.php?type=<?php echo $where ?>">
    <link rel="stylesheet" href="<?php echo get_font_css_uri() . $cssupdatedate ?>" type="text/css">
    <link rel="stylesheet" href="<?php echo $css_uri . "theme.css" . $cssupdatedate ?>" type="text/css"/>
    <link rel="stylesheet" href="/<?php echo $css_uri . "DomTT.css" . $cssupdatedate ?>" type="text/css"/>
    <link rel="stylesheet" href="styles/sprites.css<?php echo $cssupdatedate ?>" type="text/css">
    <link rel="stylesheet" href="styles/curtain_imageresizer.css"<?php echo $cssupdatedate ?> type="text/css">
    <script src="js/curtain_imageresizer.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            overflow-y: scroll;
            overflow-x: hidden
        }
    </style>
    <script type="text/javascript" src="js/curtain_imageresizer.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>

    <?php
    print (get_style_addicode());
    $startcountdown = "startcountdown(" . $CURUSER ['sbrefresh'] . ")";
    ?>
    <script type="text/javascript">
        //<![CDATA[
        var t;

        function startcountdown(time) {
            parent.document.getElementById('countdown').innerHTML = time;
            time = time - 1;
            t = setTimeout("startcountdown(" + time + ")", 1000);
        }

        function countdown(time) {
            if (time <= 0) {
                parent.document.getElementById("hbtext").disabled = false;
                parent.document.getElementById("hbsubmit").disabled = false;
                parent.document.getElementById("hbsubmit").value = parent.document.getElementById("sbword").innerHTML;
            } else {
                parent.document.getElementById("hbsubmit").value = time;
                time = time - 1;
                setTimeout("countdown(" + time + ")", 1000);
            }
        }

        function hbquota() {
            parent.document.getElementById("hbtext").disabled = true;
            parent.document.getElementById("hbsubmit").disabled = true;
            var time = 10;
            countdown(time);
//]]>
        }

        function response(username) {
            parent.document.getElementById("shbox_text").value = "@" + username + " ";
            parent.document.forms['shbox'].shbox_text.focus();
        }

        $(function () {
            $(".shoutrow").hover(function () {
                // $(this).css("background-color","#e4e2dd");
                $s = "<p class=\"reply\" style=\"display:inline; color:#a7a7a7\"  >&nbsp;&nbsp;<不许双击啦~啦啦啦~></p>";
                $(this).append($s);
            }, function () {
                $(this).css("background", "none");
                $s = "<p style=\"display:none;\">I would like to say: </p>";
                $(".reply").remove();
            })

            $(".shoutrow").dblclick(function () {
                $user = $(this).attr('ocr');
                parent.document.forms['shbox'].shbox_text.value = "@" + $user + " " + parent.document.forms['shbox'].shbox_text.value;
                parent.document.forms['shbox'].shbox_text.focus();
            })
        });
    </script>

</head>
<body class='inframe'
    <?php if ($_POST["type"] != "helpbox" && $_GET["type"] != "helpbox") { ?>
        onload="<?php echo $startcountdown ?>" <?php } else { ?>
        onload="hbquota()" <?php } ?>>
<?php
if ($_POST ["sent"] == "yes") {
    if (check_emotion($_POST ["shbox_text"])) {
        $userid = 0 + $CURUSER ["id"];
        print "<script type=\"text/javascript\">parent.document.forms['shbox'].shbox_text.value='';parent.document.forms['shbox'].shbox_text.placeholder='输入无效';</script>";
    } else {
        if ($_POST ["type"] == "helpbox" || $_GET ["type"] == "helpbox") {
            if ($showhelpbox_main != 'yes') {
                // write_log("Someone is hacking shoutbox. - IP :
                // ".getip(),'mod');
                die ($lang_shoutbox ['text_helpbox_disabled']);
            }
            $userid = 0;
            $type = 'hb';
            $ip = getip();
        } elseif ($_POST ["type"] == 'shoutbox' || $_GET ["type"] == 'shoutbox') {
            $userid = 0 + $CURUSER ["id"];
            if (!$userid || $CURUSER ["forumpost"] == 'no') {
                // write_log("Someone is hacking shoutbox. - IP :
                // ".getip(),'mod');
                die ($lang_shoutbox ['text_no_permission_to_shoutbox']);
            }
            if ($_POST ["toguest"])
                $type = 'hb';
            else
                $type = 'sb';
        }
        $date = sqlesc(time());
        $text = trim($_POST ["shbox_text"]);
        $text = str_replace("[img", "[ img", $text);
        $text = str_replace("[flv", "[ flv", $text);
        $text = str_replace("[flash", "[ flash", $text);
        $text = str_replace("[music", "[ music", $text);

        if (preg_match_all('/@游客[^\x{4e00}-\x{9fa5}]/iu', sqlesc($text), $matches)) {
            $type = 'hb';
        }

        preg_match('/@(.*)\s\!warn\s(\d*)/', $text, $matches);
        if ($matches && get_user_class() >= $prfmanage_class) {
            $operated_username = trim($matches[1]);
            $warnlength = $matches[2];

            $operated_uid_query = sql_query("SELECT id, warned, warneduntil FROM users WHERE LOWER(username) = LOWER(" . sqlesc($operated_username) . ")");
            $operated_arr = mysql_fetch_array($operated_uid_query);
            $operated_uid = $operated_arr['id'];

            $warneduntil = $operated_arr['warned'] == 'yes' ? strtotime($operated_arr['warneduntil']) : strtotime(date("Y-m-d H:i:s"));
            $warneduntil = date("Y-m-d H:i:s", ($warneduntil + $warnlength * 604800));
            $dur = $warnlength . "周";
            $reason = "群聊区违规行为";
            $modcomment = date("Y-m-d") . " - Warned for $dur by " . $CURUSER['username'] . ".\nReason: $reason.\n";
            sql_query("UPDATE users SET modcomment = CONCAT(" . sqlesc($modcomment) . ", COALESCE(`modcomment`,''))" . ", warneduntil = " . sqlesc($warneduntil) . ", warned = 'yes', timeswarned = timeswarned + 1, lastwarned = NOW(), warnedby = $CURUSER[id] WHERE id = " . sqlesc($operated_uid)) or sqlerr(__FILE__, __LINE__);

            $text = "@$operated_username 由于群聊区违规行为已被管理员警告 {$warnlength}周。";
            $userid = 10;

            $subject = sqlesc("你被警告");
            $added = sqlesc(date("Y-m-d H:i:s"));
            $msg = sqlesc("你被[url=rules.php#warning]警告[/url] {$dur}。管理员： $CURUSER[username]\n\n原因：$reason");
            sql_query("INSERT INTO messages (sender, receiver, subject, msg, added) VALUES (0, $operated_uid, $subject, $msg, $added)") or sqlerr(__FILE__, __LINE__);
            $Cache->delete_value('user_' . $operated_uid . '_unread_message_count');
            $Cache->delete_value('user_' . $operated_uid . '_inbox_count');
        }

        if ($userid === 10) {
            $userid = 0;
            $ip = "北洋媛隐身啦～啦啦啦～";
        }
        sql_query("INSERT INTO shoutbox (userid, date, text, type, ip) VALUES (" . sqlesc($userid) . ", $date, " . sqlesc($text) . ", " . sqlesc($type) . ", '$ip' )") or sqlerr(__FILE__, __LINE__);
        // sql_query("INSERT INTO shoutbox (userid, date, text, type) VALUES ("
        // . sqlesc($userid) . ", $date, " . sqlesc($text) . ",
        // ".sqlesc($type)." )") or sqlerr(__FILE__, __LINE__);

        // *******************
        // PM被@的用户
        if ($CURUSER['id'] == $userid) {  // 在使用命令时CURUSER和userid不等
            if ($CURUSER ["id"]) {
                if (0 + $CURUSER ["id"] === 10) {
                    $msg = '[b]' . $CURUSER ["username"] . '[/b]说：' . $text;
                } else {
                    $msg = '[b][url=userdetails.php?id=' . $CURUSER ["id"] . ']' . $CURUSER ["username"] . '[/url][/b]说：' . $text;
                }
            } else {
                $msg = '[b]游客[/b]说：' . $text;
            }
            pm_at_users($text, $msg, "shoutbox");
        }
        // *******************

        print "<script type=\"text/javascript\">parent.document.forms['shbox'].shbox_text.value='';</script>";
    }
}

$limit = ($CURUSER ['sbnum'] ? $CURUSER ['sbnum'] : 70);

if ($where == "helpbox") {
    $sql = "SELECT * FROM shoutbox WHERE type='hb' ORDER BY date DESC LIMIT " . $limit;
} elseif ($CURUSER ['hidehb'] == 'yes' || $showhelpbox_main != 'yes') {
    $sql = "SELECT * FROM shoutbox WHERE type='sb' ORDER BY date DESC LIMIT " . $limit;
} elseif ($CURUSER) {
    $sql = "SELECT * FROM shoutbox ORDER BY date DESC LIMIT " . $limit;
} else {
    die ("<h1>" . $lang_shoutbox ['std_access_denied'] . "</h1>" . "<p>" . $lang_shoutbox ['std_access_denied_note'] . "</p></body></html>");
}
$res = sql_query($sql) or sqlerr(__FILE__, __LINE__);
if (mysql_num_rows($res) == 0)
    print ("\n");
else {
    print ("<table border='0' cellspacing='0' cellpadding='2' width='100%' align='left'>\n");

    if ($where == "helpbox") {
        $ip = getip();
        $nip = ip2long($ip);
        if ($nip) {
            $nontjuip = sql_query("SELECT * FROM nontjuip WHERE $nip >= first AND $nip <= last") or sqlerr(__FILE__, __LINE__);
            if (mysql_num_rows($nontjuip) > 0 && $where == "helpbox") {
                print ("校外IPv4用户需要登录之后才能看到群聊区");
                die ();
            }
        }

    }
    print ("<font size=3 color=#FF0000><b>请勿刷屏、求资源、发广告，严禁粗口</b>(<a class='faqlink' href='/forums.php?action=viewtopic&forumid=15&topicid=15075' target='_blank'>新手手册</a>,&nbsp;<a class='faqlink' href='faq.php' target='_blank'>常见问题</a>,&nbsp;<a class='faqlink' href='rules.php' target='_blank'>本站规则</a>)</font>&nbsp;&nbsp;&nbsp;&nbsp;<font size=3 color=#0000FF><b>如有问题欢迎加入北洋园PT新手QQ群咨询：155707364</b></font><br>");
    while ($arr = mysql_fetch_assoc($res)) {
        if (get_user_class() >= $sbmanage_class) {
            $del = "[<a href=\"shoutbox.php?del=" . $arr ['id'] . "\">" . $lang_shoutbox ['text_del'] . "</a>]";
        }
        if ($arr ["userid"]) {
            $username = get_username($arr ["userid"], false, true, true, true, false, false, "", true);
            $arr_user = get_user_row($arr ["userid"]);
            $usernamesb = $arr_user ['username'];
            if ($_POST ["type"] != 'helpbox' && $_GET ["type"] != 'helpbox' && $arr ["userid"])
                // $username = "<a href=\"javascript: response('" . $usernamesb
                // . "')\">[@]</a> " . $username;
                $username = $username . '：';
            // if ($_POST ["type"] != 'helpbox' && $_GET ["type"] != 'helpbox'
            // && $arr ["type"] == 'hb')
            // $username .= " " . $lang_shoutbox ['text_to_guest'] . "：";
        } elseif (get_user_class() >= $sbmanage_class && $arr ["type"] == 'hb' && $arr ["ip"] != "北洋媛隐身啦～啦啦啦～") {
            $username = "<a title=\"IP: " . $arr ["ip"] . " \" href=\"reghistory.php?id=" . $arr ["id"] . "\" target=\"_blank\" >" . $lang_shoutbox ['text_guest'] . "</a>：";
            $usernamesb = '游客';
        } elseif ($arr ["type"] == 'hb' && $arr ["ip"] != "北洋媛隐身啦～啦啦啦～") {
            $username = "<a title=\"IP End With: " . str_replace(".", "", strrchr($arr ["ip"], ".")) . str_replace(":", "", strrchr($arr ["ip"], ":")) . " \"  href=\"reghistory.php?id=" . $arr ["id"] . "\" target=\"_blank\" >" . $lang_shoutbox ['text_guest'] . "</a>：";
            $usernamesb = '游客';
        } else {
            if ($CURUSER ['id']) {
                $username = "<a title=\"IP: " . $arr ["ip"] . " \" href=\"userdetails.php?id=" . $CURUSER ['id'] . "\" target=\"_top\"><strong><u><font color='FF00FF'>北洋媛</font></u></strong></a>：";
            } else {
                $username = "<strong><u><font color='FF00FF'>北洋媛</font></u></strong>：";
            }
            $usernamesb = '北洋媛';
        }
        if ($CURUSER ['timetype'] != 'timealive')
            $time = strftime("%m.%d %H:%M", $arr ["date"]);
        else
            $time = get_elapsed_time($arr ["date"]) . $lang_shoutbox ['text_ago'];
        print ("<tr><td class=\"shoutrow\" ocr=\"$usernamesb\">" . $del . " " . "<span class='date'>[" . $time . "]</span> " . "$username" . " " . str_replace("[ ", "[", format_comment($arr ["text"], true, false, true, true, 600, true, false, -1, 0, 0, false)) . "
</td></tr>\n");
    }
    print ("</table>");
}
?>
</body>
</html>
