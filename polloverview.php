<?php
require "include/bittorrent.php";
dbconn();
require_once(get_langfile_path());
loggedinorreturn();
global $pollmanage_class;
if (get_user_class() < $pollmanage_class)
    permissiondenied();

$pollid = 0 + $_GET['id'];

if ($pollid) {
    $res = sql_query("SELECT * FROM poll_questions WHERE id = " . sqlesc($pollid) . " LIMIT 1") or sqlerr();
    if (mysql_num_rows($res) == 0)
        stderr($lang_polloverview['std_error'], $lang_polloverview['text_no_poll_id']);
    stdhead($lang_polloverview['head_poll_overview']);
    print("<h1 align=\"center\">" . $lang_polloverview['text_polls_overview'] . "</h1>\n");

    print("<table width=737 border=1 cellspacing=0 cellpadding=5><tr>\n" .
        "<td class=colhead align=center><nobr>" . $lang_polloverview['col_id'] . "</nobr></td><td class=colhead><nobr>" . $lang_polloverview['col_added'] . "</nobr></td><td class=colhead><nobr>" . $lang_polloverview['col_question'] . "</nobr></td></tr>\n");

    while ($poll = mysql_fetch_assoc($res)) {
        $option_res = sql_query("SELECT * FROM poll_options WHERE question_id = $pollid");

        $o = [];
        while($option_arr = mysql_fetch_array($option_res)){
            $o[$option_arr['id']] = $option_arr['option_text'];
        }
        $added = gettime($poll['added_at']);
        print("<tr><td align=center><a href=\"polloverview.php?id=" . $poll['id'] . "\">" . $poll['id'] . "</a></td><td>" . $added . "</td><td><a href=\"polloverview.php?id=" . $poll['id'] . "\">" . $poll['question'] . "</a></td></tr>\n");
    }
    print("</table>\n");

    print("<h1 align=\"center\">" . $lang_polloverview['text_poll_question'] . "</h1><br />\n");
    print("<table width=737 border=1 cellspacing=0 cellpadding=5><tr><td class=colhead>" . $lang_polloverview['col_option_no'] . "</td><td class=colhead>" . $lang_polloverview['col_options'] . "</td></tr>\n");
    foreach ($o as $key => $value) {
        if ($value != "")
            print("<tr><td>" . $key . "</td><td>" . $value . "</td></tr>\n");
    }
    print("</table>\n");
    $count = get_row_count("poll_answers", "WHERE question_id = " . sqlesc($pollid) . " AND option_id != -1");

    print("<h1 align=\"center\">" . $lang_polloverview['text_polls_user_overview'] . "</h1>\n");

    if ($count == 0) {
        print("<p align=\"center\">" . $lang_polloverview['text_no_users_voted'] . "</p>");
    } else {
        $perpage = 100;
        list($pagertop, $pagerbottom, $limit) = pager($perpage, $count, "?id=" . $pollid . "&");
        $res2 = sql_query("SELECT poll_answers.*, users.username FROM poll_answers LEFT JOIN users ON poll_answers.user_id = users.id WHERE question_id = " . sqlesc($pollid) . " AND option_id != -1 ORDER BY username ASC " . $limit) or sqlerr();
        print($pagertop);
        print("<table width=737 border=1 cellspacing=0 cellpadding=5>");
        print("<tr><td class=colhead align=center><nobr>" . $lang_polloverview['col_username'] . "</nobr></td><td class=colhead align=center><nobr>" . $lang_polloverview['col_selection'] . "<nobr></td></tr>\n");
        while ($useras = mysql_fetch_assoc($res2)) {
            $username = get_username($useras['user_id']);
            print("<tr><td>" . $username . "</td><td>" . $o[$useras['option_id']] . "</td></tr>\n");
        }
        print("</table>\n");
        print($pagerbottom);
    }
    stdfoot();
} else {
    $res = sql_query("SELECT id, added_at, question FROM poll_questions ORDER BY id DESC") or sqlerr();
    if (mysql_num_rows($res) == 0)
        stderr($lang_polloverview['std_error'], $lang_polloverview['text_no_users_voted']);
    stdhead($lang_polloverview['head_poll_overview']);
    print("<h1 align=\"center\">" . $lang_polloverview['text_polls_overview'] . "</h1>\n");

    print("<table width=737 border=1 cellspacing=0 cellpadding=5><tr>\n" .
        "<td class=colhead align=center><nobr>" . $lang_polloverview['col_id'] . "</nobr></td><td class=colhead>" . $lang_polloverview['col_added'] . "</td><td class=colhead><nobr>" . $lang_polloverview['col_question'] . "</nobr></td></tr>\n");
    while ($poll = mysql_fetch_assoc($res)) {
        $added = gettime($poll['added_at']);
        print("<tr><td align=center><a href=\"polloverview.php?id=" . $poll['id'] . "\">" . $poll['id'] . "</a></td><td>" . $added . "</td><td><a href=\"polloverview.php?id=" . $poll['id'] . "\">" . $poll['question'] . "</a></td></tr>\n");
    }
    print("</table>\n");
    stdfoot();
}